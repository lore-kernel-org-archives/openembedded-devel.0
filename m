Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 80A4478596
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 23:05:01 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id l27so6808603pfk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HLd9J4KxM/J5/cvn6oT6HZSLGna8TQzahi5yLBxqyCA=;
	b=VZERDVQvBGVWiU6QFiAyh/rDMCwvAVFXXC38/q//c4DQARc3povKcPft3HZ6sbr+gn
	yDUUuDKbI+jYMD3gZdMNKz4aitj+CKKSPtcnogA4UNxX8L9xYxqIGMY9K7MXJkfy7QV+
	wo7k5TZvn1ufuCKHtQVBW6Ig3H8q8WAj/4Np0aVWecebGu0ILjnvIgmoIB8FfoPmoYiI
	n3ja+v/7q/JI0fEmUlIfinDdg2FRyyJhSdHywwF8KPHVP1XpQmXDr5JxzI8mj2g+QgT4
	iy3RfFX6PAA3+WXjQH++B/98wIU5CI4wi/5b8+ELvSna1b9gc3r/g47J7BRQCPtanc+N
	bXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HLd9J4KxM/J5/cvn6oT6HZSLGna8TQzahi5yLBxqyCA=;
	b=ohI9hdkgi5Kv/8SNUz6md9CVX0OqSMZE6gNmE+MBQCceBuHy6OrwRZ6sllcl+rKK/c
	TpdZ3X/loWhkPE3Lf4GQLSzVjEQTae5yHPllX9EPCsq7FCoVrTlSDdCqIzdRfyIcuw9T
	xqQpp9PiV/RPZXLAIOYcB03DiMXodWNRkpbEx7S0X6VeFWBB8qj9C+V1ut1vnn7NBiJ/
	Qzh3NHO7xVN1AY4PeI6Pp3z5IM3MCnrpKPi0MoLGViiVmqGAyVx/aorv6H3I7pnwLmiH
	dys3OU//wG+t2PU6FDJPtqpBPAdI+2kMkgqtwrGu/23SOg213yg08mmllRkC9LCHF8la
	uHXA==
X-Gm-Message-State: AElRT7EtiH34OL1dtLJeuT59d//KIbWaaC+1UhvPgYj+lmp2F/5381x9
	qJt4YvZofeMk8ZSFYRt7qUmNEg==
X-Google-Smtp-Source: AG47ELtqgh08NQP0jlD8KVcVwVtojUPG72ao1ZveFVXkbEguQgGMDzjRSiXcnok5WPsjt23pAOJ0vg==
X-Received: by 10.98.89.23 with SMTP id n23mr22304684pfb.211.1522019103200;
	Sun, 25 Mar 2018 16:05:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y15sm9174945pfb.37.2018.03.25.16.05.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Mar 2018 16:05:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 16:04:52 -0700
Message-Id: <20180325230452.40908-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180325230452.40908-1-raj.khem@gmail.com>
References: <20180325230452.40908-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtwebkit: Update to latest on 5.9 branch
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
X-List-Received-Date: Sun, 25 Mar 2018 23:05:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 0f5cbbc..eb73170 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -102,4 +102,4 @@ export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby
 
 QT_MODULE_BRANCH = "5.9"
 
-SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
+SRCREV = "bd0657f98aff85b9f06d85a8cf4da6a27f61a56e"
-- 
2.16.2


