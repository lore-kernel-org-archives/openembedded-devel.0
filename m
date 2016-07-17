Return-Path: <net147@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 316FF60589
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 11:47:05 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hh10so9194200pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XOWzfYIOkJ/hx7kIhuHB9VbSoaLBDjjRgH3I5SLAxgg=;
	b=ngqGXP2bMVK5IQpvBg0egKnEvayGnR8YBhnAhK4XnNMzW5m/cWQX/tQd7y3q9wec+q
	20wKSXkugnL7MP8cngRxAf91mX6mROvzq3gajfsZduYCn8/J77PyK8ovaGHctof+KQ55
	tgoQDbTO0Jc14ErTfEIE74QR5ah5yjq1/XwUQqbtyLloO+fUfGlIDq3KkjNUsamtkZa/
	OL9QT+EcM9Dgu/oAnV6KrBmiw7ay3aZTiQrYIm/0PUqqJuDgPpHJcpUR8P4uVr6VT27Q
	xlvgPxwsqJ9k4yO7DqMkHkxXaX7zRpBeB7dAd2+cOQ7A17GkFAQJT1ax+GTL897QM0PK
	0TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XOWzfYIOkJ/hx7kIhuHB9VbSoaLBDjjRgH3I5SLAxgg=;
	b=SYwGKJIppCcerbu03iUwPie7wR1z8VjzNYnPvugHeOFFYzS2+q2bsY4hVNtaFumnVo
	JBgPJRAIwRqvcyN1Dy1axqMBAGKLSv1fZFAmQJv6o6kwcfMCMEG/YaqH5XbO5GfBrAHK
	T6yLOv35w8zToIG6QmNPmCtrlLZsz0fRwMP2TyvIG1uwCAvhPtQ4MgMJQeh7YO0Fv74U
	yAqx6hUxLeq22QB3a5Y+eH7WyzZDdEG3WIuTNLjQfButW3M/kJCOx44HeAotxEGnX1ZQ
	fQJ9gAhBqFcQNty2xRb8w6DOES5X1z8iP6rNrUx/VEA92xBFzuXlgVG72sdjJVfcjNvQ
	dkLg==
X-Gm-Message-State: ALyK8tL9hmdfhn7E1DBcJQM6MgAmtEd0Leesf91reYE0Dwfc3u3mhl/bmd/TnqMBZ4QG8g==
X-Received: by 10.66.218.70 with SMTP id pe6mr2705761pac.29.1468756026248;
	Sun, 17 Jul 2016 04:47:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	x66sm2048335pfi.84.2016.07.17.04.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jul 2016 04:47:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 21:46:03 +1000
Message-Id: <20160717114603.7071-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-qt5][PATCH] qtserialbus: add recipe
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
X-List-Received-Date: Sun, 17 Jul 2016 11:47:06 -0000

Qt Serial Bus module was added in Qt 5.7.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtserialbus_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-qt/qt5/qtserialbus_git.bb

diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
new file mode 100644
index 0000000..731bd48
--- /dev/null
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -0,0 +1,13 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.FDL;md5=f70ee9a6c44ae8917586fea34dff0ab5 \
+"
+
+DEPENDS += "qtbase qtserialport"
+
+SRCREV = "f9201ca7bad9220149fb39b89914e83a4a14dffc"
-- 
2.9.0


