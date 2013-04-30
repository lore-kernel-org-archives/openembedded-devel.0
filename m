Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDpf-0001Og-4V
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:55:32 +0200
Received: by mail-pd0-f174.google.com with SMTP id y13so399389pdi.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5y5qdfE3RyVXLQ5hFDnf2kzc5cQQZ0wTHYjNDvDwMEo=;
	b=RqdzB/X+Gz909OOwRhrJ/FqfCCoajP8dWiGUFcSk/8GjfkO+NKCI30D0MWyPzVu6PY
	fGiMAbMPUVTgfVOV7MgkwGsymsXcu4jkokFyJD/tE2iyHGdrmk5yWvX6PWvCBQBmQV3k
	IjxrJbe5BnTowW/GLzryEipubvWlMhFjvG7kR1IzlApYcFjjHadNlQJFS2C7w7xHlTCg
	c3D+zef/vVWPQ/M2LY00WEE1nDc6vfDvjw/3lUBgJuCnsqBmfd7oP34RyENHwGEOmeDO
	QZF6VKb+GlbhIUQweEf6mXln9NbcBBvFspWm9olN63WciKJQ0arN1oXUAp/uz0/R7SXb
	TsVw==
X-Received: by 10.68.114.37 with SMTP id jd5mr76400962pbb.95.1367339839661;
	Tue, 30 Apr 2013 09:37:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	sa6sm29110428pbb.26.2013.04.30.09.37.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:37:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:33:02 +0200
Message-Id: <ceac9460e8997c7c48785205503c7c9e0ebc92d6.1367339450.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 12/12] README: show github mirror URL in layer dependencies
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
X-List-Received-Date: Tue, 30 Apr 2013 16:56:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/README        | 4 ++--
 meta-gnome/README      | 4 ++--
 meta-gpe/README        | 4 ++--
 meta-initramfs/README  | 2 +-
 meta-multimedia/README | 4 ++--
 meta-networking/README | 2 +-
 meta-oe/README         | 2 +-
 meta-ruby/README       | 4 ++--
 meta-systemd/README    | 4 ++--
 meta-webserver/README  | 4 ++--
 meta-xfce/README       | 4 ++--
 toolchain-layer/README | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 7a34ad6..8b03e8d 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-gnome/README b/meta-gnome/README
index 9204cdf..2915b1b 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-gpe/README b/meta-gpe/README
index 1b59c40..0699c1c 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 0d26f28..cc87669 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -11,7 +11,7 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-multimedia/README b/meta-multimedia/README
index b241577..926cb9b 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
 branch: dylan
 revision: HEAD
diff --git a/meta-networking/README b/meta-networking/README
index b929de9..a76a08c 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -17,7 +17,7 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-oe/README b/meta-oe/README
index 267d5c4..f596ddc 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,6 +1,6 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 0d447a1..d08b572 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-systemd/README b/meta-systemd/README
index e31745e..6e33899 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,12 +1,12 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 
diff --git a/meta-webserver/README b/meta-webserver/README
index 60d01b6..db0d02a 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -11,14 +11,14 @@ Dependencies
 
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
 branch: dylan
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
 branch: dylan
 revision: HEAD
diff --git a/meta-xfce/README b/meta-xfce/README
index 2b79780..686641a 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,10 +1,10 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://github.com/openembedded/meta-oe.git
 branch: dylan
 revision: HEAD
 meta-xfce depends on meta-oe and meta-multimedia in this repository.
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 448693f..11ad7f3 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -1,6 +1,6 @@
 This layer depends on:
 
-URI: git://git.openembedded.org/openembedded-core
+URI: git://github.com/openembedded/oe-core.git
 branch: dylan
 revision: HEAD
 
-- 
1.8.2.1



