Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAAA6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 08:24:15 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t79so350461065wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 00:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=h1VYelYM3UJbqIj1dXvvBgRA/JyVUjCWjgtAqPmwTm8=;
	b=juXjX3CABNN7/tLI/V0amXwr902Wlyx6p969g1Z3Geg6Wfo7D8SB+UfOj7RZBOLlny
	X4sDLSYJPAhmw5ad9ECr4SVF0a9ZMlDb4Mi8d9faq0/+gHthgNRmQ4vBf34sG37FPYcF
	u5ZoiN3Nm4wDm9Lowgv04+tQQZYp1BbgFWtOYbv71/gxHcsekomw+UiNbK8I9RDqxABK
	9e1BmmocRmqypOslKLVNPhyC7CG21L9/9gXU7vhLJshH+vCa+XovDnF7tE/cg0vr37+l
	3PxOLuh9rKq7utfHrLOrM7pk0PPsWvKeWN1vxWXWAzBncvuA1AAhZUEDf4RviM4Zg/k4
	1+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h1VYelYM3UJbqIj1dXvvBgRA/JyVUjCWjgtAqPmwTm8=;
	b=K3m3/lw8CMMgOlqE2kSbP1WCnZGcPNaxmDa7Zqe/DN+PoDD5yceY0fltpMqKEsl91b
	4XkCyi3+t1k30dHvWROVca+xKj5mc5UUsz6Gi6tsLXj8nP9E+xImlMLX7WT58wIK/dd6
	KLK1J3nDzNvfyJIaMnEyezHuOa/uTKsUI3CxLyjqSt+pr7VbuGzA0k9CeuNM+Vpor9Hr
	1RT8QX9K52V9N6O86qI21IF7hQXkzBxmruW9DSx/ZKY7XWxn6Ev4JigMmcN61ep1WjQL
	51FbcPab5K2CZ6HFkSD8PVeS5Zeh1/noUXXhZAZnC9nmHQ0KK2f7CMi7GBhCnqDg5Owt
	4RKw==
X-Gm-Message-State: AIkVDXKvfTT1H5q7mu14LQUt5JTxv8+quGd0oFksBks4OMGwYs2P1Nqq7v4RZhmN4mu5LzTQ
X-Received: by 10.28.173.4 with SMTP id w4mr37070483wme.70.1483086256565;
	Fri, 30 Dec 2016 00:24:16 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	z6sm72272957wjt.24.2016.12.30.00.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Dec 2016 00:24:15 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 09:23:30 +0100
Message-Id: <1483086210-28756-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] cppunit: update to 1.13.2
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
X-List-Received-Date: Fri, 30 Dec 2016 08:24:16 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-devtools/cppunit/{cppunit_1.13.1.bb => cppunit_1.13.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cppunit/{cppunit_1.13.1.bb => cppunit_1.13.2.bb} (78%)

diff --git a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.2.bb
similarity index 78%
rename from meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
rename to meta-oe/recipes-devtools/cppunit/cppunit_1.13.2.bb
index 9420294..65b08b0 100644
--- a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
+++ b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.2.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
     file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
 "
-SRC_URI[md5sum] = "fa9aa839145cdf860bf596532bb8af97"
-SRC_URI[sha256sum] = "d5b9f3ffc9f1634d75b20b54f48c02e0817bca6afa1d5160b244889d6bff8e0f"
+SRC_URI[md5sum] = "d1c6bdd5a76c66d2c38331e2d287bc01"
+SRC_URI[sha256sum] = "3f47d246e3346f2ba4d7c9e882db3ad9ebd3fcbd2e8b732f946e0e3eeb9f429f"
 
 inherit autotools
-- 
2.7.4


