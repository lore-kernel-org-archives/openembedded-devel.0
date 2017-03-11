Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2653A719FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 04:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 298552E467
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VyqLoqIAHIn7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 7DF142E440
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DE281E075
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62F301E072
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5729F747
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B4x1FW003828
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B4x1HG003825
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Mar 2017 05:59:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 05:58:53 +0100
Message-Id: <20170311045855.3665-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170311045855.3665-1-pkj@axis.com>
References: <20170311045855.3665-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/5] meson.bbclass: Make changes to meson.build files trigger reconfiguration
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
X-List-Received-Date: Sat, 11 Mar 2017 04:59:03 -0000

When externalsrc.bbclass is used, any changes to meson.build files
should trigger do_configure to be re-run.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 1362fd22b..8da06da7f 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -72,6 +72,8 @@ endian = '${MESON_TARGET_ENDIAN}'
 EOF
 }
 
+CONFIGURE_FILES = "meson.build"
+
 meson_do_configure() {
     if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" --cross-file ${WORKDIR}/meson.cross ${EXTRA_OEMESON}; then
         cat ${B}/meson-logs/meson-log.txt
-- 
2.12.0


