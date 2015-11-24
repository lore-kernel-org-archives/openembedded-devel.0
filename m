Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5583160DF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:26:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO9Qi71011085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 01:26:45 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 24 Nov 2015 01:25:40 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Nov 2015 17:25:26 +0800
Message-ID: <49867acc73e0a1f93409245efa3f75a221315d82.1448356894.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448356894.git.yi.zhao@windriver.com>
References: <cover.1448356894.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 3/3] hplip: specify cupsbackenddir and cupsfilterdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Nov 2015 09:26:44 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: hplip: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/cups
  /usr/lib/cups/filter
  /usr/lib/cups/backend
  /usr/lib/cups/filter/hpcac
  /usr/lib/cups/filter/foomatic-rip-hplip
  /usr/lib/cups/filter/pstotiff
  /usr/lib/cups/filter/hpcups
  /usr/lib/cups/filter/hplipjs
  /usr/lib/cups/filter/hpps
  /usr/lib/cups/filter/.debug
  /usr/lib/cups/filter/.debug/hplipjs
  /usr/lib/cups/filter/.debug/hpcups
  /usr/lib/cups/filter/.debug/hpps
  /usr/lib/cups/backend/hp
  /usr/lib/cups/backend/.debug
  /usr/lib/cups/backend/.debug/hp
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
hplip: 17 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index ac1dc7e..86628b1 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -35,6 +35,8 @@ EXTRA_OECONF += "\
         --disable-foomatic-drv-install \
         --enable-foomatic-ppd-install  \
         --enable-foomatic-rip-hplip-install \
+        --with-cupsbackenddir=${libdir}/cups/backend \
+        --with-cupsfilterdir=${libdir}/cups/filter \
 "
 
 PACKAGES += "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
-- 
1.7.9.5


