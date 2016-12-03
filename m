Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C6DCB71A0B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:27 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id x23so9596717pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vpGqP0hCaOjpOT66S2U2BOd02n9hLUxHGUFO05jjlOY=;
	b=iIYWhmlxYsmjd2sj+ZX/J08w0CsR+EcVM3280AnB3vJ5dmlwIr9lIqZPuVm5zm4Bpb
	ywFAI6U4N9tENEymVXOofnHc/6qu4i9ttgKODsc6BbsvhvrsGfNgBC3bROxrSX2osg9m
	lxL8tIZQxtHEpKC7vrh3Cm7q1rg3GUjUl+cqKwWEKrmkuQobFuFG/0fbKTsREF4HaF7Z
	2StBnGFaaLHvh2M+c32hdyTI3zYcj8Z7/6abWiXcu+N/9Y5FkwEEzgoRlgYDB22dEoFb
	wYJe1LIymQ1lseU+uGK2rA1EVpzbHe81cj+K5KhNLa1DssgeJV3ey3xASwWXgFro9OeB
	48Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vpGqP0hCaOjpOT66S2U2BOd02n9hLUxHGUFO05jjlOY=;
	b=UT1ExvJwUfKc7VXwz+kxWWat2GFUPlE5NFg9XXday/WFjsTj3fXCJhf+WFg3ejPtkd
	HLX2XKaSCZ54WEJsIkUZgeVU52l/lQCYu1OdibsMLNodG6R0KrAxP6GuJa6ct2vb79Wl
	sQ7ZV593I3EtU5Wxfdcnbt25jjKIDI7xevDVPyQobydA+XzbjrrluOoewvRoIzD+qAIt
	zdWVWsGe6gQip4Dgz46VWHVeW4WNMpgQd+9ijSmtPab8HnX2VNI0Hdua5jtJD3Kf6Q1n
	9rNNAKACM2q+M4yu4G8svGmzDX+YLz8F0hg3xub8EwSVJBPiuOPPkFK0yQQ1s9WIQH6g
	/7Fg==
X-Gm-Message-State: AKaTC01upRDbdwHwdpu7AKXZBxKESjymVnGyBu8okmf3yxe3YJVC8jsc+BYrSUiUzDBlrg==
X-Received: by 10.84.143.162 with SMTP id 31mr38205568plz.2.1480734269068;
	Fri, 02 Dec 2016 19:04:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:16 -0800
Message-Id: <20161203030422.17285-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/8] python-cson: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-cson/python-cson_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-cson/python-cson_git.bb

diff --git a/meta-python/recipes-extended/python-cson/python-cson_git.bb b/meta-python/recipes-extended/python-cson/python-cson_git.bb
new file mode 100644
index 0000000..efb338c
--- /dev/null
+++ b/meta-python/recipes-extended/python-cson/python-cson_git.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Python library for CSON (schema-compressed JSON)"
+HOMEPAGE = "https://github.com/gt3389b/python-cson/"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7709d2635e63ab96973055a23c2a4cac"
+
+SRCREV = "f3f2898c44bb16b951d3e9f2fbf6d1c4158edda2"
+SRC_URI = "git://github.com/gt3389b/python-cson.git"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN}_class-native = ""
+DEPENDS_append_class-native = " python-native "
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
+
-- 
2.10.2


