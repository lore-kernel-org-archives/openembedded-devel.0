Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F24365D33
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:58:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626wINC016760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:58:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:58:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:57:05 -0700
Message-ID: <1404284261-42377-39-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 38/74] tmux: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:58:17 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/tmux/tmux_1.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index 298cfa5..1148aeb 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab
 
 DEPENDS = "ncurses libevent sed-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/tmux/${BP}.tar.gz"
 SRC_URI[md5sum] = "3e37db24aa596bf108a0442a81c845b3"
 SRC_URI[sha256sum] = "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
 
-- 
1.7.9.5


