Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f52.google.com (unknown [209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE5C60703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 13:45:45 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fa1so276265pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3q5nysFXCbv7cGSpbGYv+3uj3zo+Z4Zn1J694w2WMcY=;
	b=urALfXCZF3DVYqnA75hXOY6NNs6bfw0bVHFNf5YbdcIarA91CZ8egRDP/O2UNrjHId
	0V41X0TGZIB36MNC+hHYsrIZAufrGfS5QMk9LbxfQdEa8+Cmv1VomoyMr905+EiAiN6m
	ZwImqRQQBOKIqOfj0AbUNhr/icVgZ0l/OgRZuawjb69PeWEVuAnre5B6phyrQsb7DrdG
	37V9nSba009+W9CK9ls6R2s/uiZtygPiiIQZ58Gmjd+EQ0pvaLx7wTySlc6DcIhH1B8e
	TomPfMivfBUa/jASdW2hzhMb5IIMe5BiD04Kp42B0cF2wHUvy46uIt3QEf8tBYQzdmMT
	4XKA==
X-Received: by 10.66.156.34 with SMTP id wb2mr13534377pab.83.1399643146480;
	Fri, 09 May 2014 06:45:46 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id xz7sm8337708pac.3.2014.05.09.06.45.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 06:45:45 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 May 2014 06:46:16 -0700
Message-Id: <1399643176-25796-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-gnome][WIP][PATCH] wv: add libpng dependency
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
X-List-Received-Date: Fri, 09 May 2014 13:45:47 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index ff0ab54..1e385d3 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wvware.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
-DEPENDS = "libgsf glib-2.0"
+DEPENDS = "libgsf glib-2.0 libpng"
 PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
-- 
1.8.3.2


