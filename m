Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0976B7D29F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 20:25:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id v14so5376267wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2019 13:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E0q0gTLeLvXHmdyEHYNqkYeLFOzmxOmiOnt8yD5cbio=;
	b=VJ71BtRZ6Gc7ZG7WhJrilE0kPE5T0s8m08E2peX6zUWlZkqJVAH02RGychb2ysCzxN
	/Spj2F60/dRumN6esC9dJVPLu1pKHd/S3YRRvo/CGyeXeWyWE9DSvE4iKMzoqMO+PkJs
	WKtvU0cVx3EHs791ZPb8IhC1cz+/gtoz+IFEcs+GsVq91X0pfoulbEy6907ilpKFUeiR
	RaKYRARcFGPZhccn9/bcfV466tpG991KlOdFtWtgS9Jmetix7IDvFOTxaLP/p+wTtCUG
	OfIyp3JFNyg57fRruVIlRFSUppfuaD/IwQauWlaYpWN4cp8HRopNmTJe/l7zZV9TDasb
	+rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E0q0gTLeLvXHmdyEHYNqkYeLFOzmxOmiOnt8yD5cbio=;
	b=MTz6NkQvCthYvLtzC5rizrh3eUmyeDrI+r64T6cs1wHCyL+6GOE+Bf48rSzaXr1MKt
	6WtG+13TfdaYe4K7geuie5PxhptXkC7d4ll/E2e5BYBGtiH4ips3Njhn5WEU/A8GFh3U
	DAWS4ANuiOKGsP8aszKBoBA26TwbaNb83hxhVDmvcgFjiRCoJyHbp9xHjrTIW4CLNljY
	WFtGBQL5J9PqUweKWgK8yA0ZjnyRPTgSm8dvn6iVQ8OBvIx4pjeisTuYOGPBHXDaL6De
	as3jQcPwChykdTw5f4mlnvdHwPll7r2fzCB0x3unRFat+8lwPXA5UTNRRgbFJrwFeeAJ
	N7xw==
X-Gm-Message-State: APjAAAVCYfl6c5raT3Fhec//ttHy8rUf83HKdJq303s85eIR8wa9OIpq
	O/MKOYvQfyLGeS1xHtBD3dI0XJcy
X-Google-Smtp-Source: APXvYqyL7nTRkqgXu5Ybk3s0iHlBkVj9hfkzhfgwElipqdXU24Ac3EHNm27vGzX678v1BxFRwfyXXg==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr4948581wmj.31.1554236744441; 
	Tue, 02 Apr 2019 13:25:44 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2CB720ABAC1D935B83362C.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b720:abac:1d93:5b83:362c])
	by smtp.gmail.com with ESMTPSA id
	c20sm24034911wre.28.2019.04.02.13.25.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 13:25:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2019 22:25:36 +0200
Message-Id: <20190402202536.8025-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] rrdtool: fix build by disabling docs
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
X-List-Received-Date: Tue, 02 Apr 2019 20:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have no idea what caused it but on all of my build machines started to fail
with recently:

| Attempt to reload Encode.pm aborted.
| Compilation failed in require at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/rrdtool/1.7.0-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.28.1/Pod/Text.pm line 33.
| BEGIN failed--compilation aborted at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/rrdtool/1.7.0-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.28.1/Pod/Text.pm line 33.
| Compilation failed in require at (eval 7) line 1.
| BEGIN failed--compilation aborted at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/rrdtool/1.7.0-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl5/5.28.1/Pod/Usage.pm line 30.
| Compilation failed in require at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/rrdtool/1.7.0-r0/recipe-sysroot-native/usr/bin/pod2man line 19.
| BEGIN failed--compilation aborted at /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/rrdtool/1.7.0-r0/recipe-sysroot-native/usr/bin/pod2man line 19.
| make[1]: *** [Makefile:692: rrddump.1] Error 255
| make[1]: *** Waiting for unfinished jobs....

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
index ff9957480..4a6c44669 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
@@ -50,6 +50,7 @@ EXTRA_OECONF = " \
     --disable-tcl \
     --disable-rpath \
     --enable-nls=${USE_NLS} \
+    --disable-docs \
 "
 
 export STAGING_LIBDIR
-- 
2.20.1


