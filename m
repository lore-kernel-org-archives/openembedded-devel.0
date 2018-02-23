Return-Path: <timo.jyrinki@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id E712177F34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 12:05:43 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f75so7014517lfg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uxX5h7ugsky8KLw4pvfQq252P1iLuNBmgclUT9Dm0Pc=;
	b=ReiGHirbgMdjbrUt8BU6Qv/vt+ql8ZBk3POZrrqYHv9nZ+YtME1YMyqt+uny8TGQtD
	1H5mFesFVmvlk31Pd9JTbNMfEsR9Nsw/8vvyLy17GuzfycrelsvfT8bxlxTZNfYz4C5c
	kGPZmBD6rliwc9RjF7wNhMrU+4dHcj0nPS7qFxX799iNZMMQSw1B6gGog3KCJ95687O0
	OGMaFKHOKD2l7uIOkZ/4Pm/LULyRmuap+Q93H8m0XanHHm+MI95+8sO6WBgUh2K6Yn3+
	7iSxkqUb2i7Z54cwzWkpOxPjlbCe155NUyTE7MQyeTTjTAe0Dw9wO2HrMy8OXmvGB6s5
	lWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uxX5h7ugsky8KLw4pvfQq252P1iLuNBmgclUT9Dm0Pc=;
	b=gRtt9BM8EQzeWizLEEGTUlPv7n/TY/JNAop2EVU8qymV+i+Kc1ToAAyYcNNKorUlLg
	cQmE89LhQR1i6glJu1E3Ug/UoRj7Qh9yrM9IKehfu2X+cWndqpXXSPRR6GPtZZPbi27v
	W5/KiqVu6G/DZgC24LV5SPrcxn+ofnLnn+o+2YoQzGpxcgqvJTmxmUuVrJa15rv9yG+w
	7jHYICVSpAFukwKPEF5yzEqRZw5JaCwl9ymDEEpiWSn5uUCc+2vph4nhR7BBVyYzLLWA
	SMlatCxo8kOPje7Wx1bMfUSZDr8TYBugZgKA7ed1NBPNTsxpdtw7ScNbfIYGMs5206WB
	kYjA==
X-Gm-Message-State: APf1xPDwIz9uV5Pese5hpr68Pe2S1C+tRshsSdTK7wf0IRM6DjXwD8v8
	Pc9th2XhvSzPYjam7ZY//hqVYw==
X-Google-Smtp-Source: AH8x226bNHOCPOVjLwBu9vb096jcQFnaVbTYrwt/P8jnwRHcEcPcpX1C4MAmj+xEjynLM6DYXz/qcg==
X-Received: by 10.25.155.211 with SMTP id d202mr1218895lfe.125.1519387544223; 
	Fri, 23 Feb 2018 04:05:44 -0800 (PST)
Received: from localhost.localdomain ([2001:999:51:ec1b:508a:7d4c:b474:b280])
	by smtp.gmail.com with ESMTPSA id
	h78sm443500lfk.94.2018.02.23.04.05.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Feb 2018 04:05:43 -0800 (PST)
From: Timo Jyrinki <timo.jyrinki@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Feb 2018 14:05:39 +0200
Message-Id: <1519387539-10077-1-git-send-email-timo.jyrinki@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] qt5: Add recipe for qtpurchasing.
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
X-List-Received-Date: Fri, 23 Feb 2018 12:05:44 -0000

Qt Purchasing was introduced as a new module in Qt 5.7. It was previously
only available with Qt's commercial license. It can be used to build payment
features.

The commit hash in the recipe is the latest in the 5.10 branch. Licenses
were combed with licensecheck tool.

Signed-off-by: Timo Jyrinki <timo.jyrinki@gmail.com>
---
 recipes-qt/qt5/qtpurchasing_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-qt/qt5/qtpurchasing_git.bb

diff --git a/recipes-qt/qt5/qtpurchasing_git.bb b/recipes-qt/qt5/qtpurchasing_git.bb
new file mode 100644
index 0000000..2415f38
--- /dev/null
+++ b/recipes-qt/qt5/qtpurchasing_git.bb
@@ -0,0 +1,13 @@
+require qt5.inc
+require qt5-git.inc
+
+HOMEPAGE = "http://www.qt.io"
+LICENSE = "Apache-2.0 & BSD & ( LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial )"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+"
+
+DEPENDS += "qtbase qtdeclarative"
+
+SRCREV = "49c5461af0888950b80eb9558647ccd764d55737"
-- 
2.7.4


