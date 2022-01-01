Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512ABC433EF
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 17:38:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.948.1641058699614838555
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jan 2022 09:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FW7JAppr;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so28160194pjf.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jan 2022 09:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VayMVY74XP9nfcsknbZxEBFGvp7MVsLbh3JcbkhW3c0=;
        b=FW7JApprU5i1y9poSXd6DQt1jhY5u103XeMH6I7ZTM+Rp2Xu922V6i9Yg0B15UYoir
         RpJVmWug3Sa9rrAlqm4wUK23G4lIYQaexN1J/+OdOz/+LsqYaqygPSp1KyBicPJGoU4b
         sFxgsPOBmrgy19wHOsrpF32gJilvfy74a3ql+IbsejsJEuZevH0TF3ArouuSVmotFxKR
         cmqLucA/WtrTM8RlegPa0TaFcVUs/Wfs583mx4xQ/hmcNDtHynNH4M9gMzyZhPxUYO66
         iKTcUHSoyJB1jayDo0OF1oyzvE2kYui1TS1A5Kh8DeEJrYhB/ETOI4HoVQmVEcaPLUFr
         Kzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VayMVY74XP9nfcsknbZxEBFGvp7MVsLbh3JcbkhW3c0=;
        b=m9izPEPswP2AU9mYMdzP4GJxWeyoofsdsKwZqhlYQrg+QWVMeBKnr/wblWWEWecl6G
         tnRrG/zaxUgnBqf4+TqEmLM2qx1e7r/N8nPxnMjhgH8YFT7JrSZNcESUgas4yAJCRYF7
         3OLMDgk8qc3Z6PKeYaNBbQrYYAroyvkPnu2YY2WTBYbzsyuxihcmDfBI58m0+7Voakuk
         71HsBM2J4csTKcJDRSL+4b5XNkkFf076FpO+penpa8SM1am8uaI8k6H9zMb4ikwMiQY4
         j2IdFAIrtfeYHFoG1EADm8vHeBlvaRCVkvTk72XXRnZjh2+etuLLwHYuEgzaoCfxboEL
         yH6Q==
X-Gm-Message-State: AOAM532Gu0ciBdBC6eWpyweLwQK4kYglECM0K0ir6lxx4ccSVcoN/usf
	qIiK/bEwIi/A9gLBB1elQDw+9DJITpg=
X-Google-Smtp-Source: 
 ABdhPJxFhQL8YaOTb/QgCHX1HgiQVlgF6+YuCXdy//YunUv52zBBJj0reYwEgImqiEYug3iMWwtfRg==
X-Received: by 2002:a17:902:c410:b0:149:ba80:4662 with SMTP id
 k16-20020a170902c41000b00149ba804662mr1250744plk.73.1641058698747;
        Sat, 01 Jan 2022 09:38:18 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:51d5:40a5:2edf:9ec5])
        by smtp.gmail.com with ESMTPSA id
 g16sm31301306pfv.159.2022.01.01.09.38.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 09:38:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][honister][PATCH] wireshark: update to
 latest stable 3.4.11
Date: Sat,  1 Jan 2022 09:38:17 -0800
Message-Id: <20220101173817.3014366-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jan 2022 17:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94633

For more infromation, see:
https://www.wireshark.org/docs/relnotes/wireshark-3.4.11.html

refresh 0004-lemon-Remove-line-directives.patch

Includes CVEs:

3.4.11:
wnpa-sec-2021-16 Gryphon dissector crash. Issue 17737. CVE-2021-4186.
wnpa-sec-2021-17 RTMPT dissector infinite loop. Issue 17745. CVE-2021-4185.
wnpa-sec-2021-18 BitTorrent DHT dissector infinite loop. Issue 17754. CVE-2021-4184.
wnpa-sec-2021-20 RFC 7468 file parser infinite loop. Issue 17801. CVE-2021-4182.
wnpa-sec-2021-21 Sysdig Event dissector crash. CVE-2021-4181.

3.4.10:
wnpa-sec-2021-07 Bluetooth DHT dissector crash. Issue 17651. CVE-2021-39929.
wnpa-sec-2021-08 Bluetooth HCI_ISO dissector crash. Issue 17649. CVE-2021-39926.
wnpa-sec-2021-09 Bluetooth SDP dissector crash. Issue 17635. CVE-2021-39925.
wnpa-sec-2021-10 Bluetooth DHT dissector large loop. Issue 17677. CVE-2021-39924.
wnpa-sec-2021-11 PNRP dissector large loop. Issue 17684.
wnpa-sec-2021-12 C12.22 dissector crash. Issue 17636. CVE-2021-39922.
wnpa-sec-2021-13 IEEE 802.11 dissector crash. Issue 17704. CVE-2021-39928.
wnpa-sec-2021-14 Modbus dissector crash. Issue 17703. CVE-2021-39921.
wnpa-sec-2021-15 IPPUSB dissector crash. Issue 17705. CVE-2021-39920.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0004-lemon-Remove-line-directives.patch | 15 ++++++---------
 .../{wireshark_3.4.8.bb => wireshark_3.4.11.bb}   |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.8.bb => wireshark_3.4.11.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
index c1a528f90..134633f66 100644
--- a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
+++ b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
@@ -12,11 +12,11 @@ Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
  cmake/modules/UseLemon.cmake | 49 +++++++++++++++++++++++++-----------
  1 file changed, 34 insertions(+), 15 deletions(-)
 
-diff --git a/cmake/modules/UseLemon.cmake b/cmake/modules/UseLemon.cmake
-index 849ffc1..ca38ab7 100644
---- a/cmake/modules/UseLemon.cmake
-+++ b/cmake/modules/UseLemon.cmake
-@@ -7,21 +7,40 @@ MACRO(ADD_LEMON_FILES _source _generated)
+Index: wireshark-3.4.11/cmake/modules/UseLemon.cmake
+===================================================================
+--- wireshark-3.4.11.orig/cmake/modules/UseLemon.cmake
++++ wireshark-3.4.11/cmake/modules/UseLemon.cmake
+@@ -7,21 +7,40 @@ MACRO(ADD_LEMON_FILES _source _generated
  
        SET(_out ${CMAKE_CURRENT_BINARY_DIR}/${_basename})
  
@@ -26,7 +26,7 @@ index 849ffc1..ca38ab7 100644
 -          # These files are generated as side-effect
 -          ${_out}.h
 -          ${_out}.out
--         COMMAND lemon
+-         COMMAND $<TARGET_FILE:lemon>
 -           -T${_lemonpardir}/lempar.c
 -           -d.
 -           ${_in}
@@ -72,6 +72,3 @@ index 849ffc1..ca38ab7 100644
  
        LIST(APPEND ${_source} ${_in})
        LIST(APPEND ${_generated} ${_out}.c)
--- 
-2.26.2.Cisco
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
index faf2a3ad1..6fee972b2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "58a7fa8dfe2010a8c8b7dcf66438c653e6493d47eb936ba48ef49d4aa4dbd725"
+SRC_URI[sha256sum] = "a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279"
 
 PE = "1"
 
-- 
2.25.1


