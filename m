Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 24CE27750A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:14:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x71so871985qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yYi60GejBi5vkbdyUAEHl4jv8DD//nZh+EGfWMlEnb4=;
	b=EEYc/K7bqBiFGuswmeAiDaYaJLhES8nL0GmtnZ9u9B3RuZpsStsW6ZJD4MvD1hdy06
	GoE8md2F3e5h1FvmrDulbAHOC2u67jU2YTIEq3nIpAgWVUjnl9SA3gQvlC4gCO21EQdg
	WWTToUfCGCGz5AkiSPmXP/zMiuGqF5nh0lrONpXgLz4VxsZYePbyFBaxlmWXgA8+Q5Qh
	cr61UOfpZiC36+ATaBHG/iqvtslkuctvz/YLHdjy+Na8JHs63W/Fa9kzhlHkryZmy8TV
	Qi4smd6zrXHd4rxGFoob3MPtkecIbbrKXIKehvXglKABvuMBXqbwuERP/38ZEo4ekerJ
	YPzw==
X-Gm-Message-State: AMke39mQB/+hs5o3+KumfVVlkZTQIrI6JuEoiONiA7I5A3gLPONsKFiG9cVFl1qBP1Ig5w==
X-Received: by 10.55.142.134 with SMTP id q128mr12678878qkd.45.1487891695260; 
	Thu, 23 Feb 2017 15:14:55 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	w186sm3613166qkw.44.2017.02.23.15.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 15:14:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 18:14:43 -0500
Message-Id: <1487891683-11071-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487891683-11071-1-git-send-email-derek@asterius.io>
References: <1487891683-11071-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-ldap: update to version 2.4.32
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
X-List-Received-Date: Thu, 23 Feb 2017 23:14:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ldap_2.4.10.bb => python-ldap_2.4.32.bb}      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ldap_2.4.10.bb => python-ldap_2.4.32.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.32.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
rename to meta-python/recipes-devtools/python/python-ldap_2.4.32.bb
index 5b3b8bd..f25ad1e 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.4.32.bb
@@ -15,10 +15,15 @@ PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-SRC_URI[md5sum] = "a15827ca13c90e9101e5e9405c1d83be"
-SRC_URI[sha256sum] = "67cc7801bf24c29386ab99966ceb68d6a60fa9e0566cc95a4fbb2c4695a8ce54"
+SRC_URI[md5sum] = "7c46c8a04acc227a778c7900c87cdfc7"
+SRC_URI[sha256sum] = "5810f1b5a9ae9255df99fb9c2dcab7352fed325687efda56c0faae1a82c5e3cb"
 
 do_configure_prepend() {
     sed -i -e 's:^library_dirs =.*::' setup.cfg
     sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
 }
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-threading \
+"
-- 
2.7.4


