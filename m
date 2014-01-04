Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46FC56BCF7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:14 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so7167255eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pkWBjlEno9AgUlWV4eFN5baTYPc3KQnA9wdKNDnH7ec=;
	b=oO/qIldkrvCJOXcOGhcuR5x1E4fbze7Y8Mta0vzDiGkYrxQv0LXqe/nDWmpnF7/8ju
	fevES/SDLy+cTUsS72za4J9qG579mQ1L3XeUZcBIh/f1fWsZ7SJTECuPR4QaWLf5LQMv
	TrA+d8qmGt8RfLRlibMNC5fzMtr7eguNF+kjjx+ZmRtk68TTRjcVyJ6Hf0dARAr0yHNB
	FA8i7ihOHQObwaWQT3PKfJjXsBBaJYFPpeLfQOZnKP1Zt6ZtzJSdpNWKEq0eilBq/AJy
	ufhCuS55rOtCWvRL+95wFat0XmUTKvex2MNsYhkMMsNQK2h5FE4wkq9VWOXgM6Ddlowf
	dX5A==
X-Received: by 10.14.127.132 with SMTP id d4mr7245375eei.66.1388834055080;
	Sat, 04 Jan 2014 03:14:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm152658140eef.9.2014.01.04.03.14.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:03 +0100
Message-Id: <dc22e75aedabb5e86641b172bbcf273f8ca7480e.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 7/9] usb-modeswitch-data: Exclude SIGGEN dependency on usb-modeswitch
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:14 -0000

* has runtime dependency on TUNE_PKGARCH usb-modeswitch
  Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b52

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 68f7823..1a95293 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -31,3 +31,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   distro-feed-configs \
   ca-certificates \
 "
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  usb-modeswitch-data->usb-modeswitch \
+"
-- 
1.8.4.3


