Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 24F0A6D433
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:40:23 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so4685505wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=THI67FsHbQ8pQpaQ0DIDCRXV4uJS0DVxsYNwqFmQNcc=;
	b=J/TEWBdE7Pk7jh5HSkq5n4msWhNi6eP/qb0xkOA9UbvhyoofkLWYRByQ+DQCwjEL2Z
	okYinpQvnJiDXhVZyIraLki8nkfhsd5331+N917aeoRj8gaGviVFteZDCBatJAP4mKpz
	V3vVwfjTb301RiF6mWhIlx2TerrptI3llwa3NsuNbdVHlH6oy7YvOgrSNDOYe3Jui/QL
	kVMA/WmEPKmuHpL/r2D9sIvDPSbR5sdO+yPoBm9Z/zwGox9RIMytMIEGsyTIi5M66SoV
	UrlTn8FTWAoFSgxH3r2PL+kPBc2EgZP2EMXnUz5LjEMw3oIYxat4Oh0Q+lHNj8NsXbkW
	xe2A==
X-Gm-Message-State: ALoCoQkpuHPavz0Kdf5lovfG/h9V5Vt97QC8ZUV2+wOSNJ/ajrwRPk5eoXQH9zFCkKCX/hLQhzen
X-Received: by 10.180.12.67 with SMTP id w3mr17497257wib.0.1384789225346;
	Mon, 18 Nov 2013 07:40:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y11sm25195232wie.7.2013.11.18.07.40.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:40:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 15:40:20 +0000
Message-Id: <1384789220-8422-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH][V2] python-numpy: add native support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 15:40:24 -0000

The compile hack to use a correct config.h isn't needed for native builds, so
mark it as target-specific.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index e6d328f..04cb2f1 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -40,7 +40,7 @@ inherit distutils
 
 # Make the build fail and replace *config.h with proper one
 # This is a ugly, ugly hack - Koen
-do_compile_prepend() {
+do_compile_prepend_class-target() {
     BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
     ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
     true
@@ -72,3 +72,7 @@ RDEPENDS_${PN} = "python-unittest \
                   python-subprocess \
                   python-compression \
 "
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


