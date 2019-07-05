Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 076617ECDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so7930020eds.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7Rbquoktc80IW3Cz9bVt0h1bmLXwcYU5bOj/Y8otFls=;
	b=m0GlwwWvsXER695V+d8m1O1AuQAFmAiguCZGJeR/+G1zQ1m8v6ylOh6h5DH5MUbqSu
	o+2Elrm/335wmbZ7BrCn944gPlXrccJ9BB/cO7g4UY4AmkUmA6fFYG7Y1PglVR5uP75E
	nrME63B7LqSrSdwF9LHGdAhyO+IXCJbkAAj3UBmL0Fcnwnsgwwihb9TI7NYGb5ckRohm
	xRE0qQ5Afnw+seV1XDrkbvD7IK0UJkG9jSVh3aS8dKaWr2+Bkrmkpb3AS1IfVG7BSvIC
	swaygGcUrlec65QAlNySWwS2ceZqbPMy3WRsrMcXBDPDfnNNu04qIf5Xq24mA+9xCBxA
	ih4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7Rbquoktc80IW3Cz9bVt0h1bmLXwcYU5bOj/Y8otFls=;
	b=ft0Fx8iIzQpvRkwF4V0/VtPM0+FChXr1ijsM15GHc8gRKSQZZqWegJ6xRwDKB+VRNA
	SRbvWcDAnWF5KrN4jFS2BjFZoKPsqXGB4+mVBZUlrTf97CZ2PkZjce7s1lUlDjQCJn+H
	O7drGW4BKSFcNZo/bgQfAeBw43+3a9nNimPiYZ/o+l+mOWMajv+yY9wmdTlq/FhwT8kl
	lrEJH86HGk3yH6TTCEqsIfmS52raTt8/poZnM0cMhWoRAQli7chpMvWdXRrRsftP5SB0
	0tJaSq5/XwkNszlifIy2Lm62jb9HHO9QnWj5J7Y87PncesKeHb7GeHxItSv38f6o5rz3
	Y/kA==
X-Gm-Message-State: APjAAAU98DdW/AKzqEgGUQ0IN0YEB8pOMrZvRhhvG1UzzYGHQQCzZvWH
	Vg1JOwBoXrrQS6cUqD+unSQR3ep1Ybg=
X-Google-Smtp-Source: APXvYqx3hjDE0bfZQ80gXX7AU/OFm39wjiycwsNjYkMYXO3m6PX4KK0RXVJr9f+333L/ecPcEGVSHw==
X-Received: by 2002:a50:8d54:: with SMTP id t20mr3827716edt.143.1562325526434; 
	Fri, 05 Jul 2019 04:18:46 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:45 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:02 +0200
Message-Id: <20190705111824.22255-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 01/23] icedtea7: Add missing DEPENDS
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:46 -0000
Content-Transfer-Encoding: 8bit

Fixes:
| checking X11/X.h usability... no
| checking X11/X.h presence... no
| checking for X11/X.h... no
| configure: error: "xorg headers were not found -
| 	try installing xorg-x11-proto-devel."
| NOTE: The following config.log files may provide further information.
| NOTE: /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_configure.29594)
ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_configure) failed with exit code '1'

Suggested-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 70b935a..b578cb2 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -8,7 +8,8 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
            fontconfig-native zip-native \
-	   unzip-native make-native util-linux-native\
+	   unzip-native make-native util-linux-native \
+	   xorgproto-native libx11-native \
           "
 
 PACKAGECONFIG ??= ""
-- 
2.20.1


