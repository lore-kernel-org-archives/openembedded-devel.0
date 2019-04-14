Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id E1BA77DA6E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:07:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id EFF9A3A4EAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 16:17:45 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 07BDA20004;
	Sun, 14 Apr 2019 16:17:43 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2019 09:17:22 -0700
Message-Id: <20190414161725.21617-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] gpm: Add PID file to systemd unit file
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
X-List-Received-Date: Sun, 14 Apr 2019 18:07:23 -0000
Content-Transfer-Encoding: 8bit

This helps systemd identify the main process of the service.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-support/gpm/gpm/gpm.service.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/gpm/gpm/gpm.service.in b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
index ee6c040fa..5a6cadeb4 100644
--- a/meta-oe/recipes-support/gpm/gpm/gpm.service.in
+++ b/meta-oe/recipes-support/gpm/gpm/gpm.service.in
@@ -4,6 +4,7 @@ Description=Virtual console mouse server
 [Service]
 Type=forking
 ExecStart=@bindir@/gpm -m /dev/input/mice -t imps2
+PIDFile=/run/gpm.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.21.0


