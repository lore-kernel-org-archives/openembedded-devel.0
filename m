Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 20FFC6B7AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:27 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b15so5897426eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K7rV+eXVr16O9dJdfLXeuqScTmWQCIyckastHnoD+tc=;
	b=z2ZsfE63kQm8XZ7ZQeE+Z0opY0OVW77khAmzFY3wqYM+23RKnQNE9Rpceeq/874FuJ
	3Nc6+EBgEW2qXHsv34dZWeQsD/xs47XpH1LCmaV1o1HFwooOG2WwDpPdKh7OoWU6l7mi
	KveSRdqgAhWKBP0T/V7A2p33zb3sqxevU+bnfNjoo+pTOmsmiUfhYmkxnvdIs/kyLIEn
	BzkR9pViWPk9SLqVJiyMp44WJYHismUEKhDPRIHYG1rkXqWGxNdWaZNb69YbAWMBEKHa
	t8tV3IoOQ5CTQgTpg7CyQkxjxvEiz4P6Ta9C4bCT7UEvP8ZgYCJOan7RuQeFTe7PJMrJ
	7zVw==
X-Received: by 10.14.220.136 with SMTP id o8mr11100083eep.97.1388581048839;
	Wed, 01 Jan 2014 04:57:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm126883716eef.9.2014.01.01.04.57.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:21 +0100
Message-Id: <1388581046-8713-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/8] qconnman*: Fix branch param
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qconnman/qconnman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman.inc b/meta-oe/recipes-qt/qconnman/qconnman.inc
index 44ad9a1..664f2a0 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman.inc
+++ b/meta-oe/recipes-qt/qconnman/qconnman.inc
@@ -10,6 +10,6 @@ inherit autotools
 
 PV = "0.0+gitr${SRCPV}"
 SRCREV = "f976b18c7c5584627224784801803e9fd3ebe0ff"
-SRC_URI = "git://github.com/OSSystems/qconnman-ui.git"
+SRC_URI = "git://github.com/OSSystems/qconnman-ui.git;branch=stable"
 
 S = "${WORKDIR}/git/"
-- 
1.8.4.3


