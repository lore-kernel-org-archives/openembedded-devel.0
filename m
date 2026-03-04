Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30CEEB7EB6
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 09:08:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14163.1772615127959426521
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 01:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIdk6abM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: gitbeam@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48375f10628so44058825e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 01:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772615126; x=1773219926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cbmn12tfcQZdTSV0z271PlCQfx+NFnEB6OS/UFDQNsA=;
        b=CIdk6abMXb2WW5EnUT2Nuj1Z9tEvai/Ka2dpPt9dMaTAjmsDYrAzkGShXrpNsR22xy
         BzVC1bMAVSSalh2xC2mDASUJ+ZkxcLRPCi+corJarsaGfAVVUmLkV3srWOryCtLd/fbd
         uPxu6Gs3PJ9hO8SBXQpMCEsvipA/bx4oZA0GZ0+avu0ZpZbX1KDqXUHqU9d0o3oh2g1k
         KhAPopu6fYiSBF32R9av5f1T7cPd9XscrnlRcF9s2o8BA7oiGJFdFD2ngpOEfvaF1z5Z
         G2qFT8zE2jJKTpfYmmUT5IUOzbobmS/Szi/Hoh64QRlCuMs0O29kTfLWN+rBOZDkXldT
         tczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615126; x=1773219926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cbmn12tfcQZdTSV0z271PlCQfx+NFnEB6OS/UFDQNsA=;
        b=fovpNlnCMLlgtYth/ccmIhutDE68BqVtn3+5KGk/WmaJ0jRGNq/yKCm+gH5Kxrbx5e
         BP1fVpY6WinQ5OhqESgPBbKmqtGw3aKC2m3cNyL9JtOuiXPo2bnCzWlR8DtAPqhybJ38
         82qdIkBFf3cYzZx97SoNUCta8mT9dKzQq8uDBGJdlO338vXhcigfkxzNGOPljANgeyff
         lVmsy5CkSM5p4HMU/f1y3VJ5ZXt0UmaHLRtpO6FnVRhRKDJ/PvEkv/HZ9mfQ1tO6TlF+
         v4DzccDaDKUDC0ifmcp7feJKQY8Z5OTprfeDQc+d/v2Z2Ox7C4rzm7WloWBwsd3nAgkj
         thBA==
X-Gm-Message-State: AOJu0YwpKlbFdwvAVFjlkIFCXY8aKely8QfppCshVrscYTPAgZg4+TuW
	hZqjIiovsmHN5P90lhAhUUGgX12qxkb31Au3QnfcdajIljKtnG3PRNQn7j6KkCffHe8N+FwW
X-Gm-Gg: ATEYQzwcCnCzbbtVaAZZqfpvEMamQfBLIoTX+fGuSJSrghgkW8j4Tqfm0wh3PL3Mkin
	J2rZyBgxNv4ODXBc+jaTDXKMENrgfeztIGWt4/jbtFNCD/Zx97LJLLHcdDbXtJXwOR2oRkB8aPN
	mgZJ5P88DjkPtfeYsTiWKH7HFW8g+Grh5cXopwDgbNP9g3v7vQ1stJY/CWbQ7jb0Zf404cB2ROw
	1fBaUsSNBX1ssrmwK4+9LmHzizd6bjduxihJrWB2e7Kak8l84aq+9cx30X9777bGnw7migSwLYr
	LCd3lUco45Vx+i7OVJO5ZcY1t+pvnJpdMT82uyNa/A/dbD3biv1Drnuk49hUZIGNZh+samio7RP
	MXLI4BcYmhPEAl0EXp4O6hl6rr/PDrdpdZUM7tVzZVLPAKZ1LDzbQFKzzsMZN1awop2JN4K73xL
	2fNJ1cHnZ+tMfPdSCYmgEKVm0KaQtDBIRVfvbnQ+IljGOVZP3F08ee3DUEZ8EpC3e5q2JLmgnVl
	EQJ6YCzKcTYAgMmhKv71vCfxSko0vL1ganOJgZzWDNI8eRr0wf3YFfD5lBNzCwCLSup4BGF
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48519874e2amr17905475e9.20.1772615126131;
        Wed, 04 Mar 2026 01:05:26 -0800 (PST)
Received: from DESKTOP-SJHFTAC.localdomain (dynamic-095-119-200-146.95.119.pool.telefonica.de. [95.119.200.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acf9ac7sm4214585e9.15.2026.03.04.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:05:25 -0800 (PST)
From: G B <gitbeam@gmail.com>
X-Google-Original-From: G B <gitbeam@proton.me>
To: openembedded-devel@lists.openembedded.org
Cc: G B <gitbeam@proton.me>
Subject: [meta-oe][PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
Date: Wed,  4 Mar 2026 10:05:19 +0100
Message-ID: <20260304090519.14820-1-gitbeam@proton.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 09:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124843

Upgrade to latest upstream release 1.2.4.

Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html

Signed-off-by: G B <gitbeam@proton.me>
---
 .../ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb}   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb => ntpsec_1.2.4.bb} (88%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
similarity index 88%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 872d1ce4f7..057f6582f9 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"
 
 LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSES/BSD-2;md5=653830da7b770a32f6f50f6107e0b186 \
-                    file://LICENSES/BSD-3;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
-                    file://LICENSES/CC-BY-4.0;md5=2ab724713fdaf49e4523c4503bfd068d \
-                    file://LICENSES/MIT;md5=5a9dfc801af3eb49df2055c9b07918b2 \
-                    file://LICENSES/NTP;md5=cb56b7747f86157c78ca81f224806694"
-
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6107e0b186 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
+                    file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
+                    file://LICENSES/MIT.txt;md5=5a9dfc801af3eb49df2055c9b07918b2 \
+                    file://LICENSES/NTP.txt;md5=cb56b7747f86157c78ca81f224806694"
+                    
 DEPENDS += "bison-native \
             openssl \
             python3"
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
+SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
-- 
2.47.3


