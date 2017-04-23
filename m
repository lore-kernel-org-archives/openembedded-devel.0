Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A94E77BB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:23 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 6so2612537wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p681795b1ZS8UrLvMJ5TwoiXxKaSITt21EsLAeN9Qk4=;
	b=BzTtRCs4yGaEhxPMwMJYkboSqJssyBMEBQMFEB9ksm92N4F2qZAa1h/4uAEJ4XABb7
	N36Nhpio5vQxX/pgSlEhUcXHKrQGmUZN3NpI0gBAZ0sApyiBofwricNl2QRiIAmvJB8S
	eUkKJsiFrb69dpdIzscqKvuWKyOASsmAWI7Lw9vVOF2tyZxuREzDFSrLIp6BOiL0xLkK
	quK3QP0cTv2wmXNcKv3iU6w6IkLUb7wGsLSF/YR9l//ugPM7JqJSOxf3xJztDLfLP9aS
	3yUNQ07JvsQgNeuB0ZfodZm2Kv14OdWw2nS9hE+WLu4xu22HgEAkYxvimSnSwEuijhPE
	O/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p681795b1ZS8UrLvMJ5TwoiXxKaSITt21EsLAeN9Qk4=;
	b=Yhru16vynApZFGk5Vp2F6f2OF0Fr2wxn1mgMiUbzpG1Eq2J8pT5s5oSdtxOZPMb3cB
	nlIwZiFySdFxuwSaer/4yNtDa5lMXzDFu3mcQ1L0Ra9VQ+kVISPy6ikYLvLbUqV7Wl9c
	4AgsMzlU6qhury35AsvwwImODw/mkJXfZmCYAghrGGd5igzcGUI2KZk9B1mLUjbjP291
	NZC9fVbzEl8UtMbNgDC6yJU8fb5r4UxPzBzYhnjv/5y9Geiy8K3PlLF/zUcnRkFksbS/
	+9ximBb8OsEhIf6NBW+W8kwPj0OexZMduyEKFLnsZJm6GAclCeRtQhoQ+wOyhUHRqlLI
	xWPw==
X-Gm-Message-State: AN3rC/6dmEYfTdVRFxkEjYcTsGcdMcSrOH6avIcwBqMtkE/zjfbwQQjI
	Tl64Zmg8FageEQ==
X-Received: by 10.223.155.210 with SMTP id e18mr739257wrc.165.1492930524840;
	Sat, 22 Apr 2017 23:55:24 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:54 +0200
Message-Id: <1492930496-6082-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH 3/5] openjdk-8-cross.inc: tweak PACKAGECONFIG default value
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:24 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

When x11, alsa is being set in DISTRO_FEATURES, the users might expect
openjdk build with the related options as well. For instance, they might
be confused when the openjdk is still built as headless but x11 is
actually enabled from system aspect.

With this patch, the end users still can choose build openjdk without
these options by overriding PACKAGECONFIG.

Two small fixes are also needed to let openjdk build with x11:
- Add libxtst to DEPENDS.
- Pass ac_x_includes and ac_x_libraries to configure command.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 11e98b5..3973fcf 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -15,8 +15,12 @@ PRIVATE_LIBS = "\
     libsctp.so libsplashscreen.so libsunec.so libunpack.so libverify.so libzip.so \
 "
 
-PACKAGECONFIG ??= "repack"
-PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
+PACKAGECONFIG ??= " \
+    repack \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 cups', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+"
+PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
 
@@ -31,6 +35,11 @@ PACKAGECONFIG[shark] = "--with-jvm-variants=zeroshark,,llvm3.5,"
 
 PACKAGECONFIG[repack] = ",,,"
 
+CACHED_CONFIGUREVARS = " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_includes=${STAGING_INCDIR}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'ac_x_libraries=${STAGING_LIBDIR}', '', d)} \
+"
+
 require openjdk-8-common.inc
 
 JAVA_HOME[unexport] = "1"
-- 
2.7.4


