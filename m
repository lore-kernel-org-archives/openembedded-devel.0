Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6C674E23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:57:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7vAL0010082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:57:10 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:57:09 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:51 +0800
Message-ID: <1527234893-8733-11-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 10/12] autofs: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 25 May 2018 07:57:08 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
index 68c64fd..e279995 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb
@@ -31,6 +31,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
 SRC_URI[md5sum] = "28cf88f99eff553a8500659ba5d45a76"
 SRC_URI[sha256sum] = "0d57e4138c2ec8058ca92164d035546f68ce4af93acb893369993d67c7056a10"
 
+UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
+
 INITSCRIPT_NAME = "autofs"
 INITSCRIPT_PARAMS = "defaults"
 
-- 
2.7.4


