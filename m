Received: from mailrelay3.sunrise.ch ([194.158.229.31]
	helo=smtp-be-01.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1OaWIT-0001yn-6w
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 18:02:12 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-01.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o6IG0hw5010864; Sun, 18 Jul 2010 18:00:43 +0200
Message-ID: <4C43255B.3000601@vollmann.ch>
Date: Sun, 18 Jul 2010 18:01:31 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <1279290319.10837.1747.camel@rex> <4C42D208.2000909@vollmann.ch>
	<AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com>
In-Reply-To: <AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com>
X-SA-Exim-Connect-IP: 194.158.229.31
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Jul 2010 16:04:08 -0000
X-List-Received-Date: Sun, 18 Jul 2010 16:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/10 17:13, Chris Larson wrote:
> On Sun, Jul 18, 2010 at 3:06 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> 
>> On 07/16/10 16:25, Richard Purdie wrote:
>>
>>> For the specific case of paths, I have wondered if there would be a way
>>> to leverage help from bitbake in creating a sane set of search paths but
>>> I'm still thinking about that. This extension is good enough in its own
>>> right in my opinion to be worthwhile.
>>>
>> This might be true, but solving the general path problem would be
>> much more useful.
>> If you want to add a new version of e.g. gcc in your ovlerlay,
>> you have to pull over the whole gcc directory with all its .inc classes.
>> This can't be solved by .bbapend, or am I missing something?
> 
> 
> You can handle that today by adding to FILESPATHBASE.  All file:// files
> from SRC_URI are located using FILESPATH, which is constructed from
> FILESPATHBASE, FILESPATHPKG, and OVERRIDES.
AFAIK this doen't work for include/require :-(

   Detlef



