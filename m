Return-Path: <philip.balister@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id CE5326067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 17:37:40 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id l125so3547591ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C/dk6CGMmrHLiYcCCY3JFurJMUR5i4icKHjsVvJmVZc=;
	b=OJGjjrDAxEBJsHoTjgtZ9LrbdRd+SoAWgu10EAVhSZQdAO5oUOuDtgtlqUtg+ZIURa
	TMiv5hBeWNEH3oLRqLmawGa+U5/XYgBwX00jjAZktKV1xs5Ugm0nFQP5yAZkVHwd0Xba
	1P63r3cLgClj3AdhHGoIGVn8EhJs8XbL/X37R5uH4B27Ph7CKsyB5GF9nqVHwb+7x3bJ
	3XEE/Vg1qmXTm/r2z2/bs+SXhGKc5Ies2Olu+pfXbQBDPLk36leKeWINvjBzbCcupD/J
	dypmHKeBNO972Pvo9F/PjM8/scrQw+/JuGHKd7sqjOYWunvPjkJck5GsAQ0/+PAqKudG
	LEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=C/dk6CGMmrHLiYcCCY3JFurJMUR5i4icKHjsVvJmVZc=;
	b=X/S+zn1DnulbreO+bfs8bGn4KE/MSpONCCAZYr3cfvpsn4q1ArYDjUdTr+U8WXqrbl
	IQ/5n43v9e2OqCWC9+F/3qprT8B9MbhrCCA9ZvWR9oHTgPgDJIf1xsEDikS5VvOa4FbD
	ZKAiL0pnV9H+/bM/q9ZT9OeQP6hNj/LkDDX/Izlhso+CGlVPqld9q0G+fsmoOO1JWPTl
	QjZEIr/E1Q2io5iyf0ui37VFFASgK7s6zUHauHhDet3ogSZfCuINRfyXkuuHwN9vk0Ie
	LAu8qvy54bgIw8Y4uLOIYXUSaiW/u9dxMbye9jd/PKBV5L7ittiBwFsF3du4KgRzqJFa
	CwRA==
X-Gm-Message-State: ALyK8tJpxkXoQRPQpH0j2QHh9h73e9bzmU0+f6FUFBVolH++3qZAB4fx3u0S9D1Hzl9m3g==
X-Received: by 10.129.41.17 with SMTP id p17mr6626846ywp.154.1468431461344;
	Wed, 13 Jul 2016 10:37:41 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-138.ronkva.east.verizon.net.
	[71.171.10.138])
	by smtp.gmail.com with ESMTPSA id z62sm558428ywb.43.2016.07.13.10.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jul 2016 10:37:40 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jul 2016 13:37:35 -0400
Message-Id: <1468431455-13901-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] zeromq: Update to version 4.1.5.
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
X-List-Received-Date: Wed, 13 Jul 2016 17:37:41 -0000

Added PACKAGECONFIG to use libsodium instead of builtin tweetnacl.

Compiling with current master led to:

| ../zeromq-4.1.5/src/ctx.cpp:50:28: fatal error: randombytes.h: No such file or directory
|  #   include "randombytes.h"
|                             ^
| compilation terminated.
| Makefile:2573: recipe for target 'src/libzmq_la-ctx.lo' failed
| make[1]: *** [src/libzmq_la-ctx.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| In file included from ../zeromq-4.1.5/src/curve_client.cpp:41:0:
| ../zeromq-4.1.5/src/curve_client.hpp:39:31: fatal error: tweetnacl_base.h: No such file or directory
|  #   include "tweetnacl_base.h"
|                                ^
| compilation terminated.

Using external libsodium works around this. The default for PACKAGECONFIG is
set to use external libsodium so the recipe builds.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../zeromq/{zeromq_4.1.4.bb => zeromq_4.1.5.bb}                | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.4.bb => zeromq_4.1.5.bb} (69%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
similarity index 69%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
index 2090152..3fa5724 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
@@ -2,13 +2,15 @@ DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like
 HOMEPAGE = "http://www.zeromq.org"
 LICENSE = "LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
-DEPENDS = "libsodium"
 
-SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz \
+PACKAGECONFIG ??= "libsodium"
+PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
+
+SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[md5sum] = "a611ecc93fffeb6d058c0e6edf4ad4fb"
-SRC_URI[sha256sum] = "e99f44fde25c2e4cb84ce440f87ca7d3fe3271c2b8cfbc67d55e4de25e6fe378"
+SRC_URI[md5sum] = "e7adf4b7dbae09b28cfd10d26cd67fac"
+SRC_URI[sha256sum] = "04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.5.5


