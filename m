Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79AE17385B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:49:45 +0000 (UTC)
Received: by wggx13 with SMTP id x13so14112386wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EXy4ZZAC4rmLKid/U4w+F2JKv4pggFCThu6jxGAjvPM=;
	b=UMpUBcUpJ/H+BboaG3y7fkcVpvUaUIGM0d6ju67dw+7poDO5KXJ2qIT0J+stM0uUcd
	I7f+Kl/8hxTNGYcLKpHVyqI3qHfjMWR9HAYKXEMh5MRh6AfRuO9KX6q2fXRKe0qavjWa
	efRKfqFPhVYBi77i+4LBTSgXVyJ0d+L8tVQldDIMSJ3nvuYtckJVoaPS8koTCI+iyUjA
	16mOFjZrykORtAERdNMF/YqxgMmiGpJ5iUSXAR42esrjLuNXjOWtVngoTNBSXKks4FDn
	cAMPdZCiB7ASpgJM6KyIwT0oLmqvBNEQOTvW2qpkI4Q4Nf2FwIlKxnVUpvLtxyyQPAV7
	pyzg==
X-Received: by 10.180.106.103 with SMTP id gt7mr67292315wib.59.1425570586064; 
	Thu, 05 Mar 2015 07:49:46 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lj13sm12185015wic.9.2015.03.05.07.49.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:49:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:49:46 +0100
Message-Id: <1425570588-20920-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCH 1/3] ktap-module: blacklist because it's not compatible with 3.19 kernel
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
X-List-Received-Date: Thu, 05 Mar 2015 15:49:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/ktap/ktap-module_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
index 62f2a99..e3c94e3 100644
--- a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
@@ -6,6 +6,9 @@ SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
 
 inherit module
 
+# See https://github.com/ktap/ktap/issues/80
+PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
+
 # Available package configs: ffi (only supported on x86_64)
 PACKAGECONFIG ?= ""
 
-- 
2.3.1


