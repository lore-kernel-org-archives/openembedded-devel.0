Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8448E6CA74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:50 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so9531187pdi.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ImNXeUlwdPQNH1/hnncBMscbdlWH0XctQI8Pmndx8hc=;
	b=HfADliHK1gfOHJzt5HjEV7Sdnn1LxWkPBeAfreJuz2NzCwAOq+Y7jS82xeuqz3vkv4
	IOw1sFXkwmpQEx8+GFCufr+gqVK6RS66ZfQHJNa2M3DVLGbS76Of7nHI/lnOdzEq5N3v
	vpCgzmpxxQ6GFGArx5Hgm3x1ojcfJ9SAdVNxDFeuVynaOKearZIuwf2lb8AEfVcSwrh1
	qHqf6GlOYWTdd3OBKbD1xS3HF5B4GQysZjMJBAfQmf1hDsOzTm9XaxJD1rdBgtQSXXWi
	vjNs33AuKjwFCi2bRA3pumvxDN/AMW/mp9risck99YYnGp6zpqUhnmc0xPOWE6CaKXgP
	RAkQ==
X-Received: by 10.66.65.134 with SMTP id x6mr250505pas.142.1381877032663;
	Tue, 15 Oct 2013 15:43:52 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:24 -0700
Message-Id: <1381877008-698-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
References: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] libqofono: Use BPN instead of PN in SRC_URI
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
X-List-Received-Date: Tue, 15 Oct 2013 22:43:50 -0000

Makes multilib builds happy as a rule of thumb
never let PN be in SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
index 826f646..6af8e5e 100644
--- a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
+++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
@@ -18,7 +18,7 @@ PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg ${PN}-test"
 RRECOMMENDS_${PN} = "${PN}-plugin"
 
 SRC_URI = " \
-    git://github.com/nemomobile/${PN}.git;branch=${BRANCH} \
+    git://github.com/nemomobile/${BPN}.git;branch=${BRANCH} \
 "
 S = "${WORKDIR}/git"
 
-- 
1.8.3.2


