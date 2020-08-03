Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.1036.1596475501335619138
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 10:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=veLn1fVb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id t6so27588763ljk.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1sifZnHRNkYKPjMWPfRd0+NKIJxo+BAdopCW+QegpAI=;
        b=veLn1fVbIy6IdIfTit5UGLgui2kuIphuoP7fvQzOlU4tlpD9vBr56PHeeSxyPGXa6v
         f0Ocy4rLl2wJLeD2MUFj8ttrbFwWdrOsN08uFHOPcM5/PPMZ7TUvk4zsNNUfal6QiNZA
         yT8/gbPYKF7/wF7tk9C2SoYH08EMVwkpi9fllaHHJqrV0vPMBQDNTWzCROKC58IWX6a/
         w4QRZvyf8aoCBe8jaN5VxWqufHzb9iTLwHAvzcchlFBR9eoBMrGa85VfpQYvjEyjQS0n
         qacATUWL29YvvogRGIr7XQ2iuWm8ck8NdX/XcobgDGtbYXKsVmVDBj1Fl0Tkf4af5Cwt
         Puyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1sifZnHRNkYKPjMWPfRd0+NKIJxo+BAdopCW+QegpAI=;
        b=QeAARee5Td9cQTejX8PsScQn9JNu/YMwZnvQr6zpygzXLUwZ8gcZ5A9FdE8KlTaKgt
         AMA6gryeWvW3pRxuNOor8WtM9n/wOo48rSMDuYPwhBYMoAFSpuvZFVbovDsgYK4MBhLD
         9qMq0FLvceiHg0+BxK5OQFdFB3p/Q8ulVF4XyroVvpTPspBDU5PeToWy/NP5aIVP0ZeS
         P+49q/K88/DmKMZ2JHSkZ0Vr5yUgRa/tmhg8qYxAHQkn5REm6416kxoyeDAyKpaTWJKn
         ++GnQpeQlH5bh6Sf6Mk3/1JRypYI//SC6MzsiRcd5LISpYVfQFPBci7tZSatPyTvrw6d
         l2nA==
X-Gm-Message-State: AOAM531xD6cCu5ii891PfGKkvY3Y1zY/Q0gB714dYi/5T0yMQML1ks9h
	SubTdRvZkeVfNcOa3ciI/mzDjuDpwxE=
X-Google-Smtp-Source: ABdhPJwucu233hG63jA3zWIxSemZvdHPG75weSuYr2Zyi8baYsv6KgC8XYJSEJFa+6O7AlN9Ymwekw==
X-Received: by 2002:a05:651c:2007:: with SMTP id s7mr4751601ljo.74.1596475498788;
        Mon, 03 Aug 2020 10:24:58 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c74sm3021142lfd.61.2020.08.03.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 10:24:58 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] kronosnet: inherit manpages
Date: Mon,  3 Aug 2020 19:24:52 +0200
Message-Id: <20200803172452.2360101-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let manpages bbclass handle man pages.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-extended/kronosnet/kronosnet_1.18.bb            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
index 7b1dfc241..3fd6298b5 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
 
-inherit autotools
+inherit autotools manpages
 
 S = "${WORKDIR}/git"
 
@@ -26,5 +26,5 @@ S = "${WORKDIR}/git"
 CFLAGS_append_toolchain-clang = " -Wno-sign-compare"
 
 PACKAGECONFIG[man] = "enable_man="yes", --disable-man, "
-
-PACKAGECONFIG_remove = "man"
+#
+#PACKAGECONFIG_remove = "man"
-- 
2.25.1

