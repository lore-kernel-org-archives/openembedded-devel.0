Return-Path: <ahartmetz@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3202979B72
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:14:46 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b7-v6so10822340edd.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jzJDlfQW8y8n87nYGuwa1M5FUL9vknHh4ainhMTKR1Y=;
	b=Vs/fhPVnMTGmTrR6eN3uX+CJF6D4C9MBqMP354ujJuFB7w4Yl2ma3HMakYw5QJJcc5
	zaBLzeOfovpV9qbwsWarA0kneOgzHbaU1GecxkNQc3Mzdg/IJqqm4Ofj3DnF1CGWjx41
	QXN7orJXB5Pa43x+C0rh9xSdgkiA3zvqomZqHeBqz1M05JTXTm0z3EFpzOlEsfiwYR71
	gEXm0qHZIuvill7HpreB5Tm24kvjFd+ZUkzrCYRMG3Hrfu1oo9bs7c8JNj2Y6LVPoIhM
	VnaZjcfQIxjH5sUlVs+iI7nkNZBwqj7rwQlGbAK89qqpLCtefwvLa+dJj+5xqa238ppi
	pdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jzJDlfQW8y8n87nYGuwa1M5FUL9vknHh4ainhMTKR1Y=;
	b=OLrpASqVFSydI/TgUQm7hyuJN565l9anRO3Rbb6v97H7viSukpVmYC2TBn0R63qJA8
	KCF6W84Tsiz4lJghJn+Eei0+Be8FKy+tDXdsccDtuCmugfgihhciPLPKq6KbeFpoZQYZ
	WBAs/Nbt7v+JxcyHc8B/gr15zgGtua9t/qYfp55CuDK5KsMbTgBhrNtWdjlzXj4Ee3gs
	z60hI1DJAdSCCdWUZCo+pxU1ff1/err2YJnzRAZe/ZQvtvWJZaAiqca1q8Hq2UOcSpqO
	J9WZcwqdcAvrDmAXOH2F12f7hys6eGRBO+9n8TM+uwvO3AO8RNYI41NDu09J67zsT1WL
	iAJQ==
X-Gm-Message-State: ABuFfohAE/ffYiB2peP6EbZB9yg8UvrojaCcnpG91mndyof36xP4Nkkh
	K1beZ8yfa6LmPG88OWxSUsItGeWE
X-Google-Smtp-Source: ACcGV63TlJkhaReMzjH2jll52K4drKUhPIHbPV6ACBQfqp2Cc+n+B9h5lZr1Bmv4wrt7CngEu98WOQ==
X-Received: by 2002:a17:906:6a09:: with SMTP id
	o9-v6mr5972468ejr.99.1539335686496; 
	Fri, 12 Oct 2018 02:14:46 -0700 (PDT)
Received: from rechenplan.localnet
	(200116b84217e00009c3869ee049974e.dip.versatel-1u1.de.
	[2001:16b8:4217:e000:9c3:869e:e049:974e])
	by smtp.gmail.com with ESMTPSA id
	e30-v6sm403872edd.25.2018.10.12.02.14.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 02:14:45 -0700 (PDT)
From: Andreas Hartmetz <ahartmetz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 11:14:44 +0200
Message-ID: <1823137.JgcnNxDFaY@rechenplan>
In-Reply-To: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
References: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] libvncserver: Update to latest version
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
X-List-Received-Date: Fri, 12 Oct 2018 09:14:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

By the way, this new version of the recipe also drops the spurious GTK+ 
dependency of the old recipe. I was close to sending a patch to remove 
that dependency... Maybe worth a look to check if GTK+ pulled in 
anything libvnc might need or can put to good use. I didn't find 
anything, but I also didn't runtime-test VNC.

Am Dienstag, 9. Oktober 2018, 20:27:50 CEST schrieb Eddie James:
> The latest release of libvncserver is almost two years old. A number
> of security fixes and enhancements have recently been committed.
> Since the repo is stable, point the recipe to the latest commit.
> 
> libvncserver switched from autotools to cmake, so update the recipe as
> necessary, and add PACKAGECONFIG options to allow a more minimal
> build and install.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../libvncserver/libvncserver_0.9.11.bb            | 25
> ---------------------- .../libvncserver/libvncserver_git.bb          
>     | 23 ++++++++++++++++++++ 2 files changed, 23 insertions(+), 25
> deletions(-)
>  delete mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb create
> mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> 
> diff --git
> a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> deleted file mode 100644
> index 38dac06..0000000
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> -HOMEPAGE = "https://libvnc.github.io"
> -SECTION = "libs"
> -PRIORITY = "optional"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f" -
> -DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> -
> -PACKAGECONFIG ??=
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> -PACKAGECONFIG[systemd] = ",,systemd"
> -
> -RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
> -
> -inherit distro_features_check autotools binconfig pkgconfig
> -
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -SRC_URI =
> "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.ta
> r.gz" -SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
> -SRC_URI[sha256sum] =
> "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894" -
> -S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
> -
> -TARGET_LDFLAGS += "-lgcrypt"
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb new file
> mode 100644
> index 0000000..9fb2c09
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> +HOMEPAGE = "https://libvnc.github.io"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f" +
> +PACKAGECONFIG ??= "gcrypt gnutls jpeg png
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl
> zlib" +PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
> +PACKAGECONFIG[gnutls] = ",,gnutls"
> +PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
> +PACKAGECONFIG[openssl] = ",,openssl"
> +PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
> +PACKAGECONFIG[systemd] = ",,systemd"
> +PACKAGECONFIG[sdl] = ",,libsdl2"
> +PACKAGECONFIG[zlib] = ",,zlib"
> +
> +inherit cmake
> +
> +SRC_URI = "git://github.com/LibVNC/libvncserver"
> +SRCREV = "7b1ef0ffc4815cab9a96c7278394152bdc89dc4d"
> +
> +S = "${WORKDIR}/git"





