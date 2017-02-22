Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4AE72FBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 89so2144756wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6aJQh3WTxSVB0O3fHt3MxbVBfI21ucBUY4qhOsvrJjo=;
	b=GLGdu/8oXa9nbUiZdusWQxZ4EjihDVSt5dbA9nWuVSBhu9OFPZNOZ0mAOn/CHNWQYM
	eXy0K9QL69JHuk6Z8SAtgvaTe4ChQqgImGXuuWDms2olkR+BhgnpSNXdSaf5bemeQ52E
	mAub8H6ca63UVwG/OTt5w7ucE0sLdo4YTE17/f/FLWp/wy37PzWYIIglTDQQylXO/oqT
	oAAmS9U0IcQfQ7N2nYLcrL9+KovdDaldZVvqdLGE/Ct+sbm9JL7IIKAIDY9dmRojTjc7
	cMspFlaJWHmwQOADDbt4p9Vad20lgvlJNK11JvhDSFlXbhrSPCbRl0prpaAfwI+c1cEz
	h82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6aJQh3WTxSVB0O3fHt3MxbVBfI21ucBUY4qhOsvrJjo=;
	b=rH8Vze9AwIIb9YXBAzp3hKWfMRulRyC40+FXU3fapZ5/Vc/Vv5wIYjLKeblsUKCYur
	h7ti0KsJJrW8TK9goL9VaoriuEbN+GkWT415QarUl+Gw/5E+QoLYFf2a9IKciWM711nE
	F37SIJ3sEI9EsRO+EYRzH+/xjZL3XBML2XtNoOa4qKd9bkNoiWYPar1irrgdoD56LtrD
	GzObbVI44mTSXhp3P7XYr4IEFSbZqJDAps1QTekfm3v02pitZi0/Pqsls5BL7CN8OaT1
	0DhfVQ8V8415EWNLSMpJT5sfEgQi6KJ3yRpviXMH9Qrb7OaZ5JQ/4FstYXDbH6WITdgb
	PzsQ==
X-Gm-Message-State: AMke39kwlLGtNNG8uHN7sOjWgpFk7GyyPMypTexftk//mSjG5BgvQqk4p0oJMd6jfB+biQ==
X-Received: by 10.223.135.203 with SMTP id c11mr335610wrc.135.1487804589789;
	Wed, 22 Feb 2017 15:03:09 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:46 +0100
Message-Id: <20170222230250.30288-8-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] fontforge: update 20150824 -> 20161012
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fontforge/{fontforge_20150824.bb => fontforge_20161012.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20150824.bb => fontforge_20161012.bb} (96%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb
similarity index 96%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb
index 75abd5c..1c3376d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20161012.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig pythonnative distro_features_check gettext
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
 SRC_URI = "git://github.com/${BPN}/${BPN}.git"
-# tag 20150824
-SRCREV = "07d5ccff2704f8a56f1b3cc6695a4e31f85f88e6"
+# tag 20161012
+SRCREV = "072edb0235cd163d6c3391da9cc3754c3c66f47a"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF_append_class-native = " with_x=no"
-- 
2.9.3


