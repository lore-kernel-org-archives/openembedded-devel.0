Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1AD7D8CE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 02:38:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3S2biHH002560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 19:38:00 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sat, 27 Apr 2019 19:37:40 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <wenlin.kang@windriver.com>, <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Apr 2019 10:37:38 +0800
Message-ID: <1556419058-22465-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-networking][PATCH] samba: add PACKAGECONFIG for libunwind
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
X-List-Received-Date: Sun, 28 Apr 2019 02:38:10 -0000
Content-Type: text/plain

From: Wenlin Kang <wenlin.kang@windriver.com>

Add libunwind switch, this makes it have a chance to compile
codes which are conditioned by "HAVE_LIBUNWIND_H"

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index e86ed96..c654aaf 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
 PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
 PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
+PACKAGECONFIG[libunwind] = ", , libunwind"
 
 # Building the AD (Active Directory) DC (Domain Controller) requires GnuTLS,
 # And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 according to:
-- 
2.7.4


