Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91C6771E4C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:38 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so15952204wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Yq/TO9LatU+8vvNIuWDk172wUn7FG0vxbsPM2J5vw4o=;
	b=oLWbhRA7oY0N7GGS+nNjJ88ptnPEldxc00K5456ignVKEeSW/k43MyP2ve1uIOUJe/
	xDchD/bab7E69FE5y3w/UL+D3OYmMIU9sPrK/W1/BFr01FMfsLnmWSbLJNxgtc8r8LD1
	Lo+A1iueOJ5WjR6wpUG/lZi+kqhtXnzI+Y44jWdhWnBEBEuGGyknbVD92QEe2BUxq7vc
	+GujNY1/YPsWGHTVNYjMH3KLqaubV7v8k6OBWtLJuzcUFuXnq+B6BVYVIMUnjHjce9y4
	G8ts+YteeQEZM0g2HeVpDjqlY/VodGvj26TwaTLJrZROw+RE+SnNPYQOVgv9kHpPLhKV
	aoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Yq/TO9LatU+8vvNIuWDk172wUn7FG0vxbsPM2J5vw4o=;
	b=VX3ZVdv0F9drmoxbkpmxjG8NsbeE1mYgDoUK0RUQ7BJ2fTMDlBhdxCSLmTBfzjqNvK
	o+tV5YxIDoRri6fKOmFqj6MjJ0fZ4zNIiAU9RDVe2vRz87TR0ff4y8dNtpEdtNMVDZ7r
	/6WZWNsGqg3ZF+IjUx2c14mjfelxgev2g+uYvW5tWfCVHB2NQjwUNmm9lTLkXZFVb/ep
	twdPkaryh/ObrbjWZEc46AxN2+LWMKlSh70dZ9sJcSeFW4EOuDhsEIUSH7byJ0zW+e2O
	aiPXChf3xFc/Rq43mqala7CAKoLUoCFomTqXhDIF6RFmMyeyHTzIMbk3z8wmI0kQmnBq
	A9HQ==
X-Gm-Message-State: AMke39nYuTBD9VSaVm8eKlaaAeXmqx3QzHKh+1sB6MP66qu1fAOOKJlhb7zExDa5utRV4w==
X-Received: by 10.28.128.205 with SMTP id b196mr15767097wmd.21.1486933358258; 
	Sun, 12 Feb 2017 13:02:38 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:16 +0100
Message-Id: <20170212210216.867-12-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] geany: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.29.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.29.bb b/meta-oe/recipes-devtools/geany/geany_1.29.bb
index db6a34a..f979b71 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.29.bb
@@ -2,7 +2,8 @@ SUMMARY = "A fast and lightweight IDE"
 HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
-DEPENDS = "gtk+ python3-docutils-native"
+
+DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native"
 
 inherit autotools pkgconfig perlnative pythonnative
 
-- 
2.9.3


