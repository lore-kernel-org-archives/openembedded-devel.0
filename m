Return-Path: <fenixk19@mail.ru>
Received: from smtp34.i.mail.ru (smtp34.i.mail.ru [94.100.177.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2AF72DE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=YzMCSMS0cyI47QD2E5IM0pTJpL9zjWjWtu6/joLxLps=; 
	b=oxU/Yu6s1/sac1S+sW/EdloNByP0VlM0/yVgYdqjUz9KnqtBDcvQNyvXacjEWXHFgMbxtUCwpG79OsIh7KPzu7OSAM37AYjd1A1thkq6ImOh+qV4cKcHyA1x9bEw2s/Fq7B+0B+MoV/U7EUwFGPPlMz6ol4K2TvfjWX+8ut4yeg=;
Received: from [37.204.187.134] (port=36041 helo=localhost.localdomain)
	by smtp34.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1YJPHK-0004Vf-OQ; Thu, 05 Feb 2015 19:27:47 +0300
From: "A. Varnin" <fenixk19@mail.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Feb 2015 19:27:25 +0300
Message-Id: <1423153645-9754-2-git-send-email-fenixk19@mail.ru>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423153645-9754-1-git-send-email-fenixk19@mail.ru>
References: <1423153645-9754-1-git-send-email-fenixk19@mail.ru>
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
X-List-Received-Date: Thu, 05 Feb 2015 16:27:52 -0000

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


