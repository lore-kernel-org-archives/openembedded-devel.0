Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 45C8977E39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:42:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so18579145pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vT8ab7dn86XKTGJ2K+3/4yy4ux3GmOQDJywyr3fL3EA=;
	b=eObag+mlOfeL5u3T78Nvjyyu/0Zk3eYFnMdXrWpkzyjcc+YDJIqtMuK48igmmW9bFd
	XEKsj9uNyefN4mCJEL8nHndfAyi5sWcjMAb+LJ/MSguzpwg6K2h2p65ky+EyYe2/rN8C
	y/uqTihsIUzm4MLYZ6AoM+e8qoxzcFbr612dEhNZrCEQVDAAnCeL1MUANp6R3gic67gY
	d9akdyqf811psNqNxVmzix5tEP6g+yl8DzTUhLbhF9RSfzjPovLd7l7xKHqVYJjmusfz
	D1SCzHju3r18ikjegP6+bRzqlwOWx7Kv9apvHjeItJDd7kZ5GEqvYMP8L+5PBvWRghua
	bQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vT8ab7dn86XKTGJ2K+3/4yy4ux3GmOQDJywyr3fL3EA=;
	b=UOGDNnQbpCyYmSfFV/tKSaMCxGTMY1H33KQxYwmTPmaD9MK7ZeqA2la05nA/2t8LKF
	3fzR7MPMfAYkdY5WNPufGxZTQKjSnV6zxsxQO7cTaNf1UomIw21aj7wsURBznQUEzYVK
	8LlwDyj3hVrsTO206TPLUe9BVx6zvByuilL55GAVxFJHcMRHe0euxZ0CkV9TWd+EjuG6
	kj/FHOShCXpQefQ/kgZWdaTVqooNhM2sRDS6HLRqN5h5mo5NS+lU1jQ6UG5DHjLRjocG
	9ILYpi0Lq8HcHFBUUSXoJ9pI9qBFT9gNAHii5X1bokkmrD7IyvjLP8//0bw/NZJpU1OJ
	sDUg==
X-Gm-Message-State: AFeK/H1YfxNP1K/hfgMDgacJ/0om289yQRkBL93mh9nOwi+5ZDGcOFW/Rj5IV94Gbq6cmw==
X-Received: by 10.99.132.73 with SMTP id k70mr4125937pgd.28.1490978578484;
	Fri, 31 Mar 2017 09:42:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:42:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:07 -0700
Message-Id: <20170331164247.5052-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 03/43] ctdb: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:42:57 -0000

Fixes
| ./utils/smnotify/smnotify.h:9:10: fatal error: 'rpc/rpc.h' file not found
| #include <rpc/rpc.h>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index 7cea0f681..b5a60645c 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -27,6 +27,9 @@ PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
 PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent libtalloc libldb"
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
 
 # ctdbd_wrapper requires pgrep, hence procps
 RDEPENDS_${PN} += "procps"
-- 
2.12.1


