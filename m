Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B959D7CDAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 19:28:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44F3j212svz5Q
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551900534;
	bh=GsupfHvncGndLzoXsnvHhPdamR/KU+X71/+zxAiJpso=;
	h=From:To:Subject:Date:From;
	b=BMAdQnM8lizkxGyowNz3nWR9HMOuZRFflMCTCUf4GlB0exSK2aWLTHaG1QnJLNSn0
	5W5g4fk6dSw+xcynlHopHjDoWhxz3vv2xCeGrA9Rka3Mw2ly2qCSsLqiO6UktcE8Wf
	yAEWV44BaetpFIEjGV1yyzQVapfJeygByTD7YMuAL4VHchq09fjIcDFBetYEQKKCRQ
	oX/eIiJ842ZMMPYaQmjnZ9U5Frt26y17GGgTrSNfTPJWHbdBVel5gOvnk1gAhWMCNj
	dqlayFpP2YqvP8ohvvQBDAtqQVq0JcIbjULEEU0fz/m0rrQB56ZgjlttMg0p3W4Z/p
	VELxqr1k05sQSi6yyggKgR1Ipg9MN9OIZ02VFfryUYwEwE4zfJMcalYUC9MwgI0GOn
	/QKdugZNUQNKk7nmnsziBGsaRw/GbnnS2KjO5cOMyg34sYqVpC9iD9UrLmh4uktEnW
	TpiISj+1lVki/2Od1e+qZwAYyARmA5KE/VshgJq3PxAMYlru7vnaYAnSOYvYXAFo6C
	S8iGZwXYogiUjzqY5LV9AI+kDvuoVfK5YWU9asUgRtFcr9AhvkKG45z+7MRIfeY8Tz
	tJ79F6gu2cRQiV47Rei7YzewD0BFJtP9eXGf1DhyoTaG6g7tQs4PMiklTZqtcWOm3F
	jWOgCc5cJOV6B42GYMxht7Ek=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:28:52 +0200
Message-Id: <20190306192852.9651-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.22.0 -> 1.22.2
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
X-List-Received-Date: Wed, 06 Mar 2019 19:28:54 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.22.0.bb => libqmi_1.22.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.22.0.bb => libqmi_1.22.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
index c15dfb472..da13286b4 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "35f7e1b03f9b6218a30c78422f72c6ac"
-SRC_URI[sha256sum] = "21c198b481f1617bb7edb1960d823569de3e38b269dbf513af1b56048cafaa17"
+SRC_URI[md5sum] = "3fd831c1b0de4a4432be628432a960ff"
+SRC_URI[sha256sum] = "f1f1e514a89b1dcba05cf7274895e7301a2da4c947b7c2f17acb84fc74038227"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


