Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOK2-00068S-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:22 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so778636wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=lUfJMfujukcu+psWv6b2WaD2QOSHLJh0RMMrU1xGvDA=;
	b=LaKspe/wdA48lezmTomqjkoOrTtF9YFndW4FvamfOD5XvnOTUcBecTgB5PHO6Kusib
	Ml/cfKs0V90igHkVbmDrM3FCkU4urPkZYJc5TyQG66og2bfAkaDhbQXnMM98yRx7mgzw
	KbCg1EdO3UYdQUaVgOf2Tn1TkqjZANvuww60NiU5MGrZtoeI06Azh82y4I5LLNXKoBoy
	enb/NJkHTMcVNh1HI5IKB2LWvQlPuQqRceoSwGDDp66jpPL/5AeNEHYLFgliGgArCuF1
	jjxnBWjibJ8EDxuolH9lysNUVR1XM3uXb6tOxhZM8ui3OAcy/r+54PKH4oO5zaKaP3Wl
	5SRw==
Received: by 10.180.81.135 with SMTP id a7mr13147412wiy.16.1335444707621;
	Thu, 26 Apr 2012 05:51:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm10808961wib.2.2012.04.26.05.51.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:16 +0200
Message-Id: <ea1f6cf8a06930922641c1a6ff2873977637ac9e.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [[meta-oe][meta-efl] 11/15] README: keep PATCH prefix in subject-prefix, some people filter their inbox based on that
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/README        |    2 +-
 meta-gpe/README        |    2 ++
 meta-initramfs/README  |    2 ++
 meta-multimedia/README |    2 +-
 meta-oe/README         |    2 +-
 meta-xfce/README       |    2 +-
 toolchain-layer/README |    2 +-
 7 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 41effe6..62daa0a 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -10,6 +10,6 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-efl'
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
 
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-gpe/README b/meta-gpe/README
index d967dc1..220f031 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -10,4 +10,6 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
 
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 2cecff6..8430555 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -22,6 +22,8 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+
 Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
                    Paul Eggleton <paul.eggleton@linux.intel.com>
 
diff --git a/meta-multimedia/README b/meta-multimedia/README
index a60a7bc..8f90dbb 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -12,7 +12,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-multimedia'
+When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-oe/README b/meta-oe/README
index ed14866..4226c29 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -6,7 +6,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe'
+When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 1a503c9..fa2bab0 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -10,6 +10,6 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-xfce'
+When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
 
 Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 15ac069..5996b6c 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -6,7 +6,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer'
+When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-- 
1.7.8.5



