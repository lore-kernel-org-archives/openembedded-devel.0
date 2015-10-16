Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D424A73232
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 07:17:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G7Hi3E010951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Oct 2015 00:17:44 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 16 Oct 2015 00:17:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 16 Oct 2015 15:05:32 +0800
Message-ID: <1444979132-28084-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp: fix rpath QA issue
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
X-List-Received-Date: Fri, 16 Oct 2015 07:17:47 -0000
Content-Type: text/plain

When ntp could be correctly built with openssh and libcrypto, we would meet
the following QA issue.

WARNING: QA Issue: package ntp contains bad RPATH ... [rpath]

Fix this problem by adding '--disable-rpath' to EXTRA_OECONF.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
index 71e0b19..7ce993f 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF += "--with-net-snmp-config=no \
                  ac_cv_header_readline_history_h=no \
                  --with-yielding_select=yes \
                  --with-locfile=redhat \
+                 --without-rpath \
                  "
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
-- 
1.9.1


