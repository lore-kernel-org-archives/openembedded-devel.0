Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 81C037FB43
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 18:07:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so11405323wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pHY9U8jPFZLywKTMuWib2Q8djq6BgEQbIbZSiWrb0AY=;
	b=A+W4W6sEyypmnznRrtwUw+gUFpTyErahrIWFDHtU0Mk6QVixTqXJslDWp4qHiYxnOO
	5NedSiIoL12S+ZTq018lXwbG+nvi+y7dnJKGR1uG5kcMa/We6pDsonclPFVtY1KWedC2
	ZF8yeggsanj2FtzEUwCzH0UVIE7kCQFfAgNznEznHZQdKrz/UYFWdp9AhAJfht2JpSV3
	6VJaF4MZ/uK0lFbTwPeapBiLn7Wgng+uB0YKxaPYeGkKmAh3+nCUD++H1NXJEN9IXqYj
	44Wu9AX8IblTXN6Mm82HwbHHYJYjvXMbMIwCu5o49BVIafJNLgxxJHGyo+WCUjscotsZ
	/cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pHY9U8jPFZLywKTMuWib2Q8djq6BgEQbIbZSiWrb0AY=;
	b=Q9Ecyv2aQfLk3c9aj62lGQMEYPsGwDM6MugtKZa2v+LzvnZxWtlotk2fBZ8vVhDZHf
	7LZr/8C7/4E7VxOw8rXOzLTJ5mKq1YjAyOaufduYWNjz3J/kWSoJLqQu9Ys99f4Z45rn
	72/+R6JoHrXuF0koTdFAHRMYGJi7+5kJD+KhzCAB0Mvikpe/zuK5ZwDRCGp8dHIjFgAJ
	G9gU7yS1J3zDshqXVk5h5wq3LQQ55/xZvFuD9/rSIdMh5tT/8IQVencVb/cM5KvNyj/9
	LCD5uojJvsiBXjI8bskqPJ421faGzEWOFIX08ef+cYboyzzeWnYy80xyJagir62JnSCw
	aAow==
X-Gm-Message-State: APjAAAVAdJKL0FqKZnjVgi3dvsNYG86YBeeNTcjR9888ShYrrYmQLvEW
	6vRozRUWVjjFO7GmbK6cftlohhvL
X-Google-Smtp-Source: APXvYqwpNitQZDyTW6GMSITjfpYdlI6snTjmvciiSx5wsMDIhQyKhMRv6pBFl+yu6G0tKCwFnX55ng==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr20652245wrr.32.1575742066935; 
	Sat, 07 Dec 2019 10:07:46 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y20sm7230158wmi.25.2019.12.07.10.07.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 10:07:45 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 18:07:38 +0000
Message-Id: <20191207180738.40895-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-java][PATCH] recipes: rename distro_features_check to features_check
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
X-List-Received-Date: Sat, 07 Dec 2019 18:07:46 -0000

Avoid warning due to the class rename in OE-Core.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
 recipes-core/classpath/classpath_0.99.bb      | 2 +-
 recipes-core/jamvm/jamvm.inc                  | 2 +-
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
index 6783894907d7..0e50b686e107 100644
--- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
+++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
 SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
 SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
 
-inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
+inherit java autotools-brokensep update-alternatives pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native := ""
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index 714503aab6fa..5b9d904636db 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -1,6 +1,6 @@
 require classpath.inc
 
-inherit distro_features_check
+inherit features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index cdf087ec8afd..387d799bff03 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
+inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
 
 REQUIRED_DISTRO_FEATURES_class-target = "x11"
 
diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index aa165f5075a3..87de6be12ac0 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
 
-inherit distro_features_check
+inherit features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.17.1


