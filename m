Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id D181F729F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 00:02:32 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so3496376pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2015 17:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iqyamQiMkTVQv7D+ixCpJY0lZtMhiRW/cplgBJhT5lU=;
	b=w8FY4MS1qTtstbdICulg9uK+bo+SouZRJDEsYwfnEFa8bon1TbAe0zc/NPXtm1fGhY
	PwP/w87xYRPPPm3pxqStN92Q3fxwVj/dS7hezFqoci5Vu8R3EXJLzE817y+k/oUWGk5g
	QpRqZvSwBIDt7wRQViVkhm/XRUoSZaTOI3N+BY6yGiCk0vIxfup8HTXMw6UVdwu38rUB
	iDtKnK6Ux7k1KVSYvFUDaEG3+FSAM4C+I3DT+0gXNIwcZtLGVlKY8O0s1Nhw6EfScT9u
	s61NWqseucE7P/c3PLnO0o0jPgAmGS3dWB2NbKGecrRvT2ypBYA6CRVQnagxxT1eCIQc
	+M/g==
X-Received: by 10.69.12.133 with SMTP id eq5mr60012324pbd.158.1428624153731;
	Thu, 09 Apr 2015 17:02:33 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id mt11sm179543pbc.20.2015.04.09.17.02.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Apr 2015 17:02:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Apr 2015 17:02:30 -0700
Message-Id: <1428624150-7753-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-ruby][PATCH] bundler: Fix QA new Error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Apr 2015 00:02:32 -0000

ERROR: QA Issue: bundler: Files/directories were installed but not shipped
  /usr/lib/ruby/gems/2.2.0/build_info
  /usr/lib/ruby/gems/2.2.0/extensions [installed-vs-shipped]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index 2adde4d..27ef7b2 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -26,4 +26,6 @@ SRC_URI = " \
 
 inherit ruby
 
+FILES_${PN} += "${libdir}/ruby/gems/2.2.0"
+
 BBCLASSEXTEND = "native"
-- 
2.3.5


