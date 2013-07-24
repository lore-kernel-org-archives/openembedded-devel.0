Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 499A26B383
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:13 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so213496eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1iMAhjRTQCTBfNaIeGQCSyLd2vK4fqFJ7D/zUXlC2Pg=;
	b=gkzkPmqMsnm0wvTNOcwdErAQ+vUeaTt75q+UYurKuztKsOd/JB/fwi2JSbDxwj3V3S
	AZVhWAl3xB9ihhkv6I9dchbuXjP9y8WUylHZ4aPltfgj+W68iEEgCXXiKZCj6YN0aKEv
	z2GYPw/fTof90k4TlLsE1OrxJnTGBh++LmmWAxbzUmV30XUUtSoOCL9xSO9o0bsbQUMU
	nWgpMHDZGskIJNZ84NsmsdFzkxNWOlqxPkc4UqP/0VcNg0Pav0tt9YL/HM2hHhhZ51q/
	6iEI8e8kSPxLZ8pfE9hxFfZGHE0LYxvSIq1/rSH+dAc6QcMDgrUwCd+92TLCYwOQdwqi
	j1KA==
X-Received: by 10.15.35.65 with SMTP id f41mr28110471eev.61.1374669673460;
	Wed, 24 Jul 2013 05:41:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm65832815eeo.14.2013.07.24.05.41.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:58 +0200
Message-Id: <01995f41de94909a078f01304c388d03c955f4a7.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/29] sox: add PACKAGECONFIG for magic and wavpack
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:13 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 715860b..25b3d5f 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -10,9 +10,12 @@ PR = "r1"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   magic \
 "
 PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
 PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
+PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
+PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
-- 
1.8.3.2


