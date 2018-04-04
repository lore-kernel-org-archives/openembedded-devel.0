Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id A08387477A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 19:10:22 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id k6-v6so10309194pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 12:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vJchrHk7F8WUrwmzh6jBG8Df6uZl1GufnZhdkoEYe9c=;
	b=n5mj5pwtQ5VbiPTC8FwKx4wkJ6bCln4aUfE7KAmFwzcDIMKwC5fyrllU4CYknVFCFw
	Ue0sZAwOD6CkeCNfpTMv//kYnKAkIubFjfW4QeGwkw4hS3pjfqZ17QrxsTWJwwpvg1qO
	NQDAs/OrR1iXoCiVI2r6pGHbtfP4unOFVlksw7FBaaAJcocjSV2EzbUL9/ooWOhSE996
	/WATnYZVEy9poJ7J8YWgpx7jTm9cB9zK541vU7aJh6Op7UuJF+BlMiHJgFwANH3b1mEh
	dlcu7mQwZMCX1DWKiQ7/ycAidtyDj6oRMJVCJySRQchOvLeeGw4gVJqt18GgyJmw6AzW
	cNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vJchrHk7F8WUrwmzh6jBG8Df6uZl1GufnZhdkoEYe9c=;
	b=quPJkYUQe5eJjgQCCCLSHyTep881gXfhKFDtdyoC02Hq6juCxryE1UC36B2k0oHEPW
	NxIkEaeX0azvBlO1I8MKvKvn6rL22illiFbeTyNB6xlaWUdA5vbDzGql1uLngacK/Blv
	G5HnC5bVfgvRTDyRJxVug2UHXfgxVH9gF0q9fL2pQ5qs8l+neDuNxHqpdd3JVMnRJQwq
	FohvgW+4Kh/Ky9p5JEq/Axd0d4WHcegrXBUxl+9k2cNEXNqUkMl89j9Jf/dLbl5fg9Bh
	qhYA74/eYsVtvhA6YHEIeVSXTPZ8PGjYG8H59BPiS4lwGErMaUXNxcLWlVCLDTqASEor
	COGA==
X-Gm-Message-State: AElRT7FIS92fFcjBH6tmxk8gc0TfrlJgBEJDC7b4j4tXcq7tJa4gUPlu
	t0uJlYaWKeh/J5jCmQU3XLcHWw==
X-Google-Smtp-Source: AIpwx4+V9gUEVNNVOO13rf7RCBNs4djRdlsTuq180IxpuH12tyXWniHP+lrdsJVSg5u19fDuKPbLXg==
X-Received: by 10.98.61.206 with SMTP id x75mr14665081pfj.233.1522869023279;
	Wed, 04 Apr 2018 12:10:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	g9sm10325912pgo.22.2018.04.04.12.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 12:10:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 12:10:12 -0700
Message-Id: <20180404191013.38136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Update to latest on 5.9 branch
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
X-List-Received-Date: Wed, 04 Apr 2018 19:10:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index b23d4d6..e8c0868 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -89,4 +89,4 @@ export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby
 
 QT_MODULE_BRANCH = "5.9"
 
-SRCREV = "97c4a80a1282c8c3eaa343011286b76fd4838c5f"
+SRCREV = "bd0657f98aff85b9f06d85a8cf4da6a27f61a56e"
-- 
2.16.3


