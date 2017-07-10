Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E963B77D16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B990220BCC;
	Mon, 10 Jul 2017 21:09:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bDHuhkVljZbT; Mon, 10 Jul 2017 21:09:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A6CD207AF;
	Mon, 10 Jul 2017 21:09:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1D088162525; Mon, 10 Jul 2017 17:09:03 -0400 (EDT)
Date: Mon, 10 Jul 2017 17:09:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170710210903.GD26405@denix.org>
References: <20170710203642.GB26405@denix.org>
	<20170710204751.GC26405@denix.org>
	<598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
MIME-Version: 1.0
In-Reply-To: <598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] Chromium and gold linker
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 21:09:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2017 at 02:00:35PM -0700, Khem Raj wrote:
> On 7/10/17 1:47 PM, Denys Dmytriyenko wrote:
> > On Mon, Jul 10, 2017 at 04:36:42PM -0400, Denys Dmytriyenko wrote:
> >> Khem, et al,
> >>
> >> I couldn't find below patch being discussed on this mailing list before it got 
> >> merged:
> >>
> >> https://github.com/OSSystems/meta-browser/commit/62e323848f569c4cdea5567b1917ce006d7705af
> > 
> > https://github.com/OSSystems/meta-browser/commit/55a74501bc65c90c86e3236b51ec2dc2fc0145fb
> > 
> > "ld-is-gold just means that my default linker is gold, however we build
> > both linkers, so one should be able to enable gold just for linking
> > chromium even if default ld is bfd linker."
> > 
> > I strongly disagree with such interpretation - this would mean there's NO way 
> > to disable gold linker completely, e.g. for when external toolchain doesn't 
> > support it.

Copying OE architecture list for further discussion of "ld-is-gold" meaning.


> it is not just interpretation but how it is designed if you look closely
> to code in oe-core and as a matter of fact, there are certain packages
> where we enforce one linker or other.

So far I only seen forcing bfd, as a legacy linker, not the other way around.


> mere presence or absence of
> ld-is-gold in distro features does not mean that other linker will not
> be available. If your distro is making that assumption please correct that.
> 
> I however agree, that using gold as default linker should have a knob
> and it so does which is USEGOLD, if a distro or toolchain layer does not
> want to use gold then they could set this variable to be off.
> 
> USEGOLD = "" or USEGOLD = "-Dlinux_use_gold_flags=0"

Yes, I saw this variable and already added it to my bbappend. But the issue is 
that it's per-recipe, not global. Do we need a separate distro-level flag to 
avoid any and all gold linker references?


> I think its better to use gold linker for linking chromium since it
> reduced the link time for chrome quite significantly (8 mins to 2min) on
> my experiments. But I am fine if other users think that we should not
> make gold as default.  I can send a patch to toggle the USEGOLD switch
> 
> > 
> >> According to the layer README, openembedded-devel is the official mailing list 
> >> to submit patches. I understand that github pull request is a nice shortcut, 
> >> but it prevents others from seeing and commenting on the patches...
> >>
> >>
> >> My issue with this change is that it makes an assumption of using OE-built 
> >> toolchain. It now breaks external toolchains like this:
> 
> No it does not make assumption. See above.
> 
> >>
> >> | [17/20569] LINK genmacro
> >> | FAILED: genmacro
> >> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -fuse-ld=gold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genmacro -Wl,--start-group obj.host/third_party/yasm/source/patched-yasm/tools/genmacro/genmacro.genmacro.o -Wl,--end-group
> >> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
> >> | collect2: error: ld returned 1 exit status
> >> | [18/20569] LINK genstring
> >> | FAILED: genstring
> >> | gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -fuse-ld=gold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genstring -Wl,--start-group obj.host/third_party/yasm/source/patched-yasm/genstring.genstring.o -Wl,--end-group
> >> | /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
> >> | collect2: error: ld returned 1 exit status
> >>
> >> -- 
> >> Denys
> >> -- 
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 




