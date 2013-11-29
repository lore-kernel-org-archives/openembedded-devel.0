Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B22846D014
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 02:37:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAT2bcEM012013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 18:37:38 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 28 Nov 2013 18:37:38 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Nov 2013 10:37:37 +0800
Message-ID: <1385692657-10783-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] ntp: comment out the invalid server
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
X-List-Received-Date: Fri, 29 Nov 2013 02:37:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

When ntpd starts, it will create a daemon to connect this invalid server,
and fail, then ntpd will create other daemon to connect the local-only
(127.127.1.0) server.

The users should be aware that they need to configure the correct ntp
servers, a invalid server will lead to a redundant daemon, so it is better
to comment this example server to wait user to configure

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntp.conf |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
index a9cc838..e26b615 100644
--- a/meta-networking/recipes-support/ntp/files/ntp.conf
+++ b/meta-networking/recipes-support/ntp/files/ntp.conf
@@ -5,7 +5,9 @@ driftfile /etc/ntp.drift
 # This obtains a random server which will be close
 # (in IP terms) to the machine.  Add other servers
 # as required, or change this.
-server time.server.example.com
+# 
+# server time.server.example.com
+#
 # Using local hardware clock as fallback
 # Disable this when using ntpd -q -g -x as ntpdate or it will sync to itself
 server 127.127.1.0
-- 
1.7.10.4


