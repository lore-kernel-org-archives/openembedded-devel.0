Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 238CA7868D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 12:28:47 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id a10-v6so12087229ioc.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JatRRJNFcWaBn4UUbJF/hvkasclm40JUcToj+aA2GZs=;
	b=MuJLetCPTHv4E2lGyZQuMUS+ACs8SR3XgyQVlecZbGbaworWgq1JRJzfA8OE9lqe3P
	bzV5dM0SaPDHMNwK1/nEXCGdaajUS4Lj5RkG1SGbJ7qJ7Emxc1aRcnOg977op9YJC4j9
	I1PtXAKC8UeqRDSnVLMJxnTa4md74khfS/Qp+K2zIV9b244lmlKGDFqv0zbWkpgO16fh
	keeRBixzXUpPw0k9/Z024M4EAMPwmf7kMUQaH2x+I6jF9LD2x21tWqrMHfiONGBN4ZXQ
	piRVmie+uOfGC5WtZmBTbZYSLBwwtsTqdZ7v5EkfptekMgjyZWgE30TLiOiTA+GfHp5a
	4mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JatRRJNFcWaBn4UUbJF/hvkasclm40JUcToj+aA2GZs=;
	b=Re6jAFBsem/d7Fx1ffRbm5xHNYdjC/mB7XMkk7fy0RkhSQCdqLfMW1co0wUnq2RSlN
	f3yjF4aARSmJT4MN2ebzKm/jbCzEdj8aLaTc6g38K2CCSoUK1tQQ692MWmry/KCenYjv
	fhW3o5dfzfSi54TpRTgvMh2NWUYpG4PhMA/qBQDJVbUJA/LksVckssMwJspju4UmpX3N
	j2GFZ4QG5ZkF51agdu/Ox6HWpEJ55yolIw3hdwj0iQNRdy/ThrE9r2yWhJcJGN9OQnj0
	jZxTcvwzcLYliB6zQwWNBNt/Bwe10eG6F6UssRFt12v+r15zHEhAOEoqlqD8cb9LVsLK
	PnEQ==
X-Gm-Message-State: ALKqPwepfrwolKds6q0a/DYxkbhY8soXsEeJbsDUKTtH6M93OidENWP8
	BZ4/OmPfmhIk2kyJnKsBIzb5l7Z3
X-Google-Smtp-Source: AB8JxZohp1AYa0UVrTQVnF1tOHQF53fv+pufjrwQeoPhitlLTwjVHDC4Eg8Hy5s2ohlU9iEkpul1Fw==
X-Received: by 2002:a6b:a712:: with SMTP id
	q18-v6mr6216050ioe.237.1526214528522; 
	Sun, 13 May 2018 05:28:48 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o123-v6sm2831158ith.25.2018.05.13.05.28.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 May 2018 05:28:47 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 May 2018 08:28:43 -0400
Message-Id: <20180513122843.29800-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180513122843.29800-1-twoerner@gmail.com>
References: <20180513122843.29800-1-twoerner@gmail.com>
Subject: [meta-oe][PATCH 2/2] libwebsockets: update 2.1.0 -> 3.0.0
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
X-List-Received-Date: Sun, 13 May 2018 12:28:48 -0000

The LICENSE checksum update was required because the LICENSE file added an
initial clause, and the locations of the third-party sources changed.

Here is a diff of the old and new licenses:

	--- LICENSE.old 2018-05-11 14:36:05.053031281 -0400
	+++ LICENSE.new 2018-05-11 14:35:40.364931066 -0400
	@@ -1,7 +1,13 @@
	 Libwebsockets and included programs are provided under the terms of the GNU
	 Library General Public License (LGPL) 2.1, with the following exceptions:

	-1) Static linking of programs with the libwebsockets library does not
	+1) Any reference, whether in these modifications or in the GNU
	+Library General Public License 2.1, to this License, these terms, the
	+GNU Lesser Public License,  GNU Library General Public License, LGPL, or
	+any similar reference shall refer to the GNU Library General Public
	+License 2.1 as modified by these paragraphs 1) through 4).
	+
	+2) Static linking of programs with the libwebsockets library does not
	 constitute a derivative work and does not require the author to provide
	 source code for the program, use the shared libwebsockets libraries, or
	 link their program against a user-supplied version of libwebsockets.
	@@ -10,7 +16,7 @@
	 changes to libwebsockets must be provided under the terms of the LGPL in
	 sections 1, 2, and 4.

	-2) You do not have to provide a copy of the libwebsockets license with
	+3) You do not have to provide a copy of the libwebsockets license with
	 programs that are linked to the libwebsockets library, nor do you have to
	 identify the libwebsockets license in your program or documentation as
	 required by section 6 of the LGPL.
	@@ -22,26 +28,30 @@
	 "[program] is based in part on the work of the libwebsockets  project
	 (https://libwebsockets.org)"

	-3) Some sources included have their own, more liberal licenses, or options
	+4) Some sources included have their own, more liberal licenses, or options
	 to get original sources with the liberal terms.

	 Original liberal license retained

	-  - lib/sha-1.c         - 3-clause BSD license retained, link to original
	+  - lib/misc/sha-1.c    - 3-clause BSD license retained, link to original
	   - win32port/zlib      - ZLIB license (see zlib.h)
	+  - lib/tls/mbedtls/wrapper - Apache 2.0 (only built if linked against mbedtls)

	 Relicensed to libwebsocket license

	-  - lib/base64-decode.c - relicensed to LGPL2.1+SLE, link to original
	-  - lib/daemonize.c     - relicensed from Public Domain to LGPL2.1+SLE,
	-                          link to original Public Domain version
	+  - lib/misc/base64-decode.c - relicensed to LGPL2.1+SLE, link to original
	+  - lib/misc/daemonize.c     - relicensed from Public Domain to LGPL2.1+SLE,
	+                               link to original Public Domain version

	 Public Domain (CC-zero) to simplify reuse

	-  - test-server/*.c
	-  - test-server/*.h
	+  - test-apps/*.c
	+  - test-apps/*.h
	+  - minimal-examples/*
	   - lwsws/*
	-
	+
	+------ end of exceptions
	+
			   GNU LESSER GENERAL PUBLIC LICENSE
				Version 2.1, February 1999

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../{libwebsockets_2.1.0.bb => libwebsockets_3.0.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_2.1.0.bb => libwebsockets_3.0.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
index 100f3a3541..ea262f855b 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
 LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3393a657830d4a118c5a6ed35ba53d0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce87f3facb6f911c142c8bef9bfb380"
 
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "73557509bd15f95a1ad081a6f4fab48ff7743215"
+SRCREV = "eaa935a80adb38b5cc4d09ce06ec987b87dcddfa"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;"
 
 inherit cmake pkgconfig
-- 
2.17.0.rc2.3.gc2a499e6c


