Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6F0E6067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBU8nRM7018283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 00:49:27 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 30 Dec 2015 00:49:26 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Dec 2015 16:49:16 +0800
Message-ID: <d7c3ef26716f1d0570f76ad674611903d1d52718.1451465023.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451465023.git.yi.zhao@windriver.com>
References: <cover.1451465023.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 2/2] libvncserver: fix PN -> BPN for multilib
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
X-List-Received-Date: Wed, 30 Dec 2015 08:49:27 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libvncserver/libvncserver_0.9.10.bb            |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
index 4eea6ff..235b17e 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
@@ -19,6 +19,6 @@ SRC_URI  = "\
 SRC_URI[md5sum] = "e883b6c7bd339a5e1c48645051abe5c4"
 SRC_URI[sha256sum] = "583f28869b82aec57768d7d18cd7ff81bf092ecbbc1209b587c2c2cd68330250"
 
-S = "${WORKDIR}/${PN}-LibVNCServer-${PV}"
+S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
 
 TARGET_LDFLAGS += "-lgcrypt"
-- 
1.7.9.5


