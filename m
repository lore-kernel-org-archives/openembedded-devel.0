Return-Path: <prvs=2877070d8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 549267F987
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580037090; x=1611573090;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=qnBkWajC8ZReBkyrd+5pq7RMKjfnZ2ZE5kxkxJh9EdE=;
	b=gJyofA3C2+VMb8JjhyEwkwF9ypXYXJ2Qfvx2F4UGlycOLhn+lsCvTHly
	Au++jmwC5GLXT8uQrUGaOnZBDKvo2vgJ/YBFKq8q8rm2nTvkU2ryHIcpY
	ZJp6pE/8WoNY9F/6l4FwBoNSrIMU7/h9qeP/AqpnnuCfncYiS3Yr9lGum
	L7Pf4p1GhHETo2hMccyP4rvCGrrKnBreNnvbOLQjYp9svDEZl52/DfU/3
	r2q37E3tDSTyI2XzADD2/gGStgMVH7dlKMLZaG5VjdPE9EkPVLOS0Q2QX
	nL39GFzckiBR8oelpvlAc4k+PORZU2clIoh69YC4IU51LrAjGQf1YSksF A==;
IronPort-SDR: nKPLBRLiie/ubNrds45Pth1Id3IbK2qRzBxxZIkEL1dw+/vXont+Hcen7IGGOaGhzx0/LwoxeF
	96+Nz5lhdYdGTxEid8kwzsS4vNlXdpennt56FCTxWlkpTI1Vjq5w+uE4r1MRnqRE1+r7XaZXBH
	XKhsQbZ431BJUWoGSlZRxD+TgsE/xbvxC8HLDbTkftvlLIMjDTCU+y/a3bIHIIFFEU0JCa9Y2r
	upjxGCVzG6+Sj/iqKmFMXMruy563rqzckgWSigHLT5I5fzRAeAYl0lbONaSMeD6NX5JhOhbBGJ
	DV8=
X-IronPort-AV: E=Sophos;i="5.70,365,1574118000"; 
   d="scan'208";a="2500515"
Date: Sun, 26 Jan 2020 12:11:29 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200126111129.GA2043417@pcleri>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200124103621.GA10765@brokenbit>
	<538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
	<20200124114446.GB10765@brokenbit>
	<95411b04-c9f2-ee4c-6004-110037325976@gmail.com>
MIME-Version: 1.0
In-Reply-To: <95411b04-c9f2-ee4c-6004-110037325976@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Sun, 26 Jan 2020 11:11:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 24, 2020 at 01:28:52PM +0100, Jacob Kroon wrote:
> On 1/24/20 12:44 PM, Richard Leitner wrote:
> > On Fri, Jan 24, 2020 at 12:37:58PM +0100, Jacob Kroon wrote:
> > > On 1/24/20 11:37 AM, Richard Leitner wrote:
> > 
> > ...
> > 
> > > > I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
> > > > the meta-java repository [1]. It contains (as you might have guessed)
> > > > the update to openjdk 8u242ga.
> > > > 
> > > > Can you please give it a try if it works for you?
> > > > 
> > > 
> > > I tried but I get a linker error during openjre-8_242.bb:do_compile:
> > > 
> > > Making adlc
> > > ...
> > > /tmp/ramdisk/build/hosttools/ld: cannot find -lstdc++
> > > collect2: error: ld returned 1 exit status
> > > 
> > > This is using MACHINE=qemux86-64.
> > > 
> > > Gonna try and fix and get the build going.
> > 
> > Do you have "libstdc++ static" installed on your buildhost as stated in
> > the README? ...the error let me suggest you don't have it ;-)
> > 
> 
> Oops, yeah I missed that. That got me further, but I got a new linking
> error:

As this happens in the "native" part of the openjre build:
What distribution and gcc version are you using on your host?

For me (Fedora 31) the openjdk build and runtime tests for aarch32,
aarch64 and x86_64 work.

regards;rl

> 
> > | Linking executable genSocketOptionRegistry
> > | gensrc/GensrcMisc.gmk:75: Building /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry  (from /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegi
> > stry.o) (/tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o  newer)
> > | + /tmp/ramdisk/build/hosttools/gcc /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genUnixConstants/genUnixConstants.o -o /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genUnixConstants/genUnixConstants
> > | + /tmp/ramdisk/build/hosttools/ld /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o -o /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocket
> > OptionRegistry
> > | /tmp/ramdisk/build/hosttools/ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000
> > | /tmp/ramdisk/build/hosttools/ld: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o: in function `out':
> > | genSocketOptionRegistry.c:(.text+0x14): undefined reference to `puts'
> > | /tmp/ramdisk/build/hosttools/ld: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry.o: in function `emit':
> > | genSocketOptionRegistry.c:(.text+0x47): undefined reference to `printf'
> > | /tmp/ramdisk/build/hosttools/ld: genSocketOptionRegistry.c:(.text+0x5e): undefined reference to `printf'
> > | make[2]: *** [gensrc/GensrcMisc.gmk:75: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btnative/genSocketOptionRegistry/genSocketOptionRegistry] Error 1
> > | make[2]: *** Waiting for unfinished jobs....
> > | Note: Some input files use unchecked or unsafe operations.
> > | Note: Recompile with -Xlint:unchecked for details.
> > | + /tmp/ramdisk/build/hosttools/mv /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btclasses/_the.BUILD_TOOLS_batch.tmp /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/build/jdk/btclasses/_the.BUILD_TOOLS_batch
> > | make[1]: *** [BuildJdk.gmk:55: gensrc-only] Error 2
> > | make: *** [/tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/jdk8u-jdk8u242-ga//make/Main.gmk:117: jdk-only] Error 2
> > | WARNING: /tmp/ramdisk/build/work/core2-64-oe-linux/openjre-8/242-r0/temp/run.do_compile.384980:1 exit 1 from 'exit 1'
> 
> 

