Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D7312616E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 19:38:01 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so3270835pde.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=a1KBFXh2oJaBNJQAb2B61whO6yMx09FzKP5Iq9i2ZtE=;
	b=J9JBPtNB+4BewXPXOh+5g6vDMusEle/Dkh2QFS4Ejeh1mSHnZRT3tW67uwlDjf3MIh
	Qba7sppwFHY/9eI1b3fbNSuYReIljHX7lTeUgb6/sNoFQLisVEz7n53YtcpiSvLPoTjT
	xUgzSfxiqyNnJKWL5blQkimVxGMW9k/juVMjECtoh7Rf7Eg1qYFkVkbUMqE8Sz3DyMws
	swmqvCrecK8g4WpYIH3fGJxjFqT4SN026pmP8YOhD/jZ1HF8OvDgnwFB5tPlNuQ+UB/e
	vxdqSiSMtYcT0RWXW1yLyRzGZV1hsLyW4Q4nGCPG1KgKCUQdjuqKxXzot55yyYSnfDbb
	oFIQ==
X-Received: by 10.68.76.67 with SMTP id i3mr19219345pbw.20.1369424283310;
	Fri, 24 May 2013 12:38:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cd2sm17284550pbd.35.2013.05.24.12.38.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 24 May 2013 12:38:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 21:37:46 +0200
Message-Id: <1369424267-15051-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1369424267-15051-1-git-send-email-Martin.Jansa@gmail.com>
References: <1369424267-15051-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/3] systemd: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Fri, 24 May 2013 19:38:01 -0000

* removed PRINC to make it easier to remove .bbappend if this
  functionality is moved to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/{systemd_199.bbappend => systemd_204.bbappend} | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-core/systemd/{systemd_199.bbappend => systemd_204.bbappend} (76%)

diff --git a/meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend b/meta-systemd/oe-core/recipes-core/systemd/systemd_204.bbappend
similarity index 76%
rename from meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend
rename to meta-systemd/oe-core/recipes-core/systemd/systemd_204.bbappend
index c530e02..f5aa547 100644
--- a/meta-systemd/oe-core/recipes-core/systemd/systemd_199.bbappend
+++ b/meta-systemd/oe-core/recipes-core/systemd/systemd_204.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
-
 RPROVIDES_udev += "udev-systemd"
 RREPLACES_udev += "udev-systemd"
 RCONFLICTS_udev += "udev-systemd"
-- 
1.8.2.1


