Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5F670534
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:45 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so2380494wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=14/gOmWr2ltnYFmfz/j4TB9FFJGaS2XjEFXmyHmYG1E=;
	b=gsntG7JIbS6fbUgzxMgL9NbZlpwvjlOA8OXBNSkGz6261LflmYbSHIX3xs0uatbqh1
	wnSxyHuVxmFzl79Rz2b3zrH/3dxZZftZhDRS+SKvqtMip3SwHe+WIQXgVCD350XMXCTT
	YfoBuDc802a/zigY8ZhRlVD4nApTpSU1PVG3Cn7BOWQtv6XU7VTKp7iG5EAl2/IPxsV3
	+DHGaDmH8cI6KzYcFuFsbV+ECJ3TV1FW7mmmERnJBJ/HR+aqqPUKiyhEwok3nyqX78HL
	u5YL08KxHxkl9huCQD4cA8Cl4vkJfWpot6xjhfYldEF+0x6d6uTMMI5tmHRGiOjn3c3/
	P5Mw==
X-Gm-Message-State: ALoCoQmzGONlyBIKasOxxc9bItVdUO1y1GRieXVDwdoNDAALSEzaBA7LuG3L9/JC+hwgL+KMvMMA
X-Received: by 10.180.11.74 with SMTP id o10mr5596624wib.78.1405441126099;
	Tue, 15 Jul 2014 09:18:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:33 +0100
Message-Id: <37e493698ba3d50bed2057eba92ab3b922752497.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/7] which: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:46 -0000

which doesn't want GNU-levels of automake strictness so tell it to be "foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/which/which-2.20/automake.patch |   10 ++++++++++
 meta/recipes-extended/which/which_2.20.bb             |    1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch

diff --git a/meta/recipes-extended/which/which-2.20/automake.patch b/meta/recipes-extended/which/which-2.20/automake.patch
new file mode 100644
index 0000000..92365dd
--- /dev/null
+++ b/meta/recipes-extended/which/which-2.20/automake.patch
@@ -0,0 +1,10 @@
+diff --git a/configure.ac b/configure.ac
+index d974461..a20dfa8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,2 +2,3 @@ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(which.c)
+-AM_INIT_AUTOMAKE(which, 2.20)
++AC_INIT([which],[2.20])
++AC_CONFIG_SRCDIR(which.c)
++AM_INIT_AUTOMAKE([foreign])
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index f3c6037..7483554 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -18,6 +18,7 @@ PR = "r3"
 EXTRA_OECONF = "--disable-iberty"
 
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
+           file://automake.patch \
            file://remove-declaration.patch"
 
 SRC_URI[md5sum] = "95be0501a466e515422cde4af46b2744"
-- 
1.7.10.4


