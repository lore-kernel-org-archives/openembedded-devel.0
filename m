Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5865CC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:29:31 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so4836791wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QKY5xVpBVmHPWpUYHrY3V/T5yJ7obYrvrl4ZpDpZIE4=;
	b=S2iRhgcIX51Gp2pseWTfbHLrBRUeI4Xc012TuJnsd9YW5S6mqPDrR/Lff0fAsNY+7C
	KyDUkFVLxJ36jgqiPTST81DKlFB9FUSzM3Q6q3iiHGx1kPxU1LozwkSpoUZpxGsanXnc
	qnAuEW1TIu75A7bVGDup/0adwFC7zv2+pLOBNGe7e/Dgqt4zh0iuk8VrBg+/OX4dQ9Iq
	iTWk3moCq4MrNAFbqhinK2GUcUuElji5oV4AHfllJ4V+Z8uMVgSBKPnkpJaaQOFZRf1m
	i6FkA8ww/QqBY0p2VllRcSdqkCyIKcYWgDQK18lt87pHTT5WvKFaoSej2Vc1GhVLpVHt
	FajA==
X-Received: by 10.194.62.5 with SMTP id u5mr26690641wjr.46.1405981772923;
	Mon, 21 Jul 2014 15:29:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jv9sm40765441wjc.28.2014.07.21.15.29.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 15:29:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 00:29:45 +0200
Message-Id: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH 1/2] zeroc-ice: blacklist, because it's not compatible with default db-6* version
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
X-List-Received-Date: Mon, 21 Jul 2014 22:29:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
index 79d8b5a..e39aa18 100644
--- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
+++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
@@ -10,6 +10,16 @@ SRC_URI = "http://www.zeroc.com/download/Ice/3.5/Ice-${PV}.tar.gz \
 SRC_URI[md5sum] = "f00c59983cc904bca977133c0a9b3e80"
 SRC_URI[sha256sum] = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b70493af392"
 
+#| MapDb.cpp: In constructor 'Freeze::MapDb::MapDb(const ConnectionIPtr&, const string&, const string&, const string&, const KeyCompareBasePtr&, const std::vector<IceUtil::Handle<Freeze::MapIndexBase> >&, bool)':
+#| MapDb.cpp:138:46: error: call of overloaded 'set_bt_compare(int (*)(DB*, const DBT*, const DBT*))' is ambiguous
+#| MapDb.cpp:138:46: note: candidates are:
+#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note: virtual int Db::set_bt_compare(bt_compare_fcn_type) <near match>
+#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'bt_compare_fcn_type {aka int (*)(__db*, const __db_dbt*, const __db_dbt*, long unsigned int*)}'
+#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*, const Dbt*, const Dbt*, size_t*)) <near match>
+#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka int (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
+#| make[3]: *** [MapDb.o] Error 1
+PNBLACKLIST[zeroc-ice] = "BROKEN: not compatible with default db version"
+
 S = "${WORKDIR}/Ice-${PV}"
 
 inherit python-dir pkgconfig
-- 
2.0.2


