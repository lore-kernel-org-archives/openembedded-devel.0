Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 038D3782CE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 01:28:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c28so1711716pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vWGgLPIMn/f9vheoRq/I36/LPjavtwCUb6u7OXr/YNo=;
	b=DE2k9elDF0Fn5LXLT/LeA/rd4hbEJ1/kVqLrpb6JDExT42x4S4DcahU3/kMcHN5oZU
	FRu3IAL5OT4OFnabLw6LCJDlViAJf/2FBxdCcKXcFbmOu69lnSTO9iAFrqXoh+qpmdDy
	moTm6nF7IVnF946PwDG1ZnqH7d6NqK/6930Y3kXUwheB/Q8m9zNn2s0ocVDGjfolMpPB
	WPbt5B3AItpGcjgHgNSEk7/K2lvAGG/hgpBUdxCpB8qMbec3VwRUdCkloX303OulaHYF
	pKnqzxtUBaGrpum3I6YGTp4+X+K6ndeDiuaw6fp6RQeOqSepHaVoLqahzRciMNJLFju4
	6W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vWGgLPIMn/f9vheoRq/I36/LPjavtwCUb6u7OXr/YNo=;
	b=GzF5j5trAaR/bCTpXcPnTBZsyJBGWB/DyieuTNFt8D+oJmbPQOio1bw5snzhitYsMg
	Uns62t35cqrjGcTA6PIl6JsMhK6OyjY5TnzMofX+qRN9E8PfxT3aKUJb6jr3qKC/zsS8
	rWx4My1o5WeEkKFV4AJudvnncHwEORu5LX2deVC+GT9qptE8XnL+zhvYbTbFfzEaQBzy
	l9c88daXPqmvWXmUP8YBgUQ2uK7jNQdqfjDw7CJOYYmK0hWNAErgjhirhM13trPDpJn4
	KSrQh0xwuVu6b8nizDj94EP+CqdgsAZzrkQ+m+clTIXOdPhUcCWEcCpt+uVeS0lcS4+R
	jaVQ==
X-Gm-Message-State: AHYfb5iGdPckOjjryBh89/WgYo2SGJ1J5IWLq9lVN5LpV4ueKCGGU0xl
	4Zizm5EnxxXMcKV2
X-Received: by 10.99.171.13 with SMTP id p13mr3098862pgf.109.1503797322025;
	Sat, 26 Aug 2017 18:28:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	f123sm19301150pfg.86.2017.08.26.18.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 18:28:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 18:28:29 -0700
Message-Id: <20170827012830.11782-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170827012830.11782-1-raj.khem@gmail.com>
References: <20170827012830.11782-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] irssi: Upgrade to 1.0.4
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
X-List-Received-Date: Sun, 27 Aug 2017 01:28:41 -0000

Disable perl explicitly, it pokes into host
its better to disable it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../irssi/{irssi_1.0.1.bb => irssi_1.0.4.bb}                   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.0.1.bb => irssi_1.0.4.bb} (50%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb
similarity index 50%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb
index 041f5de6d..10b04bb52 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb
@@ -6,7 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "f6bed196cef63ea089f5cce089784445"
-SRC_URI[sha256sum] = "9428c51a3f3598ffaef438c351a8d609cf10db34f2435bdcb84456226c383ccf"
+SRC_URI[md5sum] = "46d4ac2a7ab472e5dc800e5d7bd9a879"
+SRC_URI[sha256sum] = "b85c07dbafe178213eccdc69f5f8f0ac024dea01c67244668f91ec1c06b986ca"
 
 inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-textui \
+                 --with-proxy \
+                 --with-bot \
+                 --with-perl=no \
+                 --enable-true-color"
-- 
2.14.1


