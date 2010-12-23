Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PVhbx-00013m-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 10:37:25 +0100
Received: by fxm17 with SMTP id 17so6013051fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=944Xt/4xWUA7KMLRVT0+bftkgaPWWbapBkH2SxiI9gY=;
	b=xD9wqPoisKo3h06Jb9hDNTgT7qnqRQGRd8bd6xltHdqWzTjDNbXYiOL4LQTeSl3CHM
	3lBaW1gMias0+vz0LhYPdsYFQ1etGV2610IE++Ob1MJb6oV8VHnl/mGB4VW0CHIV2Nav
	wicSHUpOC0+pyFoYNwTYRSV9t1DsCxQ6gzzT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XqCAQKHWe3TVvGwd99RDUaNX1HbfOiB54g6IArDzzGo4ezRjgD6bjvJMU+Rfcz6dpC
	WpaHdpMfAp0wscOW6LMvM4rCZlAH5/aG8lYPBzSnQ9Pg9U3ApqksJUsA4wbfIl/4Yi6X
	LZzhgEXUk5sqANuRov6RVBfPoQxRMR8GYRakk=
Received: by 10.223.86.65 with SMTP id r1mr792186fal.24.1293097036716;
	Thu, 23 Dec 2010 01:37:16 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id z1sm1952833fau.21.2010.12.23.01.37.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Dec 2010 01:37:15 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PVhbl-00070y-RW; Thu, 23 Dec 2010 10:37:13 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Dec 2010 10:37:11 +0100
Message-Id: <1293097031-26936-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <4D10B09F.2050505@opendreambox.org>
References: <4D10B09F.2050505@opendreambox.org>
Subject: [PATCH] e2fsprogs: fix symlinks and work with dash
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
X-List-Received-Date: Thu, 23 Dec 2010 09:37:25 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/e2fsprogs/e2fsprogs.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index ef9aace..e400c75 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -30,8 +30,8 @@ do_compile_prepend () {
 do_install_append () {
 
     	oe_runmake install-libs DESTDIR=${D}
-	ln -sf ${D}/${base_sbindir}/tune2fs findfs
-	ln -sf ${D}/${base_sbindir}/tune2fs e2label
+	ln -sf tune2fs ${D}${base_sbindir}/findfs
+	ln -sf tune2fs ${D}${base_sbindir}/e2label
 }
 
 do_install_append_pn-e2fsprogs () {
@@ -43,9 +43,10 @@ do_install_append_pn-e2fsprogs () {
 	done
 	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
 	for e in $fsck; do
-		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
-		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
-		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
+		rm ${D}${base_sbindir}/fsck$e;
+		rm ${D}${base_sbindir}/mkfs$e;
+		ln -s e2fsck$e.${PN}$e ${D}${base_sbindir}/fsck$e.${PN}
+		ln -s mke2fs$e.${PN}$e ${D}${base_sbindir}/mkfs$e.${PN}
 	done
 }
 
-- 
1.7.2.3



