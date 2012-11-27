Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6a-0005cR-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=efHQcqQS7ThPIRpgWJ9Ir/ROGYZYZU7TZSpmrsdOBeY=;
	b=HXSx5RL9k/df6iq9e6S3UETKEDRouISgGfS/jXfj5tSEtei2abdnpVPlhZImizJdGS
	CWo5jA3mEmKkYo4aEaxdRx/1HIZeztbUeunL4rQfZnr99e0QS5EgVz6Qd4sxv2vGtA/d
	NwJOMrZHVs/0iqicyDb0G5mkILjEzIHmJzfzVbyqzczDDmwvg/Xt6QbB7ey0LXM1BGLo
	yD7FkO7DmGbJFqGUNWfsa80fXqQuPIXuvruekopoTcBvgAOEMt5BIJah2QB4dlpAmWsL
	wbUuLH/oMTPbwWIXkAUA8hhoQ+QcI75RU4JLkmz++KgoaKCcTdJydjeD/SbyRbp0gIcU
	s+Qw==
Received: by 10.14.182.70 with SMTP id n46mr61867652eem.5.1354048557170;
	Tue, 27 Nov 2012 12:35:57 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm42846303eeo.8.2012.11.27.12.35.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:54 +0100
Message-Id: <6553d084dedb54fa58c2bb2e5a725b66b6848bf7.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 17/21] eve: bump SRCREV back to EFL_SRCREV and add edbus2 dependency
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
X-List-Received-Date: Tue, 27 Nov 2012 20:50:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 34cae18..9f4b93b 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -1,11 +1,9 @@
 DESCRIPTION = " Enlightenment Web Browser"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary webkit-efl edbus"
+DEPENDS = "evas ecore edje elementary webkit-efl edbus2"
 PV = "0.3.0.0+svnr${SRCPV}"
-# 78126 and newer depends on edbus2
-# SRCREV = "${EFL_SRCREV}"
-SRCREV = "78125"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-- 
1.8.0



