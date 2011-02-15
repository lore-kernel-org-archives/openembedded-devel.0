Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpHRP-00074E-1P
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 10:43:27 +0100
Received: by bwz10 with SMTP id 10so239288bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 01:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=iqmuvO36GO755uhPzeY6XS4Y6tNA+1L9FAxD+qseZBM=;
	b=TRxA6172BHhgnIJbcX6AKB+L3vD+mf9893CTuLbxHMfd739NWsKn5T+fmtfwwsXu9W
	L5ha3JMna0fzY33HHw7AUSNZzcf1+eXA7H/no237WTgDDcnpTSnsBT89EiSonvC3v7xb
	XzDBwugRtVfe4Mef176VO+GMT+8USnnGFQScY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Zihd1ijUjgkotDZC4+AGl/XTih3ekWoQQ0o6g4Cuce3xn9pqAb0JVP0JVua9rK8HRG
	6g7wKNrKytU4dbmx/B8wn/4v17bV/CuINCQVDgrCNp0ipgGB3VKOR4QCF3h25M48dQ0b
	gkNTQTOCibDP6sGzNbWKcNEnZeWDCNyh/LGUM=
Received: by 10.204.1.132 with SMTP id 4mr40475bkf.41.1297762934109;
	Tue, 15 Feb 2011 01:42:14 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm2442002bka.15.2011.02.15.01.42.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 01:42:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Feb 2011 10:42:05 +0100
Message-Id: <1297762925-4503-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <20110215091517.GD8619@localhost.jama.net>
References: <20110215091517.GD8619@localhost.jama.net>
Subject: [PATCH] debian.bbclass: call auto_libname in reverse sorted AUTO_LIBNAME_PKGS
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
X-List-Received-Date: Tue, 15 Feb 2011 09:43:27 -0000

* see comment for reason why we need this
* more info:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/029877.html
---
 classes/debian.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/classes/debian.bbclass b/classes/debian.bbclass
index 1a2c7da..7cdb6d2 100644
--- a/classes/debian.bbclass
+++ b/classes/debian.bbclass
@@ -101,7 +101,13 @@ python debian_package_name_hook () {
 					if newpkg != pkg:
 						bb.data.setVar('PKG_' + pkg, newpkg, d)
 
-	for pkg in (bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split():
+	# reversed sort is needed when some package is substring of another
+	# ie in ncurses we get without reverse sort: 
+	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libtic orig_pkg ncurses-libtic debian_pn None newpkg libtic5
+	# and later
+	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw orig_pkg ncurses-libtic debian_pn None newpkg libticw
+	# so we need to handle ncurses-libticw->libticw5 before ncurses-libtic->libtic5
+	for pkg in sorted((bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or "").split(), reverse=True):
 		auto_libname(packages, pkg)
 }
 
-- 
1.7.4.1



