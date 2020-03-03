Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E551618EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 18:22:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g134so3066791wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 10:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vsbyuELxpGqnn8302+vf0D9CppQWLURHYR826l3NA4E=;
	b=bs4HGSUHu2FVa28GchZUjcL2Zmlov++zVBVk4kJuH7+wePvPaed4YpxEZWH89vTCch
	9fAzk/Mf7Vs2DfPz6VK495UxWQDehsmvfHouAoS+cNkY3t2gdui0O8Nxclmq+E8g9yx1
	c59WqAHAzgg3RGtU3sA7bEUztIyzo5mN4ZTn29pcizvOsnT+C378ZuS6RB3ruLUvNuG3
	rKWcINrRbzLbE126PSis5nIiufYeAlGzxPUm099Ad2qh1VcnmhhvYP75tnEIyxYdvr0g
	n5lu3pzNNKApAb5EulkhDximzRNLiTwnZn5A2shUTcl1UHv7o+EeTtiIw28jR9ub3eET
	i/Sw==
X-Gm-Message-State: ANhLgQ0Pt8xMcg3QSVOy+wbua7oEB0lFSSRy/Xjoki22HXoxNx+ILJ7d
	zszIWX1kRDQXm0peRm5QJJzJvARl
X-Google-Smtp-Source: ADFU+vtu/AeRwm92Ywun7gNykqLTtZMG1WrSytOaUx9Dn2vKA4rOPi7aozkeqs7/+0cIETEKfuBJDQ==
X-Received: by 2002:a1c:2686:: with SMTP id m128mr5305891wmm.123.1583259757675;
	Tue, 03 Mar 2020 10:22:37 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o27sm36283887wro.27.2020.03.03.10.22.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 10:22:36 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 18:22:36 +0000
Message-Id: <20200303182236.20312-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][master-next][PATCH v3] nodejs: drop 'gyp' PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 18:22:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

During the python3 / nodejs update, the dependencies weren't updated, so
using system-gyp ends up trying to use the python2 version of system-
gyp, which will of course fail.
Fixing this to depend on the python3 version of gyp still doesn't
doesn't make things work, though:
    ERROR: nodejs-native-12.14.1-r0 do_configure: Execution of '.../nodejs-native/12.14.1-r0/temp/run.do_configure.26054' failed with exit code 1:
    gyp: Error importing pymod_do_mainmodule (ForEachFormat): No module named 'ForEachFormat' while loading dependencies of .../nodejs-native/12.14.1-r0/node-v12.14.1/node.gyp while trying to load .../nodejs-native/12.14.1-r0/node-v12.14.1/node.gyp
    Error running GYP

The reason is commit fff922afee6e ("deps,build: compute torque_outputs in v8.gyp")
in NodeJS v12, where they modified their bundled version of gyp to
become incompatible with the upstream version of gyp by adding extra /
unusual search paths to gyp.

Since I'm not sure how to deal with that when using system-gyp, and because
the original intention for using system-gyp was to make the previous nodejs
version compatible with python3 by ultimately switching to the python3 version
of system-gyp which isn't necessary anymore, and given nobody else seems to
be using this PACKAGECONFIG, just drop it.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index 6eb52c209..49bb71e28 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -53,7 +53,6 @@ ARCHFLAGS ?= ""
 
 PACKAGECONFIG ??= "ares icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
-PACKAGECONFIG[gyp] = ",,gyp-py2-native"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
 PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
 PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
@@ -82,8 +81,6 @@ python do_unpack() {
     shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares', True)
-    if 'gyp' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/tools/gyp', True)
     if 'libuv' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/uv', True)
     if 'nghttp2' in d.getVar('PACKAGECONFIG'):
-- 
2.23.0.rc1


