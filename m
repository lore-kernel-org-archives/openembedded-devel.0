Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id DA86161912
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 17:28:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z15so5461227wrl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 09:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xWtkvjWDcZ3T2fxS3P9L16zV6egdY1O4tqlmh0qmdto=;
	b=Ea1Ru3JAReslzSCvjyrUBVgs/bL7OrWbdlZ5O15T1NQjFvBhaZ4G4vnL/yBDwJlB6i
	cTy16zmVZAGNISozO6ndQioldNnLmX4LGDjbyP+8va++/ftUKpRhH5zf4e2Z8TEFL3SD
	bwVqh9774Jw2w0+BgAkxpViC0RKEw+6VnxGnrIKvkdm4RAlr/055IIpWaLE/J9EUo8MG
	xnRmqov6QoOvJGlSfPLkkUiJN4cZisb7hJcBT+W+turxeHAkz6W0JCTUZm9aMuEvZO45
	1MCahWeS8f/yd/91xERywuhOwL6+WXlcCOjFPg/BWp75dCSPZWixaplHasmQXj4ywKIR
	dMEg==
X-Gm-Message-State: ANhLgQ0HRSkbX3WF4N/PZz5e1smczXiriyRJtNMoN6Vvuq03IenRonCd
	0Zj9QeIVzOriIMvhUDxNL7YijVDm
X-Google-Smtp-Source: ADFU+vtC4L/3AFAwzrEB8xzNyG8snq6oWTXh/WVMu0IG6cBK9WXwJUm19LVSlo6HxRbaJMqqZa8ROA==
X-Received: by 2002:a5d:4382:: with SMTP id i2mr6232142wrq.424.1583256533139; 
	Tue, 03 Mar 2020 09:28:53 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a6sm5100819wmh.32.2020.03.03.09.28.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 09:28:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2020 17:28:50 +0000
Message-Id: <20200303172851.19000-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][master-next][PATCH v2 1/2] nodejs: drop 'gyp' PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 17:28:53 -0000
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

The reason is the following patch nodejs has applied to its version of gyp as
of NodeJS v12 (commit fff922afee6e ("deps,build: compute torque_outputs in v8.gyp")
upstream):

--- gyp/pylib/gyp/input.py      2020-03-02 12:36:30.788248197 +0000
+++ node.git/tools/gyp/pylib/gyp/input.py    2020-03-02 12:16:09.956707788 +0000
@@ -890,6 +881,7 @@ def ExpandVariables(input, phase, variab
           oldwd = os.getcwd()  # Python doesn't like os.open('.'): no fchdir.
           if build_file_dir:  # build_file_dir may be None (see above).
             os.chdir(build_file_dir)
+          sys.path.append(os.getcwd())
           try:

             parsed_contents = shlex.split(contents)
@@ -900,6 +892,7 @@ def ExpandVariables(input, phase, variab
                              "module (%s): %s" % (parsed_contents[0], e))
             replacement = str(py_module.DoMain(parsed_contents[1:])).rstrip()
           finally:
+            sys.path.pop()
             os.chdir(oldwd)
           assert replacement != None
         elif command_string:

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


