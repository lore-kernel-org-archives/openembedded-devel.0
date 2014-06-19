Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0F30970189
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:22 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so2059696wes.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hD04z9BnvA3a7UWjPMdnjWICxMi/5RfJyrWt8jiaUrY=;
	b=zx1T/vJ7H4Npi5iamNZa/jhtUAZgjAHLGYiqk2UkVMU1BQPd6bTQg7ukhNS43XixR7
	np6zCJsmcQY5RtlEx84XsJIMq/jJX7hAivYWTn63fhg21q5YqkS2igmTTpDroHhiLlyB
	KwIOQ2jONMu7Ug4YMxGbFkj9LVVswLUz1BOsnfY/mWWQAYgCQTO+Vj+ikuUCPvtvtKyC
	UT8O2eHzQzDmxjLT90Zl0wFTzTZuc3djWAHo2rtTz7L47duLgIeZPG2msgK1dEDjK9Bv
	WYTQ3kRvaYn9SvACaasuqzyqCRL0Sz9Wg/pgVZwTJsWdn53NSU9dlCatOhvOTaYv3AAI
	MvQg==
X-Received: by 10.194.2.45 with SMTP id 13mr2212339wjr.127.1403172023473;
	Thu, 19 Jun 2014 03:00:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e11sm10063237wiw.19.2014.06.19.03.00.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:52 +0200
Message-Id: <1403171993-26208-24-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 24/25] fim: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 3433bd2..afcb113 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -8,6 +8,8 @@ HOMEPAGE = "http://www.autistici.org/dezperado/fim/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
 
+PNBLACKLIST[fim] = "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
+
 # flex with provide /usr/include/FlexLexer.h
 DEPENDS = "flex-native bison-native flex"
 
-- 
2.0.0


