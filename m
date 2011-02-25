Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PstyK-0001S9-Ga for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 10:28:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pstwx-0006Ix-R7 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 10:26:59 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 10:26:59 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 10:26:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 25 Feb 2011 10:26:44 +0100
Message-ID: <ik7skk$9g$1@dough.gmane.org>
References: <4D668BB8.1090707@mentor.com>	<1298590758-8843-1-git-send-email-denis@denix.org>
	<1298590758-8843-3-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1298590758-8843-3-git-send-email-denis@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/3] gst-ffmpeg: remove 4-year old hack that sets CC directly
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
X-List-Received-Date: Fri, 25 Feb 2011 09:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-02-11 00:39, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> The hack that sets CC variable directly is 4 year old and no longer required.
> On the other hand, it now breaks setups when --sysroot needs to be passed to
> the toolchain. Hence, remove the hack.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <koen@opembedded.org>


> ---
>  recipes/gstreamer/gst-ffmpeg_0.10.11.bb |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> index 3a6533a..563521e 100644
> --- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> +++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> @@ -5,6 +5,8 @@ LICENSE = "LGPL"
>  HOMEPAGE = "http://www.gstreamer.net/"
>  DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
>  
> +PR = "r1"
> +
>  inherit autotools pkgconfig
>  
>  SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
> @@ -23,7 +25,3 @@ EXTRA_OECONF = " --with-system-ffmpeg "
>  # We do this because the install program is called with -s which causes it to
>  # call "strip" and it then mangles cross compiled stuff..
>  PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
> -
> -# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
> -CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
> -

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNZ3XUMkyGM64RGpERAkC7AJ9/AQNel/Bukfi6mN3pkcBWLIcOYQCeND3A
OBS/tzWO5+bNmprpCd0WppU=
=GE2x
-----END PGP SIGNATURE-----



