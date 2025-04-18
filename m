Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026F5C369D1
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9975.1744977117422377707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emsi/tkz;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3264881a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977116; x=1745581916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRAotvTdhNtC+nd0TY9WpoRfW2pLJcPt2akaQEIBYM=;
        b=emsi/tkzAk72+tLQIE8oULaT8mttHMJFWf/4UneAf7rJQNVZ8K826KTF3z98r2WZqd
         +minPckMSVGB1a0mOgmV06MvgrauHBtJdBE8AifNUM6WA2QuGkfapEVgTzELtW4IgvAD
         zQsc6ahPqGxAeC8Oc/iYqSGwLp7X9oV6IJL1a88FTPd8a9TQyo5xkh81uTJThYE0Ei7S
         fGa1tbSIGWRI5hIXb0VROFmV+bmYcKjWxbvxhHh3hRzkMJKPqXKkhBnG4YYLZUv+S+OC
         vBDGbfVX3uRlLYhMsHUAnfr8TCo+kmCB4x6LyuHACquMJE2kHbD4bUX2QtUko+SSbn+G
         HVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977116; x=1745581916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HRAotvTdhNtC+nd0TY9WpoRfW2pLJcPt2akaQEIBYM=;
        b=d6+4XOr/lnokKL2fGAGPnKThGEr/8JjXNBR5LraFQl1/z3XS9ZEVlYYdg3zYZkfI14
         XrLrj2HU3FEMkuN3VSPh4/D8+NZE46srakC1zh+50XeZWZF4h05AO19KaVDxqWmkwn4R
         jU7Kkww9GHjTaXnfMdqSVSSUTQ/dSb0MHyTHSiFRjmmeKCidORXQ9ZjqozPrMyE0r7T9
         JsdPonNLgYrEhMZ4sImqigeL7+K6Z9l3ZtDmyUfdKPvqokOU534jVin87H3bG+eJznBB
         sTyjHe0YR5SEpH2oyv364TdZhp1sG0JeSumM1ZKjP7EnHZrkLpIe2ryTGKjBMjCebY1E
         kD+A==
X-Gm-Message-State: AOJu0YwxdQcXF+6HdOxYQvn5RS8m+z8Fe6XbPbtDy38491enG40qra7W
	LZgaDQmb+IsqHSiLxAOknG8FKMQV8tWLOEavsTT9cZMDirOtNM88
X-Gm-Gg: ASbGncv/7BVuOTP91zFNDbdo+LnRgfa7OtP41jhIrbQQ2mp7ilI+XoCDw8A2ktqQ01X
	T+qyMa6ozH51jrJi5AVHhyrg7Zn+Mzp6PphezYrZN1daQCNwH8Eo058pMAh5smiHngIXDsF3XN/
	WjXlSOD+6svB3wLEYrbAJ0MjTcrNensLsLabA/P8tk+2mAZDWSdhq1LdDmaW5SdAa7efNTQXjnI
	16aNd1yr4lCS1ylcleRO8J0G5ZGSq/IMSpzft3LvF8hYNIC9vUnMOGGaZkfqvLGDK55unZi5k45
	8dqkyx42rdw2HKVVb7TT90ku/Xz3wJUHnRf1ESybI9HqvrcCz6JIYBCr/1NMUpnrx6hkg6T2/cB
	xLG07pkJBrKGuJz5VOXwQ1fgGfgrGx/CgxwVq6/3JsC3IQL6OcnsQ
X-Google-Smtp-Source: AGHT+IGFf9TpBWmeALEPN+2ARkrtiS+iHZyIdhQUaYarU2ecNBE7Q/RiKORy1hxyV5x0HITAmuHkFg==
X-Received: by 2002:a17:907:728c:b0:ac7:cfe0:3014 with SMTP id a640c23a62f3a-acb74b80f52mr200609166b.25.1744977115619;
        Fri, 18 Apr 2025 04:51:55 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:55 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2 1/5] can-utils: Upgrade 2023.03 -> 2025.01
Date: Fri, 18 Apr 2025 13:51:37 +0200
Message-Id: <20250418115141.150272-2-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
References: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116958

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


