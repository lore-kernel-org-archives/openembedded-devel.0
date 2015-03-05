Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC99738D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:50:14 +0000 (UTC)
Received: by wesx3 with SMTP id x3so424976wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EXy4ZZAC4rmLKid/U4w+F2JKv4pggFCThu6jxGAjvPM=;
	b=i3uoJOUmeXAx1XNeu1otD3G6OlJgwjRHEx+NK50jbdmUWaX7TUzu9fyh6jcvogqwYs
	nSYt1b5i8wWG9Jkl9DocDNQqhWxMt5yY5G79697IitPG/Q9GRnyZYpUjQhkDeJre3DaL
	8uo2rke4t75wN/ZjdkM5GbGpfaQulOP3Fsr5CN/U1BgZZfmiJ3nmB3ZjkQLBfjpi2R68
	q7kZpHUk+Eks+mS9o7gSDqvnDy1yBS2lkxr9Fycip1M9lte3jowZzc297d+8yVr+xTC7
	mx3KxGB/GTMlDS7NJ3u+PgkB2dZdumNFp44PKE5yA19BG9RoDvlItH1kUM73PZCx3PTf
	dMFw==
X-Received: by 10.180.105.40 with SMTP id gj8mr68346568wib.67.1425570615270;
	Thu, 05 Mar 2015 07:50:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn7sm15149558wid.12.2015.03.05.07.50.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:50:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:50:15 +0100
Message-Id: <1425570615-21705-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425570615-21705-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425570615-21705-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] ktap-module: blacklist because it's not compatible with 3.19 kernel
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
X-List-Received-Date: Thu, 05 Mar 2015 15:50:16 -0000

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


