Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D27EC78744
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:37:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 141so11794362wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B5ZmcYaDqvswK3GVl6wWR5sKk46ACvnVrzmViaGazeY=;
	b=t6l9QEDrnhUgsIg+0BWxoEeixdEwzGyOfkaoj9FvOqhpZQ2xAqWte0iH9ef8Tu/fQ3
	RXNcbyiMKZmccikhaoc2CyLlctTjnPV+6YVKX447O7fqQEl6Z2ErrQ60bWlBNIQafqvy
	+gbSbnBk8WPGwoG3e9T2gGrcCW7bAWAyMpzhLaRDi1u63Hkuc6BT9ifnlFfhCCfbvv6W
	E2siOC1nxCY8Kt2yv5GQ7H5UO/Omp0GaBL0b4snUs3QKcMVhsypJV2xDL0u9UNZhPmfz
	ehMg/wod5pNeQdShZQS6w26GviIjgBPD4TdxMXAbe9qrQvW4LwkPdtetbIxi/7S9mJ/0
	cNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B5ZmcYaDqvswK3GVl6wWR5sKk46ACvnVrzmViaGazeY=;
	b=l5lBb2TSkX6bGiMPryMD5fBupGIfnGMkoj+BLiIaIWgAnvMbcAWmWAaKuKZRY79au6
	JnUfXu+sHLHvtBMb2TCX3whXYS+ROYbBZwNX9Nl1A2gPBw9aX0QrZr30/vZ//30gLHO8
	jmLy5syWrUWAh1AZ29vVcY7sdNJ9onhZ2cg8kXA8JFa772NxvaOLLTvsvmqnw/6mF5gt
	jblvUpGOBotAZIyhyUnfKNHtjOKOQMHFyLH4ERCZSq4mU89VI8F6SqwDSnJT7eFyhkRM
	cyPhoTu6qZqpZ/OIoEGydWLnX7nfg6zrDILxeHk3ZNbf1XqdnjTaR6ICO+iI2XbEMI7c
	3rqw==
X-Gm-Message-State: AKwxytfr/OckVeP0zW/zw2zW0+eqStdS1vcL5r6Hc3egIZuYnJxqECYZ
	fSLRR0Rr5dA9f56ewExtnF1QTQ==
X-Google-Smtp-Source: AH8x2257vnoQVUXJ+z86Hxeng8YA2boEZU0WJ5463dl16SKyOuGMuMF43S338VK2Ptv2PSdQVpRPBA==
X-Received: by 10.28.87.138 with SMTP id l132mr3145089wmb.27.1516541862367;
	Sun, 21 Jan 2018 05:37:42 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j6sm3443712wmg.41.2018.01.21.05.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 21 Jan 2018 05:37:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:37:38 +0100
Message-Id: <20180121133739.6230-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180121133739.6230-1-Martin.Jansa@gmail.com>
References: <20180121133739.6230-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] cmpi-bindings: use Unix Makefiles OECMAKE generator
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
X-List-Received-Date: Sun, 21 Jan 2018 13:37:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
index 25166ab580..987c09fe52 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
@@ -24,6 +24,10 @@ inherit cmake python3native
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
 
+# With Ninja it fails with:
+# ninja: error: build.ninja:282: bad $-escape (literal $ must be written as $$)
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 do_configure_prepend() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
-- 
2.16.0


