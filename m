Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 06CF6738D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:50:11 +0000 (UTC)
Received: by wiwh11 with SMTP id h11so39365560wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Tr+lzV79ojbXUlpaAJ/2V45o1zhWeQ+dxAUPA662YVw=;
	b=oIA0ltYi3wzhB8jrRCXQ22ptwoWjkQA4/IPZmeMIF5ZVSuaU1cm1lZH1EHM3zRGWkb
	oTqSqAfIj6i6vq2Wexi78ibkd1EtQNvyy3j/y5liuv4c/smLpbTr/nT7B2fw2ahvDFFl
	m3QFLxnUNi+tq9aX82RAFh/S4decM0hazl1HkJs9I5asZ/CKkN0lm81ReJgAMAA8WBLt
	TkoKPT7RfZn6puVKSyh61RXQ4jHcV3lNiUsS34N5Y9tlC1SPUFTsRn4n6VXc8cQ0+boJ
	FjP6QVtpAkDLKJ/eY6HSFsR5W3DAUAhGXweca+jGhnVNsn1WVFTAYOWwnrwGbPJkL3rW
	MLWw==
X-Received: by 10.181.12.5 with SMTP id em5mr24309213wid.84.1425570612210;
	Thu, 05 Mar 2015 07:50:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	uo6sm11037990wjc.49.2015.03.05.07.50.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:50:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:50:13 +0100
Message-Id: <1425570615-21705-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCH 1/3] ktap: rename recipes to indicate they are from git
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
X-List-Received-Date: Thu, 05 Mar 2015 15:50:16 -0000

* set PV so that it shows git revision and also automatically rebuilds them
  when SRCREV is changed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/{ktap-module_0.4.bb => ktap-module_git.bb} | 0
 meta-oe/recipes-kernel/ktap/ktap.inc                                   | 1 +
 meta-oe/recipes-kernel/ktap/{ktap_0.4.bb => ktap_git.bb}               | 0
 3 files changed, 1 insertion(+)
 rename meta-oe/recipes-kernel/ktap/{ktap-module_0.4.bb => ktap-module_git.bb} (100%)
 rename meta-oe/recipes-kernel/ktap/{ktap_0.4.bb => ktap_git.bb} (100%)

diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
similarity index 100%
rename from meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
rename to meta-oe/recipes-kernel/ktap/ktap-module_git.bb
diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
index 93a4e2c..2c94a08 100644
--- a/meta-oe/recipes-kernel/ktap/ktap.inc
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -4,6 +4,7 @@ HOMEPAGE = "http://www.ktap.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL;md5=eb723b61539feef013de476e68b5c50a"
 
+PV = "0.4+gitr${SRCPV}"
 SRCREV = "c8401e07c89cdec9a5f673da4ddb12b7982b522b"
 SRC_URI = "git://github.com/ktap/ktap.git"
 
diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap_git.bb
similarity index 100%
rename from meta-oe/recipes-kernel/ktap/ktap_0.4.bb
rename to meta-oe/recipes-kernel/ktap/ktap_git.bb
-- 
2.3.1


