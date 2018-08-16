Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECCEE7924C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 03:05:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G35D3V000342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:05:13 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 15 Aug 2018 20:05:11 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Aug 2018 11:05:07 +0800
Message-ID: <1534388707-30331-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534388707-30331-1-git-send-email-yi.zhao@windriver.com>
References: <1534388707-30331-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 2/2] fuse: upgrade 2.9.7 -> 2.9.8
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
X-List-Received-Date: Thu, 16 Aug 2018 03:05:12 -0000
Content-Type: text/plain

Security fixes:

CVE-2018-10906
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-10906

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/fuse/{fuse_2.9.7.bb => fuse_2.9.8.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.7.bb => fuse_2.9.8.bb} (92%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
similarity index 92%
rename from meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
index 2996319..1815aa5 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
@@ -16,10 +16,11 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse.conf \
 "
-SRC_URI[md5sum] = "9bd4ce8184745fd3d000ca2692adacdb"
-SRC_URI[sha256sum] = "832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874"
+SRC_URI[md5sum] = "f365e848a82504edb0b7a33df790ca78"
+SRC_URI[sha256sum] = "5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3"
 
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
+UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
 inherit autotools pkgconfig update-rc.d systemd
 
-- 
2.7.4


