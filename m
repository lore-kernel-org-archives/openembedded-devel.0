Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f172.google.com (unknown [209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id EB926660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:51 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz11so1990989veb.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z1vvJcEz9KZbcjDuVQO84QwkCknAgkaBgVqOWm8B17w=;
	b=AMMRtWnRHJBwHNIxnOGX1nAUzTF36Dj248Gf5taX7OJbgJZzwe/IrvDxPDIcYG0ee0
	H6Uxn4fTrlFTFhUnOuLsUje5qYZ3irM2UNRcC1AcH8RgD+xvmjoFyRlsPe31FCuuM8gp
	1dGFj9KsX6j8502GUIGCGV/jb2VdzsLVGMga2OGuwHS7nb/sT8Mb/b0mVxcFfM1xMDHT
	ow+73oJ8NLcJlVv3lxn1K6VCTOjwzBKtzTCTmva50v4H5WdhaouKvz0VXwx5b29+a/c6
	b3iNwJiZ2UBktaTW4XSiDqg3y+VfBhw4Q3ecDDGArfwFM2AM3rsVzLOkekP+0coY1osI
	79TA==
X-Received: by 10.52.95.171 with SMTP id dl11mr1778553vdb.36.1400058232280;
	Wed, 14 May 2014 02:03:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q5sm2227782vdc.12.2014.05.14.02.03.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:51 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:51 +0200
Message-Id: <1400058231-23201-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 8/8] exalt-client: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exalt-client_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index b8c204d..a9023a3 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -10,8 +10,8 @@ DEPENDS += "elementary exalt edje-native"
 CFLAGS += " -I${STAGING_INCDIR}/exalt -I${STAGING_INCDIR}/exalt_dbus"
 
 do_configure_prepend() {
-    sed -i -e /po/d configure.ac 
-    sed -i -e s:\ po::g Makefile.am
+    sed -i -e /po/d ${S}/configure.ac 
+    sed -i -e s:\ po::g ${S}/Makefile.am
 }
 
 FILES_${PN} += "${libdir}/enlightenment/modules/*/*.desktop \
-- 
1.9.3


