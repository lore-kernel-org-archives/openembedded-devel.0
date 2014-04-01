Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2AA6E89C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:17:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 15:17:46 +0100
Message-Id: <1396361866-16682-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.1
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH] rsyslog: remove unsupported option from initscript
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
X-List-Received-Date: Tue, 01 Apr 2014 14:17:57 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

> starting rsyslogd ... rsyslogd: error: option -c
> is no longer supported - ignored

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/initscript | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
index 8dee684..d011e8f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
@@ -9,7 +9,7 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
 NAME=rsyslog
 RSYSLOGD=rsyslogd
 RSYSLOGD_BIN=/usr/sbin/rsyslogd
-RSYSLOGD_OPTIONS="-c5"
+RSYSLOGD_OPTIONS=""
 RSYSLOGD_PIDFILE=/var/run/rsyslogd.pid
 SCRIPTNAME=/etc/init.d/$NAME
 # Exit if the package is not installed
-- 
1.9.1


