Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5G-0002l7-C3
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:06 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cZW2+OO6qWm3Q+7TI7M8McfU0nVHOkzFKHfir3ZCOR8=;
	b=a1/ED4oiCUieLx/EyfKATbdlH5tULchCag6IjEQ/Zwf4GzW0ikY0eUehgZlk+nCRfe
	3SbkzO4bwNDfxBVC8b0fk4UVCZxS+Ruo1g5BJHkHihfNaduUiuoSGN3F0Il+/dpQh9Yp
	001tQxQ4ZuE6kIt35vwPNFDuJnek1HLHq8rLZIzwFiuFadd/gyEpVQLuU+UZs6kIhk2M
	e6gtdYUMgQsQEfoWf82a2PTOt4qt6t+fusrLiAFDgzZk2yIjuLg0R4SfAKLtxYbdIHgw
	Z2cPijjYdYqcZDnmlEZHVoob8pzHt7JpT+UyAzJfpUTZFZSoMhZvq7FqeYfUla+lrYPu
	aOXg==
Received: by 10.14.194.4 with SMTP id l4mr42741718een.42.1354586626796;
	Mon, 03 Dec 2012 18:03:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm18581368eem.16.2012.12.03.18.03.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:03 +0100
Message-Id: <a790c1080f9f1689a3c95c6cf466e067c91f4ade.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 30/58] edb: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edb_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index 9963563..aade344 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -1,5 +1,8 @@
 DESCRIPTION = "Edb is the Enlightenment database library"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8a7c08df3bc3280208b959be7215c25 \
+                    file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
+
 DEPENDS = "zlib"
 PV = "1.0.5.050+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.8.0



