Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1851BEB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 18:28:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.2043.1690223289327079597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 11:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=SSY7k7bX;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-635eb5b0320so35462896d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690223288; x=1690828088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ncjeraTFr3HzlLX8WCkj1eXrdT0KifdDdBuus/ZZBL8=;
        b=SSY7k7bXS5KvCrKNPDdcQquC3jh81BsARgF4DlDkhHefgGSl4I24/eB6GmjR/laMtF
         AEaOBxCiIfDNjH01KUz9d7QDoX4gKncHtz20vI39d/iIcIfAuDpesWmhdcNxG3o9xwd4
         ybB9gMx2UTUoqTW3HgGvf6G4qLEWMOVC5ce5F4MC0y847Zm12biw4SHqWxg/xqBEjJrr
         jRvCOFkzjGaZPCRPy/ZZifzbSwLByTrZ3UcBvNKAaSt70ttDifJMRh2+kkSavJlIaUnZ
         vTktohRZZo8HpfFHeIoeq+nMLhLw4YjvzmQWIuRcG9QxLrw3bcVfJ7pxqhHs/PcZcb/M
         K33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690223288; x=1690828088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncjeraTFr3HzlLX8WCkj1eXrdT0KifdDdBuus/ZZBL8=;
        b=LKHKyHjteHjYvNRuFaYmy26EYyb18wUwlFvt+uhUcQ6TFCz82L9sLCpED/HTlNUNoL
         /A1Ocgy778PbaRxT/oYiSqBmu+AIRZzsQn0n/Ki22r9lQiObRqmP/xvb0+LVhG/814UP
         f7QyDYtf7gPytsWVqjgGKomndBBRT8YKq/KC1kt6x1zp/PFhXWaJ7FPC1RNqjelMqpfW
         nSJaJ9i1U38vLpGsmtsDEqY/bcmfLHDbPK1BVg/21aPEq6tJTwvaqz2NIzI0DUPC1onp
         Fm5aB7Yhv7axJL5cl1i5YSMBG/lXoMXKOKMK0P916enwOppLNwo6LkvVT6zTvgyslWvr
         3TwA==
X-Gm-Message-State: ABy/qLbdeZvQDZV3NBzK1nzB/7/kUlsUOh3Hrn4vQRGgc6ZEqpJbi01D
	PNR1BFLUZaDielC4AS3AS/iTTUKiRq6GdlbMi5Q=
X-Google-Smtp-Source: APBJJlFKoc5mZ32gFJBQoUQYupFI9nHCAFJykFEf0BBw7ClYRBuvlfULEVOm9quhjNXwjDaGGa0ofQ==
X-Received: by 2002:a05:6214:da9:b0:634:87c8:6a3f with SMTP id h9-20020a0562140da900b0063487c86a3fmr703510qvh.46.1690223287772;
        Mon, 24 Jul 2023 11:28:07 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id x2-20020a0ce242000000b0063d06946b2bsm578213qvl.100.2023.07.24.11.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 11:28:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-parse: upgrade 1.19.0 -> 1.19.1
Date: Mon, 24 Jul 2023 14:28:05 -0400
Message-ID: <20230724182805.103189-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 18:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103999

Switch to using git and a SRCREV to make sure we can keep the ptests.

Changelog (https://github.com/r1chardj0n3s/parse/releases):

- Add support for sign specifiers in number formats. by @anntzer in #134
- Fix handling of unused alignment by @tomerha in #132
- modern packaging by @wimglenn in #151
- universal wheel by @wimglenn in #155

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-parse_1.19.0.bb => python3-parse_1.19.1.bb} | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.19.0.bb => python3-parse_1.19.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
index 94c1b53c94..9dc7f79318 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.1.bb
@@ -3,9 +3,18 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "9ff82852bcb65d139813e2a5197627a94966245c897796760a3a2a8eb66f020b"
+SRC_URI[sha256sum] = "cc3a47236ff05da377617ddefa867b7ba983819c664e1afe46249e5b469be464"
 
-inherit pypi setuptools3 ptest
+SRC_URI += " \
+    git://github.com/r1chardj0n3s/parse.git;branch=master;protocol=https \
+    file://run-ptest \
+"
+
+SRCREV ?= "72776522285d516032faa0f80c4ee6a8964075e8"
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "\
     python3-datetime \
@@ -13,10 +22,6 @@ RDEPENDS:${PN} += "\
     python3-numbers \
 "
 
-SRC_URI += " \
-    file://run-ptest \
-"
-
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
 "
-- 
2.41.0


