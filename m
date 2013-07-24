Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 090026B3AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:36 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so216956eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5yYDkARqpeMU+FB/1pHnLbl0wKj7mukG0MskpcfZPDU=;
	b=oMY5hOd84kdK32wR5n6KdFxgtIbeZb3raxX3c0WBjlKn9t5J+W+yb97uz0kkw9gtrd
	iyDHQk4UXwk2Btw8Sl+F0ss21c4WMAZMQI947l15CaznMwlVIp94yoDSmk9mBnmxaxmY
	+31NaNjdZ134SMMiRm7cBVLFs2U/8vMTAYYC3bD0c5PMaHJL4UY72tF25gy9Sa4z3l01
	vRsu51SzjAIQfhtDNziJp3AGR+SomoVBMB76UEd+XuZZ0+OoPFPhHRnamNEB+GW96JUl
	sTY6fO8xOgbhPCj9R131r65ke+He5vsgLMXE/A0ZZCeVsr4M1/xzW7+SSdGpupCxF9kM
	xIgA==
X-Received: by 10.15.81.136 with SMTP id x8mr37582940eey.4.1374669697355;
	Wed, 24 Jul 2013 05:41:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm65838044eeb.13.2013.07.24.05.41.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:13 +0200
Message-Id: <81e4760a0ce880e5bedd9a487f837fd116003ed3.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 29/29] cifs-utils: inherit pkgconfig
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:37 -0000

* it fails in do_configure without it
  configure.ac:99: error: possibly undefined macro: AC_MSG_ERROR
       If this token and others are legitimate, please use m4_pattern_allow.
       See the Autoconf documentation.
  configure.ac:140: error: possibly undefined macro: AC_MSG_WARN
  autoreconf: sysroots/x86_64-linux/usr/bin/autoconf failed with exit status: 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 07bf1b8..fc7a4d3 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     # Remove empty /usr/bin and /usr/sbin directories since the mount helper
-- 
1.8.3.2


