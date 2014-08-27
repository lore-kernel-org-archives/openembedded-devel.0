Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 353806ACBA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 12:25:29 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XMcI1-0000uI-NP for openembedded-devel@lists.openembedded.org;
	Wed, 27 Aug 2014 14:25:25 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:25:25 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:25:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 27 Aug 2014 14:25:12 +0200
Message-ID: <ltkin8$p68$1@ger.gmane.org>
References: <1408903501-5728-1-git-send-email-andrei@gherzan.ro>
	<20140827120857.GD20524@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <20140827120857.GD20524@jama>
Subject: Re: [meta-multimedia][PATCH V2 1/1] xbmc: Update to v13.2
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
X-List-Received-Date: Wed, 27 Aug 2014 12:25:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 27-08-14 14:08:
> On Sun, Aug 24, 2014 at 08:05:01PM +0200, Andrei Gherzan wrote:
>> * refactor dependencies * remove already merged patches * define
>> PACKAGECONFIG for different configurations * have above PACKAGECONFIG
>> values activated by default * various cleanups and refactoring * use
>> internal ffmpeg - there are some known issues while compiling with
>> external libav * define --with-arch to be passed to internal ffmpeg
>> configuration script * add support for qemuarm * add libcec, rtmpdump
>> to DEPENDS * add libpulsecommon to RDEPENDS
>> 
>> Tested on Fedora 20 host using poky + meta-oe master: 1. build only
>> qemux86 2. build only qemuarm 3. build and runtime test raspberrypi -
>> (patches to come).
> 
> Fails in world builds for qemux86-64 with:
> 
> | [ 48%] Building CXX object CMakeFiles/projectM.dir/fftsg.cpp.o | CC
> libavfilter/vf_histeq.o | CC	libavfilter/vf_histogram.o | CPP
> xbmc/utils/SortUtils.o | CPP     xbmc/utils/Splash.o | depbase=`echo
> ../common.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\ | 	x86_64-oe-linux-g++
> -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64
> -DHAVE_CONFIG_H -I. -I../..  -DPKGDATADIR=\"/usr/share/rsxs\" -I./..
> -I../../lib  -D_LINUX -DXBMC    -O2  -O2 -pipe -g
> -feliminate-unused-debug-types -fvisibility-inlines-hidden -fPIC -DPIC
> -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g -D_DEBUG
> -Wall -MT ../common.o -MD -MP -MF $depbase.Tpo -c -o ../common.o
> ../common.cc &&\ | 	mv -f $depbase.Tpo $depbase.Po | CC
> libavfilter/vf_hqdn3d.o | CPP     xbmc/guilib/GUIListGroup.o | CPP
> xbmc/utils/Stopwatch.o | CPP     xbmc/utils/StreamDetails.o | CC
> libavfilter/vf_hue.o | In file included from ../common.cc:50:0: |
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/c++/4.9.1/ctime:70:11:
> error: '::gmtime' has not been declared |    using ::gmtime; |
> ^ |
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/c++/4.9.1/ctime:71:11:
> error: '::localtime' has not been declared |    using ::localtime; |
> ^ | make[5]: *** [../common.o] Error 1 | make[5]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/xbmc/13.2-r0/git/xbmc/screensavers/rsxs-0.9/src/euphoria'
>
> 
| make[4]: *** [all-recursive] Error 1
> 
> (this is the same error which was mentioned in PNBLACKLIST before)

That's fixed by --disable-rsxs, no?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFT/c4oMkyGM64RGpERAli9AKCjcd/o2Ha55NcpV3k3hSAdyyw5wgCfRNfx
wix5RoY71AKQC/PXo2cG5Oc=
=Jnwm
-----END PGP SIGNATURE-----


