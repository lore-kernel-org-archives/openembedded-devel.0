Return-Path: <philip.balister@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 419A4606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Feb 2015 15:59:47 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id z6so1814334yhz.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Feb 2015 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=occMzAkBUHaCmtBpzbwmwCLoAC1at4n/wahiKcsiKY8=;
	b=gMn6wPM7JrZjTEWPDQXBWlGSa/O9Lft/DAy+jirXfeQBTogI93Ge823e2IiWblGAlW
	+0jAftQECwqL0v83NIcnpQtk7sm1iBfQjcQoqxTmyXPtGfZqCZ0D2WHUoc9tLbq4ND2g
	LQiATAsQcE7VSpgCVC6m1sLC5ThaNyM1OT5ZvCy0r9UPQH6UDbP6n/usxnZsDJfqYfQj
	vW5WNuhIb8lCfGi+DlvfQubtoylHFviT+N2ZYYczrBw2A/BUTmwV233fl4eSz76omevK
	s31w1rogROVA7LWn3TLcxs9t2pW+Jb8+50Krw95pYLZzLd1SZHUQv2aRi4qY0+E5UZAu
	STPQ==
X-Received: by 10.170.148.4 with SMTP id p4mr7270871ykc.72.1423497588649;
	Mon, 09 Feb 2015 07:59:48 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-84-240.ronkva.east.verizon.net.
	[108.44.84.240])
	by mx.google.com with ESMTPSA id m5sm7780370yhb.24.2015.02.09.07.59.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Feb 2015 07:59:47 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Feb 2015 10:59:40 -0500
Message-Id: <1423497580-7172-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-lxml : Use pkgconfig to find libxml2 instead of binconfig.
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
X-List-Received-Date: Mon, 09 Feb 2015 15:59:48 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python-lxml_3.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
index 1fa2889..68e3677 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
@@ -20,7 +20,7 @@ inherit setuptools
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/xml2-config' \
+                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
 "
 
 DISTUTILS_INSTALL_ARGS += " \
-- 
2.1.0


