Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3D56ADA3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:37:17 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl14so2615569pab.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=W9euDwXYq8+fi4a6LI3C8J+0TDRgjT5rZsI150ZH3Vg=;
	b=CHN+WGQw4geOqPecwDAdkYNjIXY1Lu5+jIWw8EnxaPVuQVoaEd384AWzayb5xjMdn5
	N5XV3Lal24kSkF7wUR+QJxMO/9MTtoZ0Vqruk2X+jCtmCjQaSV0VcUyLpVCe5i0fhieW
	8b7PhCFdOBmNdcjxK228Lzdmm9jYw8m6CCj3XEIO4xr45h0LsMLNR3gDdKdvQDLpo1N0
	GbD4b2cvFEs3SyY4B3CqHJSfsn4kaKUw5YTAL8hkpP1PKQSF5thcUs5AFmnPWb7lgcOC
	7K6sn9Kjg4IeMopmyQPBmE1NqokAjp2RuG+MphSMEqGlyPlVpnS4w4xRAaX+WV04UirR
	p25g==
X-Received: by 10.68.163.68 with SMTP id yg4mr12380022pbb.64.1372437438405;
	Fri, 28 Jun 2013 09:37:18 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xz1sm9736917pab.5.2013.06.28.09.37.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 09:37:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2013 09:36:57 -0700
Message-Id: <1372437419-31205-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH V2 2/3] libxi_1.7.1.bbappend: Remove
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
X-List-Received-Date: Fri, 28 Jun 2013 16:37:17 -0000

This bbappend was generating native version of libxi
which was used by older chromium recipes but they are
gone. So let this go as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend

diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphics/libxi/libxi_1.7.1.bbappend
deleted file mode 100644
index c90046b..0000000
--- a/recipes-graphics/libxi/libxi_1.7.1.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-BBCLASSEXTEND += "native"
-- 
1.7.9.5


