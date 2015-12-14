Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 206A76FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:26 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so105232901pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QXRGEf6FT53uMvct6xqYL13u1/B0mj3jPYgpvhMZRUI=;
	b=XuL5Es4h1FsMgaZWRr+DlBPgRA7nBLf035m9f1ST/XZBD/CQ4pWIlsLbR+Hi44Sw5I
	ZI9a8Z7xkcvjyCUoanZSLHYwDQ1JyLWPfy8QJQTwYL/rlpYA2aR37Tl1XNJ/T9qtIbBF
	mev2R7GAufw2WpHddro/78Gh5ts0nf+kzAWwEn7dpzl4cpZAXSXg+bobHyaNqyhcTgKH
	NNEMKHNwFhFiKcAwwFSlMjcWgLtTg+uJGnbupsDrZJtKHIYuWCkx3egsoplXeeo6muF7
	g3a5WGdhoeqgEO1oJsUURGEnT6ubdsMPFZF+hTyMdWgTHUf+mATFTxuFipMf/q3FZ+pF
	bpEQ==
X-Received: by 10.66.190.66 with SMTP id go2mr47422916pac.114.1450107267654;
	Mon, 14 Dec 2015 07:34:27 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q62sm43292527pfq.6.2015.12.14.07.34.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 09AF0FCC840; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:07 -0800
Message-Id: <9deb3b0a8cf37dd951f10100cd4a2408c47fee75.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 14/14] tmux: Fix QA issue
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:27 -0000

WARNING: QA Issue: tmux rdepends on libutempter, but it isn't a build dependency? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/tmux/tmux_2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
index 6e2c88d..2f59898 100644
--- a/meta-oe/recipes-extended/tmux/tmux_2.1.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
@@ -15,3 +15,5 @@ S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 inherit autotools pkgconfig
+
+RDEPENDS_${PN} = "libutempter"
-- 
1.9.1


