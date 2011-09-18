Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYS-0003rN-Cl
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:01 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rPOib7axMZQOdxyE8bCxJE55NSWsrunbdLU4PaEwlls=;
	b=B8yVKVwPDq9Qllag2Et8AwNt9U9xx0Du+akpoCx0FCG/yKTQM7xrn2ITo4JuKh0yjw
	tMx/JRvecXV9pR+vYl8tS+BWByhZoC4HdfGdgxe3W7GPdSXj3824NoQqtw0OLxgzfwFD
	V0/bWjYVx6Y09Sctrwqi4ZNFvdqZqR42n8I1o=
Received: by 10.223.37.81 with SMTP id w17mr3001220fad.91.1316345026891;
	Sun, 18 Sep 2011 04:23:46 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:45 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:13 +0400
Message-Id: <1316344999-26642-12-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 11/17] qmake.bbclass: adapt for {moc, uic} -> {moc, uic}2 change
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:07 -0000

qt2 tools have suffix 2, adapt qt2 class to use them.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 classes/qmake.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/qmake.bbclass b/classes/qmake.bbclass
index 40fc739..3516664 100644
--- a/classes/qmake.bbclass
+++ b/classes/qmake.bbclass
@@ -3,8 +3,8 @@ inherit qmake_base
 DEPENDS_prepend = "qmake-native "
 
 export QMAKESPEC
-export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic"
-export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc"
+export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic2"
+export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc2"
 export OE_QMAKE_QMAKE="${STAGING_BINDIR_NATIVE}/qmake"
 export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti ${CXXFLAGS}"
 export OE_QMAKE_LINK="${CCLD}"
-- 
1.7.2.5



