Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBF1FA3728
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 06:38:46 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1107.1767335924768817473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 22:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJb78gr1;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b1e54aefc5so1069488285a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 22:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767335923; x=1767940723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VtZMSPQD7iQ2Mmt7hXvr6WnpufPH3rSZ2tNIxeP4tl0=;
        b=DJb78gr1KuUNpB9aCkNHg4aYd+bHailg9fTYE4VCuEL7+1uNloHX4Tmi95OgA6WAAd
         bjnLTAiGTXdsX2QhibtYnBP85pMlHngUXhrOLL243rsTTG5k7R4VHZ/v3jCtcBKJu8Pd
         emvLOvAW0yyy47ZpzzhktDaS6cCYFWK+OS6pSk6yWj+sq/FkfKtGcKyyr8ObJUxM5bwE
         3Abt5OkR9y4sK0GdQHIsJ/K99rqX5O8+u6vCs7e834iOg24yczx1wqKcW17sAlsTCuCM
         EGsJx9Ung6j6aQ3o4yisgwovG62YKuOAA7VHsdEVGpkgJozPekgx5kJMSSRWuC4daZ3g
         W7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767335923; x=1767940723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtZMSPQD7iQ2Mmt7hXvr6WnpufPH3rSZ2tNIxeP4tl0=;
        b=I7QNxyDoeZujJaX9xkBZnk+/F4eGTZ/DXdJnFRhJ91XBe5iPOaNPNFaVGZS16hFwyK
         VHmiJS3cFiHNiJFiVgA6QU90qZR+zqhjG61tgLpYJTmucYMdnkX9VIAvcca6p3eQBSHc
         h+RNUTnEd5P6hym7IHxVK598pQnoXx1QxhMIzY4fOTQQpV8JOBSWJxm7nabPA4ZSnGuh
         iy9R+aOszxgJr/CCduouFpF9SHj/QKqNCQqKuxXzn/p8IaimBYIA7m6FJ5pLAdszEH1p
         XWATYBDzPswp9lA91/KvrfM+InkNuoB97nIMGEUpcRfDIXnQxwN7mT35OYAtRjeARlvT
         4+uQ==
X-Gm-Message-State: AOJu0YxClZARtWtelbFe5BdC0tLFIZj7Iwk8wjUwspx2x1/ol2g0UV0h
	sp/zJfW74GxzUguXqbRRll+lEzf1HZhsKueSiXF6XBt3BWXKZ3RAG3VYAs7o9g==
X-Gm-Gg: AY/fxX6/LxEQxoAdys8txTznoU0Mvb84J7S8yL5bD9C8jnlQ6kU7rIgaFIeg7QIpHVr
	zN70G+JEV8EtnR0SG7DWQNaWuQP19M4wzy5pNl1/InmvA1tMVbVrftqsgFbBPg+O2ZHbN57Snjc
	imclQyesilj9cPN++8iAxjvBWBt2bVZTKDLAUbvRLOl7Ee2iWKy1mUREAL4nokFSI1ONzXRky+b
	YKWBX0DDAZLtiMkw8KPTqS/NGWpv7bDr/JZG2mptgpTqFvkocFVQJ9OjH7yR3mD4n+imK5IGKYq
	Ud13My+w2dwgqjB95iAmR/uHDzVp9zuvO0fXaVGr9BlLTD8dwmTXgBavhWQYp2ZIgk/z1LmBDEs
	el3Gp0n2ZljJtL4DSeQ9tLWMtvO1EbShSVV+tlUWKuZDEE6WsdKdojJ4cz41n74Q5XciScgI6U3
	EptE8pPqeVWJKVMT5NmGD4eJbR5FqDBjNiU7kg87bPG3e8OtUNkc61Uw==
X-Google-Smtp-Source: AGHT+IEpm3KMELX6aUs70qOja1gmrDj0WRLFa9rfXwe38e4vvuj7UWsa4FynjqjtdylITAub7h/4Cg==
X-Received: by 2002:a05:620a:7001:b0:892:7dd2:9f14 with SMTP id af79cd13be357-8c08f664ee2mr5653915785a.25.1767335923022;
        Thu, 01 Jan 2026 22:38:43 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ed98dsm3152722685a.31.2026.01.01.22.38.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 22:38:41 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libwebsockets: use native sysroot's ssl config
Date: Fri,  2 Jan 2026 01:38:35 -0500
Message-ID: <20260102063835.2614628-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 06:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123089

During the compile step, CMake will attempt to generate a test
certificate with openssl-native using a hard-coded path to the openssl
config:

	openssl req -config /etc/ssl/openssl.cnf ...

Thus using the build host's openssl config. If the build host's openssl
is configured with options that openssl-native does not understand or
accept, the test certificate will not be generated:

[log.do_configure on openSUSE 16.0]
	Searching for OpenSSL executable and dlls
	OpenSSL executable: .../build/tmp/work/cortexa53-crypto-oe-linux/libwebsockets/4.5.2/recipe-sysroot-native/usr/bin/openssl
	 GENCERTS = 1
	Generating SSL Certificates for the test-server...
	Error configuring OpenSSL modules
	4037413D467F0000:error:030000A9:digital envelope routines:alg_module_init:unknown option:../sources/openssl-3.5.4/crypto/evp/evp_cnf.c:61:name=rh-allow-sha1-signatures, value=yes
	4037413D467F0000:error:0700006D:configuration file routines:module_run:module initialization error:../sources/openssl-3.5.4/crypto/conf/conf_mod.c:288:module=alg_section, value=evp_properties retcode=-1
	CMake Warning at lib/tls/CMakeLists.txt:528 (message):
	  !!! Failed to generate SSL certificate for Test Server!!!:

	  OpenSSL return code = 1

and the subsequent do_install() step will fail:

	| CMake Error at test-apps/cmake_install.cmake:126 (file):
	|   file INSTALL cannot find
	|   ".../build/tmp/work/cortexa53-crypto-oe-linux/libwebsockets/4.5.2/build/libwebsockets-test-server.key.pem":
	|   No such file or directory.

	ERROR: Task (.../layers/meta-openembedded/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb:do_install) failed with exit code '1'

Fix the location where CMake looks for the openssl.cnf file in order
to use the one that comes with the openssl-native that will be used to
generate the certificate. Thus ensuring that they are in step in terms
of which configuration options will be acceptable.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
index 19ac6be8eb41..35545aacee95 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
@@ -36,6 +36,10 @@ EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
+do_compile:prepend() {
+    sed -i -e 's|/etc/ssl|${RECIPE_SYSROOT_NATIVE}/etc/ssl|g' ${S}/lib/tls/CMakeLists.txt
+}
+
 do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}/libcrypto.so|crypto|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
     sed -i -e 's|${STAGING_LIBDIR}/libssl.so|ssl|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
-- 
2.51.0


