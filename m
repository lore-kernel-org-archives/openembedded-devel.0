Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nxe-0001cG-OB
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:23:26 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.31.79 as permitted sender) client-ip=10.213.31.79; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.31.79 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.31.79])
	by 10.213.31.79 with SMTP id x15mr5596472ebc.100.1330438501471
	(num_hops = 1); Tue, 28 Feb 2012 06:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+vUvaT/pR5USWU94AsC5ecxOo9aqD7BQanEbadiZAWg=;
	b=KFZAWF0OF2X1TO7ieEfTzQdS3aXfOyCSAz/2gvtda3H7yQG1Kihq6qAnVj1IiIUQ4F
	2I93mkK8ZURuAu8mwy/w8qJ4NHaC5C5ng9nKW6IHWAu3sF08w425LLHIm4xUUuuCTXlB
	0HTdIv/zK1LrCX2yW/uj9roMa+MqiJQZfHqlY=
Received: by 10.213.31.79 with SMTP id x15mr4188339ebc.100.1330438501396;
	Tue, 28 Feb 2012 06:15:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm70758421eeb.7.2012.02.28.06.15.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:15:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:33 +0100
Message-Id: <3600326167f23f456c4612eddff36ec55eb73726.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 02/14] elfe: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:23:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elfe_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 5a482e4..5206e24 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 require e-module.inc
 
-- 
1.7.8.5



