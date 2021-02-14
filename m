Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.11920.1613266613580800135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 17:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=hVHJklo8;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id g11so3659130ljj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 17:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9vDdYaGgJKyAo65ZKbCig9XUCQRXZ3rCA7uGcLZVzo=;
        b=hVHJklo80sjaXbIBA1bOuzZ9qO9Btg98kUC8S38MkUTFGSMqySBDvgzFePkD2TLapd
         GAGZ50QshrwYrutVdpfXrzzRurM/3PyLpy3PKat54iERbOR+qbndaVF7YUsIi0G3DeYw
         wzd4q+hHr/rlBHiluYcIaZ4WyQFs8qTIn0L8lpmxoy5yi7SCNd0foB4I7HLdtjMBwq6W
         xG28I2e5uYRXAgr0H9Y7993pQGkuhMVHKn27PwZcvMhsBqTMIvN8z28tbA7DqQUhHqly
         /nelEPPDuLlfYck7zf4SuVjCgPgGJPecY3wu49TIvJ+wQlirOxRiUextxkPlWfmDEGcl
         HNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9vDdYaGgJKyAo65ZKbCig9XUCQRXZ3rCA7uGcLZVzo=;
        b=O464g8dzKW2yivMvzhL60FLdDMbk4a/TnIPiVJyQ10r65pyE0r4TkNWyO8l2gFBfFJ
         Lxh+vAa5A8Jyd2PHHe8gTVyvIAHP5cqqJ/oIi43LzPFnA0VbX7/8mCKpLn+vNFdKf6Mc
         LY7ZUykjMCDB6SPXfbXkMdi1nqJsMuShZMPqy4Tpighvdrjc8Bzl94SBPqHVjtI90AzU
         wkHtz9j6nHO59uN0R5/83kA4dDMFDLUAfpePTD+1RsuNciYbdeJ18zgiBZuqUSRFFKwO
         qws+zX9tgDQWp0T33S2USKMe4mvgzKwfJBYx4Nir/2droxV92Z5QsDAQNb+QFFHF7n34
         /HMQ==
X-Gm-Message-State: AOAM530REan56XiESztsF84hSO9NYUMBAnT2eU6zhIkeCxaho2Aojk+E
	baX3BeDd/HKXz90yEB10I54Aqpcb2hQBKUx3
X-Google-Smtp-Source: ABdhPJyylzvSdwTWQG2RM6Nj9V3vYGnS6etzUI/azQe4dRergvERQp+3q3KileRYxumk7eNDuPRcow==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr5566299ljg.340.1613266611403;
        Sat, 13 Feb 2021 17:36:51 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c78sm2318055lfd.120.2021.02.13.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 17:36:50 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] rfkill: update to 1.0
Date: Sun, 14 Feb 2021 02:36:48 +0100
Message-Id: <20210214013648.460827-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../rfkill/{rfkill_0.5.bb => rfkill_1.0.bb}                 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/rfkill/{rfkill_0.5.bb => rfkill_1.0.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_1.0.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
rename to meta-oe/recipes-connectivity/rfkill/rfkill_1.0.bb
index 5c19e65b0..e9e35b165 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.5.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_1.0.bb
@@ -4,12 +4,11 @@ SECTION = "base"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
 
-SRC_URI = "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "http://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch \
            file://dont.call.git.rev-parse.on.parent.dir.patch"
 
-SRC_URI[md5sum] = "b957713a6cfbcd8ac0e94420aeddcf1a"
-SRC_URI[sha256sum] = "3e160cca504a53679f2b3254f31c53a4fb38a021bc50fed8eb57a436d33dfa07"
+SRC_URI[sha256sum] = "dffc631c611520478b8a286f57c67a35e8cb5802d376c6ca13b057365432389c"
 
 do_compile() {
     oe_runmake
@@ -24,4 +23,3 @@ inherit update-alternatives
 ALTERNATIVE_${PN} = "rfkill"
 ALTERNATIVE_PRIORITY = "60"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-
-- 
2.25.1

