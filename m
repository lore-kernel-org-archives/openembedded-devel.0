Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATXe-0003G6-O0
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:58:02 +0100
Received: by wera1 with SMTP id a1so1348298wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tyIUG6ho5bS2svqi7WoqxdyrCHgJ8GrEIxq9SS9GaNg=;
	b=ktbsrYib2BnpLpEVzQm/8zE9p1UKE5he3r03zFR6OCFLnig7M1JB+rux11R1q7i8mP
	9swBMJkjd6sewO4dOSPvrsqLf83/W91IBYkNGD/EBHB1Ew1mAMDy3pBdok8TPW6Su747
	32rtamWME63u4bOkIDYvp+AsYXjs/2mVj9t12ec1ryL3P5ikenIgQ0L7bJeYxOdWefOO
	CDX3XAz1bVh9Bd9ztSy6FyhlLgzEKjZd9ovSFSY1t8g+IyRRh/XJccEwJZN2uGY5qUtj
	dNFFwlkveERnq12MGshTwqoIy7+KIOocjvvFFM9cHG8aWA+Obyu1YCwIkWgw66aozH5t
	HpXg==
Received: by 10.180.80.40 with SMTP id o8mr12518733wix.10.1332366548776;
	Wed, 21 Mar 2012 14:49:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm239192wis.0.2012.03.21.14.49.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:49:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:48:59 +0100
Message-Id: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332366214.git.Martin.Jansa@gmail.com>
References: <cover.1332366214.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] gtk+: drop bbappend for gtk+-native, moved to oe-core
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
X-List-Received-Date: Wed, 21 Mar 2012 21:58:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend b/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
deleted file mode 100644
index 7df58c3..0000000
--- a/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-BBCLASSEXTEND = "native"
-RRECOMMENDS_${PN}_virtclass-native = ""
-EXTRA_OECONF_virtclass-native += "--disable-introspection"
-- 
1.7.8.5



