Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4367EE74
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 00:21:01 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g18so41755721qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 17:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sZNqExiAWrTXW2FiWaZOmDwklD0NLOben4g+s0hbSeo=;
	b=DvPxYqkAGLWjS+LRON/oDB1VvlUg4QkSngzVtMCiMseJ1RxRZyLm/WcPS4tSayjBBQ
	UPio16mKnFZm5KWFHpYUIYTLKWt9dGiCqA3JKaIKD+ocPWCUSNsHddW1CpO/XNd5liPA
	lgt6iNWWMmVwebxEaHuiWFkPIFaMWCPwfNB0GykTsV32W9t+cWZTOpoRRXOs+2iPqVdo
	QfuPRkmAW8X3SwzGkE4SaVaOy0yyyPtKq8XOEvEGfVbv1VdIUiqYoWZnYs7T/ZBBVJM5
	0TsDKrYBnOHfohIKxATlk7/+QCb29s8v28MFoHg+1GeYNvtxgU5t6wkZJiJ3O49H6Xhv
	9MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sZNqExiAWrTXW2FiWaZOmDwklD0NLOben4g+s0hbSeo=;
	b=t0zYuqAgOmxYDeMniVSaxMa+8FExSiGAJVBal1f+0DIqL8vuURXLEhSRNvJYRfxkWR
	uKGEBOru5EGHvnRI5KD4a1gl7bncBpQpiw189qx/thSdC88iabNq886FFvx8kKQNqoHy
	6daOuY6N93ODS2VjzJF4JtrXS9Tbf4/BxOVO0GHtHIxcyeLesGzKjQV93apFW4Y+Gk86
	F/qnR+d0ORhQJkA3wGaEXgJ3weE4Rbc7RQdQnDm+cXXk2O1qbLpNai6/J7MQEP9p/sAs
	krgA57wYxMotlWEuH0xqidNu08g8s5gAj012/mKE3k+HOM00g8TgysnEk2C8eEgdj/0u
	sOhQ==
X-Gm-Message-State: APjAAAXdC8B5CPlk6yKWgyD3JS+CxlcUnLD3kMWSMEuJPCq9L1rO/Ko+
	1FDytgsNYK1aCB3RnfV59OPpBk4/yThJtk3G3ma6n3bo9fY=
X-Google-Smtp-Source: APXvYqzLQErjs5nelDC4167Xd4gP8mVGeQSMY/G9YnfshFsScMBxTNtwkXw959fLBnHa4ePR6nPqIhH5Yo6zApkMZCg=
X-Received: by 2002:a37:c81:: with SMTP id 123mr70238795qkm.474.1564273261733; 
	Sat, 27 Jul 2019 17:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190726093736.24607-1-ayoub.zaki@embexus.com>
	<20190726093736.24607-2-ayoub.zaki@embexus.com>
In-Reply-To: <20190726093736.24607-2-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Jul 2019 17:20:35 -0700
Message-ID: <CAMKF1sp1ehMTaBQPeGJDGmL-s9RYrHVdwuzVrzgDjHYsvk=cRA@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sun, 28 Jul 2019 00:21:01 -0000
Content-Type: text/plain; charset="UTF-8"

We are seeing below failures on mips

checking for LIBGCRYPT - version >= 1.5.0... ERROR:
/usr/bin/libgcrypt-config should not be used, use an alternative such
as pkg-config

see https://errors.yoctoproject.org/Errors/Details/254961/

On Fri, Jul 26, 2019 at 2:37 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
> ---
>  .../usbguard/usbguard_0.7.4.bb                | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> new file mode 100644
> index 000000000..9ec21d2c7
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> +HOMEPAGE="https://github.com/dkopecek/usbguard"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +
> +SRCREV = "0ab32d7fa092067030fcbef530968b5cc237b08c"
> +SRC_URI = "git://git@github.com/USBGuard/usbguard.git;protocol=https;branch=master"
> +
> +inherit autotools pkgconfig systemd bash-completion
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> +       dbus dbus-glib libqb libcap-ng libgcrypt libsodium protobuf pegtl"
> +
> +EXTRA_OECONF += "--with-bundled-catch"
> +
> +PACKAGECONFIG ??= "libsodium \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
> +
> +PACKAGECONFIG[systemd]   = "--enable-systemd,--disable-systemd"
> +PACKAGECONFIG[libsodium] = "--with-crypto-library=sodium"
> +PACKAGECONFIG[libgcrypt] = "--with-crypto-library=gcrypt"
> +PACKAGECONFIG[polkit]    = "--with-polkit,--without-polkit"
> +PACKAGECONFIG[dbus]      = "--with-dbus,--without-dbus"
> +
> +SYSTEMD_SERVICE_${PN} = "${PN}.service"
> +SYSTEMD_PACKAGES += "${PN}"
> +
> +do_install_append(){
> +
> +       sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
> +                                               ${D}${sysconfdir}/usbguard/usbguard-daemon.conf
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

