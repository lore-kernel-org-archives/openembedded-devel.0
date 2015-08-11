Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5AA76965
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:18 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so49990370wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Qf+ffhfcAHH/bYSkcbbbdggw8dApwc6g3g+ChE1oPxg=;
	b=ZoZd/VJpw4QpGb1aV7rRQ5MxcWgzWVTi+cGFNLRDFZXV87gs46WXhohKi9l83re4Vo
	BwBNJh9D52Iu+nqsEKFbFxBWLfmWfJTjO4Uu2WAyVBaSuEkDKHvwhC7SpA6EhVgANvli
	RYJmgw7B0rtrycWADyxFIuSU56bZCI3DY3qNEWXHtvUWOYv9zpZ+uZNNxXBvOEtGwH1w
	n1vB9lwJAnc0Yh8VrDnYONCROf4U783nWHOPJzGiblr9t+yOVWRTjYtYIwG+4Ank1jkn
	woRSBkMhqU6UMys+VQdkoCdYkdI7rNMhAbvTf9jEE4tb917i2IdUmPJuqMy0O8nzBKAB
	t4XQ==
X-Received: by 10.180.95.10 with SMTP id dg10mr24755017wib.5.1439279898121;
	Tue, 11 Aug 2015 00:58:18 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:30 +0200
Message-Id: <1439279859-1815-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/17] glibmm: update to 2.44.0
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb => glibmm_2.44.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb => glibmm_2.44.0.bb} (87%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb
similarity index 87%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb
index 71daf9d..d9cffff 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.44.0.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "5c96d566c22c209d7b9cbf2344c469e9"
-SRC_URI[sha256sum] = "f15b65bf5740257be03c69f2f5ae71436ac3011ebeb02274b2b99b796c6837cf"
+SRC_URI[md5sum] = "32ee4150b436d097fe2506d0b0b13a75"
+SRC_URI[sha256sum] = "1b0ac0425d24895507c0e0e8088a464c7ae2d289c47afa1c11f63278fc672ea8"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.1.0


