Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2JVt-0002eW-Sq for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 10:38:29 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2JNj-0008Un-QD for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 10:30:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:30:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:30:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2012 10:27:43 +0100
Message-ID: <jii6me$ae8$2@dough.gmane.org>
References: <1330368617-28664-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1330368617-28664-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Tue, 28 Feb 2012 09:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 27-02-12 19:50, Martin Jansa schreef:
> * virtual/kernel was needed only to provide omapfb.h in staging but
> that's now moved to BSP layers, no need to make sstate hash machine
> specific here.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++-- 1 files
> changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb index
> 3e4d369..fd25ec0 100644 ---
> a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb @@ -1,7 +1,7 @@ 
> DESCRIPTION = "Open Source multimedia player." SECTION = "multimedia" 
> HOMEPAGE = "http://www.mplayerhq.hu/" -DEPENDS = "libvpx live555
> libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52
> freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11
> virtual/kernel libass \ +DEPENDS = "libvpx live555 libdvdread libtheora
> virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig
> alsa-lib lzo ncurses lame libxv virtual/libx11 libass \ 
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame',
> d)}"
> 
> RDEPENDS_${PN} = "mplayer-common" @@ -18,7 +18,7 @@ SRC_URI =
> "git://repo.or.cz/mplayer.git;protocol=git;branch=master \
> 
> SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
> 
> -ARM_INSTRUCTION_SET = "ARM" +ARM_INSTRUCTION_SET = "arm"
> 
> PV = "2.0+gitr${SRCPV}" PR = "r7"

Can you please bump PR as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9Mng8ACgkQMkyGM64RGpEZEgCbB1JZBiHUh7Uauhmv14O2xTf1
9rgAnjD8skwE/Hsu3JHRVq/gaS2pv8ke
=9Ymq
-----END PGP SIGNATURE-----



