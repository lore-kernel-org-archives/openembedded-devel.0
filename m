Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 818B678883
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t12so1460988pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WlIWz4wOQVzpisJUA4JPUg4uVX+gGyQ+EgKeV05AsLA=;
	b=LdyGVjzMHrIRfothf8eLI4jzWTCjy3yKL/d8UwOpihA+NVou+t21CJfDs0XD8WR5s3
	5eDAYGroBk4l07OkeuvkK/zVwHaXIi09rBEyw49PyZOM/K2dSMgfjKlNJzObFoRl73vQ
	Wk1VEBDk8C7aK8cNvPKTu4flzuMnbXzaW1tet8yKmKD7hWv/AS6U+ywm/eF11r647WU6
	L4G+JvakpJi+48nSXfhwTDHbFxxlT36uAp3XaSq8P5fS/+4o7RBh5mAg3FkGUBI8JEOT
	DYU4AsxpaO687Oz893IvXBlKp2Bqq2dt4ZH0wH4DEv1ggGxWYYKF+OLYu5ldFRualpE7
	itLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WlIWz4wOQVzpisJUA4JPUg4uVX+gGyQ+EgKeV05AsLA=;
	b=TFveStzwRRpQ2xV9fDyRpvs3NVATY9EPynqNE0PlBMz5w5Nr/hv91RRQugip6JEpOr
	brWFI6UjOO6ct2deLSJjVZDXN0mAgr5FVhnCgv5s/9jW9gQeodVgz8w8esTJzOzBYjRt
	nyToPd/7DipW040k7yjkWhFavgkRd7pfzr7yE5ay+Lj7aeJyIqHM7hinrDF2Ct9XfuzH
	xUyMvHadKr6At/1eFqYcJvu5g13GFttHF+olB2LvjR229HPAF1azIDA4Q+j3upSsyyul
	BXtL7kMJ93BPlZJsmNcbVVM0Ot44f7A1ezc9hGCqgtXvD79QWKwa3ebNt2o7LIWiqzua
	ahLw==
X-Gm-Message-State: AKwxytfUc9QAxxulSmDWE9OYSJWYVQfgBHq0BcpB4nCcvWUKqKURFMdh
	dL91NLcEGbB0Xv2jFmAVztupNw==
X-Google-Smtp-Source: AH8x226+UyPKWWkbyzACgn4oYSB60p97UuwzH4kxXMjT8H4i8C3gKg1W7uNMGOqHEypeOn2DS4N/KA==
X-Received: by 10.98.137.197 with SMTP id n66mr20947701pfk.70.1517023497210;
	Fri, 26 Jan 2018 19:24:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:17 -0800
Message-Id: <b1a842876c3fe0af5209fe6314fb7de799d9eb3b.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/36] dfu-utils-native: fix do_deploy sstate handling
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>

We need to install to the sstate input dir and not the output dir, so
sstate handling will work correctly.

Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 1ef92d2423d6d6546e4f0585478540212b26f3a0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index 7a7a662..aeca23b 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -8,9 +8,8 @@ SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
 
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 do_deploy() {
-    install -d ${DEPLOY_DIR_TOOLS}
-    install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV}
-    rm -f ${DEPLOY_DIR_TOOLS}/dfu-util
-    ln -sf ./dfu-util-${PV} ${DEPLOY_DIR_TOOLS}/dfu-util
+    install -m 0755 src/dfu-util_static ${DEPLOYDIR}/dfu-util-${PV}
+    rm -f ${DEPLOYDIR}/dfu-util
+    ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
 }
 addtask deploy before do_package after do_install
-- 
2.7.4


