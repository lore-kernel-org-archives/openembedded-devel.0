Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O7ZR5-0003in-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 21:30:12 +0200
Received: (qmail 6599 invoked by uid 503); 29 Apr 2010 19:23:50 -0000
Received: from b9.ovh.net (HELO mail440.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Apr 2010 19:23:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Apr 2010 19:26:30 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Apr 2010 19:26:28 -0000
Message-ID: <4BD9DD63.60502@eukrea.com>
Date: Thu, 29 Apr 2010 21:26:27 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>	<1272114888-16964-2-git-send-email-eric@eukrea.com>	<1272114888-16964-3-git-send-email-eric@eukrea.com>	<1272202763.2387.1.camel@gnutoo-desktop>	<1272205477.2387.2.camel@gnutoo-desktop>	<1272206485.2387.3.camel@gnutoo-desktop>	<1272548191.2313.0.camel@gnutoo-desktop>
	<4BD98C53.1070000@eukrea.com>	<1272553558.2313.5.camel@gnutoo-desktop>
	<4BD9A0EA.1070801@eukrea.com>
	<1272557848.2313.14.camel@gnutoo-desktop>
In-Reply-To: <1272557848.2313.14.camel@gnutoo-desktop>
X-Ovh-Tracer-Id: 15952875781550353737
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Thu, 29 Apr 2010 19:30:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis,

Le 29/04/2010 18:17, GNUtoo a écrit :
> In mplayer_svn I see:
> DEPENDS = "[...] virtual/libx11 [...]" so it depends on X
>
yes, I was thinking to try to split the recipe in order to have one 
mplayer recipe for fbdev without any x11 dependencies as I don't need 
these libs on this project.

> The problem I had was that it didn't find the libraries(the ones you see
> with ldd not dlopened libraries) so normally even in console it
> shouldn't have worked...
> Strange(unless you removed X build dependencies or maybe I had more
> packages installed and configure detected them and built support for
> them)
>
I think this may be linked with configure as libxxf86dga and 
libxscrnsaver aren't built on my system.

You will find more details below.

Eric

* here is what I have in depends.dot :
mplayer -> mplayer_common;
mplayer -> ncurses;
mplayer -> libpng12_0;
mplayer -> libz1;
mplayer -> libjpeg62;
mplayer -> libasound2;
mplayer -> libc6;
mplayer -> libdvdread3;
mplayer -> libfreetype6;
mplayer -> libfontconfig1;
mplayer -> libbz2_1;
mplayer -> libmad0;
mplayer -> libtheora0;
mplayer -> libogg0;
mplayer -> libschroedinger_1_0_0;
mplayer -> liborc_0_4_0;
mplayer -> libstdc6;
mplayer -> libxv1;
mplayer -> libsdl_1_2_0;
mplayer -> libmp3lame0;
mplayer -> libgcc1;
mplayer -> libxext6;
mplayer -> libx11_6;

* here are libx* which are installed in the image :
libx11-6_1:1.3.3-r7.5_i686.ipk
libxau6_1:1.0.5-r0.5_i686.ipk
libxdmcp6_1:1.0.3-r1.5_i686.ipk
libxext6_1:1.1.1-r1.5_i686.ipk
libxml2_2.7.7-r8.0.5_i686.ipk
libxv1_1.0.5-r1.5_i686.ipk

* here is the result of ldd on mplayer :
ldd mplayer
         linux-gate.so.1 =>  (0xb778d000)
         libncurses.so.5 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libncurses.so.5 
(0xb7749000)
         libpng12.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libpng12.so.0 (0xb7724000)
         libz.so.1 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libz.so.1 
(0xb770f000)
         libjpeg.so.62 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libjpeg.so.62 (0xb76ef000)
         libasound.so.2 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libasound.so.2 
(0xb7630000)
         libdl.so.2 => /lib/tls/i686/cmov/libdl.so.2 (0xb7621000)
         libpthread.so.0 => /lib/tls/i686/cmov/libpthread.so.0 (0xb7608000)
         libdvdread.so.3 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libdvdread.so.3 
(0xb75e9000)
         libfreetype.so.6 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libfreetype.so.6 
(0xb756b000)
         libfontconfig.so.1 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libfontconfig.so.1 
(0xb753b000)
         libbz2.so.1 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libbz2.so.1 
(0xb752b000)
         libmad.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libmad.so.0 
(0xb7515000)
         libtheora.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libtheora.so.0 
(0xb74be000)
         libogg.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libogg.so.0 
(0xb74b9000)
         libschroedinger-1.0.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libschroedinger-1.0.so.0 
(0xb7409000)
         liborc-0.4.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/liborc-0.4.so.0 
(0xb73d1000)
         libm.so.6 => /lib/tls/i686/cmov/libm.so.6 (0xb73ab000)
         librt.so.1 => /lib/tls/i686/cmov/librt.so.1 (0xb73a1000)
         libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0xb72af000)
         libXv.so.1 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libXv.so.1 
(0xb72aa000)
         libSDL-1.2.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libSDL-1.2.so.0 
(0xb721c000)
         libmp3lame.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libmp3lame.so.0 
(0xb71a8000)
         libgcc_s.so.1 => /lib/libgcc_s.so.1 (0xb7189000)
         libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb7044000)
         libXext.so.6 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libXext.so.6 
(0xb7035000)
         libX11.so.6 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libX11.so.6 
(0xb6f0f000)
         /lib/ld-linux.so.2 (0xb778e000)
         libdvdcss.so.2 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libdvdcss.so.2 
(0xb6f07000)
         libexpat.so.1 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libexpat.so.1 (0xb6ede000)
         libXau.so.6 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libXau.so.6 
(0xb6edb000)
         libXdmcp.so.6 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libXdmcp.so.6 (0xb6ed6000)
         libts-1.0.so.0 => 
/home/ebenard/OEx86/tmp/staging/i686-angstrom-linux/usr/lib/libts-1.0.so.0 
(0xb6ed3000)


