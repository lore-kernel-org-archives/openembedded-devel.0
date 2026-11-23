Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48063.1795411899849909840
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AVA8GUI3;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6386440eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411899; x=1796016699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ah6V2GlYEeOcsyyzRDYN+vocr3BKcSyFFdEAWLWvHU=;
        b=AVA8GUI3UmZ1ZMkAkphscoytq9bZGABo7znfmyA504xmFkvYj/2meQItJHSP8qlPpd
         SLS4FjDPCc57xsGdlUJ8eFhpgqT6RNwlVkb07PFaf+2a4vEqAWDUzSw3bGLqnP1r8j+1
         sBlaRUhRz0RvNZulLO6+YtYSJpKv9gaggHmQiykaAWZSo1LjAqx21pNM9BeRKwPiLfdS
         UvjSx4USEdztprcEfwMN+zA0NeD6mTqBKMNV/noQDQ3q5J1Wg3wHovQN5qTuqnc1jQaY
         3xpXIPFjuTluHhCTpfHwFqtPmnIlwGeOl1YtxhROYw+TN6OF4UKMiEg4TTDIKjmklpci
         +9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411899; x=1796016699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ah6V2GlYEeOcsyyzRDYN+vocr3BKcSyFFdEAWLWvHU=;
        b=vkFYKKkHz2s2jbPeN53NL1qMqnDVHBHvLvFf2MRMCkT8WwZzYgiwij4v9O1S0Vj0/6
         3G9CGau9SyjDrGTgEVQ5ElO4i8o7dltSCcIusN1LGwEfp9fTrCaJPcKs0hS8reoiujpt
         Kaw5xWrXdYtc//iqJlMGKNsaGwXHU0MF0E6Odfuk6sFOrX8gk7vhLy2imA2ezOMEWSGW
         ZlCZctCkefD08hCAOyFaGAgTxXbDt17QMtOnNzEq4GnTZ0DpxfP13OuDGuD5BtEbn1t7
         NNNycCgF8cCAqHMY6um72bvby3UO9o/PddMoZGTOtJLYaWivmEZXEy3yGXXmXoqB2T8g
         gGmQ==
X-Gm-Message-State: APuU4Z/4pATOEjUQ6Ctm0/MuA5nBhzY3n0FRcR0mLTFFJzEZRA1ewWJX
	tl8S/ZFIYaEkwFgGlzunBVeBlA/+MCK6/qt+E2olcskxj5LKkZbeFAhEDL1Cgb1vJQE=
X-Gm-Gg: AZFdTZdSTiyY/lS4T/i+uLupX4B8uucKzcj98Jif+rYcdbtiSmlj8Lb2xVozs6VWDqQ
	YQJxZM7Vc9JYbCK+HAbDoKusxeOynAQjyKUn+m35BCb6uQ7G8OcgxRpeEOcxIYB0oip/bjDrnTO
	7QXfi2DR0Z93BIsKBydW9cwICu69yPFF+gp7H5MX0PsrjQEDsHEb7aiHgsbAGVbjDGCfWKNgpwj
	niDF6XNVFrKpS8ffNht7VPaL62ot0QB4E+dG3mHjFofBKb5GWwv6bK2IIcik8N7QfkTTFnJt0ii
	PdAT7yEZrWPeRREdCn3p1iVlrTPR09SZtCLwQOkwFt/zecRaYtSvO6i2LPfvubF4HO++SnZDEBs
	NO03e+JszllGI3fBKctipUxsLebXFgrhN0CHSXzdXQCc0TOhFv52rb4Uq5CbEQVWuBhk3/rTflC
	obY2OcDwOqNgDb61IGlqevAyOuCMby9VbAjK9LRvivWkngaojVvDFd+V7T0z0AEYDybKMKeUZIP
	XbYQKuITWzRhTz6Kl536tezbSEjEHi8HrgCmVTpjSxNjABL0sprtv5urdZjgDjM5HTxBbDRsh/M
	w+mxBD/IGsZhIeNh1s4zUtgxqFKcmlU/khUFNsTpP4qrarUVeKdSEuPeN99aR/aJimhQarRQ7gg
	IEjlDfg6hEh5AIos75RW3khWU7SKKqS9zHiFfwoaW5YmjUKfQZZPs58PIGmTdIwE0IRSLu22ZST
	W566pMywTYpKzkpQh+Tz3/3te1xfHKnH7GWDAO4SBIM/t0DbJNNi/o5h2CqUPSm6S01s387LqIs
	h3t/X9HuLOFAfHRKfu6KmYk96YLpmudzYWFC0hbZWoFtmQGiDUGjEwMqMNXuPv4VZQYOFnfvoKe
	tpSc
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr11545733eec.28.1795411899202;
        Sun, 22 Nov 2026 21:31:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 10/16] python3-soupsieve: upgrade 4.1.2 -> 4.1.3
Date: Sun, 22 Nov 2026 21:29:40 -0800
Message-ID: <20261123052953.3658549-84-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132871
Content-Type: text/plain; charset="utf-8"

Bug fix release: fixes quadratic time and memory in filter() and in
of-type selectors (:first-of-type, :nth-of-type() etc.) on documents
with many siblings, and :lang() now stops at the first matching value.
Documents that max_selectors does not limit selector string length.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-soupsieve_4.1.2.bb => python3-soupsieve_4.1.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.1.2.bb => python3-soupsieve_4.1.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.1.3.bb
index 2ee6e98a68..ad230bc948 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "c6539a2638f26991463527337e39d630e3cbb86d024f52282a510535b8a7e09f"
+SRC_URI[sha256sum] = "13f70186c8f40bf8d0ff7bbab09a18fb149600b465269207b5e5b588f55fda08"
 
 inherit pypi python_hatchling ptest-python-pytest
 
