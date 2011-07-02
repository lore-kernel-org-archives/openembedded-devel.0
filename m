Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QczFO-0005lr-6X
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:24:30 +0200
Received: by fxh10 with SMTP id 10so4287077fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=v7q0RyrzMjIdxYfPnHHu2u6+G4AqUP7mfKTTG3J70os=;
	b=YIcaAVrKJUou6WUICnHYfWqcr8i0jWzUCbF5zVPspl+wfmWjLe5fbJKtwN9iuG4f7P
	+eY6+8KNf9UKv27kbdGG9Oip7yqHlY7czzaSztWWxfFmRrTz8H9GHgXEwKiLKFDIBvsc
	myPU/vL0RfjFLsflQhvGGbeeRaZF1XXc3aYx4=
Received: by 10.223.5.17 with SMTP id 17mr2161864fat.25.1309609236759;
	Sat, 02 Jul 2011 05:20:36 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id q14sm3044658faa.27.2011.07.02.05.20.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:20:36 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:20:52 +0200
Message-Id: <06120dde2158fdb5902066f18c2c1b817172094a.1309608953.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCH 2/4] sqlalchemy: Add initial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:24:30 -0000

* Backends have to be installed separately depending on which are needed. See
  http://www.sqlalchemy.org/docs/core/engines.html for possible backends.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../python/python-sqlalchemy_0.7.1.bb              |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
new file mode 100644
index 0000000..ffcb024
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"         
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88f48967a8bd1fe88f5425f7e659dbf"
+SRCNAME = "SQLAlchemy"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "76e2e1e48b8047f1ca7023f143374aef"
+SRC_URI[sha256sum] = "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10f721cfae4a735d05a"
-- 
1.7.3.4



