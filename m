Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f171.google.com (unknown [209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0F929660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:47 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so2024203vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w28fz06Z3W6eTa6x3jxR42dLWbfXdC6zSngV2x0y98o=;
	b=ZWenvt5bzmiKCjTWSZvDsrJZmCE88uEUmdGjMoz9IjuLASzBp7ksLnd8IEAPR5YT/w
	P8+NLKGZnq1caz6yvY7nJPQzUTqHV8PACaHKxLgGwyimcDx8Y6WELLUavUc4aIDYeE8n
	rxcl7kyxpDck3F8X9ZAsGinyzoPFmpC77oPcKlfCv5ivxcBCRhcNEJq6kIl1lz1FC1o9
	dMInXsU9C3cbHyJN+cF7y8hywm6tbLfUoibSvI6cE+J16gTnsePPj3FuN/XarS8UAlLJ
	BZ9lPJ4QEW7fpV7duQyIDylhycJjM+6xrPsAHgEy3Wts7qI6EVe/U64gMJRrpjFVIQ3d
	9AMg==
X-Received: by 10.52.12.36 with SMTP id v4mr1835431vdb.20.1400058228770;
	Wed, 14 May 2014 02:03:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ix8sm2217678vdb.18.2014.05.14.02.03.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:47 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:50 +0200
Message-Id: <1400058231-23201-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 7/8] elmdentica: remove autopoint to fix B!=S build
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
X-List-Received-Date: Wed, 14 May 2014 09:03:48 -0000

* it probably isn't needed anymore

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elmdentica_svn.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 94bcbac..e7b61a5 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -17,7 +17,3 @@ PV = "0.9.9+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 RDEPENDS_${PN} = "${PN}-themes"
-
-do_configure_prepend() {
-    autopoint --force
-}
-- 
1.9.3


