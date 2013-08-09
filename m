Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id CF1396B4F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:49 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1979728eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8Gpv+3tSkAhYMQvVLlRG+gEAChgBZ/xOqmkqvPI3478=;
	b=t+4RHHCnbAme1lrzV4k0xLfIs367aebYhLro3ZUGedUMP5Ewu7ex/J++fdWWx5vuKF
	d/wCwSCF4gB2LkupRdY0rm8GVpJr6bgjHDLynXJD+McaQ0mUEeueBXQuXS2ZbeoIIM88
	rjBEIGRiQ3UYmVuVdkkevSRf+d3GIcfpPigfgo6/IA/Zx+15CFLfOVRRxk43Rqkv4Dg3
	itcpr9Z+ZVBnPA6Dd2Aq1ECD+f3kg7SCPFHnSYQmdheULS6joSo6meIk2GxKQXVGoOj1
	yxI355kj1LgF7AH5HLWBKzKGm8JoOKm+hpNn7bRd9gGXl4Vaks6GsxZB+OcnYlUr2Vr/
	63LQ==
X-Received: by 10.14.7.71 with SMTP id 47mr12380003eeo.21.1376038429819;
	Fri, 09 Aug 2013 01:53:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm26780437eeh.15.2013.08.09.01.53.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:22 +0200
Message-Id: <1376038471-32202-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/12] libgtop: add dependency on intltool-native
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:50 -0000

* | NOTE: Executing intltoolize --copy --force --automake
    libgtop/2.28.2-r0/temp/run.do_configure.20714: intltoolize: not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index e95db38..b6a8869 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -6,7 +6,4 @@ inherit gnome lib_package
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
 
-DEPENDS = "glib-2.0"
-
-
-
+DEPENDS = "glib-2.0 intltool-native"
-- 
1.8.3.2


