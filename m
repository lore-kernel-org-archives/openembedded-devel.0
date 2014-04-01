Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9EE6FA5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:59 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so6540558wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KDNwWMJ6bchHr+fSlNNkmtUv67yU2f8+XjnKZ0IV5bo=;
	b=ODOdiRRE8pBmdiFcDYqzIxYCjEe+nU+IISDTGx+k5P2RuO9usFtN1X57MQfPt0uWhP
	JT8S/0e3HIzbYPsGUQv2nCfH2ef2q7CY19TsCCSC9oPdmr0HD6IeIzlPy8vBzxexoLMf
	04RNTH5kTE9NX8DgQFoVnm1Yg3x5Nq5IYD/gFTsZk1thGOXFMYGEgnBhHKKvImcu+1CE
	bNeh1iG3QuW+08nI7J0pyqKrvL9jeNINWKyjrHu+cD8gNRJhyatZU0w4MW1Xh/sUJQPE
	Y+39Q1RmgRpA3Zdfv8DG+gm6/fI0ZuAalYyXFFBKp3hHknLBj3CJ2RgJ88sxI4/wK7eM
	Dppg==
X-Received: by 10.194.58.180 with SMTP id s20mr15593513wjq.54.1396372500348;
	Tue, 01 Apr 2014 10:15:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t4sm41846158eeb.29.2014.04.01.10.14.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:38 +0200
Message-Id: <1396372434-10710-30-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 30/46] gnome-themes: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 864c953..7863c5c 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "gnome-icon-theme"
 
 EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check"
 
-inherit gnome perlnative
+inherit gnomebase perlnative
 
 do_configure_prepend() {
     sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g' configure.in
-- 
1.9.1


