Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Ny7-0001cG-Oo
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:23:55 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.94.133 as permitted sender) client-ip=10.14.94.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.94.133 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.94.133])
	by 10.14.94.133 with SMTP id n5mr11190121eef.104.1330438530717
	(num_hops = 1); Tue, 28 Feb 2012 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=epNVPju0BRiVpB+vLEiIZsacWvZk0kngEc7E4QyRjdE=;
	b=BNS/zhbL88xtwEATysj4ZkaGb0S26k+BWffiKFi/Ldhkr3BEmV8T/xEZGAguZGGMv4
	tctLm1tl5E9x0vF57vefie6wt6SbdGNsGqmjfxKJdHZH2jId+GKe85/FOBxNncm7QyJd
	EUHNgExGZrqe9Joy5iXeMof78XIUnV3pyY0s0=
Received: by 10.14.94.133 with SMTP id n5mr8361549eef.104.1330438530647;
	Tue, 28 Feb 2012 06:15:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm70747777eem.11.2012.02.28.06.15.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:15:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:37 +0100
Message-Id: <c48c85cf7086a1fc9f4966beae4a2b8fc1eb00a8.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 06/14] imlib2: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:23:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index e131bcb..fbab70f 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
 PV = "1.4.2.001+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-- 
1.7.8.5



