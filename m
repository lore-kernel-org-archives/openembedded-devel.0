Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id B720960685
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 18:27:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b3so18040511plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=uVupiluVOE0MF6X4KitooZugtU+QC1vKj1fLPMMLxXc=;
	b=r7rBK64cbU+6HAQ+QWURyMeB5tFfY60kvFX/uahK1ZCP4xB/Zd7kqcUZZuhWDFmmhM
	nbVfovQgMN3GlwZ2uW99281BP2OtzrvbtHYpkY3y98CSRi88JCtfmUNM3reMKilgK+SF
	WVXl4H4bDnIeExdkS/+IU6wUs49yv9zU5N9lmBcBPtIWkJN0ApFKG3C86v2Tq4BW9GPf
	z4Jx3phyPdfql4qgisnnMq7X408SDhXUVrnx81x8ftbCrnMtp45rVQEweJdWr332a6qq
	KPBeO8clLSOo/ZXw3whHKov5srnOyXPCxEbn54qwgxvNTk4nbdR+hDbA/zYDDTP7W7MG
	roUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=uVupiluVOE0MF6X4KitooZugtU+QC1vKj1fLPMMLxXc=;
	b=bGHUrJMr51e+tsWnv05qe38RwTKFIiweYv9nN7lDvcDijpBdArxkqD1BZxY7pjsAvv
	Uybr6GA4Ffz6//ab7tYMvAeVHDHqI2WKKjznE4yCV+1RZJ7GICZNJXiCpmYwclydAPNz
	bXHUDYBAjVXyM/ykVeZKUPmipVwq1yTU011OWxt7XCYpdRo3LQ1Pz5m9/BBZsSS3NQHA
	kbcvlHbDe+VlccKrTRN0VzhxVFaiRLqSsh62Lf6HXOhODShXi9TSBZqbQVViBVJxG4H2
	ff+/J+p/T3PtE1hZIqdNA3KX4VQkeFNm9Xm+9Lbmh9zMF/pElX2sziMotxY9dwMlvuV7
	GLVQ==
X-Gm-Message-State: APjAAAUlgHT3O4qf8Ov8ImvgJzO3y1RtB4Rshv2tB7iYiE86KWw9kL+f
	XPk2tp90/fGy5sFGzv/j0TUSuh3rerY=
X-Google-Smtp-Source: APXvYqygVszuOyWqLHamT8iivJ6lh0+aUISny9+y2GZ3/gvr8ofGmjL1i9PJK/uLeDiTjgsEuehqcQ==
X-Received: by 2002:a17:902:aa8a:: with SMTP id
	d10mr72383027plr.154.1563733665426; 
	Sun, 21 Jul 2019 11:27:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::effc? ([2601:646:8500:6bc6::effc])
	by smtp.gmail.com with ESMTPSA id
	a6sm33361025pjs.31.2019.07.21.11.27.43
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jul 2019 11:27:44 -0700 (PDT)
To: Ayoub Zaki <ayoub.zaki@embexus.com>,
	openembedded-devel@lists.openembedded.org
References: <20190721180605.5356-1-ayoub.zaki@embexus.com>
	<20190721180605.5356-2-ayoub.zaki@embexus.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <5fca05d2-5fd6-bd45-323c-47afc56e1c91@gmail.com>
Date: Sun, 21 Jul 2019 11:27:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721180605.5356-2-ayoub.zaki@embexus.com>
Subject: Re: [meta-oe][PATCH 2/2] usbguard: Initial recipe
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
X-List-Received-Date: Sun, 21 Jul 2019 18:27:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/21/19 11:06 AM, Ayoub Zaki wrote:
> Introduce the USBGuard software framework that helps to protect against rogue USB devices (a.k.a. BadUSB)
> by implementing basic whitelisting and blacklisting capabilities based on device attributes.
>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
> ---
>   .../usbguard/usbguard_0.7.4.bb                | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
>
> diff --git a/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> new file mode 100644
> index 000000000..a77694cc3
> --- /dev/null
> +++ b/meta-oe/recipes-security/usbguard/usbguard_0.7.4.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION="USBGuard framework helps to protect against BadUSB."
> +HOMEPAGE="https://github.com/dkopecek/usbguard"
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> +
> +SRC_URI="https://github.com/USBGuard/usbguard/archive/${PN}-${PV}.tar.gz"

Its better to use BP instead of PN-PV do it will work with multilib as well

> +SRC_URI[md5sum] = "ddaa9ae884200c861ad946f34dfd5ab9"
> +SRC_URI[sha256sum] = "d37886508583565aae0df6a110b11524c59b39e0deb25ee49fc34274e4784f55"
> +
> +inherit autotools pkgconfig systemd bash-completion
> +
> +S= "${WORKDIR}/${PN}-${PN}-${PV}"

this should also be ${BPN}-${BP}

> +
> +DEPENDS = "protobuf-native libxml2-native libxslt-native xmlto-native glib-2.0-native \
> +	dbus dbus-glib libqb libseccomp libcap-ng libgcrypt libsodium protobuf pegtl"
> +
> +EXTRA_OECONF += "--with-bundled-catch"
> +
> +PACKAGECONFIG ??= "libsodium \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
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
> +	sed -i 's|/var/log/usbguard/usbguard-audit.log|/var/log/usbguard-audit.log|g' \
> +						${D}${sysconfdir}/usbguard/usbguard-daemon.conf
> +}

