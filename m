Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3893.1794729075471505245
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=i8clr9wp;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37f14feca60so20015eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729075; x=1795333875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp9Sz3HO0ax+P2KI8QMQWJ+KXx/KU6hpuDZFuYjo+rQ=;
        b=i8clr9wpj7ubRTjJwC2iZMokqXccPOSCAufSra0FHlTG29c6ffmMbrhYKQZdnk6b9+
         cCti3mFy4wy1iV2sB1hA+unZKXwTCSp4AAdVncVdfYPBLKVwhORIu8nwcv444k1mD30g
         yrk2Kq8/EYQbH1DBWwAICAa9weor2eXFoF/EIVRwqRt19tNuee/asaLknEtvhMgv0SvZ
         shJAwgg3Qpk7P15gBbnfhMLNbBCXCQ3DYkxFBM7R2veUucv0BxIbLvvee94TR8VZDBxi
         RC6L1k+BSEkYcp60vDiZFM/kyz4FSlmlRws2vp/ps6VD0kUXzy0Gukk56YHb44DsdZAl
         /FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729075; x=1795333875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dp9Sz3HO0ax+P2KI8QMQWJ+KXx/KU6hpuDZFuYjo+rQ=;
        b=bVjKndNKfnpxzBEYBJPaGlqx8gejbOEuBfC5rI6RnnT48cfmO/MJi88GP71NyhmwdU
         wWrL1tiFR7tWPHvX2vrz5xp/eF0E66g3ujj6r9MsbFgTUxBtJXujq+xo6e48JyOGkafG
         uoLmNEILfeFNgHolPebH62O/8fJQ1+qjrb+5gonPTO8/VsYDKoGQsIvjsEGJzmCyL8n3
         pQoSMxXZb+3F0w8k/0xyq3pQRqtbDrZubdMtpvs0nJ6EuWXFrYAq4sboxX08hEXF+2Sm
         mipxFQcmbjztqZIwB8Bv8CNC38wSxDhPCIlhDzvVm441QseQEaiYv2K87mwkxXn7pUJg
         0N3g==
X-Gm-Message-State: APuU4Z99zpo/BZ9JNyhgbuzZkXS2TU0i8EADMDgFV3Q9y5kz+kTatx54
	iok2eeM/ACaSS/L5OALHjuP2LdBnBK0kUvCNaeN7Rts2FaYPGdpGngl4Q9s0ajTb
X-Gm-Gg: AYBFou2hXZtieWU05aL1jPLXsyFvoFFtjHLMGAOedgLnASpP8Ezy7JJFeR7k/9OZWrS
	5bq9XmocAsTmd/l8/qrvSunBx2Q7kdvmOeg9hitlpKEw+JOhS0NV28GNL/gDdhjNdHwG9pbty5q
	L60WdgBSW90XiiPOUFap75Ev/O2okpjBDdeP43hhXsJDT6m+ueneFDxYL0TfYVX9EjfFYuz5hpO
	vJmjKwVhD95t8/GyfcWJtDyDx4c9kCHojdKEjG4P754b3GEnip4IAIMUInGob/HC7LI2abL3MG+
	KmBZkRCggggIG041l9VzPuyngOfil5ho0S4rDGoa75zMYpj39qG7sxV3OjAMfqjzsVwZYdjVF0H
	LBjjvIJECKd+As66rnpX5jq2Jao3JwP5Q5itOvW2JpbHyJHci9sJIuTuvUM+L5qQjx+4WlRGmLo
	b3B35R3/OhJF0eWzITjkMreEV4Va/Y5GwWqIcrP/zklPNbODA+Z5hQPqOGcp/hmHPZRE8ITx0LE
	T05e84d1rP6+k0ncod1tM0jczjJKFl5rxCzd8CPZa8yAA/vmRHOsT2aDB1GknITOes/ZBeIgLdm
	sW1F5zQy6RWUeeJAddMsm06KoOgBgnRHZ/EL5pa4OXY+rf9ZCdzDpXHbKg1I7ZVHl8tRU1gBZL6
	5xNbbRaSUGixVRTE6OvSXE2DulsIUP/f8hBhzF4BWqT9FxlBKicqg9YKB5QYgX7I6USXxlwHRPF
	Sngd/VLmvkNK4NxM/n1JOUiLQP/aRPzgM8WC5ySmk72VZK3ztWIKPOdS7AvQoRq8YBrAqdg8ebS
	vA8vb9TYggZp1BXwskxqq/KpqbnotK2CyJ5jMs5IdHWOv9pFOS6xh7GeAvhQ8sGlc3nMq4HBFWK
	VQJt
X-Received: by 2002:a05:7300:85:b0:376:e950:873e with SMTP id 5a478bee46e88-37965f9ad51mr6720303eec.12.1794729074771;
        Sat, 14 Nov 2026 23:51:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 70/96] pv: upgrade 1.12.0 -> 1.12.7
Date: Sat, 14 Nov 2026 23:48:48 -0800
Message-ID: <20261115074918.2932593-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132340
Content-Type: text/plain; charset="utf-8"

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/pv/{pv_1.12.0.bb => pv_1.12.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.12.0.bb => pv_1.12.7.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.12.0.bb b/meta-oe/recipes-support/pv/pv_1.12.7.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.12.0.bb
rename to meta-oe/recipes-support/pv/pv_1.12.7.bb
index 1078ca2605..fc7859499e 100644
--- a/meta-oe/recipes-support/pv/pv_1.12.0.bb
+++ b/meta-oe/recipes-support/pv/pv_1.12.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "31fdbdb449c7143cd2968567bef7599e9f031950e6158ee7bb76e40aebf6ffb8"
+SRC_URI[sha256sum] = "5326ed7ee95ef18039390c0b17891ac28985ac7c7a4235070fab767c1fe37bd8"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
