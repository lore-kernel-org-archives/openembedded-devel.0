Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id EAA4165CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:44:49 +0000 (UTC)
Received: by wiax7 with SMTP id x7so90914666wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAPcJitSHkta3D/r14HB/bpeKafrFUfY8BV5cZD4IB4=;
	b=CtITnSCILLKuqclF7tNtFCuXwMoNGWKMK13W6B7zDV2YmbXnfwEP+9Js9OiVIxNcxf
	QinT5u7xm/yerLXUEQAFncyFab53a1eC7gSfwKL05Z3/7q2PD/J+EU1hqlf02bqqXKSH
	mKnjsHAjXys6CpUFfkdMWM2LGctJ34I7ZLcE3ND6q8KTcUfmuLGyVY/Y1pXKarBk81DE
	LPIOaNlpqst/YTa4AT0jihpRYWh1TQmaM9kr51hONP+SKXfOGze1DcG1bmpsi89vn8WT
	cvz4FqWx7eAxG4njtnY/e5CcKPNvjViKILvtPC87Hv+zfOrDsNFFJKF6k++ZaG5EWWoG
	FenQ==
X-Received: by 10.194.61.171 with SMTP id q11mr24352421wjr.110.1430160290600; 
	Mon, 27 Apr 2015 11:44:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fa8sm12776952wib.14.2015.04.27.11.44.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:44:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:45:41 +0200
Message-Id: <1430160343-2781-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] libsecret: add missing dependency on intltool-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:44:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
index dca3350..06e94bd 100644
--- a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
+++ b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt"
+DEPENDS = "glib-2.0 libgcrypt intltool-native"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.3.5


