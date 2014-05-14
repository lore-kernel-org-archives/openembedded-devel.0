Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f170.google.com (unknown [209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8501666069
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:33 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id db11so2002892veb.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PL3cXmOZLElQ1azXfSirQRyq9d7tgM4vnjZogsL9z1c=;
	b=oWnsBWmKUTNf3qxrqYjR2OtjLS9ybZoj1rWwvFh5brvybvv3zsiuEXH/pS6PjnTdEM
	g8w7g+7E3D3SNaPlgb/dmv+fZneNPind34BB2wIcdhiksR/7QdI56t668zjhAQ4Eyr6v
	3eUHJHKCONbJ6iInKZJcKHOZhQyYmYstmyjpJsZp1B5dkOv5uhPAvYzZyTY1kTEXRRd4
	Omq04pMMB2+26SKItpYeDuV337kBiYJncsNtv+UZQ7TzIa60zYTu6332WT0dUMV2c/7l
	+xRMB4h9u2PhZ6yKZ1WNaPfprJkRZslO2vWRXuZw8PLvrKPijdh6jZFkfDvL8xu0AcKj
	bKag==
X-Received: by 10.221.74.200 with SMTP id yx8mr2071395vcb.3.1400058214321;
	Wed, 14 May 2014 02:03:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ix8sm2216740vdb.18.2014.05.14.02.03.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:33 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:46 +0200
Message-Id: <1400058231-23201-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/8] exalt: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exalt_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 2993f5c..1f1c850 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -23,11 +23,11 @@ EXTRA_OECONF = " \
 do_install_append() {
     # install dbus config file
     install -d ${D}${sysconfdir}/dbus-1/system.d/
-    install -m 0644 data/daemon/dbus/exalt.conf ${D}${sysconfdir}/dbus-1/system.d/exalt.conf
+    install -m 0644 ${S}/data/daemon/dbus/exalt.conf ${D}${sysconfdir}/dbus-1/system.d/exalt.conf
 
     # install dbus service file
     install -d ${D}${datadir}/dbus-1/system-services/
-    install -m 0644 org.e.Exalt.service ${D}${datadir}/dbus-1/system-services/
+    install -m 0644 ${B}/org.e.Exalt.service ${D}${datadir}/dbus-1/system-services/
 }
 
 FILES_${PN} += "${datadir}/dbus-1"
-- 
1.9.3


