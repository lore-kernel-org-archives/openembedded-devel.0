Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC457714D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxYTK017885; Mon, 22 Feb 2016 11:59:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id px_9i9C6IGS8; Mon, 22 Feb 2016 11:59:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxiKe017940
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Feb 2016 11:59:45 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aXp9U-0003wD-Kz; Mon, 22 Feb 2016 11:59:44 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 11:59:24 +0000
Message-Id: <1456142367-15064-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456142367-15064-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1456142367-15064-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/12] libtdb: Fix build when static libs disabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 11:59:48 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
index 9dc4808..c6a689b 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.7.bb
@@ -20,6 +20,7 @@ EXTRA_OECONF += "--disable-rpath \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
+DISABLE_STATIC = ""
 
 PACKAGES += "tdb-tools python-tdb python-tdb-dbg"
 
-- 
2.5.0


