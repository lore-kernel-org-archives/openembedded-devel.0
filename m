Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37343778AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 04:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1A6B9182BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id naMgdVJ5orwN
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AB6B818414
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B6C51A077
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90F4C1A075
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7AE81296
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B4x1oD003859
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B4x1V1003844
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Mar 2017 05:59:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 05:58:55 +0100
Message-Id: <20170311045855.3665-5-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170311045855.3665-1-pkj@axis.com>
References: <20170311045855.3665-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 5/5] meson.bbclass: Use the correct C++ compiler when cross compiling
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

---
 meta-oe/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index e3489dd12..e27ed3906 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -52,7 +52,7 @@ do_write_config() {
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
 c = '${HOST_PREFIX}gcc'
-cpp = '${HOST_PREFIX}gcc'
+cpp = '${HOST_PREFIX}g++'
 ar = '${HOST_PREFIX}ar'
 ld = '${HOST_PREFIX}ld'
 strip = '${HOST_PREFIX}strip'
-- 
2.12.0


