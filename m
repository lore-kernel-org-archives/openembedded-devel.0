Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2NyU-0001cG-VL
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:19 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:15:53 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.40.76 as permitted sender) client-ip=10.14.40.76; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.40.76 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.40.76])
	by 10.14.40.76 with SMTP id e52mr11514373eeb.8.1330438553917 (num_hops
	= 1); Tue, 28 Feb 2012 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OGNICk1FmXKQpMSqS0YwEu8lkoNtO3BOw7WJxVQPZGI=;
	b=R7pwW2FTmhNeR/O3mUQ/2JlJEyiomFrWt6+XBzfI3t8O1DR6OqEO5i0vPEjbCw28Pf
	KIFYNbZVyVa9ayQY/XaNklsuv+ns1gU7jtppFG/zTWXLLD1RZL5NnIWti/YYntQEaRJo
	/Ge8TxI2mQBYFJ6iFV/h9mqP6Juw+LT4fhHtk=
Received: by 10.14.40.76 with SMTP id e52mr8618033eeb.8.1330438553838;
	Tue, 28 Feb 2012 06:15:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm70765854eeb.7.2012.02.28.06.15.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:15:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:40 +0100
Message-Id: <8f64d33138f0f5534d168d89ca587d89f00d049c.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 09/14] navit: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 1aee3c7..6d0b152 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -2,7 +2,7 @@ require navit.inc
 
 SRCREV = "4841"
 PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=http "
-- 
1.7.8.5



