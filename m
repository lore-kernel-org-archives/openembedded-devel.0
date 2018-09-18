Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A4FD5795E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 15:10:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g197-v6so1192079qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4xtHL4o1qlpONsHN3Bi2p+HURBud4Wnke6Oci5E8el0=;
	b=pZJmdjw6E06czWp28RLcAp6q4Q4KsTlKcb8h4bGezK5KptD7X4g4B1HKSgZpWP2rSt
	zVZsLmzfpQYZM4buz5t5euN4IFz1t5i28FrmYfyp5r0WS9RTDev387gkpeWyTcg6FSVO
	ZoLxqmNs30GdjFIl41a0AS/8ZxF6qKAUqe9g8q0U8Vpsehl/UH6sAu7u1jrzPgTD6ruv
	xyo5ZHFDMop8UzFrOIJkXV9xakiEY8p25vwaFhdYqSvYNdCmX9W9jx78BHPB58+7GKVL
	4OePwfnLsEGjayJplgYxty+7gxcVcnpbJjouTy1Zgn1e9MVK2twnPQpmFEb5KjjosVL8
	+IRA==
X-Gm-Message-State: APzg51CR49xr5QabC3p9LSYa59Skr4bY5k5zInlSeUsFPx+jZTvP+QWr
	gkc5y4mMJHmZPvgFffA1LM8XBHN0
X-Google-Smtp-Source: ANB0VdYt8A+JoMGpGpjFhvqxA+XUv7G4HKJNPeMMMb/Blhw8nlJXwCv596OkScaHVr0BKw3Dd3Nyvg==
X-Received: by 2002:a37:28a2:: with SMTP id
	o34-v6mr20951508qko.333.1537283446523; 
	Tue, 18 Sep 2018 08:10:46 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g14-v6sm13746278qtc.66.2018.09.18.08.10.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 08:10:45 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 16:10:43 +0100
Message-Id: <20180918151043.32634-1-git@andred.net>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: support rm_work disabled
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
X-List-Received-Date: Tue, 18 Sep 2018 15:10:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Now that generation of the Java keystore actually works (again?),
OE-core commit 09bb7718d74 ("ca-certificates: use relative symlinks from $ETCCERTSDIR"),
do_compile() will fail when invoked multiple times.

The reason is that during do_compile(), the Java keytool is
used to create a Java keystore with the certificates provided
by ca-certificates. Before above OE-core commit, no
certificates were actually being added, but as certificates
are being added now, multiple do_compile() runs will end up
adding the same certificate twice when rm_work is disabled,
causing a keytool exception, as that is not allowed.

So let's remove any previously generated keystore before trying
to add certificates to it.

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
This applies on top of commit ec5aae3d ("conf: distro: add mejate{,-musl} distributions")
---
 recipes-core/openjdk/openjdk-8-native.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 6a01046..bae5d09 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -55,6 +55,7 @@ do_configure_prepend() {
 
 do_compile_prepend() {
     export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS}"
+    rm -f "${B}/images/j2sdk-image/jre/lib/security/cacerts"
 }
 
 do_compile_append() {
-- 
2.19.0


