Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id ED9416B9D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:10 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so7112526eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=iGvnSn9rjHYM/iKZW2OeffFm0J4DfqxXVpHVLn/1Lf8=;
	b=EN4nEMF6Snw28Qk55Tj9Q+/v8YKXl77h0sOo4gWmqJ/lcseTGG/AOckwVl6FNdl/mL
	Zn6OPj8Aw6xePbkZTB2njga4L6l/TUEexeUZKT5/hg/uRVo+SAu+tf07KRlnqbu2Te7g
	AvBhhpgMqnch2qklwidecmMskjVeA2kZGF0rkmYBO+PdA5sQL4VbZluqLVIX6+A+cEmh
	9/22vh8wWLhXzqbGCuBR/JcXrhp1vsUrcHSLc+9qcKeZxPSimTIMoie/eDL3a9kqQ+zJ
	c+cCKqrWtvFl4xMa1OHCKGVRhkkM1y6HnSuMRGxK+0tpqpWPNPytmUzEIeNTihuRLigt
	6GtQ==
X-Received: by 10.14.246.202 with SMTP id q50mr25814812eer.58.1388834051773;
	Sat, 04 Jan 2014 03:14:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm152667345eek.5.2014.01.04.03.14.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:01 +0100
Message-Id: <9383b3891ce8b643874f1ba08e1d23dc64e97e3e.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 5/9] mime-support: Drop allarch
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:11 -0000

* depends on TUNE_PKGARCH 'file'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index e730102..db481e3 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -10,7 +10,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += " ${libdir}/mime"
-inherit allarch
 
 docdir_append = "/${PN}"
 
-- 
1.8.4.3


