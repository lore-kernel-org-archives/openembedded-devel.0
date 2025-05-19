Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC26C3ABC9
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 01:02:49 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.41188.1747616562402787878
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 18:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=wwEX6gAV;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.221.67, mailfrom: dimitris@siganos.org)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so3471511f8f.0
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 18:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1747616560; x=1748221360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XcCJuLwAiwuqJs30jWs2F2GBoSATLGBwebKNzisu1JE=;
        b=wwEX6gAV7QS8D1ShHPt2aqFdZOjz5F98o9tbLAdCqILxB3U/ThxVBJHDRtkUsYep+o
         ElhVp895NLX1CmVzZd/E4eEuwbpZCu70C09RxUfyaV41E9k3i8guPOUU0x8OK71wcjTI
         6w93l5oSE/p9E/Wr5EMD9hzsgG33ipvy5M20VRU1NAKH+MGAWxHhF6tuQlXSPEVHi1hw
         4huaV8fHNcjiqMLTHnEh05KYzKlvRnUBdF5P5Di6HleS6mffkkFRZU2ZPgwAmZ+rg+x1
         0e1BhpMljyKjajf65nPfg+aBAH5t8Z6kAxV6uXCKWpX/gsdX3xH4N5Li329fjI8WxeHx
         12ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616560; x=1748221360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcCJuLwAiwuqJs30jWs2F2GBoSATLGBwebKNzisu1JE=;
        b=JGOlFrOkCLHArr7yetE7ME99rVrYruoDeqJ6fEZMO4RLYkAUhUtx7EbECY7icKm3Lr
         NJnbeP5/z33oAawE9I3xFwT40R+UDH18VAiDzd2u7FNcs6nhkW//pkAYfK4ZvY7hb2br
         QkVkXVRys/G/yhAEDcdbCCITkULfmnN1bl5ziHaTPPhNW5F3PYABx0ZI9G4QxjlJsxPQ
         0dsA5t00Ymr1LpEBtE8zwiQc9ISK6gEqA9CDOYUwn2pW2Zn/2LQ22rekTcEk3M6g/wOR
         TWTEtNkYYk/QKFSjMRLlHW1yiRlXLPafm9W6YvINzUb3voVzjCumciTFjcg+f0LJXDkU
         CJYg==
X-Gm-Message-State: AOJu0Yxpi185XnOP7qkkrw+1m9XjSrPo0uoQRMyXJ0QiBv7WqFpjW/yu
	0v//b0R4/S/1XyW9B9gKZJIWpoetqC+7vUqawtXovPAOswDUZpwZz2zIWGMjzt5UiGUEBMRtzL+
	Z39NYM68C2l5v
X-Gm-Gg: ASbGnctmjMAKTFkhH/ZMxC2FCJNVAEMdYHY9jjQHE+j+pOHunF56QQLCPuUzWC8EBsu
	58KDw+Xf54jpDNCQuZy5+oPgbDMx3F56d6drhO3NdLMAnblLPPSF+G8OoFKyny3le56rc1pao88
	2tlE49r1grMqWLZq2kRqhZBZOv1nmWlvvEk4OPpXzad3pZDnJVWDDOS8jTCCNXXIycEAPXAZsYh
	0BzdTSiOzh94ugN07S0URaHw4JkGFfsKsqwaS1tI5KDlDDK9RAX4KyPBZfR7m+EIA6kjhzESC09
	pPVzsVHVEok2xuO1CcOf8dSVpXrKZOdgGniQcmL7HhEA7ns7U2JHBnOArA/dcpqvhZARicbjHJl
	Gyr48DKG4UX3mGn9tp97O
X-Google-Smtp-Source: AGHT+IEvQZmACKllhPn5g+r8ZSV9Qle9WhH/L/+ItvrfTlRGaAPSvVnNlbLQRwlWnPkTeGRNAl5yTw==
X-Received: by 2002:a05:6000:2dc4:b0:3a3:6a58:6f8b with SMTP id ffacd0b85a97d-3a36a587038mr3504719f8f.19.1747616559767;
        Sun, 18 May 2025 18:02:39 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdbfcsm119641305e9.3.2025.05.18.18.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:02:39 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [meta-oe][PATCH v2] bvi: add new package
Date: Mon, 19 May 2025 02:02:21 +0100
Message-Id: <20250519010221.282882-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117467

bvi is a visual editor for binary files

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
new file mode 100644
index 0000000000..b0081794d0
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Binary VI editor"
+DESCRIPTION = "bvi is a visual editor for binary files."
+HOMEPAGE = "https://sourceforge.net/projects/bvi"
+SECTION = "console/utils"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
+
+DEPENDS += "ncurses"
+
+# The project uses old style C interfaces and it is not compatible with C23
+# it builds fine with C17, specifying gnu17 as the C dialect to use
+CFLAGS:append = " -std=gnu17 -Wno-old-style-definition"
+
+inherit pkgconfig autotools-brokensep
-- 
2.34.1


