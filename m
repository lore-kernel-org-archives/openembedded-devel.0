Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id DB6847321C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 12:23:09 +0000 (UTC)
Received: from [10.40.100.13] (port=49893 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bcXD2-0002tp-0L; Wed, 24 Aug 2016 14:23:08 +0200
Received: from clang-buildbox.bmw-carit.intra (172.20.20.251) by
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Wed, 24 Aug 2016 14:23:06 +0200
X-CTCH-RefID: str=0001.0A0C0203.57BD91AC.0049, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 14:22:33 +0200
Message-ID: <20160824122233.19616-2-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160824122233.19616-1-clemens.lang@bmw-carit.de>
References: <20160824122233.19616-1-clemens.lang@bmw-carit.de>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.251]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gitpkgv: Fix $GITPKV for a single named git source
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
X-List-Received-Date: Wed, 24 Aug 2016 12:23:10 -0000
Content-Type: text/plain

Recipes that fetch from a single git source, assign a name to this
source and do not set SRCREV_FORMAT to this name will always get
a GITPKGV value of "default", which causes version-going-backwards QA
errors.

Fix this by automatically determining a suitable SRCREV_FORMAT from the
SRC_URI if none is set explicitly. This code does not run for multiple
git sources, because bitbake's fetcher enforces setting SRCREV_FORMAT
when multiple version-controlled sources are used.

Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
---
 meta-oe/classes/gitpkgv.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 4866fac..8cd4bfd 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -61,7 +61,14 @@ def get_git_pkgv(d, use_tags):
     #
     format = d.getVar('SRCREV_FORMAT', True)
     if not format:
-        format = 'default'
+        names = []
+        for url in ud.values():
+            if url.type == 'git' or url.type == 'gitsm':
+                names.extend(url.revisions.keys())
+        if len(names) > 0:
+            format = '_'.join(names)
+        else:
+            format = 'default'
 
     found = False
     for url in ud.values():
-- 
2.9.3


