Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5729E7F68E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 12:19:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9ICJkJ1003900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 05:19:46 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 18 Oct 2019 05:19:45 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2019 08:19:45 -0400
Message-ID: <20191018121945.919-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] freeradius: fix PIDFile path in radiusd.service file
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
X-List-Received-Date: Fri, 18 Oct 2019 12:19:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

radiusd.service references a legacy path for its PIDFile, which
results in a warning at boot:

systemd[1]: /lib/systemd/system/radiusd.service:7: PIDFile= references a path
below legacy directory /var/run/, updating /var/run/radiusd/radiusd.pid →
/run/radiusd/radiusd.pid; please update the unit file accordingly.

Modify the recipe's radiusd.service file to use the correct path.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-connectivity/freeradius/files/radiusd.service     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
index 8dae0df5b..2d766488e 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -4,8 +4,8 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
-PIDFile=@STATEDIR@/run/radiusd/radiusd.pid
-ExecStartPre=-@BASE_BINDIR@/chown -R radiusd.radiusd @STATEDIR@/run/radiusd
+PIDFile=/run/radiusd/radiusd.pid
+ExecStartPre=-@BASE_BINDIR@/chown -R radiusd.radiusd /run/radiusd
 ExecStartPre=@SBINDIR@/radiusd -C
 ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
 ExecReload=@SBINDIR@/radiusd -C
-- 
2.21.0


