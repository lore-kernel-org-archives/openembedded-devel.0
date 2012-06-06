Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScI5e-0000bz-F3 for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:24:18 +0200
Received: by yhjj56 with SMTP id j56so4953012yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7kP/2Ck8vuZDa6kx5uSz4aHzYcZRsMAPztwqWgiNB58=;
	b=Y+ONNgkLdj+V1EsRcAPqZPd3mQwQ8xmnIyYSH2zLu+7IojMZ/bITopmUy6B1QKQtZ+
	BkglthscItz+Rc8gFtMQVX4oiibg2fCyofiXSFLlnOPiXXSJ36N51qU2w8NR6+Kn5DoY
	C5M+jgrxD+MHpx018vzqfiELNF4C1uVlp233qAX7tf+Aesk0+1qauokXNqIluH8iQSg9
	MjhEJGU89lojVSJKJgJzs72TR9nAcTJ2ZwurYmwzmeJwkmHet4cqjE0cyMnhqdhY6sXL
	SmNP+EHNBkSRRSMA8mbe+MJudq9bhBgljoXAlMEr0moYNytyubFjfkjd2vXOjMB77nKy
	Ulfg==
Received: by 10.100.230.4 with SMTP id c4mr3511093anh.83.1338995614624;
	Wed, 06 Jun 2012 08:13:34 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id w6sm257888yhi.22.2012.06.06.08.13.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:13:31 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jun 2012 11:13:18 -0400
Message-Id: <1338995599-32521-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmHBp98W9g0Oe+xOJZ4hh0KhrkOuCBRJAMXzi7eKba5aGthMEknFsseDv69ZWEA3eBWFj4g
Subject: [meta-oe][PATCH v2] python-numpy : Add missing dependencies.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:24:21 -0000

Numpy was missing a number of dependencies in the .bb file without which it will
not work. This v2 version of the patch fixes the difflib dependency.

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



