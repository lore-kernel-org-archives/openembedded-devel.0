Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63B547F094
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 21:48:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6BLmb5R003636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 14:48:37 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Jul 2019 14:48:36 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 8A4D0AA3489;
	Thu, 11 Jul 2019 14:48:36 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 14:48:36 -0700
Message-ID: <20190711214836.123757-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libbytesize: Add depends for gettext-native
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
X-List-Received-Date: Thu, 11 Jul 2019 21:48:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If the local.conf has set 'USE_NLS = "no"' the build of libbytesize
will fail with the following message:

| configure: error: in `/build/tmp/work/core2-64-poky-linux/libbytesize/2.0-r0/build':
| configure: error: gettext not found
| See `config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /build/tmp/work/core2-64-poky-linux/libbytesize/2.0-r0/build/config.log
| ERROR: configure failed

The issue is that libbytesize needs to full version of gettext in
order to configure properly, and not the minimal version which is
provided by default when building with 'USE_NLS = "no"'.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
index 1beb6777e..74f1800d1 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
@@ -20,6 +20,7 @@ DEPENDS += " \
     libpcre2 \
     gmp \
     mpfr \
+    gettext-native \
 "
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
-- 
2.21.0


