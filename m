Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D00570A8A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:39 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so2380957wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sroOh8zYApIiqRqhkh0l5YBAhAPKjDWVG1m2/GZV+Hg=;
	b=fqrxnRxTZFCRaQASVXyKT+0A+I9W8I8DLoD/ah0IIX9XLu4NgKGO2tvC2mBX05xRtg
	C2fxy9RZAOYvjTY4wXT2WTwktqAF6d/0ASRZ6xH4tUi2gO5PujzAQUsiwojEwo8BZKPv
	EozpQvgPPmFqZrF0I39G0TPp5CWAIAGIwE27HTAQO95uvAN4KpDlIwbufz2srWoMtsJg
	flR/Z0NJkEzyi5pc04e/PwRwu5e5oMhtrLhqwhvWqSsY1xKvs2jALO9wqdTcB3+N1N3H
	vaJlpbc3tQny6ClhnHM54SlBkAMhJksgLSAGeSEEeIworo4DgRodyF35HkoFDW4tDIGy
	Lp3Q==
X-Received: by 10.180.221.134 with SMTP id qe6mr11775077wic.66.1407600521006; 
	Sat, 09 Aug 2014 09:08:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	co6sm25521253wjb.31.2014.08.09.09.08.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:32 +0200
Message-Id: <1407600537-10857-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/36] engrave: add dependency on flex
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:40 -0000

* fixes following floating dependencies:
  WARN: engrave: engrave rdepends on flex but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/engrave_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 92d7ca1..20da907 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -2,7 +2,7 @@ SUMMARY = "Engrave is an Edje Editing Library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=edf2d968b9eb026bfa82cccbd0e6f9f5"
 # also requires yacc and lex on host
-DEPENDS = "evas ecore"
+DEPENDS = "evas ecore flex"
 PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-- 
2.0.4


