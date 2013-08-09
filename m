Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 41E1D6B5F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:54:02 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so1998378eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=43FhBEdI1JLlbWgJJ7QZHPbRjD0yuhTGinXiImIYk2E=;
	b=0ELeoK0tlRUTM4hx9Ig9JcmNk3IuWyauuwrfNaz26BzP9ECXE2edV0f3cekwbuZ+i8
	GvH149Cu+X05MeWNfyrM+fIpxpQrvuelEC5jJqPkYPuWjh5MDFVF+fQGDAiJwT5FeD15
	MWuVd0PcyOS236Ki8g9bNAysEzzjGm2iLxOiZBEPGKAM9fx/e99oB3swHoQkPoTNnZug
	xikCnq3663Vrye9rx2rnOVpOXwcojhfCYO+ZinwxTzxE2iOVIOR61Wpl8+Oc2U+q6m1J
	5Dow5e34z30S32RWW/MDaiZcKo8VMuvH/hsCEBhNndpaukG65xmSCXKlBkSqAmfGi6jz
	gTdg==
X-Received: by 10.14.211.134 with SMTP id w6mr12365040eeo.26.1376038442554;
	Fri, 09 Aug 2013 01:54:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm26780455eel.12.2013.08.09.01.54.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:54:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:31 +0200
Message-Id: <1376038471-32202-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/12] xfce4-icon-theme: add dependency on intltool-native
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
X-List-Received-Date: Fri, 09 Aug 2013 08:54:02 -0000

* fails without it:
  | NOTE: Executing intltoolize --copy --force --automake
  | xfce4-icon-theme/4.4.3-r0/temp/run.do_configure.2826:
    intltoolize: not found
  | ERROR: Function failed: do_configure (log file is located at
    xfce4-icon-theme/4.4.3-r0/temp/log.do_configure.2826)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
index 37f88af..f6a9d2b 100644
--- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
+++ b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
@@ -3,6 +3,8 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+DEPENDS = "intltool-native"
+
 inherit xfce
 
 SRC_URI = "http://archive.xfce.org/src/art/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.bz2"
-- 
1.8.3.2


