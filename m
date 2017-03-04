Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id CA80977721
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 02:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 959702E417
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RnYdL9ETDshd
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id D23592E3A5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB7DC1E083
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B00A91E07C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9A8702DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:06:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2426DBY008520
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 4 Mar 2017 03:06:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2426DPC008519
	for openembedded-devel@lists.openembedded.org;
	Sat, 4 Mar 2017 03:06:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Mar 2017 03:06:04 +0100
Message-Id: <20170304020604.8461-1-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [PATCH] meson.bbclass: Add progress support for do_compile()
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
X-List-Received-Date: Sat, 04 Mar 2017 02:06:19 -0000

ninja provides progress information when building so let's make use of
it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 5a04134..4be4b10 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -75,6 +75,7 @@ meson_do_configure() {
     fi
 }
 
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
 }
-- 
2.9.0


