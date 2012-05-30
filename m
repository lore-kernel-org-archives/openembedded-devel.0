Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZjww-0000tr-E8
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 16:32:34 +0200
Received: by werg55 with SMTP id g55so3524313wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jGKHNpeiSNHfDPlDcYOszL4NzPNASgBHbCzhQPcUqe8=;
	b=mAJXVJKKkZ4oEpacrKgZOgSrQtuNszn7CVlxNTiXPtclTyUL5tUVCSwVeXhyvh3Ouu
	2YF7ycRKskNjENPEB4TogXz40U0nRbB13s8o7CbuCFItG9S05VF7qzc+krCX1iHYa0Wd
	tDNibyYmNIzaqplXNT/h3EplA4otUhM01vBZxhR6xiv/DAc3bj2zlb2//3VnkGXiBtzf
	nfuRp1FbmgYkG2Is0OknzZnzSixJESzTJnsaZWE1ithMzJ2LBUNphZTuX/rr071pzsgu
	p85FfZYqSxuG/jHKV8+sonv6xVY18hGmpaqwivk+9MvrCAMW8zgOqTlX+N5FHIsoBO5u
	kYSw==
Received: by 10.216.212.1 with SMTP id x1mr10838606weo.143.1338387735905;
	Wed, 30 May 2012 07:22:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm56869284wid.5.2012.05.30.07.22.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 07:22:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2012 16:21:57 +0200
Message-Id: <2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1338386047.git.Martin.Jansa@gmail.com>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1338386047.git.Martin.Jansa@gmail.com>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/3] systemd.bbclass: fix postinst/rdepends generation for recipes with SYSTEMD_SERVICE (without _PN suffix)
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
X-List-Received-Date: Wed, 30 May 2012 14:32:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/systemd.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index db35717..e895021 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -201,7 +201,8 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+			if systemd_services and systemd_services.strip():
 				systemd_generate_package_scripts(pkg_systemd)
 				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
-- 
1.7.8.6



