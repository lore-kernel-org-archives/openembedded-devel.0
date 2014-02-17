Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id E36A06F019
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 20:05:46 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j5so5555837qga.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R5apE/WDWcvgVWtJj3/wPtjEuylRwY3Tre/iYRJm7PI=;
	b=RnW9oovMspqXQKTDlc8drxDvsakqQHp1TBKlpthX9DO056u/omCQ155JAT5MMEPsN8
	R83SstxPj7cb/e/6vwN5zTamzYO4JbzqjSA0S+B2cxtM1WA8pblZv35EHUTV5/llO0+8
	REQfq3VG2usfB7WJexuxh7pa4XHN/TCLj7CY8QVi63ZBzWCqONwzA2gYKrXDbUoN+7+H
	gX3z+sf+APWSTp6wREk9+rsiMwxk1vh0JShKU+PkLX8UgqGz4Rv6iShb+UxR5FV9IPpJ
	ZCzV24nebsq+jJsKFUWeJVZ+A+Pel+VTr7p9fafK06jDrt9EPUVmYv9BjUOx81clc+SU
	kg5g==
X-Received: by 10.140.86.51 with SMTP id o48mr34941900qgd.67.1392667547833;
	Mon, 17 Feb 2014 12:05:47 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id d15sm38073513qaq.4.2014.02.17.12.05.46
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 12:05:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 17:05:29 -0300
Message-Id: <1392667529-4881-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
References: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/2] nativesdk-qttools.inc: Fix installation and packaging
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
X-List-Received-Date: Mon, 17 Feb 2014 20:05:47 -0000

We must to fix the installation paths as did in nativesdk-qtbase.inc
and remove the files unused from the packages. This fixes the
packaging errors and allows for a successful build for SDK.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qttools.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
index e9b2949..494c7b8 100644
--- a/recipes-qt/qt5/nativesdk-qttools.inc
+++ b/recipes-qt/qt5/nativesdk-qttools.inc
@@ -21,5 +21,11 @@ do_configure() {
 }
 
 do_install() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+
     oe_runmake install INSTALL_ROOT=${D}
+
+    # remove things unused in nativesdk
+    rm -rf ${D}${libdir}
 }
-- 
1.7.10.4


