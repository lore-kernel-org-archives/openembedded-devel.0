Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62B42710C7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIeJg029620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:31 -0700
Message-ID: <2016151778c10b65ff66b9b885b647bed934d640.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] apache2: add perl to RDEPENDS_apache2
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:39 -0000
Content-Type: text/plain

Perl:
apache2/usr/bin/dbmmanage:#!/usr/bin/perl
apache2/usr/bin/apxs:#!/usr/bin/perl -w

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index 0356029..5989a05 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -149,4 +149,4 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
 
 FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
-RDEPENDS_${PN} += "openssl libgcc"
+RDEPENDS_${PN} += "openssl libgcc perl"
-- 
1.7.9.5


