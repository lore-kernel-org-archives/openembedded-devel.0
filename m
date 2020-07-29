Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2482.1596015338989630409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06T9Zbve023700
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 02:35:37 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 29 Jul
 2020 02:35:37 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.10.15 -> 4.10.17
Date: Wed, 29 Jul 2020 17:35:13 +0800
Message-ID: <20200729093513.6782-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729093513.6782-1-yi.zhao@windriver.com>
References: <20200729093513.6782-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

This is a security release in order to address the following defects:

CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD
                DC LDAP Server with ASQ, VLV and paged_results.
CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
                excessive CPU
CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
                paged_results and VLV.
CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.15.bb => samba_4.10.17.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.15.bb => samba_4.10.17.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
index 01250cb43..6b1e5a042 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
@@ -36,8 +36,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
-SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
+SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
+SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

