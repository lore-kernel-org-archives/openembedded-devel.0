Return-Path: <wbx@uclibc-ng.org>
Received: from helium.waldemar-brodkorb.de (helium.waldemar-brodkorb.de
	[89.238.66.15])
	by mail.openembedded.org (Postfix) with ESMTP id 5F91570233
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:55:51 +0000 (UTC)
Received: by helium.waldemar-brodkorb.de (Postfix, from userid 1000)
	id 10426104DE; Mon, 21 Jul 2014 18:55:51 +0200 (CEST)
Date: Mon, 21 Jul 2014 18:55:51 +0200
From: Waldemar Brodkorb <wbx@uclibc-ng.org>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Message-ID: <20140721165551.GH4431@waldemar-brodkorb.de>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
	<148124bb-7b66-4363-b171-f0164dab3ced@email.android.com>
MIME-Version: 1.0
In-Reply-To: <148124bb-7b66-4363-b171-f0164dab3ced@email.android.com>
X-Operating-System: Linux 3.2.0-4-amd64 x86_64
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openwrt-devel@openwrt.org, openembedded-devel@lists.openembedded.org,
	buildroot@buildroot.org
Subject: Re: [Buildroot] uClibc-ng
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
X-List-Received-Date: Mon, 21 Jul 2014 16:55:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Thomas,
Thomas De Schampheleire wrote,

> Hi Waldemar,
> 
> Waldemar Brodkorb <wbx@uclibc-ng.org> schreef:
> >Hello Embedded Linux Hackers,
> >
> Interesting development!  One question: how do you see musl vs
> uclibc-ng in the future? At this moment uclibc supports more
> architectures, but this may change. Do you think both should/can
> coexist? What are the distinctive features of uclibc over musl,
> according to you?

I think both can coexist for a while. uClibc is more compatible to
glibc, so most of the software packages used on embedded systems are
working fine without patching. Musl is relatively new and there are
patches required to make some stuff work. Alpine Linux, Sabotage and
OpenADK have a lot of patches, fixing musl issues.

uClibc has support for non-MMU systems. uClibc can be configured at 
build time and can be made smaller than musl. Musl can be used to
have a complete static linked system, uClibc still requires
libgcc_so.so for some threading functions. uClibc is widely used
in the embedded Linux world, musl is a newcomer.

For musl you need to patch gcc. 4.9.x does not include support for
it.

It is just good to have a choice.
At the time all software packages working fine with musl and support
for it is added to gcc and all architectures and MMU-less systems
are supported, uClibc might be obsolete.

best regards
 Waldemar

