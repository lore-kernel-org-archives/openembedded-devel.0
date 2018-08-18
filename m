Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDA67548E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:42 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s9-v6so9817351wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KVdbIAGcmKATLYz65JcblpkfaHpaPuzz+yqsBQ43jaw=;
	b=HHA4lKiIz5cu4fEvxyq2KwEFUhEEYhSf/Qpyyp/auKgEDiAQKKnrJiANRGx1o3QJtS
	zatklekGXl8yA0mxG0VXygS4Ow+u7CC60Y1Pwe1Vcz2Yi5GXMkj8ajGfqGyoDUxsxBaV
	oVIFqj9vFRChxgJ6HO1BZqsBXTRWUL0GKefuoIZ1tfKSd9JnGf2867PB1Re7l0W1voyf
	o/tH8t56M0Vj7O5zhIkAV9HRDThwF0kxNsxoiXW73V+j7W4AvsLIbm8xZRptmWaLuTd6
	u1gQkTW0DgazIoxzIMBTvwITbiVPBALhVPYaV4Ifh79M0jA0OZE5TNfF6UYjva1kqMLp
	PRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KVdbIAGcmKATLYz65JcblpkfaHpaPuzz+yqsBQ43jaw=;
	b=Bu9jnGV/cT/bmY3DbDwjyrF58WG3PMdBMMflTZT110+48ULZIzVq5mMAEAOPqAoa8o
	YfwGpg1NfTGSt+imMzHQ47elWFjrEfMDL1rgCzPUpENorWQcF52z5FTYONHSFr/W3iW9
	yWmVnW07+iQPS/NKQGoCtsTTlP9monWna9TXVkMxRVJdLuJHEJ30lN5r/wrcphKyGfLH
	WtzCjXCeY6pid8HDHvI0E70sKQcjWYkMH5+cJ+9ZKY+QEE59dsruJXuvUB8dHqmpnVrw
	30iVzXuPuZ6e91+V5Qf34jUtNIKUEv0IK54tgEnVx6ae3blrWATtnSc/NmA9qbf0e7Nf
	NEew==
X-Gm-Message-State: AOUpUlGcdHaXSZLAFP1znJqM3XscZqmgV3XqYSR6nyY4j0BHS0Dou4vp
	VL34Zwp48KuGZBwfrAAAjw5BFefe
X-Google-Smtp-Source: AA+uWPzKK1rXIS1K5TKVIpvSis7m7aupLWLijZ5/SeQMI7mEEIWUKf8mrx3ioTfKIk3rFnmDiy20Kw==
X-Received: by 2002:a1c:4004:: with SMTP id
	n4-v6mr20478833wma.83.1534591602835; 
	Sat, 18 Aug 2018 04:26:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b8-v6sm4844175wrw.22.2018.08.18.04.26.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:33 +0000
Message-Id: <20180818112638.10006-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 2/7] gpm: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:42 -0000

* fixes:
yacc  gpm/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/git/src/prog/gpm-root.y && mv y.tab.c prog/gpm-root.c
/bin/sh: 1: yacc: not found
Makefile:149: recipe for target 'prog/gpm-root.c' failed
make[1]: *** [prog/gpm-root.c] Error 127

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 51c4dd6397..dcc9d68eaa 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -9,7 +9,7 @@ PV = "1.99.7+git${SRCREV}"
 PR = "r2"
 SRCREV = "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
 
-DEPENDS = "ncurses"
+DEPENDS = "ncurses bison-native"
 
 SRC_URI = "git://github.com/telmich/gpm;protocol=git \
            file://init \
-- 
2.17.1


