Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2FFE71317
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIdBo026590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:39 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:28 -0700
Message-ID: <4e013dd25884803ea399806a4d9c7adf6eeee208.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] proftpd: add perl to RDEPENDS_proftpd
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:38 -0000
Content-Type: text/plain

Perl:
proftpd/usr/bin/ftpasswd:#!/usr/bin/perl
proftpd/usr/bin/ftpquota:#!/usr/bin/perl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index c154c6d..4d2fcd7 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -68,3 +68,5 @@ USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --
                        --shell /bin/false ${FTPUSER}"
 
 FILES_${PN} += "/home/${FTPUSER}"
+
+RDEPENDS_${PN} += "perl"
-- 
1.7.9.5


