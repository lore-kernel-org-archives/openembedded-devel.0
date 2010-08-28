Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxl-0001r3-SF
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:20 +0200
Received: by pzk2 with SMTP id 2so1637529pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=thtxoNPrv+cmag9L1gbYO3bSu0v+k5gmZN+iYI2v+XE=;
	b=BhZdwv9zWZn8pubH1/sGJ4diRdAfHcboyeVlr09/bLD3hJqB/xCuhE92PYI2RkdyuV
	kypnB9LN1DNTCkssh4/JUELvXFsqTmgtrwXJIrRSFP4mh4jObiWWED2E5XQ/n5jrX9gc
	g2ektpDRgRrRtlu0I2NF2NMkJto90va7ZEZcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KsUOnenI8qhsZHqD94+GHtuBfCoY1b11zhbAl3jmCbfU0k79MyS0f5oF9SSYVe4VSO
	QGJBNtyZww8elmhIRcRjbpdRO3lq9tmCdYq+c8ap/Lh5TA2l31Q3d+c8/aYVHRv8O0hF
	xT8vcxiTeIs+oaYxQtGwuCI5oYVR4A/yWEJk8=
Received: by 10.142.144.16 with SMTP id r16mr2778753wfd.91.1283027087159;
	Sat, 28 Aug 2010 13:24:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:13 -0700
Message-Id: <1283027073-12308-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/23] angstrom-bootmanager.bb: recipes it depends upon do not exist
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/angstrom/angstrom-bootmanager.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom/angstrom-bootmanager.bb
index 6cae115..ea8eaa0 100644
--- a/recipes/angstrom/angstrom-bootmanager.bb
+++ b/recipes/angstrom/angstrom-bootmanager.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "A graphical Boot Manager for the Ångström Linux Distribution"
 AUTHOR = "Michael 'Mickey' Lauer <mickey@Vanille.de>"
 SECTION = "base"
-DEPENDS = "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
+# These depends are not available.
+#DEPENDS = "ecore esmart-fb imlib2-fb edje efl++-fb"
 #RDEPENDS_${PN} = "libefl++0"
 
 ALLOW_EMPTY = "1"
-- 
1.7.1



