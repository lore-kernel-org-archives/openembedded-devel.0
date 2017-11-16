Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB7C787CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:32:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id x7so20230972pfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SKkPfo5tsn1xhXII2GUddh54GkmoipzAHs2gEIeFZt0=;
	b=ldZHeXxxlayZf8csZzu1yFDv3g5cGxJJWEcsQOskNba5gCAWYtZ/m1XTqk+Ff6JprS
	6HUpiW5Ip6ycvFvO4W5zhklX7ZfZ+LERlAZjWAj9p5AQsBDCXEu/rt+CWevWoa5nlMhR
	yAk/WWlipVTLSsqSnofr5Q4eKYNDBK55LmMv6O4iUY/EDVVe8m1tWusN7J7wnA4GmP86
	HvAy+u4q6kSAcdEEGmG5PYUdelS1gC1iX0L0tgPaV3BDru6e3LbDThzbf1Md1R7freuy
	7FXrFaZnX9yzO0eads1/x9GWA2/9O/HrT1GpyOxWGBcgoH1GFkMz9PsM2V2AcOg6Cng0
	tOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SKkPfo5tsn1xhXII2GUddh54GkmoipzAHs2gEIeFZt0=;
	b=Fzw5ZjwxRbOlXIJjkjT7t6LUp54J2d3mpCwr8TCJ6XMITsIzOWZxIk0UdrbzokjfcI
	giwm4c5AcAVXOzDrtGfZwEod4iSpV9ISJJbFX1dwYiQUw2p9X2R0MfmvlQrah0SyMlaX
	2uADFhWzsRc1E//tEI8+5mAiPa1Nk4IVv3ufcOAqUgWmxdHaJChxEspHtcN8UOwQVxXR
	VdIvBbcF/uoYcOdDcN5dcCLK2CsohKB0uBl+ojYR0dTJdhiaYEoTbMp5rtKE3QL1B7pe
	kB+4IvAxyL+LuOMWXY3PPU8i45D/cXySGXCkPhcGZ1EtMMIqXMkQNy9IZPc6mgTrpf63
	05bA==
X-Gm-Message-State: AJaThX7t9dVQIpgz1wPniX+wZXuH/eAKcC9OhERm5T/h6fgqlNvJWWAa
	Y343bxtIwdsp3c5dI1UgbG4YkA==
X-Google-Smtp-Source: AGs4zMZ09a1o4kzanaSRYWR4wZYt8JimHKiT3a/H5jrBvp7r7dMtNloT6bbOCvQjp/XXChU5oe3Qiw==
X-Received: by 10.159.233.198 with SMTP id b6mr2621017plr.350.1510857128914;
	Thu, 16 Nov 2017 10:32:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id
	s14sm3975736pfe.36.2017.11.16.10.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 10:32:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 10:32:05 -0800
Message-Id: <1510857125-8109-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
References: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][morty 3/3] system-setup-keyboard: fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 18:32:07 -0000

ERROR: system-setup-keyboard-0.8.8-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setup-keyboard/usr/bin/system-setup-keyboard' [ldflags]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../system-setup-keyboard/system-setup-keyboard_0.8.8.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
index fbbfa3d..3407b73 100644
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -29,3 +29,5 @@ do_install() {
 }
 
 FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


