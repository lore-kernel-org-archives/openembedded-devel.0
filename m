Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkpS-0001Qe-01
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:56 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so3235883eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=euFBfXjroenvP4aNHKMjvaibCIuzuQ0i7m5/AoIog7Q=;
	b=P6r0Dk6Yc+8/VNzd9HHQyHN2tVLaURYLl7DWa6gxWFc/16FOs69fRqGo0AUhpWaWbv
	Qk6t7NdjZlPmPnebvrrnGfwTkxLtiZ1VqOFHjtPyhGXonoj6lF6PZrqhh/+Nc/hPS/8E
	vhitvEzicE75st9TXjXlfrdYxW7Pol9bEjTWuoh1WclJC1lEXmiQmP3Souw5jG9csZRZ
	WT3fcQvoK7jZJiq9hE7DBFEOYU4kM/KzPPQDw+QG9lkJ704RsRZAQc9PHlLYz6F8sqbN
	SHi4JbrX1ThqUHBOeWA0LKWFEeAPzXT9/D2PEhGKHUkjPXzWUQ5drqh8OG1jVhlQtb1b
	6b+w==
X-Received: by 10.14.184.134 with SMTP id s6mr47514748eem.43.1356265445695;
	Sun, 23 Dec 2012 04:24:05 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b49sm34586507eem.16.2012.12.23.04.24.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:39 +0100
Message-Id: <cd3baa9a9f918912e2daad55d76ec7673ab755e4.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/30] qwt-e: exclude from world
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:56 -0000

* qwt and qwt-e cannot be built in the same sysroot, it's correctly checked:
  | Project ERROR: local build will conflict with /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/libqwt.*
  but there is no point to include both in world build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
index af9d956..6a80136 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
@@ -8,3 +8,5 @@ SRC_URI[qwt.md5sum] = "ace68558eab873e2da7e641179c4ef0c"
 SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924dbfdc8003cb2"
 
 RPROVIDES_${PN}-dev = "libqwt-dev"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
1.8.0.2



