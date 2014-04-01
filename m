Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5C3E6F9F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:49 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5617584wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ur06KfgIBh2+nWPnU8XChQI1TjyyLqfViQZE8ka5FUw=;
	b=RgR8iiCJhobDBOUJlNMUJKlsJEItGnFNS7iiQZzrE/PVEZtNbsVeVh7CJLdudkLfXS
	XSJFYc1g3bCypcGYjQmE7J9MhLU3q+dm6y1hkvhltFPlD2geoc3b2+6YeorFX85vHCiK
	Bow1fimDmc5lvSNyKtDthdgzxl4rLSzwLm4WnyT8WHjYsZK8/4JaYpD2H8av024Dzbz4
	MPMdm/rWQhYjGQ+tqTJ52TOzUjtuuKdqfngET8HyVCHn/aO9aa7d8d3Mfk2DeuXrO8Ou
	TD850tL6/pcJgFufynGkKg+P8CTtXvKYFCaBtzatM1CX+BwFcdpz+DbZC1+GEOo5yAM3
	y2FQ==
X-Received: by 10.180.205.130 with SMTP id lg2mr21410696wic.59.1396372490015; 
	Tue, 01 Apr 2014 10:14:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm41856657eex.21.2014.04.01.10.14.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:33 +0200
Message-Id: <1396372434-10710-25-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 25/46] libgnome-keyring: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index 667bdf8..43379bd 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
 SECTION = "x11/gnome/libs"
 PR = "r3"
 
-inherit gnome gtk-doc
+inherit gnomebase gtk-doc
 
 DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
 
-- 
1.9.1


