Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DAAD860673
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 14:53:05 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x12so6564743wgg.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 06:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N68xIXMC0GgzoGGGpo2KBu1GJNJKRJybUS6FolcF9Is=;
	b=NJYmOcnNe61NVS1ngJpWom+nBY6bCJDKIlEAzX4AFeUhLiTJIP9UjJzCeoKdAOrrD1
	CzM8rtmX/tvnEbDaZLk7FDIaXfKVhx5A95S3gMb/2QrVqs4oq7W1UKpLRYv8KG6DWE2f
	JyXxqZQWrLuZji8pdq5MC+c0b+Zn3mbWeokPMrWg6FCsCnvVi54fG81IFSsaGM/6Gkzl
	fqg9D3vD76Ks3LI6Wua7K0p/gJaDZ668fn9fbTeChmscYhOTlw7hpDNHXzU/aIp/B6Im
	qfFf+pkUb0hAUT8bc0ZtAWlbgNSFCEup1ew1Xb//0hNFevA1ODp3r4B5N/OsWIZW//6+
	evAw==
X-Received: by 10.180.11.97 with SMTP id p1mr23951617wib.22.1418309585505;
	Thu, 11 Dec 2014 06:53:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pl1sm2607181wic.16.2014.12.11.06.53.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 06:53:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 15:53:07 +0100
Message-Id: <1418309587-15823-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418308793-4879-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2] qtbase: add PACKAGECONFIG for cups
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
X-List-Received-Date: Thu, 11 Dec 2014 14:53:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4c7e86c..c37134f 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -80,6 +80,7 @@ PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
+PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-- 
2.1.3


