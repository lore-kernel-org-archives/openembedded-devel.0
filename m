Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED58745B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 04:22:09 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id l2-v6so8806957pgc.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JU0U/KI7LXFXsfQ8fEeuYuE7KM4/3q4l7Uim6+ZDnDc=;
	b=S9DQQr+dKWBiNNPRu8867Exc3YTJh/jglaJW/n/Jf9UssbXlA4K8TPSKW7oNU19a7X
	fAzZ1f6sqvrPEUQVGlT6MmxC3GJlWcbjSB0LWyI0C+qyxOxgQDyeOYjSHlKwITNrHVjG
	tbll48wU15Cglo2jpEPsFmx5cIbNy3nzxAKwXpeQHs+nu7xSaBJqQmIw8Gk+QruVry3E
	6omrdHZPZ5TqnAO4eBogD7i82Z3WYpBiYkbR76sObfptDfPlU0Uywl8LASJ93OTfrvbt
	B1cOWDCt2T+586G2rq6c0mcGsfdMCkPWiZj1JJrLlAHoL05QDxieBFmkIszL/pXJypwK
	iEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JU0U/KI7LXFXsfQ8fEeuYuE7KM4/3q4l7Uim6+ZDnDc=;
	b=hN6pRKdzwtZAdKEwxz5aZgr7HLScdBuc44lK/jp3A3V8rjJkfLknssHM1Th7ZEecPR
	LImD2JEtlZjY+h2l6JcNII/s3O1fggOSo9xHYc3cfyI2BD4A4K/jfplOM5v24vZJWqUw
	4hzKYpyc3I6fpy8DfCPjPbF4LQ/PYwG4UsuXFzw4FF67IYaMM1b1Gegi7YHljidesIKS
	RzVQt4llzwdSC15H72zAU4qtLGMLuvj+IN88QOQrku9yWNyFImutPD9r7SAp5R1Abank
	xcGTfWzrGU6OaQSBKWdBBdGzJ6xJFeBITctcU6bPn90WMBv5woSibgGly5oH/j1V4BPd
	mABw==
X-Gm-Message-State: ALKqPwcqeOmdFUNUKVOWz0/n+qb2Syu0bH95YrCNc+LoJ1xAWVsobNnt
	psjjLDf0zuLw7ugVJ/9SSjOPM2X8+FS5Mha5DUGTwA==
X-Google-Smtp-Source: AB8JxZqS6ZVB2tM55NN0m9RzgazHaFxqQRjoOsozHE7x2P8dWzN9VRIQy3wivmmMLkHEVS2CTIJbI/vQmZrZ6Fl9qeQ=
X-Received: by 2002:a62:5b02:: with SMTP id p2-v6mr1263863pfb.96.1527049330897;
	Tue, 22 May 2018 21:22:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 21:21:40
	-0700 (PDT)
In-Reply-To: <1526914374-27705-1-git-send-email-dmitri.vorobiev@movial.com>
References: <49c90165-022b-38b9-fec7-79c492777951@gmail.com>
	<1526914374-27705-1-git-send-email-dmitri.vorobiev@movial.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 May 2018 00:21:40 -0400
Message-ID: <CAMKF1sqiSzbnqTWzEowuFO5ibuLuRbRmuEL2ntdNRSdcd6Xh_Q@mail.gmail.com>
To: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] [meta-oe] usb-modeswitch: Upgrade to version 2.5.1
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
X-List-Received-Date: Wed, 23 May 2018 04:22:10 -0000
Content-Type: text/plain; charset="UTF-8"

I am getting

ERROR: usb-modeswitch-data-20170806-r0 do_fetch: Fetcher failure for
URL: 'http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-20170806.tar.bz2'.
Unable to fetch URL from any source.
ERROR: usb-modeswitch-data-20170806-r0 do_fetch: Function failed: base_do_fetch


is that intermittent ?

On Mon, May 21, 2018 at 10:52 AM, Dmitri Vorobiev
<dmitri.vorobiev@movial.com> wrote:
> Use a later version of usb-modeswitch (2.5.1) and
> usb-modeswitch-data (20170806).
>
> Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
> ---
>  .../usb-modeswitch/usb-modeswitch-data_20170205.bb | 19 ---------------
>  .../usb-modeswitch/usb-modeswitch-data_20170806.bb | 19 +++++++++++++++
>  .../usb-modeswitch/usb-modeswitch_2.5.0.bb         | 27 ----------------------
>  .../usb-modeswitch/usb-modeswitch_2.5.1.bb         | 27 ++++++++++++++++++++++
>  4 files changed, 46 insertions(+), 46 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
>  create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
>  delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
>  create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
>
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
> deleted file mode 100644
> index eeed5e2..0000000
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "Data files for usbmodeswitch"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> -inherit allarch
> -
> -DEPENDS += "tcl-native"
> -
> -SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
> -SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
> -
> -do_install() {
> -    oe_runmake install DESTDIR=${D}
> -}
> -
> -RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
> -FILES_${PN} += "${base_libdir}/udev/rules.d/ \
> -                ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
> new file mode 100644
> index 0000000..eeed5e2
> --- /dev/null
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Data files for usbmodeswitch"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +inherit allarch
> +
> +DEPENDS += "tcl-native"
> +
> +SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
> +SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D}
> +}
> +
> +RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
> +FILES_${PN} += "${base_libdir}/udev/rules.d/ \
> +                ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
> deleted file mode 100644
> index ac0df8b..0000000
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> -DEPENDS = "libusb1"
> -
> -SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
> -SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
> -
> -inherit pkgconfig systemd
> -
> -SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
> -
> -EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
> -
> -FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
> -RDEPENDS_${PN} = "tcl"
> -RRECOMMENDS_${PN} = "usb-modeswitch-data"
> -
> -do_install() {
> -    oe_runmake DESTDIR=${D} install
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -        install -d ${D}/${systemd_unitdir}/system
> -        install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
> -    fi
> -}
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> new file mode 100644
> index 0000000..ac0df8b
> --- /dev/null
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +DEPENDS = "libusb1"
> +
> +SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
> +SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
> +
> +inherit pkgconfig systemd
> +
> +SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
> +
> +EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
> +
> +FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
> +RDEPENDS_${PN} = "tcl"
> +RRECOMMENDS_${PN} = "usb-modeswitch-data"
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} install
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}/${systemd_unitdir}/system
> +        install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
> +    fi
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

