Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDol-0001L6-Mp
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:54:23 +0200
Received: by mail-pb0-f41.google.com with SMTP id md4so347430pbc.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=TtpmTq3yfF5/HxTBeFIyUj25wZWx+ByEYit0xFKzJiE=;
	b=D1+3Y/StbtFDgJ/fe9ou7HiM0kBFMTIhsKybLWrjH3weRhDPrbNrjpo2dylk1o7xLD
	0sx7SsfkQ0FTUvT7LRWOFeICV5P58pUm36DJiKyWYmpEmF89zDfUj/zoqf48ues6cNph
	/CJMtrBGxGu7F0ATOdXLTMr28ZgTwbQ2+2fJfNBFWYm9UGLjQTA0e1BB/uGNe7kmscTc
	ZsJJwNNQkYEqid7lWBwZaT2pMyZ9s8QY2dye7k+9uQl1PNjBrVlVHwPbEbxAH8toOzIT
	Uo3SykKrCZsKT//SKMg8P+vBisbWmR/PfYf/GS0g3h4xaqgY8Ke/6iKK88vao8lYuXUV
	g79Q==
X-Received: by 10.68.101.226 with SMTP id fj2mr78071937pbb.6.1367339783552;
	Tue, 30 Apr 2013 09:36:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	li15sm31296524pab.2.2013.04.30.09.36.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:36:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:59 +0200
Message-Id: <20a10ba02ff4c8b7afb8dc8b0edb84b7246a0c76.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 09/12] README: add -M to git send-email example
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
X-List-Received-Date: Tue, 30 Apr 2013 16:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/README             | 3 ++-
 meta-gnome/README           | 3 ++-
 meta-gpe/README             | 3 ++-
 meta-initramfs/README       | 3 ++-
 meta-multimedia/README      | 3 ++-
 meta-networking/MAINTAINERS | 2 +-
 meta-oe/README              | 3 ++-
 meta-ruby/README            | 3 ++-
 meta-systemd/README         | 3 ++-
 meta-xfce/README            | 3 ++-
 toolchain-layer/README      | 3 ++-
 11 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 01f192c..7a34ad6 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][dylan][PATCH'
 
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-gnome/README b/meta-gnome/README
index d7b9e7f..9204cdf 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][dylan][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 4058e72..1b59c40 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][dylan][PATCH'
 
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 01f4f53..0d26f28 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -22,7 +22,8 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs][dylan]' in the subject.
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][dylan][PATCH'
 
 Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
                    Paul Eggleton <paul.eggleton@linux.intel.com>
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 8412770..d82ceab 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -10,7 +10,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][dylan]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][dylan][PATCH
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][dylan][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 393f037..953e603 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -6,7 +6,7 @@ development mailing list (openembedded-devel@lists.openembedded.org) with
 
 When sending single patches, please use something like:
 
-   git send-email -1 \
+   git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
         --subject-prefix=meta-networking][PATCH
 
diff --git a/meta-oe/README b/meta-oe/README
index 0d6894c..267d5c4 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -6,7 +6,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dylan][PATCH'
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][dylan][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 9ef9986..0d447a1 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][dylan][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 150a020..e31745e 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -17,7 +17,8 @@ $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappe
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd][dylan]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][dylan][PATCH'
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][dylan][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 4963a24..2b79780 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -16,6 +16,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][dylan]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][dylan][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][dylan][PATCH'
 
 Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 5996b6c..1f9be50 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -6,7 +6,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][toolchain-layer]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][PATCH'
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][toolchain-layer][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-- 
1.8.2.1



