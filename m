Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 990466CED4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 09:20:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r999KXo5014950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Oct 2013 02:20:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 9 Oct 2013 02:20:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2013 17:20:57 +0800
Message-ID: <1381310457-4961-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-selinux][PATCH] README: update the Dependencies area
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
X-List-Received-Date: Wed, 09 Oct 2013 09:20:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add meta-oe to the dependencies as some recipes in meta-selinux may
require it. Here's a dependency chain:

['policycoreutils', 'libselinux', 'swig-native']

And swig is from meta-oe layer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 README |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/README b/README
index 926d880..987f7ac 100644
--- a/README
+++ b/README
@@ -34,6 +34,13 @@ the Yocto Project website:
 
 http://www.yoctoproject.org
 
+For some recipes, the meta-oe layer is required:
+
+URI: git://github.com/openembedded/meta-oe.git
+subdirectory: meta-oe
+branch: master
+revision: HEAD
+
 
 Maintenance
 -----------
-- 
1.7.9.5


