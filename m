Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USz8A-0006QV-Gw
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 02:24:50 +0200
Received: by mail-pa0-f46.google.com with SMTP id lb1so1899145pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ks/BTUFKFe6Ko1jHaPGrANX6Ho9X3rAAFTsqb/oNVW8=;
	b=HmcHqpZOmwDa1E+C+gO3K2WntZiRKu6hERBg7UibiSh/kihf6nBRuDKvXRwYJPEvy3
	AhwwgJEr8zyNXuLNCH7DwmvLRlPgoRARL7N3zvS/0OC6AzHqOx0FuI7v5onNYeVSxu7U
	B1uvkNx/XAgWOqcH7bH4Gx/ZEYVdpJwKh5qtiU/Sz8/tcCCJr5yq3iqaDF4NHb3xUCv6
	i4jej7u29sMnc+DvFzp6mIc+SCbh1EpK+Y1lZp/bBwYlU29EFa2KOGW59+wF1jphjinI
	XrniYGoEIVI6JnlrfGpN8gUPGttvhgeNuYhctntDpGywS0ouuD+GObQhqQqZFwl/lw27
	Dw6A==
X-Received: by 10.66.144.103 with SMTP id sl7mr2525991pab.55.1366330032048;
	Thu, 18 Apr 2013 17:07:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wz9sm11340453pbc.5.2013.04.18.17.07.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 17:07:11 -0700 (PDT)
Date: Fri, 19 Apr 2013 02:07:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130419000711.GD2489@jama>
References: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 1/2] linux-yocto_3.8: move Zaurus patches to the respective subdirs
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
X-List-Received-Date: Fri, 19 Apr 2013 00:24:56 -0000
X-Groupsio-MsgNum: 44325
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline

--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2013 at 01:52:06AM +0200, Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.8/akita/akita.scc          |   8 +-
>  recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   6 +-
>  .../linux/linux-yocto-3.8/collie-eraseinfo.patch   |  31 -----
>  .../linux/linux-yocto-3.8/collie-jedec-probe.patch |  11 --
>  .../linux/linux-yocto-3.8/collie/collie.scc        |   8 +-
>  .../linux-yocto-3.8/locomo_kbd_tweak-r2.patch      |  75 ------------
>  .../linux/linux-yocto-3.8/mcp-device.patch         |  13 --
>  .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |  75 ++++++++++++
>  .../patches/patches-mfd/mcp-device.patch           |  13 ++
>  .../patches/patches-mtd/collie-eraseinfo.patch     |  31 +++++
>  .../patches/patches-mtd/collie-jedec-probe.patch   |  11 ++
>  .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |  34 ++++++
>  .../patches/patches-pxa/pxamci-regulator.patch     | 135 +++++++++++++++++++++
>  .../patches/patches-pxa/sharpsl_param.patch        |  24 ++++
>  .../patches/patches-pxa/spi-pxa2xx-fix-mem.patch   |  34 ++++++
>  .../linux/linux-yocto-3.8/poodle/poodle.scc        |   8 +-
>  .../linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch  |  34 ------
>  .../linux/linux-yocto-3.8/pxamci-regulator.patch   | 135 ---------------------
>  .../linux/linux-yocto-3.8/sharpsl_param.patch      |  24 ----
>  .../linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch |  34 ------
>  .../linux/linux-yocto-3.8/spitz/spitz.scc          |   8 +-
>  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   6 +-
>  22 files changed, 379 insertions(+), 379 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
>  delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch

Would be nice to send this with -M.

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFwiq8ACgkQN1Ujt2V2gBxXXQCgidOF34BL3jrVTZE3Qlv3tyre
yzsAn3LOiTz6HyQ/JvwTuTwMaVbwiCn6
=4ELH
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
