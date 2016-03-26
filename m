Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 46B577017C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:11 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id y89so8548392qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=mmDRATEgZicx6dNDVn3X2dob0kjUoYLDKUSLuk77rZo=;
	b=HTN+CZ0iePpq6LhhmPlY/HgGhsf0UPlJJOOJjaPxpgaLYLJCwizIk+/JOf/II7K5NS
	nnxoQoMLoPR7bcNJJwuNpMJUDR2vTvSwGLatt3AjsgLWeNUSxArnDf1st4zI4c+p3+rr
	AGhMWyup1MwX7J1Ci+p157k4NLjSinUXRpwbnCzgFo9F4ZYbiWPAa/EjXlsrAqCNJDtO
	sTMzXk/yOXU4eJPkBSew05EroDhykoCUHlFOX0/HET4NhNwIZ2PW/F2Ihzi5uvVpWhj7
	zFlt+dpv87sm6bCQjsUDCx5p1ho5Dw7wIIXhlR4zOTT2Btlt9tVogFDBOxI99XO/dRBv
	RMyg==
X-Gm-Message-State: AD7BkJIBlKPQOGHucRuusCsarElXkqxzYwU4GKlUlkv5UbCRImWm5a+bVVAFewnTVPTl1Q==
X-Received: by 10.140.28.135 with SMTP id 7mr23738512qgz.72.1458997512714;
	Sat, 26 Mar 2016 06:05:12 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:26 -0400
Message-Id: <0e2dcaa6b572edc7dbafdce046ba0d1be51e99c4.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 06/30] python-werkzeug: update to 0.11.5
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.11.3.bb => python-werkzeug_0.11.5.bb}   | 0
 .../python/{python3-werkzeug_0.11.3.bb => python3-werkzeug_0.11.5.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.3.bb => python-werkzeug_0.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.3.bb => python3-werkzeug_0.11.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index 0693b47..7b54469 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
 
-SRC_URI[md5sum] = "9479bc7ea6a42c2d0d82929d3926df67"
-SRC_URI[sha256sum] = "eb5f700a9bfc96420b055635af9002d3662e43d80c3ffd31f224c25bc0d5f462"
+SRC_URI[md5sum] = "daf443a939459e12f14fd2e4658a26df"
+SRC_URI[sha256sum] = "afdb04f183eef3b20827eb4520dcb75c1cd1f0ba7a7de3f463ff7a462eee8164"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.11.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.11.5.bb
-- 
1.9.1


