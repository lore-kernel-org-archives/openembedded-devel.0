Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qSG-0000Xc-Tx
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:52:25 +0200
Received: by eyb7 with SMTP id 7so4079380eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bJMU77Tq1nFPqWU99CQSPNOzxiwYo0oilz8fMZpgcoM=;
	b=RLXkcvV22wqAWMpb8Yr8L9GJE5xi9Z9wr9pQLcp7e4rYwOi32Ez6+9GkCtJ/TsmMQq
	RkAlFwkjA3coGm6ifvCkrqt259kpEosfYIvWdb+U8ATGqVcak5FZZ3fvBUk61xyzPOFU
	pJ6fxmcWAkUuiXLBvMmKEEN3T/da5hmyPYVx4=
Received: by 10.213.25.201 with SMTP id a9mr1694635ebc.70.1315295243957;
	Tue, 06 Sep 2011 00:47:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g65sm13131470eeg.12.2011.09.06.00.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:47:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:42 +0200
Message-Id: <21665f6b0289bdaacab8210670736e88eb12e175.1315295094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
References: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 5/6] ecore: add ie /usr/lib/ecore/immodules/xim.so to ${PN}-dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2011 07:52:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 89e578e..9f3d1a4 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -73,6 +73,7 @@ FILES_${PN}-job = "${libdir}/libecore_job*.so.*"
 FILES_${PN}-txt = "${libdir}/libecore_txt*.so.*"
 FILES_${PN}-x = "${libdir}/libecore_x*.so.*"
 FILES_${PN}-input = "${libdir}/libecore_input*.so.*"
+FILES_${PN}-dev += "${libdir}/ecore/immodules/*.so"
 
 ECORE_OECONF = "\
   --x-includes=${STAGING_INCDIR}/X11 \
-- 
1.7.6.1



