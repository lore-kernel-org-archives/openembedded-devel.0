Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id DF43E73D97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:18:41 +0000 (UTC)
Received: by lbcmx3 with SMTP id mx3so35913130lbc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=GAdXA3BMiYRgUdE9FqUm4gm/IlzIhtGUGXrznmvrXOE=;
	b=ctAebHkRkabojPp3UsvvzWTk5N1UhzXiQ32GCo7U9Oke36f6VhpLemPAMApsPU5r/x
	x9jwenOuHLzxA2fSi0Jbk+FtyAYNuTMtWRcC25BHvoYdocrNm2GSL8woAiJlA49W4mDL
	LCTb7GG4JrkTtaffov9z4RKDheNzRhCc3UiufaoCLNTfZMjwXwEWpBJYwOkbhHSFaFUn
	8gOniUOPfTbl96XekMXJpHzZPwf41z6WoMMduAGJ2bsXkuk82QvOT2XV22me58jz3kfX
	NS6WBNzqzr5Rx4y2H2V7Vg9vftvf0DrVS8XqLcpf4Z1ZOiLNxPzg4Gml112X7ZE/c5O1
	yBvw==
X-Received: by 10.112.50.74 with SMTP id a10mr4547288lbo.4.1432844321251;
	Thu, 28 May 2015 13:18:41 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id o8sm819886lal.2.2015.05.28.13.18.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:18:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:18:26 +0300
Message-Id: <1432844306-4119-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-handheld][PATCH] layer.conf: add LAYERDEPENDS
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
X-List-Received-Date: Thu, 28 May 2015 20:18:42 -0000

Describe meta-handheld layer dependencies in layer.conf

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 31dcb16..c34f203 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -16,3 +16,4 @@ BBFILE_PATTERN_meta-handheld := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_meta-handheld = "7"
 
+LAYERDEPENDS_meta-handheld = "core meta-initramfs"
-- 
2.1.4


