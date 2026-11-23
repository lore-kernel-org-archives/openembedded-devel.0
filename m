Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48049.1795411884737843026
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NT+oh7+l;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so3737379eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411884; x=1796016684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ajw1dWTQblOIG6TTY3NDJ/+9+ippZEENO2IEIHSKgE=;
        b=NT+oh7+lHA1UhG47q6xollJLAkLEaQdaR/svs+gKnwCT57edvtcBFe2hnvBLs9TzDc
         QAASMkXwcRe6fapccRcZEW+0A7JwTgNeKm6B7AhCJdEv10a7jD4q3mm2yCWLnnS/uUhP
         NXKvfeXclWN4xNcqfBei4ArtIsn9ls6UTRAH3itY6e6pyO613an2VVQNhj4PA6kD89ga
         wtVkG8pJEESjp/oEIgYC2ChiuaEKvRqST7UmJrmpATa6b4TMw/hxasng8lXOrA2zM37Z
         SWJUwHSKDlQz8DYMoVp/ji9MY6z0KCxVe4QuhloJuB9z4jvD2zz43TwFrL3iBcGdUT5U
         htug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411884; x=1796016684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ajw1dWTQblOIG6TTY3NDJ/+9+ippZEENO2IEIHSKgE=;
        b=h8bxuc1o45yUqxvOU5gsgHCaC/AF9u32Yy6JQD27NeYuLbV7ErRQ3DFrzk21teJs1s
         f7/3dea1p+U14bjpy2AFhIzno5++MB0H6DBAyxQkLBx+MKBEGQX5C0AlPUXip5EkHfmT
         RAkD1PWeowvOldGAUdvsO/8EcSvHJMy+CqlC++5AfYaGfAstH2+9hQZiFCWPv9un+vnM
         vv62wV8RDyfnUbAok2kljanTyDAvzYXhvo7eSlnokD2cmXQMu4sc1AQG0vZss40p4P5W
         WrYzgshLqIya8UKp2OebwrhIrUUnzHDZelFZaMbnV8VW8cHhNfxtYQU3eWQYKQSeuanO
         b5eQ==
X-Gm-Message-State: APuU4Z+/GQus+qekdmQ+n57lxOIcsiAZbhCPn1u4W0y5joiEbaPC0Ant
	ZD8eLLU78NXjB26bEZcdBjj+XQYbgx+0HGD1mYmoTPtzvXSo2aL9rbUXivWBj8wKLAs=
X-Gm-Gg: AZFdTZdZQBhiwDVT+wjw41+YBeBdB3j5CaML/DckzQxR5iKIbPP/fWUJJ+pNcuHv5/c
	n6wGhKusaNnOYRaAgV99tf+tA3ULCA+qJGCP0VIkOrTmFR9PU9ulSOpCCtATnTMRFCUXm0SXMU4
	dYnqGl81E4hVpuujK+W9VysBgA3PyjVrG6QaQbJf8GMIEpLHxAuJ6k4EFDPkbzLM3vCEx2iPXzV
	57KzWLk5T1vmmOFNEc1BCR5wDGz6PVfgvxHticV+qtIQUaxAzL6NZ9bQP7sVcGuhJD4Oqh+JM06
	IZHnnYwz/I6TfDuaWE76qfF8go3ykPMkUM7xwIhUm1Mk5x56W66yZ3cFCiNvEffrVf3tLA25ch7
	9WJnno7FjHjoYuKP57llRt8uZZCEfYUYclOXZYgMXQSXGNPtKX4FPBo80GeC/fyMROGmhUnQrbh
	7Aq7dQrViWt6JnhuuTrPwSEeq1qolDqU5rXTIKkXZd30cPO0i17LdLFMM3CEh/OJC36l95v6Is3
	YRgYJSmUrQ3k/kN3dOE4pJbDZrY+rAJLm1ZvmkImlO74ddxDuAkH2Jg8imUWirDn19VY5qr3yek
	8sAJ65Q9FhhYAtceGq9bgZJlNmwgKR3OSIqNMQVjm+RimEzcMY3RDE/VlPG0HnXrLwnvRaVaOaO
	5evi//L//lY47q3QhEaP9bN28uS7nmKCIP4PJcFsImpscfeaQT29N1DkjBNTTaImoZcsvxSdff/
	epd1Z0i/ZAdf5AcHAyEZAOF4dZ1blgBusa/pFgk5DDU+C+VSSnmttTkt8Ozi8POekYHUawMKoZE
	MRQ/hOmvQUnyd0Iy2G+ltPFv7D2TserLM+EiK7r6JMTGUTjUNXzH8R3iMH0oXL7RwXhbBd/Dnmh
	R35O
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr13428122eec.6.1795411884068;
        Sun, 22 Nov 2026 21:31:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 1/2] libhtml-parser-perl: upgrade 3.86 -> 3.87
Date: Sun, 22 Nov 2026 21:29:28 -0800
Message-ID: <20261123052953.3658549-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132859
Content-Type: text/plain; charset="utf-8"

Bug fix release: retain entity values across stringification
callbacks (GH#72).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{libhtml-parser-perl_3.86.bb => libhtml-parser-perl_3.87.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.86.bb => libhtml-parser-perl_3.87.bb} (93%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.87.bb
similarity index 93%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.87.bb
index 2b76eb74a2..4f2c3b4606 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.86.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.87.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5305e1d5faa70ee0aa282d85a5c9aa93911e8c7afa590ad1ced5703a544e20f6"
+SRC_URI[sha256sum] = "04342b30b3b1675041b28cfecb693a3d3a0c051587cc40b746a7f9a72a7e3b8a"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
