Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B0F8C788BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:06 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o76so8261554wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZNLUVOI0y0C+bTYTBBmbeZrhQ5zWyioYYlGCNfLzoO4=;
	b=gymJbyR0lX+1ZMwYgAr9e7leL9qrjBN4iOphbFUdPrPP9ybML09gCc4HIRliV+pNmb
	U9NFttnyQT2M0VHxU3p4YjuVXZvJBimUkDtUgyOZtaMgZHzoGAdYm2AnGf9te5OT3vwz
	03+1P7EQpQkeQlFxx3TMdhee3d3KkfmU6nkZi6likAHBfp7cLE3Y4fTlizZPdXQl1Ufc
	E32NLy96yIPOQS+vX/rO+pVdp/E83U9mgp62quUBRWvBIVvSk1u0vMCzArqwmuWinlsM
	FP7kLDtkz7FQUSxMUIZKpZH5PR/qWmZh8gn6HR0QU1upcJZyJbi2RrW4yzTtAkk0QSK4
	aLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZNLUVOI0y0C+bTYTBBmbeZrhQ5zWyioYYlGCNfLzoO4=;
	b=G9rfFnPKw8n29WxHSIK+AlICet9dvlUb85EpssbysMd0aBy/xE0Nay6/vQjqMpCv7o
	Mv5wff9nIyC9pGulrtGqipjdSWaBuaYeq+AKxrMpn4LpjHS/dugyVxpfgOFbs0V3ifk+
	rVpHNMJZX7567Cf2muEES9KCkwtGzZRQ4kqjSEF2Nd66Nj3h52Ety5bcPm44sx3FwCZF
	3yF2OwTqtMUQFWYCJ//J5pRBZ9siUEL20YFSPjeRHPVg1/tNi47RVvC9BE88EVgtWPrY
	WVqVJycWNstLAN2+j0P11+XXlo5YPWb6TeLhGoIxzKST7m6gonOAAMJc+K0pqgjvnt2Y
	Uqag==
X-Gm-Message-State: APf1xPB2/hokUlfaqY5WFk1lgvB5S+FQpa53qHKO9Uw8ZQi676u7zdhA
	y97C+9fIm+cjcnUBoGKOwFb9tA==
X-Google-Smtp-Source: AG47ELu44FppC9JHAv+/qV7wMKvf3hkz4ODbkBaOKWnhPauI4uc1Eu0tg3tpTlkIg9dGlDSEkbfoZw==
X-Received: by 10.223.154.165 with SMTP id a34mr3527650wrc.85.1519945327197;
	Thu, 01 Mar 2018 15:02:07 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:41 +0100
Message-Id: <20180301230148.2284-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] exo: update 0.11.5 -> 0.12.0
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch   | 8 ++++----
 meta-xfce/recipes-xfce/exo/{exo_0.11.5.bb => exo_0.12.0.bb}       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.11.5.bb => exo_0.12.0.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index 99318d5aa..f5c5e8dac 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -40,7 +40,7 @@ index 62ad18d..bdc5fae 100644
  distclean-local:
  	rm -rf *.cache *~
 diff --git a/configure.ac b/configure.ac
-index ba5395d..2605067 100644
+index 3f92d1b..0d4cc38 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -116,15 +116,6 @@ AC_PROG_CC()
@@ -65,9 +65,9 @@ index ba5395d..2605067 100644
  XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.24.0])
--XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.20.0])
+-XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])
 -XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.12.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
 -XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-unix], [GIO-Unix features])
@@ -80,5 +80,5 @@ index ba5395d..2605067 100644
  dnl *************************
  dnl *** Check for gtk-doc ***
 -- 
-2.9.4
+2.14.3
 
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.5.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_0.11.5.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
index d5508c0a5..d256b5769 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.11.5.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "2e560edfa8ddf77e21c4787a6f600171"
-SRC_URI[sha256sum] = "8e8629f33783eba1ce6d092a42c28217458a0cc3d1ad7474097b9187054955c1"
+SRC_URI[md5sum] = "724afcca224f5fb22b510926d2740e52"
+SRC_URI[sha256sum] = "64b88271a37d0ec7dca062c7bc61ca323116f7855092ac39698c421a2f30a18f"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.14.3


