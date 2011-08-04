Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qorsq-0003v6-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 08:58:22 +0200
Received: by pzk2 with SMTP id 2so865190pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+8LiOCagCmoKTF6LhIRYqBoubofqE/dDkxuz+cRciwQ=;
	b=naK69Ai9Ws6FauUnFIw8qPR7FEB8HfhC0yicMHBPkiL5b73lrKR02MhGFm03FPGeaX
	ZSo+pJQVa6n8UZDwfcS67kmnFvyZCQ6BNRnlDBrrS6e8pqA27QTGJbJApJSVnP1HBGlh
	ejFvFnxxQjVJLHYC8eCESRJSXE15Zf4+R07Ck=
Received: by 10.143.96.24 with SMTP id y24mr469206wfl.113.1312440836423;
	Wed, 03 Aug 2011 23:53:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m7sm1877986pbk.70.2011.08.03.23.53.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 23:53:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:53:43 -0700
Message-Id: <1312440823-27671-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] systemd: Link with librt explicitly on uclibc
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
X-List-Received-Date: Thu, 04 Aug 2011 06:58:22 -0000

Latest systemd has started to use mq_* functions
which are found on librt in uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index af4a9ae..fd9bfbd 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -29,6 +29,8 @@ UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
                              file://format-replace-m-uclibc.patch \
                             "
 
+LDFLAGS_libc-uclibc_append = " -lrt"
+
 S = "${WORKDIR}/git"
 
 SYSTEMDDISTRO ?= "debian"
-- 
1.7.4.1



