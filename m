Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE35D770D0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:03 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b35so8313276qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IxQE3i9FmQldVVQDwBD/6rpt8dDeTKpRL2VO1klMEps=;
	b=G183i4IIdhyqtTxSFmSR93P5LgGuis+t1MHfxgH71nzKBHn6NYyRcnIr8umvI1e4G2
	tqCaJAzwHR2rXMfqkXx7timNJoFgycR1fJBSq5/OyVC3tssJIQkpSbw1Tl01yJbL1ss4
	YHM0a64rohvw1wbLJfpD6rBAWgbSYtQTuC7T8Zp+np3E/YqdN3SGoLTjnr7JuM6xTkzD
	vr9odMZ2/8pYOnz2/sreixGq8PpxpJHPzQmntJ0uFukK8bXXew5pVkYx9mOYWh7ksGkp
	jKkoCgSZ8fURgEslcuWz1O8ewBLLyBp8O+m51ClIZ+wMrn1csUt+JLjgk5bD03q4smQb
	WLrQ==
X-Gm-Message-State: AG10YOTsqXTIFoRZWXS0ERSETQ3Fv+bKgwVtLqKBbNiXs1D97UCG7ynQ1hdXIcvzAsiz7g==
X-Received: by 10.140.109.247 with SMTP id l110mr15123998qgf.52.1453641484645; 
	Sun, 24 Jan 2016 05:18:04 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:41 -0500
Message-Id: <14a7723ae4a25c0d00dfde4fcf2e0964f33d8757.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 08/13] python-backports-ssl: update to 3.5.0.1
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:04 -0000

---
 ...n-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-backports-ssl_3.4.0.2.bb => python-backports-ssl_3.5.0.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
rename to meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index f5776cc..7c980e7 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -6,12 +6,12 @@ on your own. So the ssl package in the Standard Library of Python 3.2 and greate
 match_hostname() function for performing this check instead of requiring every application to \
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95a5ee8fd779fbeca8b4cbca64433c87"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 
-SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
-SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
+SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
+SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
 
 inherit pypi setuptools
-- 
1.9.1


