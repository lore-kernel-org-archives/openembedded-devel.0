Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 04CD160167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:37 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so14709562wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ImVw25tz480zbxLV8l/Yk0VvROB+TEKBV6u2VS3frKs=;
	b=0OBpvSFDH1lQQaLAK1yPocT0og8YFKazMO8aV9+ol8qOmKvgvq+b5H/lgaLIV1JNvP
	YuatOb25RcQokEQrWqpLvIwCzoUfU5Mdm3FvLaSBhiFOUID8kSYwqTTF6KcX491ELFus
	NIk7fh9vKF8RjsMBGP4SarviuUfGGOwxun3CLiqA01Pf+8YCKM33QXfgma4SaTAMELnj
	ZOE9fvhyvx0cNLNJbw41NyUzTBQfUCPkwYwrv8rCPl15NPjZqkXY+h3IR6w2VP/CqYDQ
	QDlwC1X2H5M/Q9HbB2KTwywTJtsVr+Tj1g48nxDaG9+3WKygZiE7TfDK+bmHneVS2Mof
	W4Ww==
X-Received: by 10.180.86.201 with SMTP id r9mr4069927wiz.56.1423810958196;
	Thu, 12 Feb 2015 23:02:38 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:57 +0100
Message-Id: <1423810919-9857-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 17/19] packagegroup-xfce-extended: add xfce4-timer-plugin
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 07:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 3df7440..28e452a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -31,6 +31,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-places-plugin \
     xfce4-systemload-plugin \
     xfce4-time-out-plugin \
+    xfce4-timer-plugin \
     xfce4-embed-plugin \
     xfce4-weather-plugin \
     xfce4-fsguard-plugin \
-- 
1.9.3


