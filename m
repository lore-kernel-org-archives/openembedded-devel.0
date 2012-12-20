Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TlbFw-0006k1-Fy
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 09:13:28 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so1757720wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 23:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=SWLBYoJx1SubtwFInsNcFVuivG6AS30CLYfPnpjuGYg=;
	b=bxbN5G92BszILUsLD7TRcHHoMuX3byg/GORXg7Nu7oYaJsZSD6jYwzryoMNE3qWF9z
	uY4PADJInoTcGqpx5xvbB81jd+OwtdUhexYIXV3CWqlqzHf1TvzScl/LguNS9sIpvmdK
	pWyaV7NBd1kdwBfxq768YQ7C6vFQzHTaCLjIUWojvgha0IcYnad9gQLZ0oBCfdNpq9ik
	IPDdWeTsp3Vtp1bXC9fEbeMaeYvWLEoPInPdGeqUHMSS806NkjMSNSCfe/7s4Js3jkFE
	CcRJ39bKhtO7yXAiqAuxYaE4QXOHLB8TAwdRszweJ/VEVf8dWZITL9U86RwNmuvTH00q
	CHrQ==
X-Received: by 10.194.77.13 with SMTP id o13mr15666535wjw.58.1355990324302;
	Wed, 19 Dec 2012 23:58:44 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id fv2sm24068212wib.4.2012.12.19.23.58.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 23:58:43 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:58:23 +0500
Message-Id: <1355990303-15866-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] samba: disable avahi and build without acl
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
X-List-Received-Date: Thu, 20 Dec 2012 08:13:28 -0000

disable avahi and acl to avoid some random build failures. We do not want
samba to auto-detect the presence of avahi and/or acl, explicitly disabling
or enabling them guarantees a more predictable build process

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc      |    2 ++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 416334a..a86c8be 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -34,6 +34,8 @@ EXTRA_OECONF='--disable-cups \
               --with-swatdir=${datadir}/swat \
               --with-aio-support \
               --without-libtalloc \
+              --without-acl-support \
+              --disable-avahi \
               samba_cv_struct_timespec=yes \
               libreplace_cv_HAVE_MMAP=${SAMBAMMAP}'
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 5722cb6..fc039b1 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.9.5



