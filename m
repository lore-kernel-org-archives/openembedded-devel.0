Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0F360556
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 12:53:13 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 44CF22FB9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:53:12 +0100 (CET)
Message-ID: <54E1E839.1000706@pseudoterminal.org>
Date: Mon, 16 Feb 2015 13:53:13 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54DF0A5A.80700@pseudoterminal.org>	<CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>	<2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
Subject: Re: Question about RDEPENDS and RRECOMMENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 12:53:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2015 01:42 PM, Otavio Salvador wrote:
> On Mon, Feb 16, 2015 at 9:12 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Sunday 15 February 2015 19:34:28 Otavio Salvador wrote:
>>> On Sat, Feb 14, 2015 at 6:42 AM, Carlos Rafael Giani
>>> <dv@pseudoterminal.org> wrote:
>>> ...
>>>> So, it would make sense to establish some sort of dependency. But how
>>>>
>>>> exactly? I thought of something like this:
>>>>    RDEPENDS_gstreamer1.0-plugins-imx-imxaudio =
>>>>
>>>> "gstreamer1.0-plugins-good-audioparsers"
>>>>
>>>>    RDEPENDS_gstreamer1.0-plugins-imx-imxvpu =
>>>>
>>>> "gstreamer1.0-plugins-bad-videoparsersbad"
>>>>
>>>> but then I also need to add gstreamer1.0-plugins-good and
>>>> gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning
>>>>
>>>> like:
>>>>    QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on
>>>>
>>>> gstreamer1.0-plugins-good-audioparsers, but it isn't a build dependency?
>>>> [build-deps]
>>>>
>>>> But if I add these recipes to the DEPENDS variable, then the RDEPENDS spec
>>>> is pointless, isn't it?
>>> ...
>>>
>>> Just for completeness, the QA issue about missing build-dependency is
>>> something we should pay attention to but it may be a false positive as
>>> in your cause you don't depends on them for building, just runtime. So
>>> you can whitelist the warning to avoid the noise but adding the
>>> depends would be wrong.
>> The QA warning message could perhaps be worded more accurately - what it means
>> is there in an implicit runtime dependency and there is no RDEPENDS (not
>> DEPENDS) explicitly telling the system to ensure that that dependency is
>> satisfied. Whitelisting is never the proper way to fix this warning - either add
>> an explicit RDEPENDS, or use configuration to ensure that the implicit
>> dependency isn't needed.
>  From my understand, which Carlos can confirm, what he did was adding
> the package on the rdepends. Once this was done the QA warnings shows
> up which is wrong.
>
> This can be seen at 'sed' recipe:
>
> ---
> SUMMARY = "Stream EDitor (text filtering utility)"
> ...
> RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
> ---
>
> In my system, with ptest enabled, I see:
>
> WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
> isn't a build dependency? [build-deps]
>
> and this is clearly a false positive as this uses this locale at
> runtime for a test. Not necessarily it needs to have a DEPENDS on it
> which would imply it would need to be available in sysroot before sed
> configure could start.
>
> What I think is missing is that the 'build-deps' check would need to
> whitelist the dependencies which come from a /explict/ package added
> in a RDEPENDS. What do you think?
>

Yes, exactly. The current QA warning greatly limits the usefulness of 
RDEPENDS, in my opinion.  If I explicitely add a package name B to 
RDEPENDS in recipe A, and I add A to the IMAGE_INSTALL list, then I am 
stating that B must also be built and installed on the image, but it 
does *not* have to be built before A. Yet, the warnings makes it look as 
if B has to be built before A. This is confusing.

It makes a lot of sense to warn if for example a build script 
autodetects and links against a certain library which is not mentioned 
in the DEPENDS variable. But this is a different use case than the one 
mentioned above, and somehow it seems that both were lumped together.

