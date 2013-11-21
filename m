Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id E95546B49F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 10:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id E2CE43C2711
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BYKkSCKXYA12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:27 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id CB0523C26E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:13 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id AD38B752
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:13 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A22E7365
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:13 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id A0BCD3404E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:04:13 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.2.255.0; Thu, 21 Nov 2013
	11:04:13 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 5A5389C915; 
	Thu, 21 Nov 2013 11:04:13 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2013 11:04:13 +0100
Message-ID: <1385028253-13293-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: rename libjson to json-c in DEPENDS
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
X-List-Received-Date: Thu, 21 Nov 2013 10:04:34 -0000
Content-Type: text/plain

The libjson recipe was renamed to json-c in commit 533c1db2 of oe-core.

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 238b484..0101004 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
-DEPENDS = "zlib libestr libjson"
+DEPENDS = "zlib libestr json-c"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-- 
1.8.4.rc3


