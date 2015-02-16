Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id ECE8860556
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 12:42:55 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 20so13103943yks.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=PKcgHJY/qjdO2T44xlgUJZoDkkzJxZl2c0C2sxumrsg=;
	b=jP+8Ikk5sm7Z1/tOjWQJZQcb1lxoJ24A66ZindiPacpiSqelGms8S7Yxoz5SvaCTbb
	tewnONhinZ1yECck44+PLdLV4CoAxXEe8Gd5YK2ciRrQ+KCf1CjHeSaFyA1Hj9tczG8t
	R3ZZHtRqfgL353iP1149GPx6hNOX+kKA/4W2XshIsUdNuFU9pGHK+uLHifXpChCZcluq
	MByjz9LBE6LhDy+KMkMh2DENVB2tJCU3Z5bT+a9rpJpTo+3yVFzLb/InEbE4FNhH9wzX
	hZNd5vH44rTLAp2yRw0BA5r/AT9gZMWk5pYLz5IJl3FcIle3YMiy11tIYDGtDSIuWqbA
	shvw==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr1396813yho.104.1424090576476;
	Mon, 16 Feb 2015 04:42:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 16 Feb 2015 04:42:56 -0800 (PST)
In-Reply-To: <2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
References: <54DF0A5A.80700@pseudoterminal.org>
	<CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>
	<2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 16 Feb 2015 10:42:56 -0200
X-Google-Sender-Auth: N3EyV-Cb8Z8Xn6_qFzJX1KHpFCs
Message-ID: <CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 16 Feb 2015 12:42:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 16, 2015 at 9:12 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Sunday 15 February 2015 19:34:28 Otavio Salvador wrote:
>> On Sat, Feb 14, 2015 at 6:42 AM, Carlos Rafael Giani
>> <dv@pseudoterminal.org> wrote:
>> ...
>> > So, it would make sense to establish some sort of dependency. But how
>> >
>> > exactly? I thought of something like this:
>> >   RDEPENDS_gstreamer1.0-plugins-imx-imxaudio =
>> >
>> > "gstreamer1.0-plugins-good-audioparsers"
>> >
>> >   RDEPENDS_gstreamer1.0-plugins-imx-imxvpu =
>> >
>> > "gstreamer1.0-plugins-bad-videoparsersbad"
>> >
>> > but then I also need to add gstreamer1.0-plugins-good and
>> > gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning
>> >
>> > like:
>> >   QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on
>> >
>> > gstreamer1.0-plugins-good-audioparsers, but it isn't a build dependency?
>> > [build-deps]
>> >
>> > But if I add these recipes to the DEPENDS variable, then the RDEPENDS spec
>> > is pointless, isn't it?
>>...
>>
>> Just for completeness, the QA issue about missing build-dependency is
>> something we should pay attention to but it may be a false positive as
>> in your cause you don't depends on them for building, just runtime. So
>> you can whitelist the warning to avoid the noise but adding the
>> depends would be wrong.
>
> The QA warning message could perhaps be worded more accurately - what it means
> is there in an implicit runtime dependency and there is no RDEPENDS (not
> DEPENDS) explicitly telling the system to ensure that that dependency is
> satisfied. Whitelisting is never the proper way to fix this warning - either add
> an explicit RDEPENDS, or use configuration to ensure that the implicit
> dependency isn't needed.

From my understand, which Carlos can confirm, what he did was adding
the package on the rdepends. Once this was done the QA warnings shows
up which is wrong.

This can be seen at 'sed' recipe:

---
SUMMARY = "Stream EDitor (text filtering utility)"
...
RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
---

In my system, with ptest enabled, I see:

WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
isn't a build dependency? [build-deps]

and this is clearly a false positive as this uses this locale at
runtime for a test. Not necessarily it needs to have a DEPENDS on it
which would imply it would need to be available in sysroot before sed
configure could start.

What I think is missing is that the 'build-deps' check would need to
whitelist the dependencies which come from a /explict/ package added
in a RDEPENDS. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

