Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96FEE7C6F1
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 21:56:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18482.1769896601794808633
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 13:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FxFiF9kp;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so42891955e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769896600; x=1770501400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsYmiSj4b+JXV5N6yh24y3v1tEMXuZndDvlu4Erqz8k=;
        b=FxFiF9kpdcmPtkFULkxag0mMVhTghQhhfv7QuEi9B5dDVj03OMEmC6XxMFGL4JGtWF
         sypku1c4SGt4MrFxbk6PLe+BBzDs0mO0URscVa5mr97SuxaYoO2P5qN4XzgrLcsFv74I
         AL1fpEBEbaaYlAgLQJwnUYa2WxXU+UzVosvbDeV4xCGLXmtgpSbD3e9/hJsatcIBcSG8
         xluVlyhSTeiaz5eoyrO4C/T6/6l1Rqct396HvIsXQrMWtQ+B21wv0eWGJBvhYtVoEZMc
         WN0H66AeSups2v1cxAng1FZUuxdNoZPhaKbiAw19uMmHNN1XljpQwjb/mfWZtOYOUcTZ
         2aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896600; x=1770501400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsYmiSj4b+JXV5N6yh24y3v1tEMXuZndDvlu4Erqz8k=;
        b=Mcz7a4PK579ibqHtoiPuQYiLs3hRTHZWbhbTJiDzS4n2frbeFIKfqimzMGw/up8UHT
         3aI2c9rxEZrjaugiP/tx1DQaXobszfiyLadbeepfzHi7Z2xf4GMn8wpQy13jJMA1ZP7M
         ml/qHsYNiAXwBUUO/djcl5X8aH68CWQxgd6tl8eJhLflHYqHK6GybMYWsJP05boOuyb1
         c2RDCOr8PqJFWhKD2xZSbdLtBgmVS6IGnsOE2TWkLEyoTHeg3mWfZ7iSSC/sp85/+j6q
         DcHkiKdai/TzokmU6H02lJ6K+KqP/KvFM9QuRO4V5mvO35lgeEaGf+xXwBsYq2OC4Klg
         ZljA==
X-Gm-Message-State: AOJu0YzxP9iZgHjPk3vIbrEyE2BpXiaDVdIRvsT2c3t8W/EPuLD+s8n8
	9JpO692Ngr/m5DOHFhqbVC2tYpsaemzgy+HVGbk+OCwPNPgrHBe0s6hlXNEXJw==
X-Gm-Gg: AZuq6aLwn+1EIeIaWFT5UipX4VpeDXpO4JaaaBtwFuB2q9XGjeop2rVZFnkRTeKsqBj
	w5tIItirXyTTl1Y3UpX084AX1VQpcdH+ElTCddGoPD17dFG9eS36cYPZQ8ACsAwcEX/ct4cN7y4
	ofpo5bb8xf/J0/PPtBcVZmTI2+yPZT4iHy1W7V8FxU9pJ8h4agcaqnmo4nYN3nS+TyKhAaMyT9u
	FDn/i0ejMEs5Z28FfSkl9kNSmSlUyUmNQYXSfYjAKNDJOi08JECr2jHXOdpqAjiUaeeIWLkxxxU
	TYAKor2rY2eJqL6vZgN6BULDJ36Q1KlmhbQjcVvSutZfLP2RlTW9fssEyFkOOF2wbb7cmkwKkR/
	zBIJfQHBVRNuzjboMsiWhdtZQO/Nlhfoq4IOJubN8HI44AEdA0qfcqVMHBsjKKKN259xRrMnU2a
	yXdM9dHi1d
X-Received: by 2002:a05:600c:6814:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-482db4b21c6mr74166155e9.37.1769896600146;
        Sat, 31 Jan 2026 13:56:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm276840065e9.12.2026.01.31.13.56.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:56:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mailcap: add recipe
Date: Sat, 31 Jan 2026 22:56:35 +0100
Message-ID: <20260131215636.2633863-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131215636.2633863-1-skandigraun@gmail.com>
References: <20260131215636.2633863-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 21:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124022

This recipe is one of the successors of the mime-support, which
provided mailcap and mime.types files. This recipe contains
only the mailcap portion.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mime-support/mailcap_3.75.bb              | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/mime-support/mailcap_3.75.bb

diff --git a/meta-oe/recipes-support/mime-support/mailcap_3.75.bb b/meta-oe/recipes-support/mime-support/mailcap_3.75.bb
new file mode 100644
index 0000000000..6dc1fb3f8a
--- /dev/null
+++ b/meta-oe/recipes-support/mime-support/mailcap_3.75.bb
@@ -0,0 +1,54 @@
+SECTION = "base"
+SUMMARY = "MIME files 'mailcap', and support programs"
+LICENSE = "PD & Bellcore"
+LICENSE:${PN} = "PD"
+# mailcap.man's license is Bellcore
+LICENSE:${PN}-doc = "PD & Bellcore"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=881b8546ad4d18ee8d55d42c93cda0b6"
+
+DEPENDS = "file"
+RDEPENDS:${PN} = "perl"
+RRECOMMENDS:${PN} = "file"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI[sha256sum] = "44876c7241693ab32de57e799052b19a575ae0e27e85380537225708f562738f"
+S = "${UNPACKDIR}/work"
+
+FILES:${PN} += " ${libdir}/mime"
+
+docdir:append = "/${BPN}"
+
+do_install () {
+    install -d ${D}${sysconfdir}
+    install -d ${D}${libdir}/mime/packages
+    install -d ${D}${docdir}
+    install -d ${D}${sbindir}
+    install -d ${D}${bindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man5
+    install -d ${D}${mandir}/man8
+    install -m 644 mailcap            ${D}${libdir}/mime
+    install -m 644 mailcap.order      ${D}${sysconfdir}/
+    install -m 644 mailcap.man        ${D}${mandir}/man5/mailcap.5
+    install -m 644 mailcap.order.man  ${D}${mandir}/man5/mailcap.order.5
+    install -m 755 update-mime        ${D}${sbindir}/
+    install -m 644 update-mime.man    ${D}${mandir}/man8/update-mime.8
+    install -m 755 run-mailcap        ${D}${bindir}/
+    install -m 644 run-mailcap.man    ${D}${mandir}/man1/run-mailcap.1
+    install -m 644 debian/changelog   ${D}${docdir}
+    install -m 644 debian/copyright   ${D}${docdir}
+    install -m 755 debian-view        ${D}${libdir}/mime/
+    install -m 644 mailcap.entries    ${D}${libdir}/mime/packages/mailcap
+    cd ${D}${mandir}; gzip -9fv */*
+    cd ${D}${docdir}; gzip -9v changelog
+    cd ${D}${bindir}; ln -s run-mailcap see
+    cd ${D}${bindir}; ln -s run-mailcap edit
+    cd ${D}${bindir}; ln -s run-mailcap compose
+    cd ${D}${bindir}; ln -s run-mailcap print
+    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz see.1.gz
+    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz edit.1.gz
+    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz compose.1.gz
+    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz
+}
+
+INHIBIT_DEFAULT_DEPS = "1"

