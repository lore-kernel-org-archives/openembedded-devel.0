Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyI0-0003Gk-N0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:21 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2422155eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xABqe8IRpr4Y5e5l7Xy1B3K/i61BHKG8eLL1FnZ91cE=;
	b=F46N8HAQ2F6utNB+/t76p1Q7U+QmGFLd9KUobqO9+6VT7DBSuV949xaSgpiYvpM0ij
	ciSp5Ij+QMEQwWxl0Qsd0fk+AHLpRF2SLPQMdFJ5ZCw/4gKmpZdK58Oc4jSfuLQ150Rm
	gbqZ9jMzhrZFRUOiSowoyEzFO/XswEf2DTezg10f3YRZLRcgqWRZP0YKg8PSffvNfQY9
	VwNGa0jH1lc+Y2co5GmCv1j8JKVAzYbMNsaE490+u8o6KS1FB5xItgIFcTkp4HrrkuCV
	F3kXb0ovWFaxfYcvxQJ9GjEkCx4gYkl3AhKAHYN3lDo8oTRKkg1X6hCjQ+KLiuqVNLuO
	Knrg==
Received: by 10.14.221.5 with SMTP id q5mr51204032eep.33.1354648920126;
	Tue, 04 Dec 2012 11:22:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm4279818eep.15.2012.12.04.11.21.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:21:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:31 +0100
Message-Id: <231f200fa0d3bd1a41c800fd19293093b4e74877.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 62/64] enjoy: depend on edbus2
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
X-List-Received-Date: Tue, 04 Dec 2012 19:36:21 -0000

* ported to edbus2 in r80102

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index cfeb001..8dff593 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary emotion lightmediascanner"
+DEPENDS = "evas ecore edje elementary emotion lightmediascanner edbus2"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
 
-- 
1.8.0



