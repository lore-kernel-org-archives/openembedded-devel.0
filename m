Return-Path: <fenixk19@mail.ru>
Received: from fallback6.mail.ru (fallback6.mail.ru [94.100.181.147])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8E160169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:33:04 +0000 (UTC)
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [94.100.177.107])
	by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id 57B026842CD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:47:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=YzMCSMS0cyI47QD2E5IM0pTJpL9zjWjWtu6/joLxLps=; 
	b=mHmf8M/3XpdtHmRvKaX/iJl6LirnEA3fib/sCZiDyOsqQdPH0C3feJ2D6/JYqkvrQc5jbcSTfm5MPwjh0t08vQSHHbygjYwfMZoWDRTxhfhf4WMzsWQ9g3Fz940zvXUuxPRmRAF/AAv9/3hDKJJNA/Auo4MNCdjisX88p/pU1dI=;
Received: from [37.204.187.134] (port=35721 helo=localhost.localdomain)
	by smtp47.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1YJOe2-0002gI-5x; Thu, 05 Feb 2015 18:47:06 +0300
From: "A. Varnin" <fenixk19@mail.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Feb 2015 18:46:45 +0300
Message-Id: <1423151205-8219-2-git-send-email-fenixk19@mail.ru>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423151205-8219-1-git-send-email-fenixk19@mail.ru>
References: <1423151205-8219-1-git-send-email-fenixk19@mail.ru>
X-Spam: Not detected
X-Mras: Ok
Subject: [meta-oe][PATCH 2/2] freetds: add new recipe
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
X-List-Received-Date: Thu, 05 Feb 2015 17:33:11 -0000

From: Alexander Varnin <fenixk19@mail.ru>

FreeTDS is a set of libraries for Unix and Linux that allows your programs
to natively talk to Microsoft SQL Server and Sybase databases.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 meta-oe/recipes-extended/freetds/freetds_0.92.79.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/freetds/freetds_0.92.79.bb

diff --git a/meta-oe/recipes-extended/freetds/freetds_0.92.79.bb b/meta-oe/recipes-extended/freetds/freetds_0.92.79.bb
new file mode 100644
index 0000000..c7946d1
--- /dev/null
+++ b/meta-oe/recipes-extended/freetds/freetds_0.92.79.bb
@@ -0,0 +1,14 @@
+SUMMARY = "FreeTDS is a set of libraries for Unix and Linux that allows your programs to natively talk to Microsoft SQL Server and Sybase databases."
+HOMEPAGE = "http://www.freetds.org"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
+                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRC_URI = "ftp://ftp.freetds.org/pub/freetds/stable/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "b97e9bdd3f461af3e8ea559404582f70"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
-- 
1.9.1


