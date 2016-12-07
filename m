Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F68971BD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:47:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB71l4tY024863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2016 17:47:04 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Dec 2016 17:47:04 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:47:56 +0800
Message-ID: <1481075276-9315-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481075276-9315-1-git-send-email-Qi.Chen@windriver.com>
References: <1481075276-9315-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] tftp-hpa: fix ALTERNATIVE_PRIORITY to avoid conflict
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
X-List-Received-Date: Wed, 07 Dec 2016 01:47:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix ALTERNATIVE_PRIORITY to avoid the same priority of the 'tftp' utility
with that from busybox.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 115fa2e..5932f85 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -75,5 +75,5 @@ INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 1 ."
 
 ALTERNATIVE_${PN} = "tftp"
 ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
-ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE_PRIORITY = "60"
 
-- 
2.1.0


