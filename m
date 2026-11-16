Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22039.1794808942614528819
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Adr14kgZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so1043411c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808942; x=1795413742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jQ/37KJ+542wBa+o9xpCuA2wG0IEh4Q2zk9NiWFkN4=;
        b=Adr14kgZvm7B/UeCTOTPfjUfiAH8cJd1D7E8A+MjvTAVcw/yUkx7G1UH6dAYGHVa4m
         ZNXdsoKjgOlVkPBAkDtN2y1L866zEnRsJpdMAH0iUU/g8ju0nYox9q4tqbT+SeV25RnK
         Yp/LYsCiVSPjOKJLS0ujhgBOuFgcKSmeGYulpootBkkXWheheVOZEY4VnrFV+4lW2289
         zCrfbLz+viMPOlBVoniV+fkBGgNf8z1zgnMsdcbrrVs/uNjuUsK3qjhRbHHQmtTSz71F
         I4jKXj/v2bWCz9H56FSPfv1d/d8s812dXWwteBfGEHA4Nq5ZH67FuynlQZuE6dATcpIA
         d+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808942; x=1795413742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jQ/37KJ+542wBa+o9xpCuA2wG0IEh4Q2zk9NiWFkN4=;
        b=QV9ekPxi8gGTDRyIIcOfqmTW+scdmgKDGQyiF4+duvugu8qxOGUZ5b6cybLtTi0KSW
         UK5iyXQHvOmBDB7Njq/rxE/2+Ka+6XHcQNK0xL4SS8cKVmE5PXhngJ2ZaScCSryE+QiO
         Npd2juWmgE5VYdHhQ7VQwAxNudjLDzpUfoE92TZ3A3kRi0uOd/IACbXGU+8SFzUJ7WKw
         i+aN/fe/Th3O1uplNQ/v32iDGtxsKV3HHM45JviTY9cHXr32rTk+/Ff6ietW3teRZ/+5
         td+xZ0Hj1dqn/4GlpocmNlMyY60E5V/vxhQzTRt7S1peZa7PCj3BL6fN7sDRilD9P6Dh
         7QuQ==
X-Gm-Message-State: APuU4Z/BvHryNvCmNuXpW89jP68HBp9OvtaWvHd+19HlC8IEAIUbfeP0
	QIxEWkPy82IKQFvTbQXyIQDIm07ZWnUkCXAp2i2x4hnZY6WoGvZPPGsZhHMKtKTk
X-Gm-Gg: AYBFou04mRRsGfkO4G4etl099ou7NpzHduTZOd10ULVQRYdCKP4fsQQ7WonYXkAlkjH
	Dr+ZvE2zPJdkdMS9d46SYEtpD1lIrOgt6ZkaEjL5T5zOs7hW26nkbMIaa1pAPzzKquWE399JSHR
	Rw/kMBcNG1s6WR6Mx/4obFR/tYTM2AZTZTl3b4mSnhjWsU0E1++wtZotu+cMpmXVLUrtCK0RhFi
	xNr9hjr+2rCv1LtXGAAN0929EzaBECz0+g7nzAwjhfdKUODPiPukWEZR1+a3bZEj/PUXlEnBhDP
	dxAosMo5CKTT7Qpu7bF4418rh0RFr5xnbQeKFAoFpBDvmd6IDfiK3zPIpjv+hRymz10NOsdU85K
	Vz7QQdHpFGEOnFHmU0KL3fbjQ2qOX88FJtmVwuvvjAdxLeADLJz6rkEtpwLEkdv7m9A6O4nc1ZP
	YC1BQIIekNMNKR+5XVZFjtHZ4mCKbscJ0AHiYIoXnADJtHallSMkDjDNkIxXgRMJH0HD3CLpQ9D
	PCBiZA/Z2lASIZnlNgTDv4s/vJs8HKhpjcUY8vHCS88DHy+f0XLt4vS60HRnQxgtj4/a/QukJHX
	xNXOfuUTQ8ig/RUphdE1tzwxmUmsBrt28eEc7NfUsFQ97r7AETAQ35LGBIwbRQBpinASLaapp23
	xNAQf1y8PLweLfZBpun16ytTYnlWySaylv1ZyQwPBkMM56mi/0igfUu61WmjpywRCrFiR+1GERM
	GSbL7iTBzj85Z/gBsJwmpuaU+SAeeB66XAQ3HN1tCqF2GiXI4Kl/+Helu4tkVlSURZluYRkv3j8
	zJpkcOtmQabix/c9Hmf4auoHvl8yom1JgXhmMwrQmqCWScZc/SMMHzlB28sjeuGlFdfVWv6tALU
	3t4w
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr11354282eec.21.1794808941697;
        Sun, 15 Nov 2026 22:02:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 09/30] libextutils-cppguess-perl: upgrade 0.27 -> 0.271
Date: Sun, 15 Nov 2026 22:01:47 -0800
Message-ID: <20261116060209.2916444-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132407
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...cppguess-perl_0.27.bb => libextutils-cppguess-perl_0.271.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.27.bb => libextutils-cppguess-perl_0.271.bb} (92%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.271.bb
similarity index 92%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.271.bb
index 34ad066682..471624d294 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.27.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.271.bb
@@ -12,7 +12,7 @@ LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b2c7b581901054a32dfcea12536fda8626457ed0bfbc02600bd354bde7e2a9b4"
+SRC_URI[sha256sum] = "4727cfe7da6aba9cdcc6bb9f899843844d8cfbb127f2d763b194c345f243ba43"
 
 S = "${UNPACKDIR}/ExtUtils-CppGuess-${PV}"
 
