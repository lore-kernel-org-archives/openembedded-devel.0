Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AE27F7F941
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 22:05:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i10so12562018wrs.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gl/5lyE+73X9InbonhHs/HdIniC4ZjWFnyRWQ+6Lqx4=;
	b=Jz/eePe102R3flya2Og1AwmZvB91sggSDYUyhV7RtA9vjf0/2qqeDi+lMhlXwSYQuz
	yFsxR62Jgxe5qAyHf+kwtxBXik/SCrlibt70At16IpVLbcqWhg+y5Dg/58+2ZNqYSK8H
	g6yWwPqj1EpBaraLRpxdWLbupA7UhLQrLaJhVgG+/jC5Y/TAbvuK/OqVfQgz7IqUZKg/
	mxq81ZRtXmJKEUniICZwfhQarPfss36AVPVDHuCCV5pKrHmbax17H18EUpVgq6e009gv
	vBRP/cT+4RxeI4iqOM1mr7nTgOieMadlF+G3g7rkt6t48tMOIqL0OXL4aBVKdD0FJ4YE
	JRsA==
X-Gm-Message-State: APjAAAWhZ9raXXdlcGhnkr+exmdxxCWa+eD8XPKTTqHOv/hnLYdNZY4R
	EOSG1sogiryRYoeGS4WiUjyo3M4z
X-Google-Smtp-Source: APXvYqxJAuat8bD55wSMpqWolRs2Y5f+QmHcrmE0bKExQZzUofEBIL0rGmoQboBbfHsoOfcKTZJReQ==
X-Received: by 2002:a5d:4f06:: with SMTP id c6mr18275084wru.211.1573423512285; 
	Sun, 10 Nov 2019 14:05:12 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t24sm29925375wra.55.2019.11.10.14.05.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 14:05:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:05:07 +0000
Message-Id: <20191110220510.10077-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191110220510.10077-1-git@andred.net>
References: <20191110220510.10077-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] nodejs: delete all bundled deps in do_unpack() if needed
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
X-List-Received-Date: Sun, 10 Nov 2019 22:05:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We can delete bundled deps where system-provided counterparts
should be used instead.
Amongst others, this ensures they are not used accidentally.

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-devtools/nodejs/nodejs_10.17.0.bb   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 9c514e6be..53149af5e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -69,9 +69,24 @@ EXTRA_OEMAKE_append = "\
     AR.host='${AR}' \
 "
 
+python do_unpack() {
+    import shutil
+
+    bb.build.exec_func('base_do_unpack', d)
+
+    shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
+    if 'ares' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/cares', True)
+    if 'libuv' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/uv', True)
+    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/nghttp2', True)
+    if 'zlib' in d.getVar('PACKAGECONFIG'):
+        shutil.rmtree(d.getVar('S') + '/deps/zlib', True)
+}
+
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
-    rm -rf ${S}/deps/openssl
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-- 
2.23.0.rc1


