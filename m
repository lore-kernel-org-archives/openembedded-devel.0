Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD116011F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:45:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8R9j414015654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 02:45:04 -0700
Received: from wind-k.wrs.com (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 02:45:03 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Sep 2016 17:45:02 +0800
Message-ID: <1474969502-17781-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: enable option o_direct
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
X-List-Received-Date: Tue, 27 Sep 2016 09:45:05 -0000
Content-Type: text/plain

During some lvm operations, e.g, create many volumes, we notice
a quite big degradation in performance with o_direct disabled,
if enabled the performance get much better, so, here we should
enable this option.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index d66daf8..c6d91b0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -29,7 +29,7 @@ PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
                 --with-group= \
-                --disable-o_direct \
+                --enable-o_direct \
                 --enable-realtime \
                 --enable-applib \
                 --enable-cmdlib \
-- 
2.7.4


