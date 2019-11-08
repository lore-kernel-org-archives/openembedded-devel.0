Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 069EC7FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 03:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA83Otmw009808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Nov 2019 19:24:55 -0800 (PST)
Received: from localhost (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 7 Nov 2019 19:24:55 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 11:24:49 +0800
Message-ID: <20191108032449.9342-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108032449.9342-1-yi.zhao@windriver.com>
References: <20191108032449.9342-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.158.241]
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.10.8 -> 4.10.10
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
X-List-Received-Date: Fri, 08 Nov 2019 03:24:58 -0000
Content-Type: text/plain

Security fixes:

CVE-2019-10218: Client code can return filenames containing path
                separators.
CVE-2019-14833: Samba AD DC check password script does not receive the
                full password.
CVE-2019-14847: User with "get changes" permission can crash AD DC LDAP
                server via dirsync.

See: https://www.samba.org/samba/history/samba-4.10.10.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.8.bb => samba_4.10.10.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
index d824eacf9..d84c338c9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "f3c722bbcd903479008fa1b529f56365"
-SRC_URI[sha256sum] = "c41f05fb567f7359998b451543501c7690a2bf6551d658a76bd6916316a410f4"
+SRC_URI[md5sum] = "dde27447f39d124efe18f719ccf956dd"
+SRC_URI[sha256sum] = "700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1


