Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SbyMG-0001Yj-10 for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 20:19:56 +0200
Received: by ggnp4 with SMTP id p4so4234899ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 11:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=o/ZSReYzdByjHttM9SZ7YyltiBEN/a7/0WdHppzF2cE=;
	b=pZdD7MfE+s//qsrPY1Qc+VI1xAEy6vl7/f17dKAzlM0IEPsXotlvBhULJySQd9R4hp
	kz5UCmDVFZ83X7adarVGvpQMwMMgHQIeo462G7vipFYGp3QaZoXhV2mDgrHHAKt41gEw
	U+eqqKh7nmcxX51mxq/trJEWqr8bWnmb9beWyQhJRgEaK6kfozBYRNe/Rp39sXATec5r
	9rfYv0bdNtNxEFUxYX7TuWUCLqOQ5PjfBc92TCPvdgvwgG5oD1nIPD1t7Ysh5d0Y7D9Y
	WR7/5ngAtUuYfTc1I9ho1UChxRoFZwKdkUaZSnBZ1ShsB/0Umf6ZOH4MmaPimjRC3pH4
	41tA==
Received: by 10.236.46.74 with SMTP id q50mr12758378yhb.30.1338919769188;
	Tue, 05 Jun 2012 11:09:29 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id
	d10sm3135617anm.17.2012.06.05.11.09.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jun 2012 11:09:28 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2012 14:09:16 -0400
Message-Id: <1338919756-24482-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkbORF2ssNfRkjdvyIi2Xe6ATQLEIkTFO7RJo4mD0q423rKKjY+WOFkzkTPC8SlH4am5Cey
Subject: [meta-oe][PATCH] python-numpy : Add missing dependencies.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2012 18:19:56 -0000

Numpy was missing a number of dependencies in the .bb file without which it will
not work.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 36ab622..bae624e 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -24,3 +24,8 @@ do_compile_prepend() {
 
 SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
+
+RDEPENDS_${PN} = "python-unittest \
+                  python-diffutils \
+                  python-pprint \
+                 "
-- 
1.7.9.5



