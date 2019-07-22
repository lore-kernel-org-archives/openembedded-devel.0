Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08AFB7EFE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:41:47 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 201so27879109qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4mGDwQYempSJch74q2Jn+t5b1hurShu5IDOednFwdek=;
	b=eqL9vbDTUgZV+2jWuWJkPoqT4/jhUofr06UExSIh0bn3cCrRXofR75Oqo1tnubRApb
	SC400fRM65CTn1ap4QdLzFU9vLxFuInfIYQqyrrihONcUgiFbjIDgs2N8UEGlPJ23fvr
	+nuo1LxUfW2QpWxfkXcZHecAmmK3mX/AFRlgJrzGZr+Do5N1uU9j2jEOXTQGfd9B736o
	FjNncVCEVlwizRQgH7YqfFEKAxkLCLN9KhXw7gBCPTYLhNIwnl0UHn/0W8zN/4rTTyz3
	uHkqzyftYC6lEcOcRY1xp6/jCl2Ibk/Oe15gM7OrDQJfWcaBt+rhNCDq82XjJq2mxLPN
	KRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4mGDwQYempSJch74q2Jn+t5b1hurShu5IDOednFwdek=;
	b=KrmKNhlQC4pwLUPwh2+44cQwDbrlqg4Wc5iyvw3FqiS8lfCLMPu409Ak/xZTwUl/hs
	mETqG3JOB6PnP1kV8Cb8i07BPFkTNYPv7a01LR+x0jEp4yKKl5gBJiFeq1lSUhmcKPOW
	T1OFGaY0UEvqBf+8Sjf4rpKNMTLDrNYrmXq+y0ITjO0iGScgNBk3Juym+gHLJ1P58f3a
	nKyHUxKBCeV7lIebrXyMqXCd43LHyG9TYGk3wTWOhSboQcww9W5A19rYd8SzNMxwkeQO
	0BqRlN/OhXpvOTK9DVZ+Y+LcmQCfoHican3Vo3C7zwL0AdZwf4oJrta1N4RGvayBa9Gi
	o2/g==
X-Gm-Message-State: APjAAAVQtOL7z3CnVcV2j4fnAGc4l5Og4IC3LwrsXIXQb09ZhcdOIaMq
	hpZRC0M6Y95GORUI40FQSgoU2xhsqhlK0CsgBg38nvQT0Yo=
X-Google-Smtp-Source: APXvYqyf749EBIlDDEr3LvhjnVy1UhGGtBJIGkR8GmsmMS4duIbUIksg0pL+GUA5DJo/VXeaULV6MCtK92MzRN2nH78=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr12081687qkg.337.1563781308535; 
	Mon, 22 Jul 2019 00:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190721185137.27323-1-ayoub.zaki@embexus.com>
	<20190721185137.27323-2-ayoub.zaki@embexus.com>
In-Reply-To: <20190721185137.27323-2-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 00:41:22 -0700
Message-ID: <CAMKF1soc=iL9HotW4WDdkHLDS_10b2zWOGaOCN7FswcK_M7y2g@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Mon, 22 Jul 2019 07:41:48 -0000
Content-Type: text/plain; charset="UTF-8"

it seems to be using recipes from other layers see

ERROR: Nothing PROVIDES 'libseccomp' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
DEPENDS on or otherwise requires it). Close matches:
  libcomps
ERROR: Nothing RPROVIDES 'usbguard-dev' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'usbguard-dev'
NOTE: Runtime target 'usbguard-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['usbguard-dev']
ERROR: Nothing RPROVIDES 'usbguard' (but
/mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'usbguard'
NOTE: Runtime target 'usbguard' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['usbguard']

I would prefer it to be a packageconfig and disabled by default so it
can build without libseccomp

On Sun, Jul 21, 2019 at 11:51 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
> ---
>  .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> new file mode 100644
> index 000000000..eee381fbe
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> +HOMEPAGE="https://github.com/dkopecek/usbguard"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +
> +SRC_URI="https://github.com/USBGuard/usbguard/archive/${BP}.tar.gz"
> +SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
> +SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
> +
> +inherit autotools pkgconfig systemd bash-completion
> +
> +S= "${WORKDIR}/${BPN}-${BP}"
> +
> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> +       dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
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

