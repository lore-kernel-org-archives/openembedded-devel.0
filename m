Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E260972F69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so2950574wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qj7bmHdRKyfVSiJp9wnpXV4JxwWJdA/mdf0xqtIWnWo=;
	b=S6BGORmxPSr7+GZxuSwshypSfrSWvovkKIcmfldFl/ex4x5EViEOgBioWQE78N7m7E
	SYZFq846KVj6d16QhNKq2ncDKCZy2yjU9onoT8/YoofKqn3yYd0YsvEcSdCqDkwK7DaD
	TQ+SQ6UNOcnUbCMXhf4qPfDrsoBSMPgw4BYwloKWtURGy/0dI5+gycWtCSWDhmIi3TaO
	hI2gfCn0dIEVgEerLbwU2TUko1nZYZDXhlSzLQe5fExUps3IbYMYghexMetYZh+feVez
	uFpK8vQzbjXzpKuKyBSOuD5w4sh9yql4P8eI0NuWPZkyv2Z0i15NUZZ1kywJSVD4q6JY
	F/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qj7bmHdRKyfVSiJp9wnpXV4JxwWJdA/mdf0xqtIWnWo=;
	b=CmMPJZAhlJOllfFXQsO1F7YMuzUu00G8Rt3sD1V0ZWh8RSxQgzAvUVCTnEaU5b9BWV
	nfpT2xILtRY4IOA8LrRfUAcSO7QF94y7pnYiDApaK1NEggAcgfeIxPwvO7G+bT/iHbOZ
	FvZSQZfRTBf8fjCf75fiodCcaGtbemcsnGTozPXnK3Y/Epo9fmxB0GMSKsNQUABMytlP
	bZz38FdviNGjwldQElAd6cYqcBD9F70DXluDx5jH2sBo/BIj2g1P+upSFNay//vOBwsG
	695Cfe4HMCipt6PUdY7cOUUPnZk4FE5Vj6lnSbJGAJMsooe+0fvhZT9oqjJGYW4I86Uq
	LmNA==
X-Gm-Message-State: AMke39mWzxM7p1mGbm5Yhg+WN/8rvkwk5NxYTHzzWsRHXg0vLnNSNrd40DCx7z4TFbmtUQ==
X-Received: by 10.28.142.16 with SMTP id q16mr726543wmd.78.1487804587617;
	Wed, 22 Feb 2017 15:03:07 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:43 +0100
Message-Id: <20170222230250.30288-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] gtkmathview: libxslt -> libxslt-native in DEPENDS and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is not exactly a chance to get a useful fedora system without libxslt for
test. So this is yet another guesswork.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 1478c48..15935c8 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://helm.cs.unibo.it/mml-widget/"
-DEPENDS = "t1lib gtk+ popt libxslt libxml2"
+DEPENDS = "t1lib gtk+ popt libxslt-native libxml2"
 
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
@@ -23,5 +23,3 @@ do_configure_append() {
     # avoid host polution inf pkg-config files
     sed -i "s:${STAGING_DIR_HOST}::g" `find -name '*.pc'`
 }
-
-PNBLACKLIST[gtkmathview] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131636/"
-- 
2.9.3


