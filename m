Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UFi3J-0003Zc-9h for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 10:32:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UFhnW-00050i-A8 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 10:16:34 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 10:16:34 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 10:16:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 13 Mar 2013 10:15:59 +0100
Message-ID: <khpg4b$cvv$1@ger.gmane.org>
References: <1363126161-9828-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1363126161-9828-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCH] libav: library packages shouldn't rdepend on libav package
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
X-List-Received-Date: Wed, 13 Mar 2013 09:32:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-03-13 23:09, Andreas Oberritter schreef:
> Otherwise the libav executables (avplay, ffmpeg etc.) get dragged into
> the image, along with all their dependencies (e.g. SDL).
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- 
> meta-oe/recipes-multimedia/libav/libav.inc |    3 ++- 1 file changed, 2
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc
> b/meta-oe/recipes-multimedia/libav/libav.inc index 388a567..54307af
> 100644 --- a/meta-oe/recipes-multimedia/libav/libav.inc +++
> b/meta-oe/recipes-multimedia/libav/libav.inc @@ -11,7 +11,7 @@
> ARM_INSTRUCTION_SET = "arm" # faac faad2 lame schroedinger libgsm DEPENDS
> = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
> 
> -INC_PR = "r7" +INC_PR = "r8"
> 
> inherit autotools pkgconfig
> 
> @@ -96,6 +96,7 @@ python populate_packages_prepend() { 
> do_split_packages(d, av_libdir, '^lib(.*)\.so\..*', 
> output_pattern='lib%s', description='libav %s library', +
> extra_depends='', prepend=True, allow_links=True)

Ah, so that's why that happens!

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRQEPPMkyGM64RGpERAoWvAKCPmD5imlxQhkUotQftxW094mTzsgCbBMeG
FhxvbTNmnXhaKhfrgaeVigE=
=Jmzk
-----END PGP SIGNATURE-----



