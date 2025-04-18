Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E0BC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9978.1744975940635652566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frbNMsHE;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so332956266b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975939; x=1745580739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRAotvTdhNtC+nd0TY9WpoRfW2pLJcPt2akaQEIBYM=;
        b=frbNMsHE136KDwJ2sdwciPlOcxvsgtSZYDmICrBWfw1E4D0ODEUzh/U/5wua5NRDFm
         ucI35AgiT5Mc7RL8ysxb418VfYfh2+fiq3DSJ0dXFfoWpgcT+yLpAaUQJ+JB+3KMQast
         t/WWLAbm220SGQBytdTtAqGQ/28OjMaxg0YBvwmz2WuOLYIkVKbkBvGeC3GGxCvCX30c
         TfXA+SLaOZee0nh9oWINip3HsboMp+Q75h6PilQ+QgnUBNQ8wHlzrMk7pYh4/yJfaaK3
         CjQYySZvtFpNQUJ3rQ+ZSOuccO09Dkk3LOgeF+bDRssSrNh8V/6xCbRZh9A/qlJk3HCV
         RWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975939; x=1745580739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HRAotvTdhNtC+nd0TY9WpoRfW2pLJcPt2akaQEIBYM=;
        b=m6xQruYH2exSdFii+GAwgo/k4mlQCuGtTk+IlI9fBxppGeHotxAQKUU3ZVEjixJ2Jf
         nAJFpmvibxKo0+wfQnYlbVv24HwD0TyRqeaFoUfphzvMLsyTQFY2FsXIHqNAMh9mnYdp
         6D3r+VUtZpJ7r9749NZC9yeCyVMXqclCrUrMRDpvWDiehnGSt6PKQIyhP/N4gh8uELek
         6BOEu3D0hqh6+wp4A2E2xQT5SToDUtx3DoxL7C+bUhodjS+A/CMMxMEkqj+rnLCq1aq5
         EwGQwwikcJZDnRKFhYlM2JZH3wTzELpVonVw2ZfhboPcuUOrzYtQakE4xsxmdp9D+wvr
         QoMg==
X-Gm-Message-State: AOJu0YwvHljkKH6ZBa+6o7Mu5l6vyqiqVykBlqhPxqgF9P3viu8fzwoC
	/7W5O9QCuGu91cUcoyJ6TXjpKgdse5il8uv3byxbrUU+vJUG4yNpP6oY2A==
X-Gm-Gg: ASbGncuBbPRZSlsNWacxbE6y6ZGFHJhxq3O04u/92xA4kvXJJWQnpZEtck8Ck2BZjdq
	lJlFTN2rqnZ6WYt3EvVpO8KaqIfgO8VJiEaLcHLSWPVG6g90lQhXqqQ7IkitwXdHvwxA4JgVj16
	5wfvNy39AD3TmQg+fSxxczgRjjhSBCXYDcsQrxlNue3O5jM3AaJ5ENAtcYxzIiXV148aRuqVP9n
	byJDNOLNIAzEVzcttHJYz4AzCx6XvBw82mu88dogdThs5605NZhJURHk9z35O1622cPcNM8AGlG
	xjGgRl6mC88G5IlXg/8xf3WG4dlWbTgsa4tOFXYPRyalzFxYatBHcHi6OG0GAW9ZswjigH0Que9
	kEhk0NhFa6tXfmYSJJmTfiTObsIVPSSHWbxYWFla4wIz8AtRQJuA3
X-Google-Smtp-Source: AGHT+IGwupn0JEkVtElMQ2mpCvM5ai/ZF9AliMdNqSnMjyeKQPlTedT0aJhWvgj2YP3WiD+qkCehUw==
X-Received: by 2002:a17:907:1c0c:b0:ac2:4db0:1d22 with SMTP id a640c23a62f3a-acb74db7cffmr203860166b.42.1744975938740;
        Fri, 18 Apr 2025 04:32:18 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:18 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/5] can-utils: Upgrade 2023.03 -> 2025.01
Date: Fri, 18 Apr 2025 13:31:44 +0200
Message-Id: <20250418113148.142480-2-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116952

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Changelog: https://github.com/linux-can/can-utils/releases/tag/v2025.01

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../socketcan/can-utils_2025.01.bb            | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
new file mode 100644
index 0000000000..cad41944ec
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -0,0 +1,68 @@
+SUMMARY = "Linux CAN network development utilities"
+LICENSE = "GPL-2.0-only & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
+
+DEPENDS = "libsocketcan"
+
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
+
+SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig update-alternatives
+
+PACKAGES =+ " \
+    ${PN}-access \
+    ${PN}-cantest \
+    ${PN}-isobusfs \
+    ${PN}-isobusfs-dev \
+    ${PN}-isotp \
+    ${PN}-j1939 \
+    ${PN}-log \
+    ${PN}-slcan \
+"
+
+FILES:${PN}-access = " \
+    ${bindir}/cangw \
+    ${bindir}/canlogserver \
+    ${bindir}/bcmserver \
+    ${bindir}/socketcand \
+    ${bindir}/cannelloni \
+"
+
+FILES:${PN}-cantest = " \
+    ${bindir}/canbusload \
+    ${bindir}/can-calc-bit-timing \
+    ${bindir}/canfdtest \
+"
+
+FILES:${PN}-isobusfs = " \
+    ${bindir}/isobusfs-cli \
+    ${bindir}/isobusfs-srv \
+    ${libdir}/libisobusfs.so \
+"
+
+FILES:${PN}-isobusfs-dev = " \
+    ${includedir}/isobusfs* \
+"
+
+FILES:${PN}-isotp = "${bindir}/isotp*"
+
+FILES:${PN}-j1939 = " \
+    ${bindir}/j* \
+    ${bindir}/testj1939 \
+"
+
+FILES:${PN}-log = "${bindir}/*log*"
+
+FILES:${PN}-slcan = "${bindir}/slcan*"
+
+ALTERNATIVE:${PN} = "candump cansend cansequence"
+ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
+ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
+ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
+
+# busybox ip fails to configure can interfaces, so we need iproute2 to do so.
+# See details in http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.
+RRECOMMENDS:${PN} += "iproute2-ip"
-- 
2.34.1


