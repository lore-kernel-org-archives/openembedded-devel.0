Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A468570A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:59 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so6749280wgh.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wZhw2fCXQ3y5w0CYVQbf6LqtAQZ88QJ7cKypUd9t8Ds=;
	b=RgHHVSiFi5tvIY5pPwoZq5lHRte55UfLROf6r1mZOOnqbcWhx2MLA9d7LDK3ND/0i3
	ZGIYyesB8NrChiKqqyLdu6ADLIyTKh0Q2OVA9lj5rcO0GCUGfhoXz39Qk3xxJA+c00zh
	FkxvkcHbR0anYygpYW7Notvy2Jzm2jgtghd0FMgyazbQE2ePxqGrkhu2fuPIHhQ3CkBt
	4xhyCmB+AnMvVR3bDmb9hh122xjRUpYotjQGPkT+3KOSTnY1efHAv/Q6dcHUnnlcIR3B
	wo4DkXpARXPF3+0jMXl36ZkgX6vrUWvt5uAYNjuYpxK7rDObmzPoOINbXo0TEUHqFXTf
	CEPw==
X-Received: by 10.180.189.107 with SMTP id gh11mr11889824wic.40.1407600540747; 
	Sat, 09 Aug 2014 09:09:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t6sm20459449wib.4.2014.08.09.09.09.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:48 +0200
Message-Id: <1407600537-10857-27-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 27/36] polkit-gnome: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:00 -0000

* fixes following QA warnings:
  polkit-gnome-0.102: polkit-gnome: configure was passed unrecognised
    options: --disable-scrollkeeper --disable-man-pages
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
index f018773..b262b5e 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -12,10 +12,10 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
 
 PR = "r2"
 
-EXTRA_OECONF = " --disable-scrollkeeper \
-                 --disable-man-pages \
-                 --disable-examples \
-                 --disable-introspection "
+EXTRA_OECONF = "\
+    --disable-examples \
+    --disable-introspection \
+"
 
 inherit autotools gtk-doc pkgconfig
 
-- 
2.0.4


