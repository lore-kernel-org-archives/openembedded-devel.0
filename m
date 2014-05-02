Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4E31C605B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 21:11:09 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id z6so4693891yhz.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Va4P4/foVLLqhifqy9Cic+AooePlZQMlhv4HIIZpGSM=;
	b=FXn8bfzz6KUEYmHqcYCjGGR4Egn+c0RGrXycSS98Ttu/nuEohY3oNB9Lk0z2eFXxX/
	PPPW6bX8JNXzAQo0eegNfWOkNCw674U6JVRhH0SFSgJ0WRtZLwjzLwldMW5EuBSTwdsw
	Fj0+4b8yvK7FNaTTI0ycxOIHumEFGpaJCx8tQD8tMJZUaYakcU4cx1RIvpfjz+YkXFwg
	x6a5tFgwYcAgM5s3Arqm29mxPL9ru1rRMUp5lhz7zfncStd8xJ9mS7fl5t/J8mOcouDZ
	nJ9sV3VRSMs4pppJVuqRWv7EtDMhDCgg+j/FgjE/YmLLmwCq24n0H13vT9V75vAkAfNF
	kCfg==
X-Received: by 10.236.124.237 with SMTP id x73mr12935904yhh.137.1399065070345; 
	Fri, 02 May 2014 14:11:10 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id o62sm242168yha.27.2014.05.02.14.11.08
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 02 May 2014 14:11:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 18:10:48 -0300
Message-Id: <1399065048-23186-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Fri, 02 May 2014 21:11:12 -0000

qtquickcontrols-qmlplugins requires accessibility to be enabled and it
is added by default to the toolchain so we ought to have it enabled to
ensure the default toolchain generation works.

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


