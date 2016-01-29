Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF6957713F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 07:47:21 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 128so6041880wmz.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 23:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=N/te9MBaeo+VOKwQErdisMXHcviePQU2WCeJC2ssJuM=;
	b=Zl6X8zBviGApCXtgoBTqwNWiTNX3pu441TdKIhCW+euv49SNe2vBqVJ5lf1+aJhIdV
	y7Pc2dBhoNZxMurgD0CuxWu9XdUwh84UOjKMNO+gZc0c4HB9MEhR7RaFJdFE2Owx43J+
	xWUU7RsmYYdWlr2W+wFSjov8kqCGbtoTESQmfmzltv+jV/VSb+roZSfSOeGuVlGZfemp
	6DNMhotZe9PM7gunTO7S/KiXYanfrXaBZXs/igLujF5LsEzlm8Gh8QrSu/QA6JweXpG+
	cFesmHebUdfRq/B9gtel6j3ET8aDl8/7DbqEZTz/YsZkV9HPRFr++bjvqVrO3CrQV7P2
	dwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=N/te9MBaeo+VOKwQErdisMXHcviePQU2WCeJC2ssJuM=;
	b=XpoQkZHwnqPBeEK1lQE8YMBi0JgoDxdEPgB7kgty9tmnVKn+2RE6NKc7hFudqLC58M
	UyFtEHtL0Z3WmdRUPM5HRvqzl3X/BzPM2u+x5F0kkMdszf67ooFw8kRdo0XaCg9suvsl
	YmjJS01oAkirfcFmrfv4hBcLGSeGJ6ffKrtNA8uceWfU5ZiGoEJLdY+HmGBoKIXNihwy
	yO+dlBrsvag1JfKYC5mhfj+J8Isd0HY6A8MLxAb5i0ve4zCsan5jl7QbX9mbNSR2igM2
	MBd2NmnEpSb3TkUmOCkH85CSltkaOGErHvpeUgVqchBmVHmx/MVukQMs/VxD0O/eV++a
	v82Q==
X-Gm-Message-State: AG10YORFwHQ1oTevM4AoVQY2T+vzomjTMxZrEEAPr/MygVEfmnxATmVc1IHFm6f6Fnu82g==
X-Received: by 10.194.235.4 with SMTP id ui4mr6882956wjc.177.1454053642016;
	Thu, 28 Jan 2016 23:47:22 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	i63sm6199401wmf.24.2016.01.28.23.47.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jan 2016 23:47:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 08:46:52 +0100
Message-Id: <1454053613-27842-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/2] xfce4-calculator-plugin: initial add 0.5.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 07:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../calculator/xfce4-calculator-plugin_0.5.1.bb                  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
new file mode 100644
index 0000000..cb1fa5e
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.5.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A calculator plugin for the Xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "8d7bf07a669a2884a409a7b03f89be5c"
+SRC_URI[sha256sum] = "7dcb04a3da7b85cb1f35f546c366fe8529f1c15f1c8c290edb91d16c07f5fd6d"
-- 
2.5.0


