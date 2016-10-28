Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F87E60670
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 13:47:07 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v138so2181138qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3jx5NX84FDrsFKP8CpsL6fOvsjrocxITuFuK6IjhXok=;
	b=U6fvJbaUeVJBspUANZCfXgvlizlkk9JPcEH/p8RQj0JiwdUkU4+21CcZz9g1DXm2JX
	sWIpAl2gAkLZGrn97eM/XgePnd7wy/hzXoKcK+QN2UyfMd9te2ZNHjnUhQCpdsXq0etg
	Tj4nYln//cw5QrhUoIz03q1tdbIUNDZTht+AodZ6WLoWTVuqwdZ0EzO4R9AgHeVAZ3Bo
	XDaCVRWP5fQO8DHIcjNKESU7xPJjACKbFmTS3yClGWA6DBU5uABknNyLG+IeD6ZWMkmr
	T6X22w9Q+LYyQunbj2WehE60bFQWus0TahjN4mR2bY07C/VYrHeGLbsxgK62yG/GVOrq
	rVhQ==
X-Gm-Message-State: ABUngvcorf3TYHz05+z+sPvKMP4uWjmWYoj+51D1+msaP+5yyeylrnsyk/FhCHIAFgSbHg==
X-Received: by 10.55.112.195 with SMTP id l186mr10948595qkc.183.1477662429085; 
	Fri, 28 Oct 2016 06:47:09 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id i5sm6267334qtb.14.2016.10.28.06.47.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 06:47:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 09:46:57 -0400
Message-Id: <1477662418-29346-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-webencodings: add recipe for version 0.5
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
X-List-Received-Date: Fri, 28 Oct 2016 13:47:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webencodings_0.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-webencodings_0.5.bb

diff --git a/meta-python/recipes-devtools/python/python-webencodings_0.5.bb b/meta-python/recipes-devtools/python/python-webencodings_0.5.bb
new file mode 100644
index 0000000..fbe6285
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-webencodings_0.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=2fc6c99a19e6dbde9f7a2239143c9d13"
+
+SRC_URI[md5sum] = "878714d45241f7970dffd8991d61fff9"
+SRC_URI[sha256sum] = "a5c55ee93b24e740fe951c37b5c228dccc1f171450e188555a775261cce1b904"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
-- 
2.7.4


