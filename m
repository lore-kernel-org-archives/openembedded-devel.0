Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62AA778A52
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i14so1240532pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZGOLlsTd7nsQnL5kyQeFJ3AXR/JF484gmAB1h7913X4=;
	b=R8Wzz25I6WJRw5mETQC4Ecbr0pIVwtzMHWEyjL442t8n5zxnmO7HyBevB+dtwxslS+
	85fpeibmNE6esmHQE6H4OP3QqEbMed8NRar9vQBdAbH4rUIGVaPGX705IzJsgnPGbJSV
	FamW54QZ8jkBSQdL7DcvCD+Cg4tWZpQZOhm1W61LIs8iZyCyN7kawRL5blxeFbLo3zrK
	Gk9Bnwz51R9jPTH7aO3nWSkXTLFEuEvzR3ts6xKX4p2be4TOPt2AiXL56VNH0onF1Iiq
	FSQFgq6rt7M5jWF45B8SwBv1gEqFB9uEUe4gAHH3nQW+LdQOIiZVJJbGrmP8wR3KsEhI
	lr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZGOLlsTd7nsQnL5kyQeFJ3AXR/JF484gmAB1h7913X4=;
	b=fwRUayHHI/Yr1KHw2MCe9P7OPlRzZ4L5vLG/Ob7uSgxTcycPYWUwcH0V1AN2nWxKKR
	7FF8/UHHQfTYzrIth7+7ffeKiHJqWIzu3CTh7TXnn5NPMFH8mfJmUa7iQb+dMp2QAK1n
	SpBrPKLcuPX0LLsnYV7mF4cQHRU3p2+ghHsldUiIfCLQRd2tCXpyZMdsgYzZ2s/9+fL+
	b7Kzk5fqjvWoIfhVubaNWWqzxGZw9zx8zUILRI2/CdEYasBw0Y9s4TET7ya12iPrsGhV
	mOIiKRzRPtx+0dTejgJop0fMEKvB7Mfuq5YGh1+OYv5OnHAiaOVyEE0eDy7oRqrk+HtP
	w8pw==
X-Gm-Message-State: APf1xPC0EQaXHwEwjuF7ymm1l1lVAAvL/Wycwuhrw+rDHqoRh7+MlVoO
	5BFYcEi2ScpZ+QaLmmlNCsQ6+A==
X-Google-Smtp-Source: AG47ELs9OVW828Uz62pgE3EcsP64JVE7LRnM4E+hwlf6HR+JaNWGiC2FSn1BFQfj8euVksvWRCkDpA==
X-Received: by 10.101.78.200 with SMTP id w8mr19119643pgq.43.1520449293903;
	Wed, 07 Mar 2018 11:01:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:04 -0800
Message-Id: <1520449275-29492-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 12/23] abiword: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:32 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
index 2a13e48..1d92b04 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
@@ -38,7 +38,9 @@ SRC_URI[sha256sum] = "afbfd458fd02989d8b0c6362ba8a4c14686d89666f54cfdb5501bd2090
 #want 3.x from 3.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep pkgconfig
+inherit distro_features_check autotools-brokensep pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= " \
     collab-backend-xmpp collab-backend-tcp \
-- 
2.7.4


