Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC1F6EC6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 00:40:23 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so12656395ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 16:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t60F2EkiUIlSi6We6oGqdTn3DSk0JmMLftPNLjXcyQY=;
	b=ldVzDhpMOg6Cnfup56HUDJY9xir46HoGp8BgFo+x0Tjgau0Uwc0rgkKYlwaqpJ91W+
	MmVVVMYuNpJulz2zqwUKVaGG4DvY1lxT79oO8J1nWlWgXEkcj0JHT3lxFdZPOP9s9JLz
	O92x4HrikYl0eKde9ZyPxplwbVfKlO+FMeGm8vfB7NlAqXGSWt5NWuEfx0uJkNV+WqKM
	52QAZtjykA3T7WY/+oKA8BwQATRl2q5nDLO2v/d28WNEaxqkPG7b61nz9sLt/wlEDOVK
	97LlajpKGXuL8bRXWqZKkb2MqBbVvZwrMc4p6wPSLchUD2Jqz7aTLl4zSgdO3uZ2wE8U
	3Aaw==
X-Received: by 10.236.74.162 with SMTP id x22mr27451283yhd.131.1393202424583; 
	Sun, 23 Feb 2014 16:40:24 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 48sm44205160yhq.11.2014.02.23.16.40.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 16:40:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 21:39:55 -0300
Message-Id: <1393202396-11130-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
References: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v3 3/4] mallit-plugins-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Mon, 24 Feb 2014 00:40:25 -0000

The qmake class now respects the QT_DIR_NAME setting when setting the
headers path, so this change is not needed anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index 273b3e4..7dc1a73 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -6,11 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
 
 inherit qmake5
 
-# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
-# but
-# actually it is ${includedir}/qt5
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-
 DEPENDS = "maliit-framework-qt5"
 
 RDEPENDS_${PN} += "qtsvg-plugins"
-- 
1.7.10.4


