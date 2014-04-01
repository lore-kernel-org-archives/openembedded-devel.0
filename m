Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 061A26F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:32 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id r20so5603088wiv.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cjDiKEaKo1TkX0xIk6hj5FHpBkS1q9rmjRcE+Cq7BDo=;
	b=Bf7FDqOFDucMHm+raPfc8weP3y92p7OBUP4LnMDrJYJkRsb52mxQMeTEGdbr+Ra2Nx
	zy/KD8iZhrg7kJjQIFQzMYphxHQf6RNfBlT16enAI48YgszdWLQIRRMhZmEuZmBgSk7e
	7Y0JmgvNlQo8VUfWzkBVp/1B5Qvly8PsD2cV3c0ribgBvXEED3MPwyw06ZKVtgtFk3aM
	G1hmo6HCkHg8fcDi9f7Am2et4NjBZ9psFJTZoylAHTRjbZzD1zQMs2RfbcSbAOkJgIhc
	fsJnsbgVqikxGIEVM10hyUtZyYmtFlPGXfQgCQw9YgWPJeE1SrBi9jCx4ppzAoeH5N/0
	n9TQ==
X-Received: by 10.180.106.168 with SMTP id gv8mr21686334wib.19.1396372473323; 
	Tue, 01 Apr 2014 10:14:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm41854132eei.24.2014.04.01.10.14.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:25 +0200
Message-Id: <1396372434-10710-17-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 17/46] wvstreams: fix QA warning
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:33 -0000

* fixes
  wvstreams-4.6.1: wvstreams: Files/directories were installed but not shipped
  /usr/lib/valgrind
  /usr/lib/valgrind/wvstreams.supp

* the valgrind support is disabled in EXTRA_OECONF, so just move unpackaged file to package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 90d64a8..00df2b8 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -28,6 +28,7 @@ PACKAGES_prepend = "libuniconf libuniconf-dbg "
 PACKAGES_prepend = "uniconfd uniconfd-dbg "
 PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
 PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "
+PACKAGES_prepend = "${PN}-valgrind "
 
 FILES_libuniconf     = "${libdir}/libuniconf.so.*"
 FILES_libuniconf-dbg = "${libdir}/.debug/libuniconf.so.*"
@@ -40,3 +41,5 @@ FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
 
 FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
 FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
+
+FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
-- 
1.9.1


