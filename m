Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Eyc-0000Vt-SG
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:43 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1699154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UvlnuaO0wTjS6dxr1k2TCOz/oS5XN7R2jlQNcxq/Mgs=;
	b=oB6cEpQGEZGnZP6qmPjvCy9MxK5bjMNAK616C2RQZ3zExC+vR9YGhfYAYEFAX0iXFo
	bqOUfBZhmLw+fpvJRMQ3AB4+o6hiOI2ELyBmZ0fFzkfO5vJrWwa9FiZZPpJ19mwkMYr7
	EDC21wHBzn8SGt/BQ2ilQYGr7g6EA9GAoVqrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cY/g4lcTy+mp5wx7+G6izajUq9nztRPbJdbOwyJq/rp0kQx589kFas8e5Sd4Ttbora
	f8FZwV6qZU5qahCsIlMLwlNoqhJ/A6aLQ/+eaph6BJuSiyzkc80dA1jYvS19a0C6MZ4p
	8IfRTiceVujCjW7F+TXjCN48KyZJaQ5wvotyQ=
Received: by 10.204.32.9 with SMTP id a9mr2202304bkd.182.1301566665015;
	Thu, 31 Mar 2011 03:17:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x6sm632991bkv.12.2011.03.31.03.17.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:37 +0200
Message-Id: <339dd6174dfa66f4c5c7b0f13ac7ed6ccc6af1ed.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] epdf: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 80adfb5..1f37629 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -1,5 +1,9 @@
 DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
-LICENSE = "MIT BSD"
+LICENSE = "GPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
+"
+
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r4"
-- 
1.7.4.1



