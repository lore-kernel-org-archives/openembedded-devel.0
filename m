Return-Path: <olof.johansson@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 128096C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 07:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id F285619EB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yBjaom480fUs
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id CD5CC19EB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id ABB2D9B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A0EB4525
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 9F6083E06F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.2.255.0; Fri, 18 Oct 2013
	09:27:28 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 6A38C9C078; 
	Fri, 18 Oct 2013 09:27:28 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 09:27:28 +0200
Message-ID: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: fix dependency name (json-c => libjson)
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
X-List-Received-Date: Fri, 18 Oct 2013 07:27:31 -0000
Content-Type: text/plain

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 0101004..238b484 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
-DEPENDS = "zlib libestr json-c"
+DEPENDS = "zlib libestr libjson"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-- 
1.7.10.4


