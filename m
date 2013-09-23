Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87EAD610FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:30:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8N9V2RM016193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 02:31:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 23 Sep 2013 02:31:00 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Sep 2013 17:31:01 +0800
Message-ID: <1379928661-9188-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] quagga: fix babeld_option
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
X-List-Received-Date: Mon, 23 Sep 2013 09:31:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix babeld_option to make babeld start correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-protocols/quagga/files/quagga.default  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.default b/meta-networking/recipes-protocols/quagga/files/quagga.default
index 438c3b6..0c1ce6c 100644
--- a/meta-networking/recipes-protocols/quagga/files/quagga.default
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.default
@@ -4,7 +4,7 @@ vtysh_enable=yes
 
 # Bind all daemons to loopback only by default
 zebra_options=" --daemon -A 127.0.0.1"
-babeld_options="-D 127.0.0.1"
+babeld_options="--daemon -A 127.0.0.1"
 bgpd_options="  --daemon -A 127.0.0.1"
 ospfd_options=" --daemon -A 127.0.0.1"
 ospf6d_options="--daemon -A ::1"
-- 
1.7.9.5


