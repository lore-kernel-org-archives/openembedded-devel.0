Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQlVa-0001yC-07
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 23:27:47 +0200
Received: by mail-ea0-f170.google.com with SMTP id a15so1398186eae.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KhLVU+0jvlfWZWYYnhQwb3s1+OBWHjpsdjAXA4flDnk=;
	b=PDCY74XHggr7/DUFX51SjGawe4tIhOVF16kzazYfv27gW85xsMnKyp0GPvf2tKfPVi
	3q0BVLk74vEceKeu1/gSfKFLZa4xyh/iclOZuAH9xFgyaSkRfdztpomOJ+wyw1YTBgM4
	8Er8id1vkwaqPp8Rkkm5IfeMyo5mzoMkgi3NNqQBiIX9RPPSFdqy7Fn67B3KEl+iSkSI
	dKsWLg7D1TIq87zvHXlGBGzh1hsx2+A3daocvo3ZsCPqzRAZbmTMwlosZFV24Ss7lFfI
	mSQztTWByK7TUZXGDymGhv0yVnPfAqNd5nNoQuyz1ttFEWqhE521oE1iF1arC7ESKqTu
	xQqA==
X-Received: by 10.15.21.1 with SMTP id c1mr31786536eeu.36.1365801021333;
	Fri, 12 Apr 2013 14:10:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm13158594eem.9.2013.04.12.14.10.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 14:10:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 22:50:12 +0200
Message-Id: <1365799812-5676-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][meta-gpe][PATCH 4/4] libgpewidget: fix warning about overwritting keys
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
X-List-Received-Date: Fri, 12 Apr 2013 21:27:55 -0000

* drop FILES_${PN}-bin completely, use bindir+sbindir from bitbake.conf
* WARNING: Variable key FILES_${PN}-bin (${bindir}/* ${sbindir}/*) replaces original key FILES_libgpewidget-bin (${bindir}/*).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index e30b1ab..8e504c1 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender" 
-PR = "r4"
+PR = "r5"
 
 inherit gpe pkgconfig autotools gtk-doc
 
@@ -20,6 +20,4 @@ GPE_TARBALL_SUFFIX = "bz2"
 EXTRA_OECONF = "--enable-cairo"
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-PACKAGES =+ "libgpewidget-bin"
-FILES_libgpewidget-bin = "${bindir}/*"
-
+PACKAGES =+ "${PN}-bin"
-- 
1.8.1.5



