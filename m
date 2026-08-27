Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86832C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 10:42:44 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33696.1787827354145942023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 03:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fhtnLUFr;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66d9f9d8384so83616d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787827353; x=1788432153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wm47P5RHZsl8rktk4kyU+h/gpnwl1Juk22hqU49aUT8=;
        b=fhtnLUFr7NBCjo0XNadI6MRnIfAPZHpdPaqJq0jdJhCQRJTW5jOozVOV39T6ZZScvA
         jWqyvmUU5J+Zx09vWiGjE4vlWq+2BeWrfGOGvspi/5AUwaC09H9BW8r4Ahdjjsz8d5hB
         UFjrQI+6SZGCuC5KN3/0iKzk7ONQOyQvbQE5CJ2K9i933ESH4bk1dnAb3PafhSp2MV+G
         M+4+VR0pCkE7TLg2US14WilMOr57h0nLIDOicrG4rYYB1g3yeB5gZL2Lk3bx2i30zpzs
         0M6Q3wS/+KzVknGQsNmUn+mwXfRiLXkYl5UHXtjfwxwM9xXqoXXF+JYWKFGypZ3bxeX+
         QP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827353; x=1788432153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wm47P5RHZsl8rktk4kyU+h/gpnwl1Juk22hqU49aUT8=;
        b=T3004pSBUvvXImH8tVOFN8kSJJv4JHuw78EtdftXNS+BJgzo2h+xccrMZVitDLZJMv
         d6MKs3rijbeDCQwO/SFUqHjmWK8bWRdJp5B893y+klQsLSdmQAXWW1Kg1hTBS/YAFHK0
         Zhd0OLwcbiYXY5q4mnWrtr6owi+qMxRLcaCX8WAVQIOHYWjXYcQcfEiREynFNi7z3uCZ
         x6+1Lm39/+zwXLY6rUBxk7BQNNCqiCY1DxoaIXahVEnQzmlkys6bxUhqz/R5I87tmRkl
         TxFlteRneUrkVMjlLtpMAsXTQJ3QMuFKWA50GZksNNDibqSRi4bEM0LJ394oYGemYf9h
         nSQg==
X-Gm-Message-State: AFuF++kAeoJPNAwllw1ryl0fApe94owLCYjZghBmfkQ/1LjXiRZSTduF
	PwYfwojjwfArrB7oi3k0apTEahfBiciNsADjDuVKdbKD7t/5GUq5MFWtI28bWjG/
X-Gm-Gg: AR+sD133U6smfNMWI2wtPGm0uOTthZ32k1rX6NAt2s0TCOqa2SXpvL13tWHhwJ6iObH
	v3NYucUWNMaji7GHWQEu13nJInPfZhLYQO+5Cj7U78zo9D5EnLVsXymiK1nXMQuLQLYBNhOvwxF
	zkPgd/x1uq+vTyxdryjzQKm6CAZv3FQzfMpfLzco3SGc4ZtuW7tX8xCgdXT2c0p2OVhpWzCONFV
	z4CIPUYjhyWKUGKmZY/G7BojNO+GIIddy2TjV3Y+0pSZHoflcpvOr9v4li7OFqPBYUeTetTj5x9
	Ky0XxqyMyot3qmoe9FCnaDtVwMSbf48HNdLH+yRFW0G5ikUBZNr2lJD05aAJHkVgUiQV9QvS6X0
	bjVfmyZHeZgo7Tw8hfjuaLug48dCuGbhHuY0jhUV998c2rCfExu4HtAMmvMgRnBNaiKyJ438eqK
	1lxLdrA06R0INU2r3SuTGKaRu2ucQxWyXmHb3I7mHJ2o16BPW7zkO2nG0J2IWjdjNyXcEFVVibK
	Zv5wdMCFODAOeqNH+H84lq40ZFWUlDDnl6iWSDxTJmsISBFR/92joKPl0QVEvcv0MSmvRDXXaEq
	KRiF2M0WILw=
X-Received: by 2002:a53:c811:0:b0:667:dfad:8767 with SMTP id 956f58d0204a3-66d256a560fmr3510407d50.9.1787827352871;
        Thu, 27 Aug 2026 03:42:32 -0700 (PDT)
Received: from localhost.localdomain ([67.7.72.170])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d2454d92asm2753146d50.3.2026.08.27.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:42:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.19.0 -> 24.20.0
Date: Thu, 27 Aug 2026 06:42:18 -0400
Message-ID: <20260827104218.1718034-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 10:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129532

License-Change: move from zlib 1.3.1 to zlib 1.3.2.1

Changelog: https://github.com/nodejs/node/releases/tag/v24.20.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_24.18.bb => nodejs-oe-cache-native_24.20.bb} | 0
 .../nodejs/{nodejs_24.19.0.bb => nodejs_24.20.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.18 => nodejs-oe-cache-24.20}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.18.bb => nodejs-oe-cache-native_24.20.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.19.0.bb => nodejs_24.20.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.20/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.20/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.20.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.20.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb
index 4ef05cc623..789c402632 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.20.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "Apache-2.0 AND Artistic-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BlueOak-1.0.0 AND ISC AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76c62fa4c329393e905512b36f8378b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=edc0683b77d2c503217642fa000b5b31"
 FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-24:"
 
 CVE_PRODUCT = "nodejs node.js"
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "f6d95e10a0431ee1067fc6aabe9f762908b4716dd35324e1ddb4b1466b76659f"
+SRC_URI[sha256sum] = "2732fc3f588dd335cd6779c06864f7cd424bb1b5ff9a1743059a66c54f9ca4a1"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


