Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC6A671987
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 07:41:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 144so7046519pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 23:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2/vGuuB8xX0p+68S2XHr7Ar5S5/3c8rPtjd1T+TUGqU=;
	b=dpB04bQ7s2I/jQ61J4EfxDgRPsVqFrt6gleUrilUjjCqfq46HjlmnEeEYfjMuotvDP
	WNsg/LAKW7PqgLa73uu9Hl//SSsoDVVRwwCiMCwVD4s7gwkWiQbrcgoeFSWKqAJtTe5h
	yPcVHgax8wjWZj+RsgkTQCFooY/XEZNkfq1egZtFkDUA44Jyalq9U2YO44Ai3Pe4MFzC
	aq/DOyZZ4Aw7GInEisy755GnlOvoAgIiAqLdB4mHkg8lm0Wiu3Oo8Z0lv2KsfKYrfMOX
	Jx+4Gw2mWW3SRTczROLdRylvE9pe6gHOjvWuTWr5Fxoxq7UoTrKX9YY6GTb552lffmhE
	qYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2/vGuuB8xX0p+68S2XHr7Ar5S5/3c8rPtjd1T+TUGqU=;
	b=QR2Z1HHynxU9YXTCiO9HvuI5mY10gj4nCmOwTzX1FbYKt5+UhoYoW7V1J1itK7LIpv
	OFrO15sfBN9Y7kKu3WoQ3rbxLX8IY+FggmbwhAgnwjW0ESnvfqwgQPpgjGqnf8Equh+j
	yLghjuaDqZX/0yJSGy3VxCFlNzCJJOuDPG8OerI+i3Ytu5f2yANK9tSwh4vpZR62Ou9k
	vnWUS9L3CR1tqJ2tL3oT2TYTfRznIS0ZVNY1SSX/zAunesNCDglWpRK4UEEJpufe+LOh
	gLjnzZb4ZxvnRs/Hok5Fnqs/R2RuDVJwLDk7WzDUGVW2/CuUmk5XBXayOyYHj70erlcc
	Vnpw==
X-Gm-Message-State: ABUngvdDG0OCQ04sM8KDxBP5onnan22c9MHS93E0kShRvTed3R2+1ydT66LgMKPAQYu+rg==
X-Received: by 10.99.221.85 with SMTP id g21mr8909688pgj.121.1478504463538;
	Sun, 06 Nov 2016 23:41:03 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	131sm37626623pfx.92.2016.11.06.23.41.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 23:41:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:40:55 -0800
Message-Id: <20161107074056.18613-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107074056.18613-1-raj.khem@gmail.com>
References: <20161107074056.18613-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] lockdev: Pretend GNU libc on musl
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
X-List-Received-Date: Mon, 07 Nov 2016 07:41:02 -0000

it has all needed features but expects " -D__GNU_LIBRARY__"
so make it happy when using musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lockdev/lockdev_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 023b9a7..507ce3f 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -18,3 +18,5 @@ do_configure_prepend () {
     # Make automake happy
     touch ChangeLog
 }
+
+CFLAGS_append_libc-musl = " -D__GNU_LIBRARY__"
-- 
2.10.2


