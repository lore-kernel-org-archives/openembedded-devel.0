Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web11.42748.1598620397864267075
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 37F977;
	Fri, 28 Aug 2020 15:13:08 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTQuyvR5UbER; Fri, 28 Aug 2020 15:12:54 +0200 (CEST)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 65019C;
	Fri, 28 Aug 2020 15:12:54 +0200 (CEST)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] README: Use quotation marks for subject prefix
Date: Fri, 28 Aug 2020 15:13:01 +0200
Message-Id: <20200828131301.20736-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200828131301.20736-1-jubalh@iodoru.org>
References: <20200828131301.20736-1-jubalh@iodoru.org>

On zsh it otherwise returns:
```
zsh: bad pattern: --subject-prefix=meta-oe][PATCH
```

With quotation marks it should work on all shells.
---
 meta-oe/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/README b/meta-oe/README
index 347816b0d..6a0d7c0a1 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -17,7 +17,7 @@ pacman -S lib32-gcc-libs lib32-glibc
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
 to share your patches, this is preferred for patch sets consisting of more than one patch.
-- 
2.16.4

