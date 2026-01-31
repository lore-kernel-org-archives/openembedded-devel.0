Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82CBE7C6F3
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 21:56:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18481.1769896601316386062
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 13:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWcZjI7x;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso29306145e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769896599; x=1770501399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoyVKp75dyOB6djPt+9ypDdI8Loku68L4Y/6mDkwTTE=;
        b=JWcZjI7x8HSJ6UU73FmR4FGCpnukTHSTtivGCD5Hci6DkMujcnzeKlpNL/Nba3XNp3
         cpkuOMEi/z3z3YdGbgjAGdu9b+JknIV72HXky5vvqQCqVYGBiLB1X8sU4SZsaiz35wYZ
         /ewk/fxyILGz3gHyMjUyXTt3ytP3Pskxbx3lfwg/wiGizbL/P6UcYKYxRtHUicicJwJ6
         bnG3BKi+0dMveVGMRd2S/GNYSKB5awK1/5cB5uQR6MIesrW6Cmu4cnaUXf8/u4uUTFU7
         Fzu1c/Dm+yc0vguYsJdrbAQgxgltI83MmScw1MsLdWZk4oo1Q6cMQRpBHq6kjMlZ7ph4
         hR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896599; x=1770501399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoyVKp75dyOB6djPt+9ypDdI8Loku68L4Y/6mDkwTTE=;
        b=jPhdi4EBLdAKMpSNcUZ6SSql+MvMofqw7DeQXztkxhJk96p3ZNgzCi5M9D3DgSizkj
         O1YsKtlM0gD5m5DAH8bB9pI+1lqxlEBx5ZYzX1Xxga/3YlhG/cjbAMMeHm+T/88U6kL3
         VeaNe8mrue+t035iXbFeYcetypfJRZtVzUC2OtRWZhvQEqb1QjVtX9c4EoamdE5M4nEo
         jaJghulKz1u7eY0FMM09pnSxJyxbBfEHN5D6v+MVaesxwo6X0ijk7gRw9LejC0f4VIvB
         wwkNcaJeRh3uteqjNuGZFNZj8Zr/x/SGauL+HCsIK++ZT+k3oJ22/OtogCyWehit+Y1u
         NbIQ==
X-Gm-Message-State: AOJu0YwIaYOWeAjXmVHKBBf1gcHS7mes+IBhj0xtHpH/HhUsc30ebHRa
	Cezdumkbbf3fQXzDf1mmpjtBlCAz8fDu6nrB2HiEMHi7GN+6KritWxxU8133Bg==
X-Gm-Gg: AZuq6aLhxEFgKD1UbnUH11KUuUsC7l134Cq9lK0fdSiqdbyZo4XO9Xy+2eF4E+bk8VZ
	mvIJdmpvG1v3hOnTK2gXh5dd6zybmyTl/U0AJ4t5+6DjhWwK4vj1Twd1IhI09oSMf9Qi9MsXEEq
	rsClpiDY1HNo4xcdCRbWURNSuVf7t/TVb0TE6mfYYewDlhgrbMoKPRv3YH43pcS5uiuQEq1rDci
	c3e6j2pltJEHNXMVBPJp2HH5jhj2nHA4aVK13nbILxhIy/4YiljMbRHnx5eo3SviCqv1BZHxWyd
	RShdApEqGY2G7iJjYGoWv3YCa/NRA86l6+jKEZR/DYOUgPv/XO55mYYHQnFdC51c1Lk402o1CaD
	E7jRO3R5LyYqov9NAd437uD6IzWdDiK7DP5eAz8eVFPfSPIrTLdZDaqD7rOeiuGtTr8pafwQGPT
	b8pVhnrvmb
X-Received: by 2002:a05:600c:c16d:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-482db44d22dmr95180025e9.6.1769896599553;
        Sat, 31 Jan 2026 13:56:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm276840065e9.12.2026.01.31.13.56.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:56:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] mime-support: drop recipe
Date: Sat, 31 Jan 2026 22:56:34 +0100
Message-ID: <20260131215636.2633863-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131215636.2633863-1-skandigraun@gmail.com>
References: <20260131215636.2633863-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 21:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124021

Debian has split this package into two sepatare packages:
media-types and mailcap. This package hasn't been updated
since 2020 (but the other two packages are regularly updated).

Beside this the SRC_URI has been inaccessible since a while also.

Drop this recipe (and substitute it with the up to date packages
in followup patches).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mime-support/mime-support_3.62.bb         | 65 -------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mime-support/mime-support_3.62.bb

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
deleted file mode 100644
index 1c0aec13e3..0000000000
--- a/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SECTION = "base"
-SUMMARY = "MIME files 'mime.types' & 'mailcap', and support programs"
-LICENSE = "PD & Bellcore"
-LICENSE:${PN} = "PD"
-# mailcap.man's license is Bellcore
-LICENSE:${PN}-doc = "PD & Bellcore"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=53c851e31d27c3ea8a6217073a5ff01c"
-
-DEPENDS = "file"
-RDEPENDS:${PN} = "perl"
-RRECOMMENDS:${PN} = "file"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}.tar.gz"
-SRC_URI[sha256sum] = "54e0a03e0cd63c7c9fe68a18ead0a2143fd3c327604215f989d85484d0409f4a"
-S = "${UNPACKDIR}/${BPN}"
-
-inherit update-alternatives
-
-FILES:${PN} += " ${libdir}/mime"
-
-docdir:append = "/${BPN}"
-
-do_install () {
-    install -d ${D}${sysconfdir}
-    install -d ${D}${libdir}/mime/packages
-    install -d ${D}${docdir}
-    install -d ${D}${sbindir}
-    install -d ${D}${bindir}
-    install -d ${D}${mandir}/man1
-    install -d ${D}${mandir}/man5
-    install -d ${D}${mandir}/man8
-    install -m 644 mime.types         ${D}${sysconfdir}/
-    install -m 644 mailcap            ${D}${libdir}/mime/
-    install -m 644 mailcap.order      ${D}${sysconfdir}/
-    install -m 644 mailcap.man        ${D}${mandir}/man5/mailcap.5
-    install -m 644 mailcap.order.man  ${D}${mandir}/man5/mailcap.order.5
-#    install -m 755 install-mime       ${D}${sbindir}/
-#    install -m 644 install-mime.man   ${D}${mandir}/man8/install-mime.8
-    install -m 755 update-mime        ${D}${sbindir}/
-    install -m 644 update-mime.man    ${D}${mandir}/man8/update-mime.8
-    install -m 755 run-mailcap        ${D}${bindir}/
-    install -m 644 run-mailcap.man    ${D}${mandir}/man1/run-mailcap.1
-#    install -m 644 rfcs/*             ${D}${docdir}/
-    install -m 644 debian/changelog   ${D}${docdir}/changelog.Debian
-    install -m 644 debian/copyright   ${D}${docdir}/copyright
-    install -m 755 debian-view        ${D}${libdir}/mime/
-    install -m 755 playaudio          ${D}${libdir}/mime/
-    install -m 755 playdsp            ${D}${libdir}/mime/
-    install -m 644 mailcap.entries    ${D}${libdir}/mime/packages/mime-support
-    cd ${D}${mandir}; gzip -9fv */*
-    cd ${D}${docdir}; gzip -9v *
-    cd ${D}${docdir}; gunzip copyright.gz
-    cd ${D}${bindir}; ln -s run-mailcap see
-    cd ${D}${bindir}; ln -s run-mailcap edit
-    cd ${D}${bindir}; ln -s run-mailcap compose
-    cd ${D}${bindir}; ln -s run-mailcap print
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz see.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz edit.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz compose.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE:${PN} = "mime.types"
-ALTERNATIVE_LINK_NAME[mime.types] = "${sysconfdir}/mime.types"

