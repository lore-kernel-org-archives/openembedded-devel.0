Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3FE71D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id o126so15583366pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xl/dGO2TyoyoFZ5MWKQIj9CMRXNAr2GtsccSDu8krdA=;
	b=CTOkyZSbBKpFr3DsghEhXy1Q7exQR69EZpmzBu8xOYmDlCGr4mslLXhfA2k8wBzijJ
	MQfpsABhML4JRVYxC/VnoDNPu1/EoJMxPdSxVV1ZO0OfZb1TUTLxIHngYWW+zThAM/qS
	H1Xf47Ld/bDdfX0M5hfDMn50cAp3/MGs3cYhViFdv34Uv1wxkPWoo5JUpqlNXVECylGp
	E3HHnlbG34gxzuZShU90G7aIQw7ylK2iFeKEWmt+MZe6D8D3aNkgI4HaTLC9Xft2UbUG
	KkZJCtmNt15w8UcQCMAS8PGmd78A12MeIMYiADiLS16dUgW2yAAfG6kQ0PwRYY/oqOF9
	bpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xl/dGO2TyoyoFZ5MWKQIj9CMRXNAr2GtsccSDu8krdA=;
	b=itSw7Nhz+lOMVdVsSQj5CbSohZpRXqGDFLjeE+UmSceeYQVGJw78t+Vf46JvsPLO4O
	dsKrODMuAwufFpeipu8u1Mkdsf9Sm8jK2Qx94oxEh6+rxqKj0sPqn9skRKNWLWKmiXgf
	EsVWLXkDxUREw5SB7L84OCF74zvKxAvL0i4snzbwbJIxrteZFIXqrvVlcfaQp/KFKZvl
	1qEPSrzKqHXkKPZphyQ5nJ3XZZ/ogqhqW2+v8tXOTIPOz/bm+/iycd9ASERb002Ahgqi
	GeXjDxpUZ5reCt1BijC36AjbGJPHE5TL9nN7AgxhouamAXD9bQSaM51E++/kOcAiociG
	/1eA==
X-Gm-Message-State: AFeK/H2fB93UHnJ1PWa2DyBcB08oiWv/J1dIz08/WNYZvFVlMt1AwbZlXqrwNQkLP7ujSw==
X-Received: by 10.99.172.84 with SMTP id z20mr365264pgn.123.1489987936336;
	Sun, 19 Mar 2017 22:32:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:44 -0700
Message-Id: <20170320053152.29352-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/16] procmail: Fix GNU_HASH errors, pass LDFLAGS
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 9bbd4103c..aa474ceb1 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -29,11 +29,11 @@ do_configure() {
     export CFLAGS="${BUILD_CFLAGS}"
     export AR="${BUILD_AR}"
     export AS="${BUILD_AS}"
-    make TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" autoconf.h
+    make TARGET_CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}" autoconf.h
 }
 
 do_compile() {
-    oe_runmake -i TARGET_CFLAGS="$TARGET_CFLAGS -Wno-comments -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+    oe_runmake -i TARGET_CFLAGS="$TARGET_CFLAGS -Wno-comments -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.12.0


