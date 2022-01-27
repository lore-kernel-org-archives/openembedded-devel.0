Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A8EC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 06:02:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.24557.1643263363469083915
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 22:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lrxsv6yE;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i1so1592359pla.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 22:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=evKoMsGV7tLEQgX2YzCSuU6/ImRDf9/QNi6f4x7e7qY=;
        b=lrxsv6yEn6jmbs8LXPMUYT2dFc8gP3Eyx/NEAPAGj6xZ8pAdRrzGrWi9WcnCzKlir9
         cY6H1MFVcvGs5iXNCw35kWb1cWtJKC/3Wk1FnPcCoNwenYaF8w1lg7YWhV1mGZ+/xokr
         /NpjozUv/iuc/8+fzw2+bQZVCmEH1uKnfIn/33xRYdzyXDFHwtE/Eot6W0zD8BHTafhK
         fOE2bKJEh7jiM/e96MYjPUy2cbJAlF+26K7Nlw/r7LHFa5JHEwQbRD2qhCrciY5xGkG8
         NtvxIGV5yOOgArxYnT5vmsdmOrL/ip59RD8f4DkXe33Ceon7ySJba0iSbBTDBVopr4Hy
         STzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=evKoMsGV7tLEQgX2YzCSuU6/ImRDf9/QNi6f4x7e7qY=;
        b=j5lcYQ4futkpElorbSl6oAPQPvN+EfNdV8oc4ThBe8Q97iaz9ClFVL6W+rbgG/cDS4
         VbDD1NESGdkJKV0lvR8PAOLXhoSG67UKKM61cM1J+dX4ZFKn09YS0xfNZkX+XyTykVkd
         Rzz3ECH9Rl/2Mjo7Ly8yf4571Pn/CkyD6BBvUQrJq67f9tR4bGB1xwuw0vbqsM4ZO+1s
         b3AhDjyMva/S88qlItDqCpVkoEzd/S3/fn4ZqvbRE3SLCJbmb7iLJjNKJKJX5FAe+oOF
         Ge4cg/p6P0LLtQtFHKKZl1+1a94gmgl+EdgjF+9E505Y/FsjQgCLf0IFUNr07gNBxWz5
         Ae7w==
X-Gm-Message-State: AOAM530NSt3vZt0sjaX4nFfDdF/L84G37PuV63slx15n/an4dZ7rBkaB
	kNpFYB1NH21SPbo9N7zqlp9fW5AEFw5Z5w==
X-Google-Smtp-Source: 
 ABdhPJz8xw1/FmGkSEorz0rabOgKrF3d87A5GRmR2NMrvBjLA7QsYvuh9P/MRShJ/wGik+qqgd1IMg==
X-Received: by 2002:a17:902:ac97:: with SMTP id
 h23mr2524395plr.82.1643263362660;
        Wed, 26 Jan 2022 22:02:42 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5fd4:3341:c771:87a3])
        by smtp.gmail.com with ESMTPSA id
 x18sm3868087pfc.123.2022.01.26.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 22:02:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][dunfell][v2][PATCH] wireshark: Update to 3.2.18
Date: Wed, 26 Jan 2022 22:02:40 -0800
Message-Id: <20220127060240.57444-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 06:02:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95113

From: Armin Kuster <akuster@mvista.com>

Source: wireshark.org
MR: 114425, 114409, 114441, 114269, 114417, 114311, 114449
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 8663cdebb2f10ee84817e5199fa3be0acb715af9
Description:

This is a bugfix only update.

Addresses these CVES:
wnpa-sec-2021-07 Bluetooth DHT dissector crash. Issue 17651. CVE-2021-39929.
wnpa-sec-2021-09 Bluetooth SDP dissector crash. Issue 17635. CVE-2021-39925.
wnpa-sec-2021-10 Bluetooth DHT dissector large loop. Issue 17677. CVE-2021-39924.
wnpa-sec-2021-11 PNRP dissector large loop. Issue 17684.  CVE-2021-39920, CVE-2021-39923.
wnpa-sec-2021-12 C12.22 dissector crash. Issue 17636. CVE-2021-39922.
wnpa-sec-2021-13 IEEE 802.11 dissector crash. Issue 17704. CVE-2021-39928.
wnpa-sec-2021-14 Modbus dissector crash. Issue 17703. CVE-2021-39921.

Signed-off-by: Armin Kuster <akuster@mvista.com>

---
V2]
Fixes: /build/run/lemon: Exec format error
revert "cmake: lemon: fix path to internal lemon tool"
so the wireshark-native version is instead.
---
 .../wireshark/files/fix_lemon_path.patch      | 22 +++++++++++++++++++
 ...ireshark_3.2.15.bb => wireshark_3.2.18.bb} |  5 +++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.15.bb => wireshark_3.2.18.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch b/meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch
new file mode 100644
index 0000000000..54438dd870
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/fix_lemon_path.patch
@@ -0,0 +1,22 @@
+Fix update to build for alt arch machine.
+
+Commit 9ca6e39c7ee26570e29dc87332ffb0f6c1d0e4a4 changed the UseLemon to use
+the target lemon built by the target wireshark. Revert to use the one built by 
+wireshark-native.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off: Armin Kuster <akuster@mvista.com>
+
+Index: wireshark-3.2.18/cmake/modules/UseLemon.cmake
+===================================================================
+--- wireshark-3.2.18.orig/cmake/modules/UseLemon.cmake
++++ wireshark-3.2.18/cmake/modules/UseLemon.cmake
+@@ -13,7 +13,7 @@ MACRO(ADD_LEMON_FILES _source _generated
+           # These files are generated as side-effect
+           ${_out}.h
+           ${_out}.out
+-         COMMAND $<TARGET_FILE:lemon>
++         COMMAND lemon
+            -T${_lemonpardir}/lempar.c
+            -d.
+            ${_in}
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 36e84d0ccd..f9e22141c4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -8,11 +8,12 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz \
+           file://fix_lemon_path.patch "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "32f6cfd67b00903a1bfca02ecc4ccf72db6b70d4fda33e4a099fefb03e849bdb"
+SRC_URI[sha256sum] = "bbe75d909b052fcd67a850f149f0d5b1e2531026fc2413946b48570293306887"
 
 PE = "1"
 
-- 
2.25.1


