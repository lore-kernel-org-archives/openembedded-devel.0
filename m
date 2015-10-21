Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1E74875E80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 19:40:28 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so89787400wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=rattoJ0lx89kye0cJdbHjY6nz+h07I7IceRb+6HIYiE=;
	b=V8UjM0kLkh7Yq2PMEEUUIaYECpcWXrid42Gq7U7Z/d6Yd5hbKbTVYeUJeSOqVxzZ4c
	qrZjnMxUP1OpzXqPkbkyxqa4ExdxAsrSzhLTer2+D4loMAwhTsDh5uAQwYXii/3Swfjq
	4TLyd61Oh/DjmyXBb6yisaiQIR/Dt7/D9xjByfY7T/wccud50kNQCWmc7r3o1oUiNUWJ
	9ooa8bbVjElQ4aI5FTGMsrcP+q7lHmH9JNnHelx1RsFtbEvIOauJR1ibFYQWI7xOwKZt
	txhMmJghKT0iLtmzNRL8/8OkC7EJYpkhivHMEubmvvZsJN1z9GSSUHnho6dVHPHEHroC
	zW8A==
X-Received: by 10.180.87.37 with SMTP id u5mr37154955wiz.42.1445456428385;
	Wed, 21 Oct 2015 12:40:28 -0700 (PDT)
Received: from localhost.localdomain (p4FDF14D2.dip0.t-ipconnect.de.
	[79.223.20.210]) by smtp.googlemail.com with ESMTPSA id
	g9sm6288wix.1.2015.10.21.12.40.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 12:40:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2015 21:40:17 +0200
Message-Id: <1445456418-2756-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 1/2] libvpx: avoid CVE-2015-1258
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 19:40:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[1] https://security-tracker.debian.org/tracker/CVE-2015-1258
[2] http://pkgs.fedoraproject.org/cgit/libvpx.git/commit/?id=4257ff5f4ac22a3fe7b34f441e6425b2a8b690ae

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
index 4d9d2fd..5d049bb 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
@@ -37,6 +37,7 @@ CONFIGUREOPTS = " \
     --enable-shared \
     --prefix=${prefix} \
     --libdir=${libdir} \
+    --size-limit=16384x16384 \
 "
 
 do_configure() {
-- 
2.1.0


