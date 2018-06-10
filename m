Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 864B875352
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:53 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id d2-v6so17768233wrm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tBmu6a081Non24GeMMXA//dErVzuQrGtUzV9grh54NM=;
	b=ctlxcUEsE0eyKyz2dZLdVi7XAIi+5gkikV2dMeVpT3D5Cs9ZcN6U2Hu/xJOE1kAoKq
	GTdEZ+hezziKiz4NemJdPYPEYriwBjn5DkcrmCzxVMawV5rkH9NFBf9r+k8E6wrg3TRa
	duZF7F6QuHW7GmGh8TNK1N8Z3U32lDaehWunNDbz15FLJ4BOVaKcrNKYefjyjivf5R1y
	FfRNCantoBHLGYloSdxdl9MmovoE6t3/jlp+ls/uKvjQNrTuW92fhgrcCVz6pDaRxznp
	IrJJhEw9FFuDZ0Bcgk7tE8n2Ax8pJzSAg5HkdMy/YFFc+F91nbAaAdYz17KEsyA/oZvO
	A5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tBmu6a081Non24GeMMXA//dErVzuQrGtUzV9grh54NM=;
	b=CEilyC7vfXWVF+E+XGmtu2PPrQdoLlaX/25+CJc5c1hMVLM5Fr2VI4CoHafY+rnDtz
	1xyzXT2jNWGizJ6O3l8ZJ3ISd4RP66qQD7aIucBAPVFLA7jjZKXWTetDTbrVUtbPR2VT
	uDkO98KQH6768YNNhocOuFZ8ttjEby2wCpAMQE4Z2JEYqqbkl36j8Lj0pEdbTKGguKAX
	B0meLsJHP9BAdeDXHqtPs19mEfxhejYzAEEk893dR+TRO9M/0ocRFpjhzqNgUH1Vi4ai
	BgEpSZ4fA5tnyKaJ1XEq5PgrXPGFzXuzGAOhFyi/Dt/aOECNoKK9pg1by554GbEzmyHv
	M1rw==
X-Gm-Message-State: APt69E0IPqeU3rZwIt+iWuAuvH7IuQ0hMyU+T+GpKOPw+xcbK82cnhAr
	khxE432gpgjoD75znl41gBb7Cg==
X-Google-Smtp-Source: ADUXVKLbZ/f0J8Pg+8L/eiDxWsVUUS3O6ESfBIZTi/eBP9lRY3w+R1YzRj+7OpUAEw1YaKzFAoOrow==
X-Received: by 2002:adf:a6ca:: with SMTP id
	t68-v6mr10022619wrc.215.1528643333980; 
	Sun, 10 Jun 2018 08:08:53 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:13 +0200
Message-Id: <20180610150821.9536-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 11/19] thunar-media-tags-plugin: upgrade 0.2.1 -> 0.3.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...r-media-tags-plugin_0.2.1.bb => thunar-media-tags-plugin_0.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.2.1.bb => thunar-media-tags-plugin_0.3.0.bb} (63%)

diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
similarity index 63%
rename from meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
rename to meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
index 90f150b6e..a61e7648e 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.2.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
@@ -7,5 +7,5 @@ inherit thunar-plugin
 
 DEPENDS += "taglib"
 
-SRC_URI[md5sum] = "0106e900714f86ccbafdc72238d3cf8d"
-SRC_URI[sha256sum] = "056d012a10403ee3e2e55b6ff2faecb796821de9ebee000315589b95d95ed253"
+SRC_URI[md5sum] = "5e332113e4b0e548ee7abd87629667f7"
+SRC_URI[sha256sum] = "e265c4415abac40337cc5566c6f706efcf0be4e97723abe22ba8b874c93a591b"
-- 
2.14.3


