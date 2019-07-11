Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15B0C7EEAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 14:10:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6BE9sQX032414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:10:14 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Jul 2019 07:10:01 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 203B4AA3488;
	Thu, 11 Jul 2019 07:10:00 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 07:10:00 -0700
Message-ID: <20190711141000.3115-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libbtyesize: Add depends for gettext-native
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
X-List-Received-Date: Thu, 11 Jul 2019 14:10:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If the local.conf has set 'USE_NLS = "no"' the build of libbytesize
will fail with the following message:

| configure: error: in `/build/tmp/work/core2-64-poky-linux/libbytesize/1.4-r0/build':
| configure: error: gettext not found
| See `config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /build/tmp/work/core2-64-poky-linux/libbytesize/1.4-r0/build/config.log
| ERROR: configure failed

The issue is that libbtyesize needs to full version of gettext in
order to configure properly, and not the minimal version which is
provided by default when building with 'USE_NLS = "no"'.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
index 863ce428f..cd67ab1b2 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
@@ -19,6 +19,7 @@ DEPENDS += " \
     libpcre \
     gmp \
     mpfr \
+    gettext-native \
 "
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
-- 
2.21.0


