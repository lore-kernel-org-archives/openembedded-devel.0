Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4A43785A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c204so6504283pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ev1PTC/LJSp5LZnNvTw9EaU3Yl/sz5gDORWqj63plvY=;
	b=mnyjHUgW4YuJcAynSrNeMtkjVsxoOummtIHz2zhCD0dv3NiA9A5z2t2aGyuZdFStZK
	CdVMmul6cgWd640IdOu59e2F/9Ler1QPaAeJ4EZ8tycqMCShcvVZbxRszqebewJ/xgZO
	3h6rJR1uTX0esNcpclmE6EsCN7YUW5sChNhnjj6lXJzBx9xzgcyiRlBeOJfl7GkGBvfK
	IL6g12VDsIu924GSfgTQ2MXGKLDuFxaY6UQFBa0PtIF5vcq1rxjnj9qudaq/W7vYE5Eg
	kWf/Lf6gXq9UTMfEJ/fPrFqzzNl3wxyNkr+kfzNsIsBaWkpXi+nMNicBXOPYPhKu1G52
	VBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ev1PTC/LJSp5LZnNvTw9EaU3Yl/sz5gDORWqj63plvY=;
	b=CGRgDNPJyADWk3o+vdeBQFUVUY0cBULixqyLv1xqHmQEoYVLqJxSjZ2Ptmtc/d4G+J
	Qk7jpV8nvNDyBFH5FGIh6dnhSykp0hvKGHkQepvfCBwOVDw5ekeSFE/JyZUwhJExucc0
	tkijEQSfC1QiQISatwEAsStxicGmokF/VdBiwLWHBnNxrHSWqKrCL14GBWGanfkJ2s5T
	VigxEuR8d7zvtLKky70REIISDJeHnYBu2N8bZQ3iGxHSgGr0UIn3ikOV26YM7MNfQ6Za
	mG+EDqqJ4SauIp7pBXJz3qKYvhFWpoREuQpZHhYkBUBj3l5dyIs8R6Ls8bbmL1LS2ipo
	9TWA==
X-Gm-Message-State: AJaThX7Fu6wwAAK2e1te77B4jM3uVg6zMp2V3rGcarD+zkmwOfVRWIbs
	nqpa7xIhFtsiz1gDKh3+1A+0Xg==
X-Google-Smtp-Source: AGs4zMapG1MAk0g7d5LSKYJ6H+IyHPw3DG4Vbd8PscmEZX8JY95QS8hfGCxLM7opZXdRwkCsuuXXSg==
X-Received: by 10.84.160.233 with SMTP id v38mr28359272plg.179.1512711994889; 
	Thu, 07 Dec 2017 21:46:34 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:34 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:46 -0800
Message-Id: <20171208054548.26218-11-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 10/12] python3-visitor: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:33 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
new file mode 100644
index 0000000..b9bc51d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-visitor.inc
-- 
2.7.4


