Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8204.1795739703878949922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oS4EI0Cy;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c71feeeaso3977565eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739703; x=1796344503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJIzxVNiS/b/VHwb3RY7ORX8EJuhXJnZGaElp+S3kAU=;
        b=oS4EI0CyAhP/EkLqTroB8WLfNJmpthPgtvdcLQd2xxlIUklzr3NBcCiGA7n3an7hat
         +RNrEX8rwi2RKwpzx09Tci66sSOlqeZYWJZ17BoiBNAoBR0AOBpWl2RCakeCMFebqjs2
         B1SlmKeZa1H/8wDb6+0eNUTGgYJb4ewXUBuIyaCmZvQEKhq+jtM9ljKW3bQmXaw0DQN8
         uDEYLkIPx5Dm1Eo2fDvR1ipg0k+KU9XDEYsLWB+9694BiZg6XdLWfpN5sIjAAYvCIj6H
         EaxSU+787IukBJqqphDCBai3qDzXdiZepRasG99RUMcHUnfjYTzk3eTlINu/y82BtDmI
         zxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739703; x=1796344503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJIzxVNiS/b/VHwb3RY7ORX8EJuhXJnZGaElp+S3kAU=;
        b=K61hx5JrYczg9WhOWtz0fKDRiDg30l2W4q86NfrzhiL3ik7FflUdOyiTQHemo+al8s
         pcrRQFRRhISVy3wPxJ/LE3LhLwo3xuFf3CVM6MNAnz+KqF8h3gkxkiD0GbN9WH50gHza
         ya1QK6SdrnIeDbyQkosLjxVUdp8vhY4dFcmwHlX3f6NLlgqOY8TqQMz72Bg6AGDgksfN
         /iJlapFFfu/EFj4tL9vDblyhMJUWqZJ5tDnI+xKVfId/2CDPvACVI1Q9e+f0/gvu7z8A
         KNtR7Lw82E2rJMfAofIFfx/6fkLw/elT+9k6cOX+4mYnyUlK9QdOZz4yUgjftnfBAp0n
         Hvdw==
X-Gm-Message-State: APuU4Z+nDN0OzwrLvfXuhGuar5CUDjzh0+iFhiABKwocWJPSv1SupZ0X
	H+UZfUuVK21inZbL/xracLDHSdGzQE9wjPUU2cOFjZXOgEB/mhvTy9iWAxieKJjF
X-Gm-Gg: AZFdTZej7i/fADBj6b9yR35GphcyvYOuDcGKX42YKxeOex2Uq2lsnTM27niFE+3/sfP
	a/QFip3RLihXiEBTgGZupMdRr5Zn/cDOWAG7IWZEN/VwiFsDcERAsyCUIWs/rJ5v7LNJ/MFAhYl
	4KeiURQlxfyhmSuR+11+kzY+b3UBMfidvlrdyXKLltv5pygDAAWETODye0PRSaNvhZF3f0fabqs
	LXtjRsriMnmmEC9V/tRynMa7bc9iR0foomR/CCD/9XrpdvPaymda7OLKYmVtOCLhJadxVXErlEu
	Oq2WLgHZ4dCULiK23G82nIUJ0RZhvlcopuqCraaxJ01mNTVWLRVb9W65uuqSg4CbodWaueiisvo
	fIerIyScA87ykdzbdmSND1J2UEeaypoHZDeT8s/Eh1gCZaNBSWdEjuV9As3AEYR6tVgFA5DujS0
	tjcX5+WSkcT2R9HyRaOLAm25dwXxOmeamZqjpslsO68vVC2v0bLtQixb637jqnBkc4x4Ap53Vmv
	FE6qIvpSow/Sf+VI/t77Jbv4lvNr7HbVd6nE4NuptkOjO21NaUS31YnJPQCncEWIBtwLqI6w8wr
	+VKN2KISPPxWZvDrLG/xOaGD/4zDypSXujm2TNeJjCygs2hwNSwifqsbuYtVD/XL8CvQzHNd8c4
	9MAD3rT+rqGmur1IpIvtC2p2b5PU44pGUdXXGuMJtFebLPwYAy2yw1BO84TPFQMFdblGz0ZU3b1
	HShsMLyAngdrDfL8c6BIok2crw5vBMWZ58ulgwsITjS+Egvcr8jpMcZR7aa09YDBsSjODI1ga9L
	5cAtCW6bYD91ogoVWXGe1JsZwsN75cv1wZE5BFB4iHvk0ZkinWEO6FhYWRbnhYjxEQwNUoRYGph
	w8qK
X-Received: by 2002:a05:7300:dd08:b0:386:ce6a:b256 with SMTP id 5a478bee46e88-386ce6ab415mr7025251eec.7.1795739703196;
        Thu, 26 Nov 2026 16:35:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 32/69] cpuid: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:48 -0800
Message-ID: <20261127003425.2166632-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133132
Content-Type: text/plain; charset="utf-8"

The default regex matched the binary RPMs and reported 20260503-1. Only
match the .src.tar.gz source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
index c0e27bdc20..ece8aacad8 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20260503.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
 SRC_URI[sha256sum] = "8ee10fb48d4aa20c484a75d6852883710286ed2975c314bda6d0b0383908cbfe"
 
+UPSTREAM_CHECK_REGEX = "cpuid-(?P<pver>\d+)\.src\.tar"
+
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 inherit perlnative
