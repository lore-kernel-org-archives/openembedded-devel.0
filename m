Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDAD76AC4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 08:37:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U8bh0q014098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 01:37:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 01:37:42 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 16:34:25 +0800
Message-ID: <1414658065-32307-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp: add sntp.service for sntp package
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
X-List-Received-Date: Thu, 30 Oct 2014 08:37:48 -0000
Content-Type: text/plain

This solves the following warning:

lib32-ntp-4.2.6p5: lib32-ntp: Files/directories were installed but not shipped
  /lib/systemd/system/sntp.service [installed-vs-shipped]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-support/ntp/ntp.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index fd45219..6897587 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -128,6 +128,7 @@ FILES_ntpdate = "${sbindir}/ntpdate \
 "
 FILES_sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
+              ${systemd_unitdir}/system/sntp.service \
              "
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
-- 
1.9.1


