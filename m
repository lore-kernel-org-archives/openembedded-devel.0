Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22461.1794808946938452214
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TIIGiT1D;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so8873716eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808946; x=1795413746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7w7H6KqbfW8ZtRFVL0xPrUbj9K/0ILjXRtiAVxw/JI=;
        b=TIIGiT1DZ6EfyRimgX/yxCOawNwgcW1GYi7sTVitcheTAk5DbjVdUdhViBgmAdyJZ4
         HGjj9ZiaXT6cK15a00yGlzoHqrob3IHzstZGtUgezuskyMONBAlf+J8aWz9EZ7bQULUJ
         /cYqoTtXgF1XvtB6Wd/FyxyjaWcDxPLQxA1iDIZ6d0rcdfspFd6Qi+Tol5JQ7ETEbCuL
         17ZMqvTe5kYfu43k4756z/OTRldM5De7TWG5natdqc6iY23P4vNmm1LjD74x1fm5c9Dv
         TildWKdG2yfR32ZJ8iUYQzuX9VSRZNKPor0wE7Vv5B2iJL775hA+8DeirrklixE2esrz
         rbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808946; x=1795413746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7w7H6KqbfW8ZtRFVL0xPrUbj9K/0ILjXRtiAVxw/JI=;
        b=CcVsQAsOZWbUGzdEYhA6EuoSnv3wS6AptF2Bs62rewNkHwS6aOGDOVNVvNcD4FhqpN
         sJ74tq76cELu96jMlf0o+3B1lLFUm/QHAjd6Pr2y0M0+5lSHAX408cz4RYiALZuRj1WI
         kVHWf7ARmD03HesmOsKIvuS0gKQNVIRxDCh5uspJWKKuCJbBBP7jJ8Ysz8hSwJvbjRzz
         6HpObJJq53DwFS5gsuPeoRk8znAvmevwg9eOVIHnF/Ay8x/5jnq6TLkb8icpMXbYoRxj
         AKzJa18MpnBpUGzAbfplxNEwPF/gRapX7vVwFHJsZ/WOqIn+vSMxpdC3eKOq2608rL6j
         IWqQ==
X-Gm-Message-State: APuU4Z9PgKlWYLuoRIeUl6hRGadE0yS+ZgpBZs2FoQ1jp4drVA47LeRO
	KHRlrg8AiYvXXusou2lYYC8KLXTChJgxRuxgHJqWRaPw0pGNRWQWZGxYPOffEbB9
X-Gm-Gg: AYBFou3SZz7/n/G/xOQPne6JIDmD5aMaonTyQuahxcNXcff/+kfrZvLQ9BRXXrS4zj5
	0tPv0xnXTyOZKd9PWQO1wdqFFF7gVhzdIC6XwrMcDxcI/9gKePNh4APfIZtlir7DL/HbOuo/ybF
	f6wJyOS+uRN6FMOuDe6H/tW68zMM8vZLXqLn3kmeRmTT/i+7G7Q45kC7VxH2S9Aiz+DsQ54zT2u
	K89ZlHgJNoG+r5EvDeWiAFOSdrvD3US/caMe4/WmEBSRxXPgUVa/I530xBk8gYwK7JcYa0aybeR
	fNTrKl+7SPGr4lw/05MeOyskN67gMaFeprKEE4O3Yf3umILOcyhwDKHCLc6S+aOJDkJ1hdXHCCG
	HSDjneCb6Kr99XJVDRvDhEDGba8/cMwSdL8WSzr+ndeX3FcwIDg5A8ueeaTaAG52BwfR0fJMKL7
	Hd7YQCHC5Sbhy/RYRrmUp198vZ/UMygRT7LAn1wwcKsaeXpQVC5bDxkPj58bhvO0V1T515iFjUT
	g9vftNrTxDXXNSmYornoey+UgnqdyWV6H1KiXQeUQ3ByYCpx88HAUfmQH6ZCsjq97D+vA2ylBCY
	3fPhn4HbV3daUABDsgJR5LOXIv9QWpr5y07auXEwdQmU0X6jZnymwx4vpZVvYRM3W9X1jp7HSZo
	0So5d73NINK9RSeex9kXV2bTyCgSwFC/8nAd4Ugw2rSAXQ3uQJtL+GXenmig7/cvu7TsILb/TyO
	SR/XV6wZAKw4gzV8ZWx99IPwglTR4mYqUCd8f46P9a6szE1OItruC2ph9Ej3Skc5Q7dkmXbe5Mm
	D2+uVqCHzI3KfrAQbc63T51aAa0SmRp5zchfGXG8fyzhy1goCexFgtY3rcLcA2iD76vc5K9dIjR
	0BE/
X-Received: by 2002:a05:693c:414d:10b0:377:678:2309 with SMTP id 5a478bee46e88-37966a58effmr10906024eec.15.1794808946257;
        Sun, 15 Nov 2026 22:02:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 13/30] libio-compress-perl: upgrade 2.223 -> 2.225
Date: Sun, 15 Nov 2026 22:01:51 -0800
Message-ID: <20261116060209.2916444-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132411
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ibio-compress-perl_2.223.bb => libio-compress-perl_2.225.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.223.bb => libio-compress-perl_2.225.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.225.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.225.bb
index 24527ef1bc..f8d2eec721 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.223.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.225.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c75095afb0e056db01daced032c7cfbbce350a14c613b9c8dba0c6fd4a47d7c3"
+SRC_URI[sha256sum] = "5244279bc5aa29637e4c77f45b5e54d9bc8c29e2f07d22180783cc7b06e58b5f"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
