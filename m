Return-Path: <net147@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C7B2C6FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 00:57:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b66so6260530pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 17:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Qbtjd6P+JjQ5EJOQ9iJzH75VcNj6pxKO8O0fu36ohg=;
	b=jOnXBO6wmSxg40TLhpIBE7r2VJBsFf77QAsrP9dodm8ynjtS9ZD+1I1pb5Tk7ydUG2
	rj2pgZ6dVynRQH2y2sMGNlI08tnOcFPrkiL9xQ66gDjlQFTrKOlwbloKlV1/4nAhQLgl
	bYcVtKUfAdVoBR26DBSu9rH4WzL0Jp1kZh9C+KXwhWIaIM8S+1xOod0lqGPENihGZQ67
	reIfn1lYArVta/p+Yejqdm7Jc5sUfb8Pnu/jwSOxtA516OF78833Yyno8JtjWr7H7zSZ
	9oUgmeJvyyClU53XJXSSLxJ/poy3XL6yJM+kW21AKMNwDayNtQEm1WzRxQDb5jtFioPP
	g9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Qbtjd6P+JjQ5EJOQ9iJzH75VcNj6pxKO8O0fu36ohg=;
	b=PndeSMOZYCUZxNJl63KupMai0b9SWsgMkTutc2KcGg+coPj8jlUa/BOtwxsu7SlE82
	wzy9o8x04NI0JI+pI0wfnFTzJt993W/4XdOzCDoCbBXfBasRHoRqaxyZelOPRId9RWPn
	zYneTE0GmAQQlonLqWk+AXzrXW3mWAoUr/ADaAaKO2IGlxpLygPsKCYR3C+7Dv4Bcf9W
	YDy4xnNDwBbQ5TKC4dV64cnrBMlPVgfCzGfM7KMNG198Zh0aCsZccm9ngZzi47kbakeT
	rYOvTtNhiRCJCE95tTAfdZf9KatmCVYKT/V8hqZNTNC07CN4rjuutjh7NgCAyOB1R2oC
	XxKQ==
X-Gm-Message-State: AOPr4FVGKWBf/ogPcMgjzK3+rdQ92GkRbX0Qb7KWdD34/ZGSKxmjzgSyRDbg0r7KAGgJmQ==
X-Received: by 10.98.5.5 with SMTP id 5mr41194471pff.58.1463360224434;
	Sun, 15 May 2016 17:57:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	x64sm42783815pfx.95.2016.05.15.17.57.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 May 2016 17:57:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2016 10:56:59 +1000
Message-Id: <1463360219-31365-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-qt5][PATCH] qtdeclarative-render2d: add recipe
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
X-List-Received-Date: Mon, 16 May 2016 00:57:03 -0000

Qt Quick 2D Renderer module was added in Qt 5.7.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtdeclarative-render2d_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative-render2d_git.bb

diff --git a/recipes-qt/qt5/qtdeclarative-render2d_git.bb b/recipes-qt/qt5/qtdeclarative-render2d_git.bb
new file mode 100644
index 0000000..cb2ee8b
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative-render2d_git.bb
@@ -0,0 +1,12 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GPL-3.0 | The-Qt-Company-TPLA-2.4"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.PREVIEW.COMMERCIAL;md5=c458c2ae1b463cca5219eaee54f6287e \
+"
+
+DEPENDS += "qtbase qtdeclarative"
+
+SRCREV = "13a6c51f26128015c0a3c335bdae676b46df6ed6"
-- 
2.8.0


