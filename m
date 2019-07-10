Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 143DD7F00E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 23:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6ANv8U6010198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 16:57:19 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Jul 2019 16:56:58 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jul 2019 16:56:57 -0700
Message-ID: <20190710235657.97551-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] drbd-utils: enable reproducible_build awareness
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
X-List-Received-Date: Wed, 10 Jul 2019 23:57:28 -0000
Content-Type: text/plain

Enable use of SOURCE_DATE_EPOCH from the reproducible_build bbclass.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
index 70e04b9..7fd3090 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
@@ -35,6 +35,9 @@ EXTRA_OECONF = " \
                 --without-manual \
                "
 
+# If we have inherited reproducible_build, we want to use it.
+export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"
+
 do_configure_prepend() {
     # move the the file under folder /lib/drbd/ to /usr/lib/drbd when usrmerge enabled
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-- 
2.7.4


