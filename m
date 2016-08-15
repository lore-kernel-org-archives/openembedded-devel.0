Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0CE770EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:21:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so10368409wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IRYRQCqfUoLNhMRkswxgB/wuq8ViFBZ4UXCvqhfIEbw=;
	b=VbYvR6KRNkHqdKSdnqxn7P0WVNucU2/NX0XZpqCJz/6h2kY+hVNbx5o5O7uZiUwTr1
	vRJT+6myuGH6mUkbTTv0IkLdWGyJMpiUl8LoWMfaphV7nRJQ0ckxG7wWQWEmLlIhHTxO
	y6DKzDPA/LUKYM4eFtd8V2usb2TlPUJOMzo43YroheVWuYjzqe1L0bSnG5HpD5wXeBjg
	H/bWiGkj/15l3bltFAV+h9FakK9kPjk3VoAc+5uWao0k9AoChb3plPTI2/8deXHY2+Na
	X85twafsT8mYKBgU98AQyi6Ut02NeoP5z1s6ge7euthvAeFIxz3dqGV0B2BB9K4sZcHY
	125Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IRYRQCqfUoLNhMRkswxgB/wuq8ViFBZ4UXCvqhfIEbw=;
	b=Voh5bt7q/EoJok78mCH4RqwO3IXj2Ed4/OTz+YUtKrMq37l5MY9nPyCJRfjnkt8C/K
	bvEwud/0VBxPgxNSmbknJnY55JPnEFcvO815zoV7qu1qn9MS/582qTTIISmN/iUoBORF
	zxDPryTpk/Z2wizjqAWAwDWchPDxVq99ptQqDe1GeIbLiO7PIBm7vHz6gVxzbXO3u+78
	CluDO3vDG6WdI279Gqf5eebSdDbhLdiWlpXw12qPvidYqERaWD+9Igtg12xvKj9J4LCy
	GHPqtnx8C7IX/+zoE5sSeBPFysPR8u2HS/JrqyEVbGej2BiTNTIu+PL+EAPzExLvfRMg
	k6Dg==
X-Gm-Message-State: AEkoous+HHglWKwPKGHTemmxrSjDzMdE6QRU+OR1ZQJmZo707TOscXB7SwPrEeoP0tRHCw==
X-Received: by 10.28.167.135 with SMTP id q129mr14468820wme.82.1471256466136; 
	Mon, 15 Aug 2016 03:21:06 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	v134sm15831811wmf.10.2016.08.15.03.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:21:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:48 +0200
Message-Id: <20160815102049.3291-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/11] gparted: add intltool-native dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 10:21:05 -0000

* fixes:
  | ../gparted-0.24.0/configure: line 16730: syntax error near unexpected token `0.35.5'
  | ../gparted-0.24.0/configure: line 16730: `IT_PROG_INTLTOOL(0.35.5)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index c1666a3..73a15db 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
 SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
 
-DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils"
+DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils intltool-native"
 
 do_install_append() {
     # Add a script which checks if polkit is installed.
-- 
2.9.2


