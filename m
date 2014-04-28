Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6916565E93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 15:28:08 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 10so660985ykt.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=IyI4iE4QAPkZiylF1Wct8rZAYU3NpfLfgX+fWwd7q0c=;
	b=drhLF3oZbZtWyQzM0gssCIRw7lNUC8uVPAYpBGdRsJClED5mO2oI0TRkDpj0W1hltM
	QkeDwAESYxzUuG0gv2sH066P7CyhW63rR7Im8yx0zWRMfmegV9pishDU4XzOSxVqW/ZK
	nzXrHJRcjAGqZzB7RjSrmtAKTVUd9Otge6EUyN58RJ7yy0ZkaqjFdti5BLqrzbJ3m3/r
	zd5hoGQZx++WfVccS+3NvvgkeI/hzRGCePOMuadFbTxerG5e08g0cx+Qe/QclCPwkVue
	D+XLkSWdzPhVp9VrecK36Il2L34X3pU+jxNdjHSWGdumbDIJqWqggz+dxwK+OnwMUqh7
	kHnw==
X-Received: by 10.236.177.100 with SMTP id c64mr39245110yhm.30.1398698889574; 
	Mon, 28 Apr 2014 08:28:09 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	t66sm31039400yhc.45.2014.04.28.08.28.07 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 08:28:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2014 12:27:39 -0300
Message-Id: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Mon, 28 Apr 2014 15:28:11 -0000

qtdeclarative requires accessibility to be enabled and it is added by
default to the toolchain so we ought to have it enabled to ensure the
default toolchain generation works.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtbase.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 89736be..91cadef 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -39,6 +39,7 @@ PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsy
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG_ACCESSIBILITY ?= "accessibility"
 PACKAGECONFIG_DISTRO ?= ""
 # Either release or debug, can be overridden in bbappends
 PACKAGECONFIG_RELEASE ?= "release"
@@ -56,6 +57,7 @@ PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_FONTS} \
     ${PACKAGECONFIG_SYSTEM} \
     ${PACKAGECONFIG_MULTIMEDIA} \
+    ${PACKAGECONFIG_ACCESSIBILITY} \
     ${PACKAGECONFIG_DISTRO} \
 "
 
-- 
1.7.10.4


