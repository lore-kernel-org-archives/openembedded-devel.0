Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id A04956BD90
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:01 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so346062eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=H4J+EhJvGV4lxSjnDU6Ye7WDXlDpKtChlLvrpVr8+0Y=;
	b=kH52axxI8GY98f5xQWs/9xeyLYAaPwinGKmNY2vUMZD6wYEEajHAQh+Qqszn7bzDhx
	0ci0BhK4zs2jCt7O6j6qkxz5KMUQC6TNpndm+jTEtuo3HvmH9niJIOgK9tEEHyEI1xdl
	GrLJGjFdHpuEeHQifTTwR0WlsMEsuMlZqIRtxCG3HZSAN1HXQs1W5Je+6hbEOCl9hadm
	hHdNs/RVqcWtoKl8m+mQNhxqWehgsNYC5TPAfcveqwz/mQ7CVcnzr1WEJbRc4SnaTf9T
	Ag2NnV/R/o7Ygpy5Hy0lUGWyZEUfnWZ2s1/N64iDCX0zwxix4UyleZsyOd2N112Tn2QJ
	mbFg==
X-Received: by 10.14.2.199 with SMTP id 47mr5372692eef.57.1377791462081;
	Thu, 29 Aug 2013 08:51:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47234977eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:03 +0200
Message-Id: <7d5fed812e95d487ae68cbf239eda92e912f5309.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 10/66] abiword: Add PACKAGECONFIG for collab-backends and spell
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 1aa88cb..11565e3 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
-DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2 \
-               librsvg loudmouth libwmf-native gtkmathview asio"
+DEPENDS     = "perl-native wv libglade libfribidi jpeg libpng \
+               librsvg libwmf-native gtkmathview asio"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
@@ -31,12 +31,17 @@ inherit autotools pkgconfig
 
 PARALLEL_MAKE = ""
 
+PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp collab-backend-service"
+PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
+PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth gtk+"
+PACKAGECONFIG[collab-backend-tcp] = "--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf libxml2"
+PACKAGECONFIG[collab-backend-service] = "--enable-collab-backend-service,--disable-collab-backend-service,libgsf libxml2 libsoup-2.4 gnutls"
+PACKAGECONFIG[collab-backend-telepathy] = "--enable-collab-backend-telepathy,--disable-collab-backend-telepathy,libgsf libxml2 telepathy-glib telepathy-mission-control"
+PACKAGECONFIG[collab-backend-sugar] = "--enable-collab-backend-sugar,--disable-collab-backend-sugar,libgsf libxml2 dbus-glib"
+
 EXTRA_OECONF = " --disable-static  \
                  --enable-plugins \
                  --without-gnomevfs \
-                 --enable-collab-backend-xmpp \
-                 --enable-collab-backend-tcp \
-                 --enable-collab-backend-service \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 
-- 
1.8.3.2


