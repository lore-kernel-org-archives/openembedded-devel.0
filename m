Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10330.1795752997335188003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h2NN+FsC;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso10730121c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752997; x=1796357797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2dP6/9VR7+643XaNt0EwVQVIdJyPX6sj0Pp9WoUpF0=;
        b=h2NN+FsCZV2OxtoVskQ8EMhqgoRJLVb7hXgaFnVzYqWFFHSv1ZXHA3VOei6lIfeJQ3
         bBIbb5CtHRoZk+S9qeEyk1q6HRAL7UmDY4vflPRuyiIcc8vR6CtJdcNx+fmIGCv0oFWA
         QWd4uhdspK5lmvBW800C/2OVJ+YpgncukZqEtCgWz1xJBbCcx9a0fHao8Wil/4US4uKU
         VYb+2PlF3+MwMnMNth7ZZ5g4a+wHYPneZORk1Q5mtUXGJmMRkrc6oHLFNnqGyKNdKrYO
         zCL+9NFoMZWHEjnks60N6MuI/sp5Tsz/JjOUouzqaVOaljcnirDjxU/Qk51AU51iJTWk
         mktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752997; x=1796357797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2dP6/9VR7+643XaNt0EwVQVIdJyPX6sj0Pp9WoUpF0=;
        b=im5LMVeq7PdYQwBYwe3FVVI9T5RRedf00wYQ07BMye+yYFP80y9Y8kQYx5tE61xqh4
         RzspGzY7F3zttGK5THH77hOxDbpTj9yLu1G9MeYuA5mQ9RSCaIhok40UlTU7yTnydLnJ
         jQ3T+X0+yk9haEwDgRfyIK8kujWU1r911vJrgz1cEApwCjJBuynV1QMKzJl/VdieccKu
         MF7xJYYfHvF6cIJZldxQ+rcSw9f2QOrwPw9EC/oFaRXf3n2HO5BRlADCJUzjZSyaHhdf
         0y+nFjXBQZv5p72LgoXIklAma5VrcmfKB/f2T474s5OsW1V1WjvNvNTfyKadRQeJRmdV
         vhHg==
X-Gm-Message-State: APuU4Z8zpScq2GbLLNWv/0hU/E8fxOooWFPBetcWXjSiKL/m33fmEXB7
	cJuNXJs9pRbylGm/eJq1F9siAtiSG5mU6NQgLJuEXSC/quq39EoLxoxYNa7JqwrW
X-Gm-Gg: AZFdTZcpkNZjmzmimX7ZmeCG8YCMbzYu96u2MTjX7h6dIyc5fWGbgpWQZOmukSiefKX
	Rw6SvRJfcc8CNX4lOW0utj0Hn1vvc44JOzRtHkFcbzwvp+fSaL85ST+f5TfbLhARF1x0uu5+x4e
	xQ/q7k80AK+wRCimUy1gJk7pQ+sh4BaULcerGDJY3ExiH9EhHuU237ilenqb/hms8vWDFQUzyuR
	M+Q5K0I5tpaRUw102Ous+9f+WgOv3Z8sYQJxUYe89QAUBLbRXvCwYP9rG8fr9Zytdohg2xFsqoQ
	x91VIiK5fu9lrIcuqQ27c647dL8NVhJTM+n5YtnbIpQkmFtv9H/Hfv3jI2Ti+hfg4toeP2qmW7g
	SnDDqvvO4n1N0aOtjv0N3OpCiVLp76uI4OS86WaMhVsi8IXEl6uPYh1XNygCswwlxj69gTyZsHl
	zPtQAgfvORBeokmYuA6b6Qm7eOeOHfZLUA+njLnWQIaBpGHdJYMzPFqgbKBnd1XDGQekS2mdI2I
	zx/P4hqvWUxO8ngWA2SfcFDvqNtVN2ajcn6rBRlBOBgFi7xJKEFyYfXjjukeZ7pfb0GdjWm/whn
	bRezxFJnsm/26dHH1POUjLwz30c/kIu213QF6h6uUVNRl4Caq96w+pMoNAvyFxzbMGIZlD1rpAH
	wPw5gSKz4fiJ5euuO5rkFpVV872u6SDy+uGi1OcBDxDQQIK+H22y27etV+MgnG4wBGF0lq+0Okk
	abAZQ47PAvmJbx2OpcmTrGXGzvT0w1pe1s0j8yZEUBwV2ByZb77NrOxi1i2w8jHkgEjxcLzHrqu
	LsRC2NDf2jFV6QyE2hxHtOVF4Odz4xUujxfYCT3d5Aswzpe6d7FztT55sx123/MPViytfjoxIVJ
	+SgZ
X-Received: by 2002:a05:701b:230d:b0:1b5:8a6e:8791 with SMTP id a92af1059eb24-1b58a6e8aaamr6399862c88.7.1795752996516;
        Thu, 26 Nov 2026 20:16:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 17/32] python3-regex: upgrade 2026.11.24 -> 2026.11.25
Date: Thu, 26 Nov 2026 20:15:59 -0800
Message-ID: <20261127041614.1775064-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133236
Content-Type: text/plain; charset="utf-8"

- Use sparse active-repeat checkpoints in push_repeats/pop_repeats and
  guard resets (PR 647).
- Do not add out-of-line CALL_REF widths after SUCCESS to the enclosing
  min_width (PR 648).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-regex_2026.11.24.bb => python3-regex_2026.11.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.24.bb => python3-regex_2026.11.25.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.25.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.25.bb
index 8eb431dd32..ac9be78eb5 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.25.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "07f222de81cdcfd39eef8671e92d14f50f61f1666f756659b0e649cf700b1b10"
+SRC_URI[sha256sum] = "d3ea8d9698f13f3fd08c65f9bed0bb07bcfff80b61dfa14d86b8cc398f886588"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
