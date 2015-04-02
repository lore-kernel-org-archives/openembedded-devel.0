Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F04C6AC56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 08:20:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t328KLO9005489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Apr 2015 01:20:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Apr 2015 01:20:20 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Apr 2015 16:20:22 +0800
Message-ID: <1427962822-14751-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427962822-14751-1-git-send-email-Qi.Chen@windriver.com>
References: <1427962822-14751-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-systemd][PATCH] meta-systemd: add "core" to LAYERDEPENDS in layer.conf
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
X-List-Received-Date: Thu, 02 Apr 2015 08:20:20 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-systemd/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index f3fc45d..0563f44 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -29,3 +29,4 @@ BBFILE_PRIORITY_systemd-layer = "7"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   systemd-serialgetty \
 "
+LAYERDEPENDS_systemd-layer = "core"
-- 
1.9.1


