Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42BFC75CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w207so4947244wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R3ZDhtRljftWz8UMvGdvtqHd41GUOuQNtck1Xnr3vFY=;
	b=KeNh3mkk5AxAuFqzo1NESSqulfF8+j6xDEezzrB17QsUWeltVgfAyI8ON069bUQ/AR
	hTeCqUzkSxsnecgAuqRbUXoV6fAce3ElUr7IJubgdODDc6txU/oDUEWJWNF7eajOWHSi
	Xkztr/5ZRGYRKvpkI3WHGAwZGVvJnIt+1czPENhyC70UqwAvaZDACfUK+waby+LzUfnR
	NaJ+RhCJMKGgu7z1X22Ou396nnKyftH6mM4YXOANyjAiMXuUTNP/sWuI4Nmgj8WxhxjQ
	Ezgz0xTYz6eMi+3Zkjf1LVGUYyOnUKBGgjjUoPMaTKFLdsk/oCLGRKZ+9Wi7s1dCqWNr
	lakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R3ZDhtRljftWz8UMvGdvtqHd41GUOuQNtck1Xnr3vFY=;
	b=m+JeSzsKsxfAySUWOZUBucwOzzmlVSPk4mmZooUysIszsbvtgBKInnH7+/2vK+bi72
	h7ZorzUXamfk+8f1m09LlVCltJwnp83M1YFG6uIkJg6LJU/WQ7cR4Xdu9042zzB2faQJ
	/hpuGKZHghYjAXpv0aDpu6ChrE1Xu2zVBsOBOF95VS2mtvXP+NkQtk6TpVrQZ1nhZVgC
	3MvwaDon+odVjlTaGZLVVLzGIZ+DOLtu0dGbJEb3I+3NZM5RKeBWxZDj3+/Q3pzezmAR
	xQ2aNJbb8KCKXWgEDr5X/zeb4dvNP8sOP4luPISnz8bY+CQuipL6WfEMMWkNoZ/Ia0ya
	mzCA==
X-Gm-Message-State: AE9vXwMuJK3HTF1l+SppQ8rLvaZDibLww/qmcn9eHhGt1b8+lBK8N02ZO39GFyXLY/GPfQ==
X-Received: by 10.28.86.8 with SMTP id k8mr11537016wmb.33.1472672481123;
	Wed, 31 Aug 2016 12:41:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a21sm10460228wma.10.2016.08.31.12.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:01 +0200
Message-Id: <20160831194106.14065-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/11] accel-ppp: blacklist, fails to build with new binutils-2.27
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 19:41:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
index 10e98a4..22b7cfe 100644
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -40,3 +40,6 @@ do_install_prepend() {
                $cmlist
     done
 }
+
+# http://errors.yoctoproject.org/Errors/Details/81003/
+PNBLACKLIST[accel-ppp] ?= "BROKEN: fails to build with new binutils-2.27"
-- 
2.9.2


