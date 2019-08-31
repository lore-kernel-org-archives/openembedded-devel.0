Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 08AF97F4AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:47 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id bj8so4897142plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T82LD6LAPLxtCR3VWX94EQHwIWtTeNvxwblIfIVCwUU=;
	b=ShvLVTS/LtsyEI3JgzKNhOrhDGqpqx3lOes20jI43Iu23yRU+5QuUJI6manpWD6JjF
	cLOuw0R5lCaZiJDCRY2tQkKX4jaZK1cFsViUc4fhBffxl9r/G8x/MYPLa9G0JKcPUP/Q
	Nh5JvvC6R4QKvRLetBNDpwo422ZmXAUlanpwn/gwNstF5CT0OVdY4p4WzUpSIvLv9pNJ
	BpkfHXM8PCskUflEtcRx9MKyuVCu8/mdTffofaawf0wrn2QfInjC6gQ0Js/L6msZpxMS
	m5w6YMBb4M3K1CIyR0aZvp0PwsHkQpoUPqvaVPu5PX69MxKNQcqSIuEdnZ0gY1H6N4rz
	AyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T82LD6LAPLxtCR3VWX94EQHwIWtTeNvxwblIfIVCwUU=;
	b=ZHfZ9/RnpPWmk7jlYpHToXh7k8v/sisRvakOHTmC+nMi223pTyOojvhDIcyDHC0JB6
	MqCxZITmWy6KnSVNugP8uLOA8m6RLCdRHgor1XZiC+CFcT86NP5idUiv5CJFNrF6Ny3r
	DTGspulnGdR4ygobMX9nKuOPY3zElVXsGsawaBFc1IKV+3S3TqXddWpFMaE8lbUxEZLO
	wPRk04KWanGIX2qOTVYU8hQmXIBwdJe56Gmfzxj4GDjlU3bg6cziRDhGUe5RkIJfErC2
	pceOXJqV63YcNq7gp64d33AVKVUOucNVtJkB+B+HuryEsfuXuSzlYGgSTwcq9lszGryu
	rcAQ==
X-Gm-Message-State: APjAAAVnm/p9kmcEE2godIZjSWuMkv5+k8r6lyxP8C8cjHT7+ZFOpMvk
	mbyn2Nr0a3sfUlOge+1gJrOjQZXh
X-Google-Smtp-Source: APXvYqxlfZetch9cXZsBJTqnD7Y97YuO8wUT2NK9u7X8KQU/77zclCA/UvgaSidDgw46yyRbr+8Mgg==
X-Received: by 2002:a17:902:9689:: with SMTP id
	n9mr22976234plp.3.1567287109111; 
	Sat, 31 Aug 2019 14:31:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:22 -0700
Message-Id: <0fe933ca2dfc42ba4e550b971c421845adeb4551.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 01/23] openh264: Fix armv7ve build
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:48 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index 44c46f8..e2f028a 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -23,6 +23,7 @@ COMPATIBLE_MACHINE_mips = "(.*)"
 COMPATIBLE_MACHINE_mips64 = "(.*)"
 
 EXTRA_OEMAKE_armv7a = "ARCH=arm"
+EXTRA_OEMAKE_armv7ve = "ARCH=arm"
 EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
 EXTRA_OEMAKE_x86 = "ARCH=i386"
 EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
-- 
2.7.4


