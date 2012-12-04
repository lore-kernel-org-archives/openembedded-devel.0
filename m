Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi32-0001w5-FX
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Z9/u3YjI8B0LvgiA9KnBn0w+qMTm2TecLYpo5ijqzgQ=;
	b=NDCwvs5hvsN7TpEBuFGgZCbAcfPpF6hY4mQo/fSRT8b/C7TEkdPERxSd91H588Iw+H
	SZ++hhXNcEKZGaLfqJ+6rmD+OoecZlIdgz+9m98qXaxBtgGdjUTgCFiiGdv3vyQbUES+
	oZRkfaWS0TNf5v2irSi7XoEbaYprYLqFFLGRbik+j6mZlD1B3ZMU7zPtduIfe9uNo9vP
	pBiNlYfztxGrCcS9eT/imm+TUorT7A/ZyY5dP0DLDaUgG4iAps42vZbG8qbnwZybeq5A
	GesUULhxm4k0BgkQ7WnbB6xnAeZuCBUWncevQSizGRqTZFZnzTu+gRgTyS4vXqc+zQvo
	MfUA==
Received: by 10.14.194.4 with SMTP id l4mr42720865een.42.1354586486531;
	Mon, 03 Dec 2012 18:01:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34794316eed.10.2012.12.03.18.01.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:46 +0100
Message-Id: <5865d50996950dee44bcd656e14f37d04d05d033.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/58] libgtkstylus: add SRC_URI checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 02:15:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 8567b13..4b5a750 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -9,6 +9,8 @@ inherit autotools
 
 SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \
 	file://gtkstylus.sh"
+SRC_URI[md5sum] = "fa1c82cd9fd2fafd7ff10d78eb5781c5"
+SRC_URI[sha256sum] = "383e0a22a537f653b8d41688277560f95678a042967198085ec7caa1a5cc2f4c"
 
 do_install_append() {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d
-- 
1.8.0



