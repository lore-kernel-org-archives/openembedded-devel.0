Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E98C9745FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:20:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T7Kho5022018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:20:43 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:20:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:49 +0800
Message-ID: <1527578277-26494-17-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 16/24] makedumpfile: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:20:42 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
index d6f2d80..38f9d24 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb
@@ -28,6 +28,9 @@ SRC_URI = "\
 SRC_URI[md5sum] = "72be5bf973eed898c5127e3abc466583"
 SRC_URI[sha256sum] = "ee3d21cb4032a60bd2c802d1d8b21b9f399710e1574f8de8ead5ab50cd821a6d"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/makedumpfile/files/makedumpfile/"
+UPSTREAM_CHECK_REGEX = "makedumpfile/(?P<pver>\d+(\.\d+)+)/"
+
 SECTION = "base"
 
 # If we do not specify TARGET, makedumpfile will build for the host but use the
-- 
2.7.4


