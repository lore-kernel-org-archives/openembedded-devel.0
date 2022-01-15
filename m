Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F31CC433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.7771.1642256888752535002
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pa0zOp1l;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id e19so15600159plc.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9OSS4aa7HdsvXbIseT9+krnGdlmjmNd4LQa7L63VFxo=;
        b=pa0zOp1lGvra6G65HLhgLX8Q5U+1zScr5bmTRIyDM/HkXDz2t0Jubc36llCzO9ddFH
         Ruqtg2IXt/YaqfbypPVHhGsbsBADA/YZbtLs0QHR1s2SKPceb+/0pkz2p6gNKnqkUbI7
         KbhF6AB5i0OW3WmbmtI2PHJnL2Afp02s/5klxaVPOOMlbuGEuZHA6g1NPyoDbaOB8UNQ
         QJwl7hQqHSORfA6H0KmrdmTERCWwiL2Q8jvlv/CY2KAzY83cnk0ifRiwlgYOKjW65XF+
         CA4T1FAPiSROfv7z+NwbxTR7MAcBlgJR5Av53lBj8h0XsCJL0Wv8PoFiPzSHV/CJonZ9
         QZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9OSS4aa7HdsvXbIseT9+krnGdlmjmNd4LQa7L63VFxo=;
        b=2QgUdY/2AVUKcQHEi6s6UTdY/McWObkt4DepHU3zlOU3zEwiRIGZa1g0ZwF5dk+jEp
         lud+LaRjo1i6sFS9+57sWoA8SDT5KxnCh6hgPenQXNoGnK/sg0JBPmUtS6QeORcwCJeu
         tOVUeqo/F5IP+6yE6Q1Foeps1809VA3sXl3gA75RsV9913vmCkkGVytEyQAu++DKrriz
         D4a3f6oCyz7zXF80lyYiBYSoNrLnQY2V28Rw+myCTW7GzlVzf0H+iufBc+u6FETY+9nU
         /IBDhI2wn22T/HywS07ZaTO7JRQv1TMamlPRWXRdDcqOLlGoFNCq92NoOgUuQ5XFGbXQ
         bHVw==
X-Gm-Message-State: AOAM530wCJF4a5gLaUoxZuyw6CsEpQfZwAiHESShHx1FMAByGt14qg2B
	BXN8BK+LpjCWAZmdWihira4yQZr3LD8ZFQ==
X-Google-Smtp-Source: 
 ABdhPJyRC3YG0NM23lWe0kZe4+yizaBd//yhc1r5BPZzKzZ+xFTeM5OCFW73gqU08jfmg9/AWh9btQ==
X-Received: by 2002:a17:90b:4f4d:: with SMTP id
 pj13mr20453699pjb.30.1642256888093;
        Sat, 15 Jan 2022 06:28:08 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/11] wireshark: update to latest stable 3.4.11
Date: Sat, 15 Jan 2022 06:27:53 -0800
Message-Id: 
 <357e6a8495eda11d9b22216a59360afafce51317.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94869

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
(cherry picked from commit 89bf10d0cb8af495de02ba7a02c487a8b5592cc6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0004-lemon-Remove-line-directives.patch | 15 ++++++---------
 .../{wireshark_3.4.8.bb => wireshark_3.4.11.bb}   |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.8.bb => wireshark_3.4.11.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch b/meta-networking/recipes-support/wireshark/files/0004-lemon-Remove-line-directives.patch
index c1a528f90d..134633f668 100644
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
index 73ccfc5f30..df1fb89f0a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "58a7fa8dfe2010a8c8b7dcf66438c653e6493d47eb936ba48ef49d4aa4dbd725"
+SRC_URI[sha256sum] = "a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279"
 
 PE = "1"
 
-- 
2.25.1


