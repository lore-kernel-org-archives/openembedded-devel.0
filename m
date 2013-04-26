Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVj6V-0001dU-3C
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 15:54:25 +0200
Received: by mail-pb0-f48.google.com with SMTP id wy7so113346pbc.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=EkuGddjyHKaNRJS6p5jQjZwVu0yiILLnRkAQcVEqQXg=;
	b=KD1D0Pis7VjBbqMHseWEDeaB1u5B4a6FJ1jg9N8jV4YWdCX5xHlu/mgCHszUgUoQ90
	NbDz0gdZC84VNLuj+5UqJacOLHTjWeXNWaAkAJ/HsXe6Wn9z4HOMMGjA2kY9LXZbZh1l
	JBdx1fTxSIWbgnTM8GQEwZdUmCWsLdg0qFO8VjdGAPljxrgLW2iOmnzRV8Sgck5ERWIs
	DkpNJjWOekay0glbLrvnPUJGeinAWjnima8ndMSvRLyLtoGryYuhVTJky34DkEHF2MTU
	SawzEN/SfdSVcUbrLPliTz0YtZs1P2UyAdEDW17f+3kc+pnJ/xC6Ozew862R+9wrdqEO
	lo8Q==
X-Received: by 10.68.58.228 with SMTP id u4mr47029561pbq.30.1366983397604;
	Fri, 26 Apr 2013 06:36:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	nt2sm5204197pbc.17.2013.04.26.06.36.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 06:36:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2013 15:36:23 +0200
Message-Id: <1366983384-31049-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] README: add -M to git send-email example
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
X-List-Received-Date: Fri, 26 Apr 2013 13:54:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
index 820d481..e3235af 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -10,7 +10,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
 
 Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                            Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-gnome/README b/meta-gnome/README
index 29a21b7..90545a7 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
-When sending single patches, please using something like 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 8540ffe..3c7522c 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -10,7 +10,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
 
 Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
                            Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 8430555..473c57d 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -22,7 +22,8 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
 
 Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
                    Paul Eggleton <paul.eggleton@linux.intel.com>
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 2146a13..7bf7fc8 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -10,7 +10,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
 
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
index 4656a3d..ede8011 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -6,7 +6,8 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 51cab2b..cf2f405 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -10,6 +10,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index ff25229..f1f4835 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -17,7 +17,8 @@ $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappe
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 88f2332..2f4aa9f 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -16,6 +16,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
-When sending single patches, please using something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+When sending single patches, please using something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
 
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



