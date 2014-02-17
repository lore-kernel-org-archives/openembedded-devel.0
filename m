Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 585B36F019
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 20:05:45 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id m20so24194824qcx.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 12:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=LDqABgu4d64LJPk8roV9vc1hzhJHAZgevF6JQPJ5G1I=;
	b=V+Y3bhuA15PL6lq5zY6dzSxe7mjvI94ia4dbyTH4IlexW8db1sXFZbf+WD/wa7Fbka
	dznfYIN78t0dupOkEshK0pNkh0rhfG+fesJq4c2wrUI4fu1SLJm0jm/697sCRkYXq1VX
	K0PRNCXDeh3CysZXUJwaStOxJx3xy6ZV2vFoMs1KuqM6BPMhR3s3rpSrYhzbP1SklbCe
	SQwh2Fv9qpcFYXz2RcA7NrR778tFn3QysFS2x/aONu45nZC0eJaHwPzX6jSXoccQmBAU
	ZLN5VTSVcLA6mioHgyhAv8q74GKw6sTmReXp3sR2Dh/gMx6tK8uu5DaA3+UIopM90mE8
	2A6w==
X-Received: by 10.224.14.2 with SMTP id e2mr5523284qaa.73.1392667546009;
	Mon, 17 Feb 2014 12:05:46 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id d15sm38073513qaq.4.2014.02.17.12.05.44
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 17 Feb 2014 12:05:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 17:05:28 -0300
Message-Id: <1392667529-4881-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/2] qmake5_base.bbclass: Fix mkspec path when building nativesdk binaries
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
X-List-Received-Date: Mon, 17 Feb 2014 20:05:46 -0000

When building nativesdk binaries we ought to rely in the native
mkspecs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake5_base.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 2db0fa3..3861cd0 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -4,6 +4,7 @@ QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}/${QT_DIR_NAME}"
 
 QMAKE_MKSPEC_PATH = "${QMAKE_MKSPEC_PATH_TARGET}"
 QMAKE_MKSPEC_PATH_class-native = "${QMAKE_MKSPEC_PATH_NATIVE}"
+QMAKE_MKSPEC_PATH_class-nativesdk = "${QMAKE_MKSPEC_PATH_NATIVE}"
 
 # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
 OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
-- 
1.7.10.4


