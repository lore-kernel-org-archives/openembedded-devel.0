Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFRVU-0008RU-GT
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Sep 2012 17:20:36 +0200
Received: by wgbdq11 with SMTP id dq11so2990637wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2012 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gWkuSMoGMWWpKYKRDlF1JpUQJK8PYCNWYL9yU894l/0=;
	b=VXEDSC2H+JDqcFn1V5GRqr8/+n8i1XKmneIbsd/a9f/H5WG+N9A2tUI/3dGaoLdCUq
	MXKHsm0PAZF9Ycb2killlRfCh86ZVO8XM1Kz9KccekMy+vWAcqnzWQpqyRYwfHtVMyZf
	FOpDEDfUk5nEbhhF8TnrQawxmkRPJMvQhhlRgjgbnYBXV8fVfGfD2uMhJkVJgmIF4t7x
	T8EAcZZDcrFwZMGGmkztHIZHOC33lZrt/8lJxYbDn6VFyOlV5I2z7b/T7HZXCIOUKFJ4
	4lQcPVXC76dfS90p/WDGTJsP8Go8NgLE48r17A8WPi4ON3M0HS8rwu6x7fV6xxaWj6lZ
	M9IQ==
Received: by 10.180.91.169 with SMTP id cf9mr3776577wib.1.1348326471434;
	Sat, 22 Sep 2012 08:07:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm4612467wix.5.2012.09.22.08.07.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:07:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:07:40 +0200
Message-Id: <64a25e7e3213f86dbc1a4c7ca833058e04c38389.1348320947.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] gtk+: drop .bbappend with native BBCLASSEXTEND
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
X-List-Received-Date: Sat, 22 Sep 2012 15:20:36 -0000

* it's in oe-core now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend | 3 ---
 1 file changed, 3 deletions(-)
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
1.7.12



