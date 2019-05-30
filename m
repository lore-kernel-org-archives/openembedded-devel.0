Return-Path: <scottellis.developer@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1C427D41E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 09:04:49 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t1so5999395qtc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=78eJMesgAIPqq6iG+16fV18sGQZPs+JxEaLduget7Vo=;
	b=eTYJsaH1CoddVsk8p5+O1lzJYt5FPKVwwq0m6NQou2F+J0gD5I6jwxoRodNg79mRTv
	1rjOGYqQ+bI+KrO4U5diXih/+Q0rlHFVz3yh0D/VUvU7WQQcO8HTHrs1FESElnN5wkTu
	9XkS8aC9bo7r66dJiL/dPBWe2Vegu+X2K7KfcdIwP5Eo7bu6QtToLFZgG6NRov6F+CJy
	eAAMEKPQiQXZZRAR5Y38zL8HsISm0fXyyR6PB87yJy3g8OU5DVhY6pL/2+vbA6EyNftN
	JIOoa4eF077VWWgWmofrrFJ+UenhGjpObVYimVcKe47f6kYV5ZUc+Q4V5rL42nvrVBzm
	XVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=78eJMesgAIPqq6iG+16fV18sGQZPs+JxEaLduget7Vo=;
	b=a9PR6ugIdgy8HKg/HGAYlHdWSu58jFFZSOLdTQ+1yAq+nEZRl/jW3rRdeUcCmbaGHR
	ORwytVk85E4G85KQYpyxxnZWOj2SthShO/6UqcU9YHb+xLNIj9Ci7y4cgb9D9cV747So
	Phq65a8poUGeKDYO93v3u6b2JOpSTvOD3hahWyOe0AuSOKe62ExH+dSoDUn2uyXiTJvb
	wMot/Lcdn4wp277DAHjUPt9NYD6pUh2cbDPk5ReiX2dJukgZO0iTIl7TumIj6RWyW8GT
	wk9CtvFgibcM06BFZRsNTvHgRajl3YZge0VQ5A0vkMueyt9p1jYnBZUiFhBqUKGb2Hp4
	rqwg==
X-Gm-Message-State: APjAAAV9GEFjZr6Bf/vXtYgHslq82aBTOuGL5hZr2o0jdm8OdB2DVUyX
	uYnl7YQpKpr9UnTtGTdXrIXpap8x
X-Google-Smtp-Source: APXvYqyqLf8rzXU3776PMDsXM+cmiEUM52l2CMJ7iGyhgn+Ljq4mNdP7WETJGnHWhFBLB+OX74koeg==
X-Received: by 2002:aed:378a:: with SMTP id j10mr2461451qtb.6.1559207090807;
	Thu, 30 May 2019 02:04:50 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	e66sm1241083qtb.55.2019.05.30.02.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 May 2019 02:04:50 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 May 2019 05:04:14 -0400
Message-Id: <1559207054-32056-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][warrior][PATCH] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Thu, 30 May 2019 09:04:50 -0000

Fixes issues with kernels 5.1 and greater.

Backport from master fc1b5310b28f70900a8a432048e08ee06ae309d7

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
 ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 8314e79..5cf745e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
-SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
+SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
+SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


