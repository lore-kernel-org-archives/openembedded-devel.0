Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2630765F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:28 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so427126wgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=FxUFojS7JP+4mJpxkrT0bUeHDfp/Lqls451CnoCACmI=;
	b=n45iG+Vi2cUGNxKXLh9LmFADBLJRUb18LfCcCYF9McclZEy51+5G0hs3BX6n/AUO7V
	kfu++CYcs0TBHpvvwNPE7h9Lmd3zH7ACcuor2wkLiIXp+nHEAS4nifE/EdnwLGhAqrme
	h3C1LPjCbr48Ldp/kVNJ9iK72fyqWNeNr0OJ5VRDGQ1/VaaTyClVgnno6opRjx5QZzb8
	fzsdxR3/uaUmhX3HezkqB9aI0FCV0yA4QU4gIirLVsPujc8jid7m8JYOfkFAa7NbcVXy
	ipGAFAwS28jvg4Th12cjrd+CQZWf8t7sRTNwY4RoteCGQDpdYVG8pStsV8aLwp6t+RQj
	Dvcg==
X-Received: by 10.180.186.4 with SMTP id fg4mr2451053wic.73.1412151569498;
	Wed, 01 Oct 2014 01:19:29 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:06 +0200
Message-Id: <1412151555-19865-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 06/15] tumbler: fix build deps QA warnings
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: tumbler rdepends on libxml2, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: tumbler rdepends on libgsf, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: tumbler rdepends on libbz2, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
index 8651d00..9f361e9 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.30.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus speci
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native"
+DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
 
 inherit xfce gtk-doc
 
-- 
1.8.3.1


