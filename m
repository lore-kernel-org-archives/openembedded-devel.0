Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 26D7170A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:43 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so2371853wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HUO37o5WTNVBJ4YGoaWVq9pDXMn31/8TAV+22k/Q/Dw=;
	b=0CFLrzKlOp01pnCirtfj8scVgs2bg/S4AFaqRfMhQ84zjnIXamps7dx9PnQkuU2Col
	mgLRbNZ+a36P/uLlonBSHEGI5jOTN1FsNffXZo6+jympQkATz6moBuRI4/ehakvoROYt
	trMB0i78WhaCFLY/bUGxb7H2UhRzdggyzVwtbv/hPC+DiK/8o3xtXxrHgyGd6Kub7f0V
	edtWIgDhyS7h5dUXuG+K0Lk4NLIhJtBm/uvFrJfsm1VOZRdxFefimsWN4CWaqevHGZbq
	irx6vTewesvA3c907UVPmC4aa64dQ6y12jDXm+lTQJ/Pb2UnOG/SurfT+/RXOroHaLtI
	qw+g==
X-Received: by 10.180.89.161 with SMTP id bp1mr11423947wib.49.1407600524682;
	Sat, 09 Aug 2014 09:08:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e3sm25550930wjp.4.2014.08.09.09.08.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:35 +0200
Message-Id: <1407600537-10857-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/36] evolution-data-server: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:45 -0000

* fixes following QA warnings:
  evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4:
    evolution-data-server: configure was passed unrecognised options:
    --with-dbus --without-bug-buddy --without-weather --disable-uoa
    --with-soup [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 162471b..7c935a3d 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -41,10 +41,9 @@ do_configure_append () {
     cp ${WORKDIR}/iconv-detect.h ${S}
 }
 
-EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
-                --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-nntp --without-weather --disable-goa --disable-uoa --disable-weather"
-#		--disable-ssl --disable-smime --disable-ssl
+EXTRA_OECONF = "--without-openldap \
+                --with-libdb=${STAGING_DIR_HOST}${prefix} \
+                --disable-nntp --disable-goa --disable-weather"
 
 PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
-- 
2.0.4


