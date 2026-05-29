Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326E2CD6E51
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 12:17:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8824.1780056602407357662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QZKyV+Ga;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alexander.v.yurkov@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so8559637f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 05:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056601; x=1780661401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3Bzw8zpZHb7NNhv7GM0X0pHWOiHdAA4RUrQo3d3MoM=;
        b=QZKyV+GaWr8sA/UFPnhRucKzQNyNu8liUwhFR1Dqrg0nZbLGLCzAOJ/vi1DY9vT9mn
         tKEY88OYu4ABFeozLk6ea8pPtkP1k85xsBv2XKtFNkbuQfP3bTAkOx1f0O5TxxMKq4o/
         J95D75BL94GgGhjSF7Qj39uxh8Uch9KZunlYUAZkCczmvHTml6xYzbMvyEU449SF5BA2
         rPG93nWtwK3xWgNXj/IeFf1JKHUh2LWeNk8l6deygNff0JI+Vo4k9iL82k545RQrbRjv
         WNmrVM9T6oIM0puPFNY0A1Ma6F58Jhu6G1Y5WKUtQ2XssQxMaEVnqrEwS90hqfQI9BT5
         WDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056601; x=1780661401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3Bzw8zpZHb7NNhv7GM0X0pHWOiHdAA4RUrQo3d3MoM=;
        b=aLKHkvd3d70FufW+pEWAUlWhSfY9ubmbJ4O5nJJZDOHNslNnG8fWKZA9OlNOkgPFy8
         CFTPYOPvx5zhPhzxlZedEG8ZmNWTWdL8wr5Clo3JdwFn+/a575yRgw6lXpMqV5UhzKWM
         13l+Uo/db9p4p4WdH3Brypvvewde/qYhQ8v9BhN8qxvThFtEnP8N1sMPbrIldYWL8Jhv
         gIhcJSOPaSMov9/nhsMhozpGOKoLBfbecGNtU72rZbbRLIPz5CjEi1SEpknxwIOI9uAR
         C2KO2+yw/2Jaa6D66kXAIDmeBUn15NbldxQxH13bB2htxhM7TxgsbJ68QARxR2RcSYQ0
         Kevw==
X-Gm-Message-State: AOJu0YzCXTwABbz74EiK742lslJkB8ZRkzq5MCAzfK0emlymFMIJp0Fl
	92o4OIHBiv6xlH4SiOIPTEokrwYGF1KLsN6p+5A3qhDuMzfAmiyzWq0/cn/cPD7akdY=
X-Gm-Gg: Acq92OHfDcK30B49Jr8KwUdkofPeirR1iNCrwjN3nVSkaAxPT5P5z464k6ualp7wkgB
	MQDnS+zvQRwupGKIwOWBRSIY96Zj0YRHtA5HfsEGmMG24mygPpLdWGxJXluAfFRJxJR975Hzshm
	JanBkXuyr8CiKa0UIf4NYeJDz51qZqIzvWEp1AjHjcXHMSqedG46rIx5AcyA54qTO9UsLrQPeGT
	k9qAOIZWf/Isj/JCCirNFbReg8CGH5JHVcUSIuqEgDvu0F0pC9CRfLXTPrMRP9kYIZ4AHCuCTkN
	83RaY9WQANxFzIer1v7uLPCLQJ4TkXHS4XsUNBqnqx5gB2y1Kscpbk83D1/433bsx9Y08erT1yG
	4SOzQJrq+Sq4mzMWCyHkS0E2C7HwHpuMenIIVNgxNjAPCd3B37pTokiV86e52pg5VpBuRIYG78N
	j+K9luJNTzwug8BK2ml4/12UsdPF36aMe1lG8xc2J1mA1XLXNq
X-Received: by 2002:a5d:6906:0:b0:45e:ea71:c6e1 with SMTP id ffacd0b85a97d-45ef144a647mr3337320f8f.21.1780056600636;
        Fri, 29 May 2026 05:10:00 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm3572495f8f.16.2026.05.29.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:59 -0700 (PDT)
From: alexander.v.yurkov@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Yurkov <alexander.v.yurkov@gmail.com>
Subject: [PATCH 2/2] syslog-ng: Add an option to make awk optional.
Date: Fri, 29 May 2026 12:09:46 +0000
Message-ID: <2f78e6bc74f8df296707f94a936ecc614606b29c.1780050236.git.alexander.v.yurkov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <630c6256d52d36ebcb805c20c13a4867da6b4aaa.1780050236.git.alexander.v.yurkov@gmail.com>
References: <630c6256d52d36ebcb805c20c13a4867da6b4aaa.1780050236.git.alexander.v.yurkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 12:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127288

From: Alexander Yurkov <alexander.v.yurkov@gmail.com>

Breaking change: Awk will now be turned off by default.
The change is introduced to avoid licensing issues: Syslog-ng is GPLv2,
gawk is GPLv3.

Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
index 9c6f62856b..65cb8f7db2 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
 PACKAGECONFIG[examples] = "--enable-example-modules,--disable-example-modules,,"
+PACKAGECONFIG[scl-syslogconf-awk] = "--enable-scl-syslogconf-awk,--disable-scl-syslogconf-awk,,gawk"
 
 do_install:append() {
     install -d ${D}${sysconfdir}/${BPN}
@@ -108,7 +109,7 @@ do_install:append() {
 }
 
 FILES:${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
-RDEPENDS:${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
+RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
 
 FILES:${PN}-jconf += " \
 ${datadir}/${BPN}/include/scl/cim \

