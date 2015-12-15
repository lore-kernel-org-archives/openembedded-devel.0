Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 177937317E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 09:44:54 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n128so2100092pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fzsqGqKZotInE4iX9Ef3ByHV17MU8l61DA3zY4Uj0vo=;
	b=DZbFoT2SPDtLzlpWegMLfqJUMlqDnkAxnCZ63MbYB9xqaUWkgPHFiDUL8jByFDmFbE
	pVw2Vx6YR4jNcPRh/N05k0bjISvcS56Io8uYIwCPxQcF9pp3Fd2bVBkiexuSt74Vw3r/
	ImgTtv63RmnvvJRILUELI9FPQ2z73xVUz6+YKJ8Os8LQRPREkLLN21Q6WREBTpTabdvs
	5bK1zwuXJ2GIHhREP+6J9KIxTWmNhKkBQRIAfkhdXfv/siuvAQCJVQ+QQ+PqHHlSNd7s
	utJlxGg7Aa8ywU5nKOoTIWaHHFMIeURvPtlBJ0cwN2lwreBtDGbJj5PXouUtxj5rZaTd
	PECA==
X-Received: by 10.98.13.195 with SMTP id 64mr43646724pfn.147.1450172695628;
	Tue, 15 Dec 2015 01:44:55 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	qz2sm1072662pab.14.2015.12.15.01.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 01:44:54 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 20:44:29 +1100
Message-Id: <1450172669-20882-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1450172669-20882-1-git-send-email-net147@gmail.com>
References: <1450172669-20882-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH 2/2] README: remove meta-ruby dependency
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
X-List-Received-Date: Tue, 15 Dec 2015 09:44:57 -0000

The ruby recipe has been moved into OE-core so the meta-ruby layer
is no longer needed as the ruby recipe will always be present.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 README | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/README b/README
index dcfb5e5..9817851 100644
--- a/README
+++ b/README
@@ -4,11 +4,6 @@ URI: git://github.com/openembedded/oe-core.git
 branch: master
 revision: HEAD
 
-URI: git://github.com/openembedded/meta-oe.git
-layers: meta-ruby
-branch: master
-revision: HEAD
-
 When building stuff like qtdeclarative, qtquick, qtwebkit, make sure that
 you have required PACKAGECONFIG options enabled in qtbase build, see qtbase.inc
 for detail.
-- 
2.6.4


