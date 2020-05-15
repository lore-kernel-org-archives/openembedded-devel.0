Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.9538.1589532659638480630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 01:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04F8oxFh028758
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 01:50:59 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 15 May
 2020 01:50:58 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.10.13 -> 4.10.15
Date: Fri, 15 May 2020 16:50:48 +0800
Message-ID: <20200515085048.26381-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515085048.26381-1-yi.zhao@windriver.com>
References: <20200515085048.26381-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

This is a security release in order to address the following defects:

CVE-2020-10700: Use-after-free in Samba AD DC LDAP Server with ASQ
CVE-2020-10704: LDAP Denial of Service (stack overflow) in Samba AD DC

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.13.bb => samba_4.10.15.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.13.bb => samba_4.10.15.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
index 5f227c892..2c74c27fb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.13.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.15.bb
@@ -35,8 +35,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "e7906580bf06dae087e99ef8254f327d"
-SRC_URI[sha256sum] = "49eb6426e97cbf538e416e51ed8535930382512ad2d13d5ffd7f4336aa7faf63"
+SRC_URI[md5sum] = "67e9f6b8c5140475641bf5121c93b3d4"
+SRC_URI[sha256sum] = "0b8b62558b62fbb121015f28f40fae0f07522710b6bef77c508b51bb6914ced9"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

