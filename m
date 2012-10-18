Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwNt-0004j2-J5
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:08:01 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2297338wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ewxcvWDTLcYY8G418RBIe7p2V9bZ3ouvjzCbTtnHyL0=;
	b=By8Fu3EV9qJnvGT+kHxEkBdIpv29fE+4KkTQo5a4MfFkO/8jxiTXhIsGa8aNI4x1lV
	O1waSKE4JD70ZLrceDVUOYpBHCFRt+QeyGU8DuxcsQt3FAwXEzvPAb6tnpNdtk4IM6tX
	Lg/72OasJKbVUBDSfqPCPG3772Mh7OGskFBfSWw44FLvSr2hzPHLo4Uwr90/IRRqdebu
	KdfWFus84n1CQqygawHNqbFykyniFsLWRZriS9+g+TrEQDZxPw7q8N7QcLbq6GoMSJ1A
	Usf4PV2RVWglXOAbYXqYwUGJqok9eDAQjlatJSg/wFjGgokgqMD1GuDcJYUTF9ZtF6vY
	qJuw==
Received: by 10.180.78.40 with SMTP id y8mr13576026wiw.7.1350590081898;
	Thu, 18 Oct 2012 12:54:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm35293194wix.0.2012.10.18.12.54.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:54:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:30 +0200
Message-Id: <c03fda26cfd77ff82fdf8000cd4214c604bc5248.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] mcnavi: remove myslq_config include path work around
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
X-List-Received-Date: Thu, 18 Oct 2012 20:08:01 -0000

* it was fixed in mysql5 3f95bb907381ac5fd789452e1330c12f9a8904f9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
index 35c304c..75958d0 100644
--- a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
+++ b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "acc07debcdb3ef448b95e6a6cfcf53d8"
@@ -12,9 +12,4 @@ SRC_URI[sha256sum] = "d3ce1f5901f13985d877b2b6ad06b64094ba43a4e13cbfe06c7cb2f1ab
 
 S = "${WORKDIR}/${PN}"
 
-do_configure_prepend() {
-  # for some reason our mysql_config returns just sysroot/include_dir while mysql.h is in include_dir/mysql
-  sed -i 's#`mysql_config --include`$#`mysql_config --include`/mysql#g' ${S}/configure.ac
-}
-
 inherit autotools
-- 
1.7.12.4



