Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10321.1795752980395634777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OZZg/aro;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so4452814eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752980; x=1796357780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rTDEnsU9yyCLK/usEAWO0+noOjuTGs1NHLGdHa5g3w=;
        b=OZZg/aro8CKA5gOJIfFsGezji4e38GRq66RWFkvAb5elRiwxndluP1zLQK9hU06Lhd
         8j/gblEy1wfeHos67z66RM+OYZu5nezoTeJX68xL8VWg3j6DTn9XXxYgOxjyUsCb9eZY
         meoCgLNautO3ND/UKNlRfNPSTbfVlgmAV1Pupq5YT+q2YB8XdAKHAoMKTkGdQ9iMiRbM
         di7ziXHIrFOYz5o9lyfNXelgLV8NlvHlxHyiQXKPpAi1CCK1rK0UWWE3kvmSDF8u4Vb7
         Cs0eoVeWnnoILLZQJaAlxQFnUO5TF2qEPCW1oytZ8t9FiK7CTKuHM5mYcNpSDpXSmqDd
         j4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752980; x=1796357780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rTDEnsU9yyCLK/usEAWO0+noOjuTGs1NHLGdHa5g3w=;
        b=XCM6kfFlEtQA3/5hAm44F6acm48c104LrKqhQlKkvE9ZBADoxps1yuHVU+Cu5jmdma
         R1KAcekZ5KEmjrv0JuhNWZ15PHXZNAmZr7AwgYJtfIzBafAUOnVLcmbgLo3kiPVV6+xp
         O9dvKHr6iqfO1fsniMqxlJkudOU+6w2JuxpdXjALSx0LaCohKARVWLIbSywhqF6dOGC6
         XVyvoxO77hFRw6kieG39deezGmcJaCsHSumjZBuoj08VYyBcAIRq2YzVuw7YkgxHxDse
         SGrY2s5AZ+nnVxBwA139fvliTf8Iy0SXXdKOuVYM6z/5e0BuXKs5MdDjW6sYOxRTWyKC
         +iWQ==
X-Gm-Message-State: APuU4Z8i07AEutSOH+lowum0MPz20AFNJQk9BGj3vp/PMX5kBr2JovkC
	8aeWtAvvlqqldJSwLS13h5GxeNF/izTJhugsHpKAN+IRLvkR3vMh+VevqnxG2tqG
X-Gm-Gg: AZFdTZdJwA3AYp/6msHPf6mhmefelom2aBER5+48nVL+mc6h/ED+pE8yFgaMwCrZjWY
	RXEEByI64DXzc/u+0Xwb24IYkBfcj2PQwn65lMk5CIBFnY1hWJyZsDuV7nq/efQ1hmIqv3PARdS
	UvBGA2WrRcpK3nik7/wnzGHl3epXHayOoKBt6cMLP4ZwmGMmZcV1qUYnYuxGmYxXtMsE8T+JIxu
	U+mrRBD6hYzI1Dp4rpv4siI5QwHQk4bXzyGlB+U/FAG8JbbEdUo6esyZBnGVrbFSgB87bvFY2cp
	wUuSwZgYX2EaASDWoPj+VWizo7HcfNgQIP6vUvudolHs90E+QWSdN9gFjYNeuBc0Kjx2LrklUQC
	9jDJOnBriI8xp7d43HpVuOidR4G7X1CZLyue2N/pqIW6qTjOUBZJPBfvpcwJymbWbWfVHz3anqr
	5X5lbtlXHEhSur587z410VyN7tR2XegX29OlZjjp0Mvbt1Zhd3F+B52dfXEKgPfFeRsLlD3TLDx
	fFWQdoABqEt35/pwzL97T+dD1aFoqOsmstq8JbUXSN8iB6MMVbc0g/Mt/YIBgy0NGdS5e4av8S8
	o5dUcU1K+L3p0kF6L3JzTsuyXC514RIbBfcBOhjVF2JiB9wgWjsBaE0H4vU1s4PL+jEkxsA/tSf
	ZgiOJsDg070LI3rloGIODxZfBih5K4tfVurFMJgKdjJExjANqJ2qvIU2KDLGPfrb0s7d2wqGC0k
	t6XjQ7pUAcYpV18zc5OXW+i2Le2TZMRAq0KF8LHExhL8PLBnLJ6DA5PmeGuITD1ET63yGRES+pj
	ZWGVAJo9r84FiCl6hf7sf90U5uzmnO6Q7vPrsdkUeOnwWoygGMteOdoo+MdS9whumRZtlGi4rzV
	BhhTdw==
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr26169352c88.3.1795752979662;
        Thu, 26 Nov 2026 20:16:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 01/32] gyp: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:43 -0800
Message-ID: <20261127041614.1775064-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133220
Content-Type: text/plain; charset="utf-8"

gyp has no release tags and the recipe tracks the master branch,
so the tag check found nothing. Check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/gyp/gyp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 668aaa5340..b6f53cf611 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -10,6 +10,8 @@ SRCREV = "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
 
 PV = "0.1+git"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
