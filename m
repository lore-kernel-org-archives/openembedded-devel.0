Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.11846.1594608996050446646
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sC9wvmD1;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id d4so5413159pgk.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gPT6u+LZ0UeJtPiaWLbNyJPpwDnTsWRbkB9jJPS5kbY=;
        b=sC9wvmD1Q7BjaYBD5jgs3iYpcXp2a3Rl/So4NPR4icy5lozhCDuqPuxItNX6OVXC/L
         Trl8frcRBT4QOR/CNw4AzsIvYisWslK0GgpKGhnpd6cHblGOcC37gXbgn3Ii9HZ2kzpJ
         sPTq0VGGZpNZ8G3zNXO/J/FFjws210UJS84jqn9IZQSSZCq3Win+KMi9cbWgLS7ngoGA
         I04ZSBvjEysu4FjQ4kT9ORG8hYP9C5wytJHjy7N7Cof8TLaeVCHNFjpI7xvIn5w9YpIU
         A1fSG+3YVjSvw1Kj+R6qMqfOOb1PqjUIbn1sB+hhYxLxKFL0iEh36pv3MINN1SBJz+jL
         ZfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gPT6u+LZ0UeJtPiaWLbNyJPpwDnTsWRbkB9jJPS5kbY=;
        b=jG82SCgUndCjTlHOb/Z1c8EcBhNrWsr6bAv+sYS2/0dOHAKFMpBSmj3t6jus5QtkYZ
         tBwh03W2tuH7lgrDAKIjfrw2uoODPDgOynUmFgrAPvxfwNlK2JS2pIjaOYpqgAS2kKUP
         0WWQxYjkj5qUpW2w7kITDXBL5KrBTAfrduFON49wr0a7zyuKU3FP+dabBwi2RUbqNWQU
         Zqe13K9dmNs2zIhEzXQhcxkLGI3uCLa9unC07yiYLjF7TWlULDXQLbqpUnbZS2QTW9Sj
         RDZlFHoCBsW3E5njk3R7ZCSEqEc/Nfjs/vQWhG7vXfaUUCB0JYQWvG3bj86VLt0oXSZM
         NWjA==
X-Gm-Message-State: AOAM531aOqpdQGVXDk43VNqvVsfWPMmuG0HVFvricVPOaqv3bSQknwJN
	spUycfVaznYkZkkisdgnNqN1Kk52Gwg=
X-Google-Smtp-Source: ABdhPJwXLTmT8mYmuNm+suPZcD2LBIkPSvJB+c+kJI1ooKyznHRuYuDT6Shklu6CSrXL4wtI/tWH3w==
X-Received: by 2002:a63:5a1a:: with SMTP id o26mr66271973pgb.420.1594608995451;
        Sun, 12 Jul 2020 19:56:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/18] wireshark: Update to 3.2.5
Date: Sun, 12 Jul 2020 19:56:14 -0700
Message-Id: <3add820b373564478591e244226704371c1d34d1.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Source: wireshark.org
MR: 104620
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 64e3701e4d6bd53972c22c49d655556e6f37e461
Description:

Affects: 3.2.0 to 3.2.4

Includes:
CVE-2020-15466

For more info see: https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9019ceb2ccfd32789b7bc680269b3af234ebd397)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
index c3caaefde9..a6c09d47ba 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
@@ -12,8 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
-SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
+SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
 
 PE = "1"
 
-- 
2.17.1

