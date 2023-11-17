Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BF6C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:02:33 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9286.1700218952227423287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtYDNAiy;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc13149621so4398105ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700218951; x=1700823751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFWFn6ixBX1e63bXQM2m8h3/WVhQVHhp6SbEhiignvY=;
        b=JtYDNAiyK2TNnRndLKlS8tXREwD0U8+MZMay3VibaYjGy+QdE64iYRKCels1/ZRTu/
         SCLL1R1nyxiy7nSaSsUq9w6PCBc+fVBNSU3y0wmJW2/eJN6SK9ucSvyQWxT4xp6AlngG
         D6GPAWsMvoZs9742qiTn4BQZQ8IPvaUcUsvXSe+OE49zmdM5WWygyuf37y7ehQQp7oP5
         1c1IQ4Je59Oz1Fmy5tu42OOVtzTUR+oSdkxSG7UrxeYQR5FNllG9XPKQGPL9ZvlMohgh
         WfRY3ll/9/4oxyZKD4Tx8Xlt3PTnNDgClbSgirkJVM04bkVoOWyBwkPlzMok2Sg2SU69
         Me/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700218951; x=1700823751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFWFn6ixBX1e63bXQM2m8h3/WVhQVHhp6SbEhiignvY=;
        b=Hky6fEMgLEjAfjIi6vrLgJYd1U2vAXLEEngZ7zh7m5OdMGxiNFY+78bGvbcS6f6THG
         RAzKnt8umu/REBiX6JD8lpm3ZoRHM/YBscyGIsxWMgUBaLrly49OZMsXC6aIBCL2u5i+
         chqrol+uhLlfiysK8La9LyP43nL1Cgr5IqYuZH5IzFqFcw93X/G+rYnoyxg2rvuMWAzp
         JjML2St9GnoET5SeMaPP+zb3x8VZ6EyN3jXPM8zfYntiNBtos3toxcu5y33noAGFsHMD
         TozlWpp8JtHbWDe0yetyF/+zskzW9QTAwsAoMoN4muauINLWGXEelD8JQdUDHRS9Bw9L
         WgzQ==
X-Gm-Message-State: AOJu0YyKMm9pOyf21ggY3aR30i+1UXybGKKfPXsMJiTTeWnpqhm4mKZh
	4plrS8FVLlxx5WFTmjj7QI0Et7r8Cms=
X-Google-Smtp-Source: AGHT+IGFjANYcF7k/kiwulhppTrhPLCL8XbIIjddRtb854dZnKUhYfGvEArpmkCFAfssVcegyojzXQ==
X-Received: by 2002:a17:902:ecd2:b0:1ca:28f3:569a with SMTP id a18-20020a170902ecd200b001ca28f3569amr9683783plh.5.1700218950805;
        Fri, 17 Nov 2023 03:02:30 -0800 (PST)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id bb5-20020a170902bc8500b001c3be750900sm1139780plb.163.2023.11.17.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:02:30 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akash.hadke@kpit.com
Subject: [meta-java][master][PATCH v3] meta-java: Adapt LICENSE as per SPDX identifiers
Date: Fri, 17 Nov 2023 16:31:28 +0530
Message-Id: <20231117110128.444181-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 11:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106868

As per Yocto 4.0 migration, LICENSE variables should use SPDX
identifiers
Convert this by a tool present at below location
poky/scripts/contrib/convert-spdx-licenses.py

Link: https://docs.yoctoproject.org/migration-guides/migration-4.0.html#license-changes

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb       | 2 +-
 recipes-core/xml-commons/xom_1.2.10.bb                          | 2 +-
 recipes-extended/dbus/dbus-java_2.7.bb                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 460d39a..368458b 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Common CA certificates (JKS trustStore)"
 DESCRIPTION = "This package uses the hooks of the ca-certificates \
 package to update the cacerts JKS trustStore used for many java runtimes."
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
 	file://debian/copyright;md5=ab0f6b6900f6564dc3e273dfa36fcc72 \
 	file://src/main/java/org/debian/security/InvalidKeystorePasswordException.java;endline=17;md5=f9150bf1ca3139a38ddb54f9e1c0eb9b \
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 42ad957..d01d5b2 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tree-based API for processing XML with Java"
 DESCRIPTION = "XML object model which is a tree-based API for processing XML \
 with Java that strives for correctness, simplicity, and performance."
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f18f166096348ef9d457214a2484816"
 
 HOMEPAGE = "http://xom.nu"
diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
index 0e5ae92..1bfe5a7 100644
--- a/recipes-extended/dbus/dbus-java_2.7.bb
+++ b/recipes-extended/dbus/dbus-java_2.7.bb
@@ -4,7 +4,7 @@ SUMMARY:${PN}-bin = "${SUMMARY} (Binaries)"
 AUTHOR = "Matthew Johnson <dbus@matthew.ath.cx>"
 HOMEPAGE = "http://dbus.freedesktop.org/doc/dbus-java"
 SECTION = "libs"
-LICENSE = "LGPL-2.1 & AFL-2.1"
+LICENSE = "LGPL-2.1-only & AFL-2.1"
 
 DEPENDS = "libmatthew gettext-native fastjar-native"
 RDEPENDS:${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
-- 
2.25.1


