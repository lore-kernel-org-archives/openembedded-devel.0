Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC81719F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 18:42:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uALIga0R005917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Nov 2016 10:42:36 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 21 Nov 2016 10:42:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Mon, 21 Nov 2016 13:42:34 -0500
Message-ID: <1479753755-30913-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] dnsmasq: read the conf files found in dnsmasq.d
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
X-List-Received-Date: Mon, 21 Nov 2016 18:42:37 -0000
Content-Type: text/plain

The dnsmasq package installs a ${sysconfigdir}/dnsmasq.d directory but
doesn't currently use any configuration files that might be placed
there. This goes against what the user would expect and doesn't match
what you see in other distros.

We could ensure this config directory is read when dnsmasq is started,
as we are doing here, or by including it in the main dnsmasq.conf
file. By doing it here we can have better reuseability of the main
dnsmasq.conf file by other instances of dnsmasq.

There are currently no files added to the dnsmasq.d directory for core
oe images, so this should not result in any runtime behavior changes.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service          | 2 +-
 .../recipes-support/dnsmasq/files/dnsmasq-resolvconf.service            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
index cde2244..32f8e59 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
@@ -6,7 +6,7 @@ After=network.target
 Type=forking
 PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
-ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d
 ExecStop=/bin/kill $MAINPID
 ExecReload=/bin/kill -HUP $MAINPID
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
index 68b175c..07b4817 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
@@ -6,7 +6,7 @@ After=network.target
 Type=forking
 PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
-ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d
 ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
 ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
 ExecStop=/bin/kill $MAINPID
-- 
2.7.4


