Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 854757EF36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:20:49 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id p184so16490045pfp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=uQncF+0imGN7N0JI8dQL7xpO752rEyM5nUFnz/yW3uc=;
	b=CI3wuqBiMHlDMUTOaq1dsM8t2tTXhascqlIp/9UB1DdQEhAkQaZlBxnTAU91PzPcXM
	IjUW94F+9P5sFRvH2LMg6+gLXFL39myU232O8wz5oKSzlFR0jWoLg1qnrcxrSfdolca3
	GhlFoSwy0rfss+sAB0iPaKnfA1fj8OY7uZv46gl9FKILl35bUt3WjU58/3N36cfr9ESA
	94LVguAfA9dOBNkqOqVBR30qqx+su35G3l8KUwL5SlBBRPtPK9PyymD9RydZMBfkJiu8
	LEmt9vUNGBR8abuZbca86PNFPQIFx6uiToDZCa6x1z6reV3yKesQJOKHtthS4KX2VCxv
	TYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=uQncF+0imGN7N0JI8dQL7xpO752rEyM5nUFnz/yW3uc=;
	b=g9KHPg//ccR/HxRbpllRIuUjUTI+cbasmAvQAnwSBA2T8o2pcQ/jiM1BxiyNsAzjNV
	grPxjb5NTCm80soIlMVbM1MDNr5IpL1+izOfh30jYG8CAS6ESPAbEVNWKlCUaZqhbOKI
	gp05DRYm2B5nYkAMMsDMs4rc9Vq6AMBcNOgQ6+4Fw6wlkx2WNUMCi8hYQbZ9sqFK3Qpv
	EMi5xSWrLZrh5LdTrV3OZTmWmEgvzgHkXYXV/yDtZD6bVtArt4cGDPsLxrupJTiib9jl
	dSdqZCS1cDJ8e9T2JbYFVY19YWehNo+ibvCYIR750sdNflDwc+ntHBXhx+r+nRW5ygpU
	Z/PQ==
X-Gm-Message-State: APjAAAU0QKp1XcJrRbW6f7G4TXjGCBWqACjw+4CNNwl+2Dw4cQwISJzD
	HzxhWqZCWZ1iZLcdZHTMhlKxmqzrcGk=
X-Google-Smtp-Source: APXvYqwKmo3iMU/2b55Ky498/NYXlb/8XRMK+krtQOghwZGGdUe7zLsi1d28zewxnGnSi+j5+TPegg==
X-Received: by 2002:a63:5c15:: with SMTP id q21mr45479735pgb.199.1563754849679;
	Sun, 21 Jul 2019 17:20:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::effc? ([2601:646:8500:6bc6::effc])
	by smtp.gmail.com with ESMTPSA id
	65sm37772382pff.148.2019.07.21.17.20.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jul 2019 17:20:49 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190721233802.32193-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <c9ce95b6-ddd4-a290-c7d7-04fd9fea116d@gmail.com>
Date: Sun, 21 Jul 2019 17:20:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721233802.32193-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-networking] blueman: update to 2.1.1
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
X-List-Received-Date: Mon, 22 Jul 2019 00:20:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

HI Oleksandr

Can you rebase this on top of master-next and resend ?

On 7/21/19 4:38 PM, Oleksandr Kravchuk wrote:
> Removed patch was upstreamed.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../blueman/blueman_2.1.1.bb                  | 58 +++++++++++++++++++
>   .../blueman/blueman_git.bb                    | 42 --------------
>   2 files changed, 58 insertions(+), 42 deletions(-)
>   create mode 100644 meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
>   delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman_git.bb
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> new file mode 100644
> index 000000000..36de2af1d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
> @@ -0,0 +1,58 @@
> +DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
> +
> +inherit autotools systemd gsettings python3native gtk-icon-cache
> +
> +SRC_URI = " \
> +    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
> +    file://0001-Search-for-cython3.patch \
> +"
> +SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
> +SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
> +
> +EXTRA_OECONF = " \
> +    --disable-runtime-deps-check \
> +    --disable-schemas-compile \
> +"
> +
> +SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> +
> +RRECOMENDS_${PN} += "adwaita-icon-theme"
> +RDEPENDS_${PN} += " \
> +    python3-core \
> +    python3-dbus \
> +    packagegroup-tools-bluetooth \
> +"
> +
> +PACKAGECONFIG ??= "thunar"
> +PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto"
> +
> +FILES_${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/Thunar \
> +    ${systemd_user_unitdir} \
> +    ${exec_prefix}${systemd_system_unitdir} \
> +    ${PYTHON_SITEPACKAGES_DIR} \
> +"
> +
> +FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
> +
> +# In code, path to python is a variable that is replaced with path to native version of it
> +# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/python3-native/python3.
> +# Replace it with #!/usr/bin/env python3
> +do_install_append() {
> +    sed -i "1s/.*/#!\/usr\/bin\/env python3/" ${D}${prefix}/libexec/blueman-rfcomm-watcher \
> +                                              ${D}${prefix}/libexec/blueman-mechanism \
> +                                              ${D}${bindir}/blueman-tray \
> +                                              ${D}${bindir}/blueman-services \
> +                                              ${D}${bindir}/blueman-sendto \
> +                                              ${D}${bindir}/blueman-report \
> +                                              ${D}${bindir}/blueman-manager \
> +                                              ${D}${bindir}/blueman-assistant \
> +                                              ${D}${bindir}/blueman-applet \
> +                                              ${D}${bindir}/blueman-adapters
> +}
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> deleted file mode 100644
> index 91b64a36b..000000000
> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -DESCRIPTION = "Blueman is a GTK+ Bluetooth Manager"
> -LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -
> -DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
> -
> -inherit autotools systemd gsettings python3native gtk-icon-cache
> -
> -SRC_URI = " \
> -    git://github.com/blueman-project/blueman.git \
> -    file://0001-Search-for-cython3.patch \
> -"
> -SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
> -PV = "2.0.5+git${SRCPV}"
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OECONF = " \
> -    --disable-runtime-deps-check \
> -    --disable-schemas-compile \
> -"
> -
> -SYSTEMD_SERVICE_${PN} = "${BPN}-mechanism.service"
> -SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> -
> -RRECOMENDS_${PN} += "adwaita-icon-theme"
> -RDEPENDS_${PN} += " \
> -    python3-dbus \
> -    packagegroup-tools-bluetooth \
> -"
> -
> -PACKAGECONFIG ??= "thunar"
> -PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto"
> -
> -FILES_${PN} += " \
> -    ${datadir}/dbus-1 \
> -    ${datadir}/Thunar \
> -    ${systemd_user_unitdir} \
> -    ${exec_prefix}${systemd_system_unitdir} \
> -    ${PYTHON_SITEPACKAGES_DIR} \
> -"
> -
> -FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"

