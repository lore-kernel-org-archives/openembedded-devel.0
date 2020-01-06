Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3788C7C4F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 07:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0067PDR2012976
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jan 2020 23:25:14 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 5 Jan 2020 23:25:13 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 15:25:10 +0800
Message-ID: <20200106072510.25476-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-networking][PATCH] samba: upgrade 4.10.10 -> 4.10.11
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
X-List-Received-Date: Mon, 06 Jan 2020 07:25:13 -0000
Content-Type: text/plain

Security fixes:

CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
                management server (dnsserver).
CVE-2019-14870: DelegationNotAllowed not being enforced in protocol transition
                on Samba AD DC.

See: https://www.samba.org/samba/history/samba-4.10.11.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.10.bb => samba_4.10.11.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.10.bb => samba_4.10.11.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.11.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.11.bb
index 9eaa13415..ffdc15ac4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.11.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "dde27447f39d124efe18f719ccf956dd"
-SRC_URI[sha256sum] = "700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5"
+SRC_URI[md5sum] = "eebd021de840312d7e08959e8a3d0ba1"
+SRC_URI[sha256sum] = "609f4232e04c6eaad0e3b8e00cd837683a960ebb95c1fe3349e968d1d1dff894"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1


