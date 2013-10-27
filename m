Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 46CFA6D236
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2013 22:20:34 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id l10so3068758eei.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2013 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NcLtAs0S/MWxphZ2+dPVqUQ6yJecilzoKCTfN6zV5QI=;
	b=eBL0LpgEW/2EjXo/DoaJGuSlWoIe86p+QKdmwD/99X6N2ae8WsxRFRbBp63CZGm1Bh
	u7UycKk1djlYY4A2JItN1Ccr1o2zvybn6WOB9GoZyTs6F7TCTIySBjmH+VTKaoJBQ6HG
	r0bSQHYCshcv/70kY6erVa1CFEKbROTtQZ5pXzJm00Lk3XlTTTw9aJUpDJGjn2SNW4N9
	zAJTvXWz63VxGIQoKNDExSbduE/5m0gYRddK0dYZ/pOFZ24Q95OEVFhEGhZ9ttJN+uUu
	RXXMzo2ECesKSZk1UVFxFErkM3gl3t3yzRMJTIwBEI7LZI4EBAieOtviAO3Rg2Ixow90
	8o6A==
X-Received: by 10.15.61.66 with SMTP id h42mr715625eex.62.1382912435587;
	Sun, 27 Oct 2013 15:20:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h45sm49259521eeg.5.2013.10.27.15.20.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2013 15:20:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Oct 2013 23:20:44 +0100
Message-Id: <1382912444-6072-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-systemd][PATCH] dropbear: Rename bbappend to match new version from oe-core
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
X-List-Received-Date: Sun, 27 Oct 2013 22:20:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dropbear/{dropbear_2013.58.bbappend => dropbear_2013.60.bbappend}   | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-core/dropbear/{dropbear_2013.58.bbappend => dropbear_2013.60.bbappend} (95%)

diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.58.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.60.bbappend
similarity index 95%
rename from meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.58.bbappend
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.60.bbappend
index edaa66e..fc18ea8 100644
--- a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.58.bbappend
+++ b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.60.bbappend
@@ -1,7 +1,5 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 4}"
-
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.8.4


