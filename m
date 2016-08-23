Return-Path: <net147@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 555F073257
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:16:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so7824815pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2016 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v2ybXpuGTjNuqdDxBUn6aFLP/3nap0V0zot90kGMieg=;
	b=O5oIbpcPToluQOZqthsYM6uWSAmfZnugbIDQsIdAk5aXYmV+/cnGiuh7tOO4qoyz9R
	GO4w4ttZDTwzmZNL/ET4RJQ2Gx5aNakIGfH/3OqcF64lQkvxtmBSf59XY89byxk9Pxk0
	iWZ73OR52F70Bc5O7rEmtg+6Pwpp1eSTKyKsiVhTryi3uSlKxkAtX4nFSxCovJvSp4yG
	2higsVaVASa/fFmNuXaVUnG9yonWgk2xbjLlpXpmG1A+EXo1irYU5HvKnQfqlb9gF1bx
	vgAQktu0/qe3N5yDwcP2Foh8J4BDA6+Wg4jdvuJs0xlalcNc83yWubqC69wS9I8069u9
	9sQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v2ybXpuGTjNuqdDxBUn6aFLP/3nap0V0zot90kGMieg=;
	b=GEsVgdhULRkP5n1UtrmrSag5wsL93EybPZr4YBSAqtscz7QMePpd6fez0IssYYQYpG
	7Xu8w6DwUJsGJxgTUx6N5CLixNe6GMdRUsUsmV1Lttmt5mPWM1JCNyErlOCF4NNWS2ZN
	gOeN2jfenlmvopMu4nAeXxqpBKFQxgKzNk26oRdLDXzS4UrZ82Tl12C5y3xpQMt4jHyX
	ryGAI0GlUYjqScNreZHZwADHWraFGd0VI0YqOmdFdZ7gQ5oXFhZdjuLSd8UItpTnqU26
	TCwM1kXpBQU0ZHf3hvaw0pnjxg/2QMw18ROekIE3JH86GaXN73GbEJY0g0YHE/Vn0Rdu
	4NTA==
X-Gm-Message-State: AEkoout93RcJJO8KXL7qvuDinFcVTyhHvugRgJvzFVnb1r/To2xf5FT5LkORiwfBdlAhEQ==
X-Received: by 10.98.56.207 with SMTP id f198mr50691878pfa.83.1471940161812;
	Tue, 23 Aug 2016 01:16:01 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	t126sm3297179pfd.28.2016.08.23.01.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 01:16:01 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Aug 2016 18:15:36 +1000
Message-Id: <20160823081536.32366-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][PATCH] qtbase: avoid QA warning if PACKAGECONFIG_RELEASE = "debug"
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
X-List-Received-Date: Tue, 23 Aug 2016 08:16:01 -0000

If PACKAGECONFIG_RELEASE = "debug", an invalid PACKAGECONFIG QA
warning is shown. To avoid this, we add dummy debug PACKAGECONFIG.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index f69c33c..e633d01 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG ?= " \
 "
 
 PACKAGECONFIG[release] = "-release,-debug"
+PACKAGECONFIG[debug] = ""
 PACKAGECONFIG[developer] = "-developer-build"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
 PACKAGECONFIG[tests] = "-make tests,-nomake tests"
-- 
2.9.3


