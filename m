Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 273777F555
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:05:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v19so10993970pfm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xEaCLyH1Sb3BjYglxBFQsvGbogD7JsJM2SFhaz6bmps=;
	b=E1vMKqaq/4Fji6HsR6wVMWyYs/jViBCK/x2PsSEdT/pS0a+W7/CZS6UUpNSKBoK6h2
	d2VtuUSkNeRgo5L5AGn+BhoNUQM8+JMgZTD3ZiRPjbCIxEtpQ2TiwnvchwX1SnOqpz+8
	M+euJwzN8uTS/SGssQtIkhlXtrXwlDcAsl8ZhAJBZmtEb+5za27kFM5RkKxKho6qU2Yj
	Ze6RYmfMJnd4qVJbrEDPnZBNOIf7yNuU5gwrb3SwjVMJ7txhxSdP4DE3nTXi0b/kuSA0
	e0+3KgeV6J9IHURqEHVjXqTi+L7XMsnN+y4PG10/4KFz7rbfy6ZpF09tXlnCVujUt6fF
	YZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xEaCLyH1Sb3BjYglxBFQsvGbogD7JsJM2SFhaz6bmps=;
	b=d4eLM38URDAPyUiYHCUI3Z73EKubBKQGDe+nxxEdjR8FXqNxpw1klxwCyj3dKx2VN3
	xGKnX/eq10GiHjIXniu2/Y1VN/3BYxxBda+UGv8NI67sZzDEB1rrGGrddSBl7+hxAQ+e
	B6qVBWbmlE8km8k1T0SCYW7dJnG/zMwiPpHGFKhxX3hwg6e+2UrOk7Fn0cMLLSWuNiCs
	ZCpSxCFLN/GicL+B4o72z75kRHAwX66P1VbAAJ9+txrK5ahNjK1mSAdwxPGEky7VlbLG
	1i1yolkk/MEV59rvL0e3Bk9OhHJxJoInKyhRLMB5v3MPBow0v//HUHHynQ0Z1xQ3BkIT
	Hoaw==
X-Gm-Message-State: APjAAAV18hLfjasll1yBxCqEYROnYb79ZXvKgcY8pfSHYu81sxXRoEJ5
	cBR2MO6q/0jJKlW8qy9RomZUQfBKz9I=
X-Google-Smtp-Source: APXvYqx7ZHzMQei2Swjk9IaQ7GLvgFjxM2nsWnEMZ7/dsYLeRolAYsopxwoqkEo1MeUWCyde5sF28Q==
X-Received: by 2002:a63:4441:: with SMTP id t1mr5682767pgk.179.1573488350483; 
	Mon, 11 Nov 2019 08:05:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id s2sm4301353pgv.48.2019.11.11.08.05.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 08:05:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2019 08:05:34 -0800
Message-Id: <20191111160535.547773-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lowpan-tools: Blacklist as its deprecated use wpan-tools instead
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
X-List-Received-Date: Mon, 11 Nov 2019 16:05:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index b70c43f156..585968f836 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -35,3 +35,5 @@ FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${libdir}/python*"
+
+PNBLACKLIST[lowpan-tools] = "WARNING these tools are deprecated! Use wpan-tools instead"
-- 
2.24.0


