Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D04DC7199A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 20:09:54 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so27845519pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=a3C9EaF7ov/p3wDJLtL0X0DVwg3URWpi8tzLqjWi+YU=;
	b=SaEvhbiSY+BBdAYzXiRnsqfvx3LjsGbFcWdrRC5itJ6MTPxPaDYlwWS3b5DTCk4JtV
	XoOcAyZNMUg5+VRqK+BYDPeHdxiAe2qcoiip1nMRD8x5gGMxLo/e+pXYQjWz5tsztsDc
	E8Pe7XNGU4ln/OtP/NnN5qRPxFynTbBAdW7MCUjhxDVhzIQ1tFkLmYXYLn4PBXSysbbJ
	QbKPcFrR6HYsOP/b7P0QGc29bLd858YqZkl9lR9f95/t4MQ64TgKj7wqzvgSV3pL3pMd
	yfxROUrK5e7qCkdGmnaVjd1woQAVvtUHpg1hvPlp2CEgMN7Djx13CYSIqncsE0z9QpAM
	fBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=a3C9EaF7ov/p3wDJLtL0X0DVwg3URWpi8tzLqjWi+YU=;
	b=sjkkpKyHLdUuSxSiAPE/73woV/esuuxepQkzHi3PKH4FNlKoF+hEU6sbFLGxgthM0B
	L32xNuFKiU4EXn3J7qMRWZgEW0Cy2W9USPvCjk1FRZKtExEdX1DFdGmuXQB7OKIF4t2u
	ASXlv3JQsIsgzUTBmiva3gPT9Xm0YOkQ4guFLHk28cKhvr5hvUYIEuZ6R7oHW0Q0GO+Q
	KXzgX4COBHhr6cp6LXF+gYwAasi4Dn/1bw49SIpnV0VObMsKtCg4hOB4nlqXPeyHLjIW
	YphCq9gwHfxlkLD0z51X9xgxvsTtz+L7NTzTvFnARLVj3P8KjJ5n0KwVvXQa2+WH/GKm
	xz8A==
X-Gm-Message-State: AIkVDXKortlPu+NcyPKE88e8wEF2Y+2BPHygKV2AZHrcV9iomvLpBUdpQj3JIXcHGXB2Bw==
X-Received: by 10.84.199.194 with SMTP id d2mr21314968plh.134.1485634195023;
	Sat, 28 Jan 2017 12:09:55 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:a85d:1e1f:8a34:2074])
	by smtp.gmail.com with ESMTPSA id
	v4sm20830960pfb.36.2017.01.28.12.09.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jan 2017 12:09:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jan 2017 12:09:53 -0800
Message-Id: <1485634193-30863-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libnet-ssleay-perl: fix build error
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
X-List-Received-Date: Sat, 28 Jan 2017 20:09:57 -0000

../../libexec/i586-oe-linux/gcc/i586-oe-linux/6.3.0/ld: cannot find -lssl -lcrypto -lz
| collect2: error: ld returned 1 exit status
| Makefile:492: recipe for target 'blib/arch/auto/Net/SSLeay/SSLeay.so' failed
| make: *** [blib/arch/auto/Net/SSLeay/SSLeay.so] Error 1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index cfd6f51..f347942 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -32,8 +32,7 @@ inherit cpan ptest
 
 EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
                    INC=-I=${STAGING_INCDIR} \
-                   'EXTRALIBS=-lssl -lcrypto -lz' \
-                   'LDLOADLIBS=-lssl -lcrypto -lz' \
+                   '-lssl -lcrypto -lz' \
                   "
 
 do_configure_prepend() {
-- 
2.7.4


