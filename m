Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id F28006E835
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 20:28:23 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so15914163ykb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JHvOpHXVknOZzash0o+gWk3xGwj12AIEG0Tde0eK1Gc=;
	b=J/b1KG8q3zFaxFFLTzS+peIApmCipx9kzbi3isVhaPqeTLSt3faG5ILsC/+8yfI8Pf
	b9akMG1q8FQIGqQwOVY4xV1p0VpyU0hv/1FjJbv+H0M9LZyBTKA2p4v4p4709GqFF1yS
	V/a1BWStfOpO8S7pnZuDyPyGD1dyyEtJ8pOs2qzWPYqFRG18vRbahGaq2G44nrlUCLLp
	dJHvNx40aUYBvI1hLKy4/kS2O1Pf0NxPIg033ZVAySGufS4KW5XtRbWRlwMcLzLsnES+
	vo5Bo8ov4WKGfmO0IS7G/Vnqsj8yyTuU/BmUaJa9Q+GSuCuOCkkhFWW9mSAKdCuPmD0l
	zF9Q==
X-Received: by 10.236.150.45 with SMTP id y33mr1115439yhj.124.1393273704291;
	Mon, 24 Feb 2014 12:28:24 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f78sm945753yhp.12.2014.02.24.12.28.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 12:28:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 17:28:14 -0300
Message-Id: <1393273696-9249-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/3] populate_sdk_qt5.bbclass: Fix symlink location for QtCreator use
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
X-List-Received-Date: Mon, 24 Feb 2014 20:28:25 -0000

The QtCreator is quite broken regarding finding the mkspecs files; so
to workaround it we must to add a symlink to it. The workaround was in
place but in the wrong sysroot, it must to be in the /native/ one.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/populate_sdk_qt5.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 3b849e9..635dd6d 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -27,7 +27,7 @@ toolchain_create_sdk_env_script_append () {
     echo 'export QT_CONF_PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
 
     # make a symbolic link to mkspecs for compatibility with QTCreator
-    (cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; \
+    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
          ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
 
     # Generate a qt.conf file to be deployed with the SDK
-- 
1.7.10.4


