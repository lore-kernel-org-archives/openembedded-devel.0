Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5726271C42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 05:47:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w985lRCc009636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Oct 2018 22:47:27 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 7 Oct 2018 22:47:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 13:57:31 +0800
Message-ID: <1538978251-6432-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20181008044741.37650-1-raj.khem@gmail.com>
References: <20181008044741.37650-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH V2] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 05:47:27 -0000
Content-Type: text/plain

Since `36983fe umip: move to meta-networking' applied,
it was moved to invalid location.

Fix prior partial move to meta-networking

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../umip/files/0001-Add-format-string-to-fprintf-call.patch               | 0
 .../files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch  | 0
 .../recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch      | 0
 .../files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 0
 .../umip/files/add-dependency-to-support-parallel-compilation.patch       | 0
 {meta-oe => meta-networking}/recipes-connectivity/umip/files/mip6d        | 0
 .../recipes-connectivity/umip/files/mip6d.service                         | 0
 meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb               | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/mip6d (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/umip/files/mip6d.service (100%)
 rename meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb (100%)

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch b/meta-networking/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
rename to meta-networking/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-networking/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
rename to meta-networking/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch b/meta-networking/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
rename to meta-networking/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-networking/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
rename to meta-networking/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch b/meta-networking/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
rename to meta-networking/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d b/meta-networking/recipes-connectivity/umip/files/mip6d
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/mip6d
rename to meta-networking/recipes-connectivity/umip/files/mip6d
diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d.service b/meta-networking/recipes-connectivity/umip/files/mip6d.service
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/mip6d.service
rename to meta-networking/recipes-connectivity/umip/files/mip6d.service
diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/umip_1.0.bb
rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
-- 
2.7.4


