Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6D147719A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 09:46:05 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id 20so221688046uak.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=oL/ZUG3i0xQ6vWKEmPHIiZ8yB1fE4zOLWRgwtzST0sM=;
	b=H3gF5atxf8BEvXEsfwJ7jAQdTNA/wkB0xSPDtRm9H9GRjd+BTHLqylPKc7uUqdrqCo
	8nXJrLOqU6S3G6/lwXSrUs4453077m7uuTwUNch5AJVfswEIcRt2ZlmbH3O3FxOBoMXR
	3lGUnBSpaYJBVeBzUQzskVX+stVxUDvDds/0aGXoSk6R1kCW1eKmtSezfEW89s0Z5TVo
	XXGU91nsZ4ousa2MYw0nocZIsVXCj7BQRD4KmOvCu9inWnl6cvkFmjCKoE+KKuaBzLsv
	wdhxwpEBxroY2Ow6Wa1vPLgG4pMY5RRNWtBFIJ0B2AKUaJ5eA34deg5uql3+O/0Iu+za
	IREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=oL/ZUG3i0xQ6vWKEmPHIiZ8yB1fE4zOLWRgwtzST0sM=;
	b=WDnsnwOeUNGofXR/EUEXHy/6sCvWRK5Qg7mN2M4rTzXl5FkNeOM8C9PNbPLzZIg4lL
	HOw4tUe6ie6TnHI+mkMgPsdf2i96mjIEnzD60qrBoYr8qcZQJTz/9BF7rRBb4dzJ0ea7
	KTFIHtOpq58+CRDUINMcW3kEhGhoIDFTi7k90F4Gyjr73tqgm8dQSzM9DKWXQRzLAefj
	r27kKyqJwU5sJQwu8UiCHeF9QHVdjnoD0jhgedN92U9OFd53uicvJU5tC+k/8V94H9Tf
	vC02jLfh7gjJzItquwodqLGix8weQtTv0gsBTzQdk1npbbF3yLfg8EX2xO/RAWpVdvLF
	qIHQ==
X-Gm-Message-State: AKaTC00gORvsOZ02FCKuYnR8o06wEmFd7jhhBMykxdZq5tZY01to3VNRbcCsPEzsfxdvQTu8a/f6egS07h0KbA==
X-Received: by 10.176.71.133 with SMTP id v5mr7454565uac.68.1479721566136;
	Mon, 21 Nov 2016 01:46:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.146.208 with HTTP; Mon, 21 Nov 2016 01:46:05 -0800 (PST)
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Mon, 21 Nov 2016 11:46:05 +0200
Message-ID: <CADnUhn1fM7kJFPssio+cPXsdwAEzi3oGoO-iymcFAshXOT2e5w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: usb-modeswitch 2.2.0 not compatible with systemd-udevd version provided by poky/krogoth and newer
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
X-List-Received-Date: Mon, 21 Nov 2016 09:46:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi!

I faced with similar problem described in
https://bbs.archlinux.org/viewtopic.php?id=199075 .
In short the latest usb-modeswitch version (2.2.0) of meta-openembedded is
not compatible with the latest versions of poky distribution (from krogoth
on).

I made a recipe for building the latest usb_modeswitch that seems fixing
this problem at least in my case. I also made a recipe loading the latest
usb-modeswitch-data.

Please find them below.

Take care,
Matti Kaasinen

=============================PATCH ================================
## Add usb-modeswitch_2.4.0.bb and usb-modeswitch-data_20160803.bb
---
diff -Naur a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
1970-01-01 02:00:00.000000000 +0200
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.4.0.bb
2016-11-21 11:18:12.380995084 +0200
@@ -0,0 +1,19 @@
+SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple
device) USB gear"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libusb1"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "6e1640db47768bb9012f91b7593116ef"
+SRC_URI[sha256sum] =
"17dc32bf10df8e370f2369b5137d34dfd8f2347faaa51524c5f21c922f42e212"
+
+EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
+
+FILES_${PN} = "${bindir} ${sysconfdir}
${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir}
${localstatedir}/lib/usb_modeswitch"
+RDEPENDS_${PN} = "tcl"
+RRECOMMENDS_${PN} = "usb-modeswitch-data"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
diff -Naur a/meta-oe/recipes-support/usb-modeswitch/
usb-modeswitch-data_20160803.bb b/meta-oe/recipes-support/usb-modeswitch/
usb-modeswitch-data_20160803.bb
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20160803.bb
1970-01-01 02:00:00.000000000 +0200
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20160803.bb
2016-11-21 11:18:12.380995084 +0200
@@ -0,0 +1,17 @@
+SUMMARY = "Data files for usbmodeswitch"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit allarch
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "acc927e44827837eb23b2a7980b38a35"
+SRC_URI[sha256sum] =
"83f4a277c6e34b8537740ae16bf9275008f7bf3f326134e0f846656a61a756fe"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
+FILES_${PN} += "${base_libdir}/udev/rules.d/ \
+                ${datadir}/usb_modeswitch"

