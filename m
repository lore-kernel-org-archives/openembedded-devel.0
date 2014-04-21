Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA94365D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:25:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6P618024880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:25:06 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 20 Apr 2014 23:25:05 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 14:24:51 +0800
Message-ID: <1398061492-31615-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
References: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/4] quagga: fix QA warning
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
X-List-Received-Date: Mon, 21 Apr 2014 06:25:05 -0000
Content-Type: text/plain

When build quagga, it shows QA warnings:

WARNING: QA Issue: ELF binary '/home/build/poky/build/tmp/work/i586-poky-linux/quagga/0.99.21-r2.0/packages-split/quagga-bgpd/usr/sbin/bgpd' has relocations in .text
WARNING: QA Issue: ELF binary '/home/build/poky/build/tmp/work/i586-poky-linux/quagga/0.99.21-r2.0/packages-split/quagga-ripngd/usr/sbin/ripngd' has relocations in .text

The configure script tests compiler whether support option '-fPIE'. If
support, it pass option '-fPIE' to compiler then cause these QA
warnings.

Disable configure script to check option '-fPIC'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 5e85e55..2031087 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -62,6 +62,7 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --enable-logfile-mask=0640 \
                 --enable-rtadv \
                 --enable-linux24-tcp-md5 \
+                ap_cv_cc_pie=no \
                 ${SNMP_CONF}"
 
 do_install () {
-- 
1.8.4


