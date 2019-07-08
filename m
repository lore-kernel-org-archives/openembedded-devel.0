Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E65D47D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x686fgOJ007279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:42 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:41:41 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:39:00 +0800
Message-ID: <20190708063901.13914-8-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 8/9] keyutils: move recipe and patches from meta-security to meta-oe
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:41 -0000
Content-Type: text/plain

keyutils is originally in https://git.yoctoproject.org/git/meta-security.
Move it to meta-oe since other recipes in OE depend on it.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 .../recipes-security/keyutils/files}/fix_library_install_path.patch       | 0
 .../files}/keyutils-fix-error-report-by-adding-default-message.patch      | 0
 .../keyutils/files}/keyutils-test-fix-output-format.patch                 | 0
 {files => meta-oe/recipes-security/keyutils/files}/run-ptest              | 0
 keyutils_1.6.bb => meta-oe/recipes-security/keyutils/keyutils_1.6.bb      | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {files => meta-oe/recipes-security/keyutils/files}/fix_library_install_path.patch (100%)
 rename {files => meta-oe/recipes-security/keyutils/files}/keyutils-fix-error-report-by-adding-default-message.patch (100%)
 rename {files => meta-oe/recipes-security/keyutils/files}/keyutils-test-fix-output-format.patch (100%)
 rename {files => meta-oe/recipes-security/keyutils/files}/run-ptest (100%)
 rename keyutils_1.6.bb => meta-oe/recipes-security/keyutils/keyutils_1.6.bb (100%)

diff --git a/files/fix_library_install_path.patch b/meta-oe/recipes-security/keyutils/files/fix_library_install_path.patch
similarity index 100%
rename from files/fix_library_install_path.patch
rename to meta-oe/recipes-security/keyutils/files/fix_library_install_path.patch
diff --git a/files/keyutils-fix-error-report-by-adding-default-message.patch b/meta-oe/recipes-security/keyutils/files/keyutils-fix-error-report-by-adding-default-message.patch
similarity index 100%
rename from files/keyutils-fix-error-report-by-adding-default-message.patch
rename to meta-oe/recipes-security/keyutils/files/keyutils-fix-error-report-by-adding-default-message.patch
diff --git a/files/keyutils-test-fix-output-format.patch b/meta-oe/recipes-security/keyutils/files/keyutils-test-fix-output-format.patch
similarity index 100%
rename from files/keyutils-test-fix-output-format.patch
rename to meta-oe/recipes-security/keyutils/files/keyutils-test-fix-output-format.patch
diff --git a/files/run-ptest b/meta-oe/recipes-security/keyutils/files/run-ptest
similarity index 100%
rename from files/run-ptest
rename to meta-oe/recipes-security/keyutils/files/run-ptest
diff --git a/keyutils_1.6.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
similarity index 100%
rename from keyutils_1.6.bb
rename to meta-oe/recipes-security/keyutils/keyutils_1.6.bb
-- 
2.14.4


