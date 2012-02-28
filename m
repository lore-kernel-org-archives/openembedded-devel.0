Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2NxX-0001cG-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:23:19 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.102.1 as permitted sender) client-ip=10.213.102.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.102.1 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.102.1])
	by 10.213.102.1 with SMTP id e1mr5749986ebo.20.1330438494367 (num_hops
	= 1); Tue, 28 Feb 2012 06:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+kAUkKf6lK52aEndUWmiINHKoz10xaoFW+8Q00eFJLY=;
	b=ZNefbCQ4z3cLs7Y0E+DfmznP6is0SjhwiRCJNa5qVP2h3PmBkATdI5+Ay1d+lhko5C
	fBtScUoJSB9muYvp4cnzGdAJedeEDE7qQmCi7G8AgSty+/aIdsmdeN8QWEukIyJPZMfZ
	kPDo4ZZcXdB7cWr1J8RrN8EX3iXDzJvfUADNc=
Received: by 10.213.102.1 with SMTP id e1mr4279973ebo.20.1330438494168;
	Tue, 28 Feb 2012 06:14:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm70776240eea.5.2012.02.28.06.14.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:14:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:32 +0100
Message-Id: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 01/14] python-elementary: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:23:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-elementary_svn.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index 102ca07..daaf119 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
-- 
1.7.8.5



