Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CD94876B49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:44:11 +0000 (UTC)
Received: by iodt126 with SMTP id t126so157963756iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V7YFy6eM5ZkV7lrdnxywg/HFnBQ3loADblxIqdIg6fk=;
	b=R8pkprEnvpV5EGEdxAjUqeDe9+d26g8Y3TYCcIp5lLDwP8uetBxtk3wLvxnmG0y3+R
	teDo3dNHjDGqixEEHGDdPYmoB0dpac5dX8eb42h9t2/NmdOKqVFJCYDrtAeN+BikAPHX
	qdaawvfUhgrDZ6eYuXgcq6UBuE+poTrPzHGD8HIWqAm2ueQKatdJJvED5jG9unW2DsxD
	f5apl6KrWnOV/KOC/L/kTB3sMPGMsmyg/6SuYP5ff2QwhdPJp/0W/SdRXFjIbmYpUBIc
	dfYXszSNEZeNZwPmQ3XNvvM9vIG+v5v/VCHFQY0CgJW8E/ZMVBJOoo6oRY4HnaZRSAOS
	qf9Q==
X-Received: by 10.107.10.201 with SMTP id 70mr18204587iok.45.1440438251655;
	Mon, 24 Aug 2015 10:44:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	ht6sm9289129igb.11.2015.08.24.10.44.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 10:44:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:43:58 -0700
Message-Id: <1440438239-19765-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH V2 3/4] README: Correct syntax for git send-email
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
X-List-Received-Date: Mon, 24 Aug 2015 17:44:13 -0000

Add some more help on sending more than 1 patch (if needed)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 06335bb..e9ba2b9 100644
--- a/README
+++ b/README
@@ -16,7 +16,10 @@ for detail.
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-qt5]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-qt5][PATCH'
+
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-qt5][PATCH'
+
+Change option '-1' to '-n' for n number of patches in series
 
 You are encouraged to fork the mirror on github[1] to share your
 patches. This is preferred for patch sets consisting of more than one
-- 
2.1.4


