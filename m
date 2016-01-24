Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD3C776E2E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:04 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so8407526qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/9iZ5guWp6Icab86blNAql74QqnFrWoASRdy400ZFbQ=;
	b=EPgJjwRamu7Lc4kce2xW8DXGp8vBaRRphk477HHifWss4MvsInr9Uv7I7Tpem1KGyU
	W7FBPOsVdCrORvYtjErxzJ3OqYzBadlFIyKHouWCNeaUXlQ1wToAJAhlR7j0agBhirRa
	Y+2C19MZvg0aNkunKeiACr1ZF53sFxHZfcUeJzArw4hc1xSwsK+3Pqlfyg563k7+wiD/
	l5kvAJcv0E4y7KCB2FEowbARw/4TI7Mav0Jfn9QalVVyJaV48LMuEb1adsMtkhRyavlv
	c+A7wszsT9o0wX1hMAZj8TfrBWB6CLs36HhgRTguEciYLa967Y1vqjsraXgNRzsR9PdY
	RmYA==
X-Gm-Message-State: AG10YOSLTNJiAD6rVrjxoZWte77XjQyzB+JviP967A53FuJVt++D/KeaySdNP/ozr0SUvA==
X-Received: by 10.140.18.114 with SMTP id 105mr15223969qge.41.1453641485317;
	Sun, 24 Jan 2016 05:18:05 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:42 -0500
Message-Id: <70a7f529873d88c7d2254c2625577dbd9b2e5687.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 09/13] python-certifi: update to 2015.11.20.1
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
 .../{python-certifi_14.05.14.bb => python-certifi_2015.11.20.1.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb => python-certifi_2015.11.20.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
rename to meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
index f1ebf1e..1485d15 100644
--- a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
+++ b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
@@ -2,11 +2,12 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "315ea4e50673a16ab047099f816fd32a"
-SRC_URI[sha256sum] = "1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69"
+SRC_URI[md5sum] = "e04b512009401603f1485380ac879cf5"
+SRC_URI[sha256sum] = "30b0a7354a1b32caa8b4705d3f5fb2dadefac7ba4bf8af8a2176869f93e38f16"
 
 inherit pypi setuptools
-- 
1.9.1


