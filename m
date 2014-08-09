Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8F32970AA1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:51 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2367515wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xAD/3XayT/2K5VR7qKIoE24U/trFPSO6pKJFBcnVXq0=;
	b=AYPaj2InFcxxLg+h6geG2Jn6QA9XCoj5Uk2VmwvXK8d516wA9DSu4s9JtXmcZw7alv
	55eq8K+f96vD+CVTHGUy8diBaq3IBN3TYC8+73jRsOZnor2mDgXwMujBKLzrREl/hjRg
	WNqFgU4jZHm4XUMI4I7z6SL2HPrjtPivzskjColaktSWYOESuGaf1YHkRE8MvwQjSudE
	m2hFt7u3fz7v7GqmvH796XSfWIbdx8oiHXSj/wbVw+T8uHnjysNbilJlC7fJEmrJrGIY
	JxO2zBpfz0it8ophysSA6qJuDM4JhqClj1kCW+JFZbPr98Vjq6D0e2l7R+9RE8CfuOjF
	jNCw==
X-Received: by 10.180.11.135 with SMTP id q7mr3682550wib.67.1407600531863;
	Sat, 09 Aug 2014 09:08:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm25527813wjx.26.2014.08.09.09.08.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:41 +0200
Message-Id: <1407600537-10857-20-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 20/36] libgsf: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:52 -0000

* fixes following QA warnings:
  libgsf-1.14.29: libgsf: configure was passed unrecognised options:
    --without-python --without-gnome-vfs --without-bonobo
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index 881d19e..d7bbd3b 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -18,9 +18,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
 
 EXTRA_OECONF = "\
-    --without-python \
-    --without-gnome-vfs \
-    --without-bonobo \
     --disable-gtk-doc \
     --with-bz2 \
 "
-- 
2.0.4


