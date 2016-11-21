Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1E78D60722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 14:22:34 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id b35so227131198uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=LaIpLLEQs6lx/Comr+/Cosgl0TprXH+p9wImqejKdg4=;
	b=YsGkh9YiqQcSIIvpDIrC7UGTnqCysFWNqcYKxwv/+ql9/SRpfJH+s2ChNP3BmK9+8o
	2mF+GqB7ogl2MiQk3rzJGfLmRPdLKpyVCuAZSJ240+2uANRzkTOhMZNoxC1TAZANNwMQ
	QAgt+hRC4W9NmVNyF2YnyKO/7omBSIKcuy4VZKqKADGTbiXdcklArdbVuHq9QrnaxAak
	oGQDjlrch+3WKhc/crvQAbjKIdEHczYv8My9mClGMpQ5GI87SHjErDetidIeFD5OHyyN
	nLtPUNW5XoFgcrEf2NfwXpF3Y0gCssxJGmcYdctR7U5BLnRD6rWA6FWoknsptIQ49Gv0
	vcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=LaIpLLEQs6lx/Comr+/Cosgl0TprXH+p9wImqejKdg4=;
	b=EioCQjQpc3u+V+TXzleYp5R/hreA9wN77mG/kqZYUZVRm6A/7/R0vYEDCGqo9SFPfg
	v6VNQtr7MxjJtWNi3YZHxnr02Ns6W5LRq+GJRLR3DLNEmPTGLQ0u+ErOIHSVBYJ2W9bv
	dxMhGwMzf58iIDnUjF9tynRGOFX6sDpmTAEhKlZmVjfpNFY2Uwd1PJ+MIO/5LJflrQHv
	T4WyYQU18qHlLx4Tn6IXCUm4kCPiGe6hN7SQPOmzHGEC9Zk0fZ18L2e7SOMwzSqhvJJP
	boZelp29etDMZXgflU/VlI4CUc3gzWeKWmcTENdVYdQKN9/DNUDDPmzZa9slnjw/YNUz
	m7yw==
X-Gm-Message-State: AKaTC0231aolsAhYjYKOg+k4/KRdTvg0lFOI6m+pSmqac2ITywCp+F/sz6spUwbH5Ux5/HJDL0ffLJfCow25Cg==
X-Received: by 10.176.1.180 with SMTP id 49mr7767592ual.55.1479738155865; Mon,
	21 Nov 2016 06:22:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.146.208 with HTTP; Mon, 21 Nov 2016 06:22:34 -0800 (PST)
In-Reply-To: <CADnUhn1fM7kJFPssio+cPXsdwAEzi3oGoO-iymcFAshXOT2e5w@mail.gmail.com>
References: <CADnUhn1fM7kJFPssio+cPXsdwAEzi3oGoO-iymcFAshXOT2e5w@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Mon, 21 Nov 2016 16:22:34 +0200
Message-ID: <CADnUhn08-5h=cVZ7v+oyu4CAeUhx2zY7qF-+3BxjBqxFM_QgEw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: usb-modeswitch 2.2.0 not compatible with systemd-udevd version provided by poky/krogoth and newer
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
X-List-Received-Date: Mon, 21 Nov 2016 14:22:36 -0000
Content-Type: text/plain; charset=UTF-8

It does not work anymore. It worked about half an hour/one hour. Now
operation is even worse than it used to be. So, I would be very reserver
with these patches.
-Matti

2016-11-21 11:46 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
>
> I faced with similar problem described in https://bbs.archlinux.org/
> viewtopic.php?id=199075 .
> In short the latest usb-modeswitch version (2.2.0) of meta-openembedded is
> not compatible with the latest versions of poky distribution (from krogoth
> on).
>
> I made a recipe for building the latest usb_modeswitch that seems fixing
> this problem at least in my case. I also made a recipe loading the latest
> usb-modeswitch-data.
>
> Please find them below.
>
> Take care,
> Matti Kaasinen
>
> =============================PATCH ================================
> ## Add usb-modeswitch_2.4.0.bb and usb-modeswitch-data_20160803.bb
> ---
> diff -Naur a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.
> 0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
> 1970-01-01 02:00:00.000000000 +0200
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
> 2016-11-21 11:18:12.380995084 +0200
> @@ -0,0 +1,19 @@
> +SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple
> device) USB gear"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +DEPENDS = "libusb1"
> +
> +SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "6e1640db47768bb9012f91b7593116ef"
> +SRC_URI[sha256sum] = "17dc32bf10df8e370f2369b5137d34
> dfd8f2347faaa51524c5f21c922f42e212"
> +
> +EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
> +
> +FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch
> ${sbindir} ${localstatedir}/lib/usb_modeswitch"
> +RDEPENDS_${PN} = "tcl"
> +RRECOMMENDS_${PN} = "usb-modeswitch-data"
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} install
> +}
> diff -Naur a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20160803.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20160803.bb
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20160803.bb    1970-01-01 02:00:00.000000000 +0200
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-
> data_20160803.bb    2016-11-21 11:18:12.380995084 +0200
> @@ -0,0 +1,17 @@
> +SUMMARY = "Data files for usbmodeswitch"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +inherit allarch
> +
> +SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "acc927e44827837eb23b2a7980b38a35"
> +SRC_URI[sha256sum] = "83f4a277c6e34b8537740ae16bf927
> 5008f7bf3f326134e0f846656a61a756fe"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D}
> +}
> +
> +RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
> +FILES_${PN} += "${base_libdir}/udev/rules.d/ \
> +                ${datadir}/usb_modeswitch"
>

