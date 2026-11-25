Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37969.1795594147193719431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MgzcLbcS;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386ab9ab619so6450601eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594147; x=1796198947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58kSBFaivuMqLESKM/6xzBssu3PgAFVMZknqpIUbzxY=;
        b=MgzcLbcSiABQlbQTR1xgUzhUS3R/15Sk10x39CoKm8c5mBcEn/jY+cCK3yE/QSWjzF
         Uew2nakC5ERGx/Diedlw7VGET4jJRKzNXSnuZQaF8Yr7uib313QeKk3TUpUYy4gEsO2Z
         vlmHe0koHZDwBKmFnayirm6Ftmen/KysGKuCWd/Hw3L5G8rB29BmzOzMvB324zrIUDWr
         IxoPzJna/QmGFsjfTdZATLR78HjRUcCsNmqeVV4G3dYotb7mZBL0Z4iAK1Lk/LgBh/4x
         D6hhA9cLRqIg/26KvHAbdaJc9IggwtkXLtd3ht6DAINFSOnbMGISzEQvXZ2QSkZ68xaR
         Q5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594147; x=1796198947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58kSBFaivuMqLESKM/6xzBssu3PgAFVMZknqpIUbzxY=;
        b=kkPXZ8NLBmlHsYfX2Ti9LUVIiyMqAiJHkmPVZ7f9g+j8SksioZEWYxDtbFyM9U/kwK
         A34hieOTvXbbZR0sbH3qs3q4G18fZK4D3YWfsRMCDJ1zzoEexHyeefklqLTqQx6VtsGl
         iynvE2bTIpBXX9ScFLf8rkOfUYvdnQ1S4+ziDTsIkoGLmVhS35roY26cMWe4ZezKS5kj
         I6E0VF1bE5D3t3qyyjj+M4j3efN+zJEr5LeIaHXxQYtWFNvLBwnLMIPsjbYdRM4Vk9Fe
         FV0Mezf+Vfot3LVWlbpg0WEKuYwOu8iEUt/TJkwOrxGnAKAs86T/Acq+u0fCmVg2k9r2
         DvWQ==
X-Gm-Message-State: APuU4Z9W5jnp23pNGiTHpto1MrN8c0zLCSm1DXXluFjcIYW9Z3bywtRD
	rV8gUUDQWb7k+7XgkDOfPw+Jb24VZ8dUFvw+IssGknlMOPIN/yJnpJgyevs3QrXB
X-Gm-Gg: AZFdTZfuUU+9myBCEGb9LJyRM93wuR7JloUNxTYxgDEgg2pzSB3i+8Y6iL+O8DDl8M0
	E522aY7Hx5VUZiC+sL0yaIng/9DOrfmPjiFzq2IYAEIpNpAGxylHFEidx1Yt4Fon+laWYJrIEh4
	gOf8p1d0Fw6P5MDeTEbj3PidCe89ro2n+c+8oJ1oRxT2YKRGlz06ShZGufkikE+XKAB0bmqTsJc
	FGL64v7opR4LbxQjHZ0cMRPOXhoT32ht8DtyqoC3oRGM96hG+oXpCkzWyrKuEKIawOF1nbcCAPy
	qYl/81tt9wVgLZhaaq9W50JQ68WZwfzhUVsFRWuGuWupdq/HXtq4Ba+5gZ4cG6OsuoC4EClJ6pn
	ybkd3+tK8DDThZvQ+FpTCyJudYipZp1uCKwA0kw3h6RcTV/vDDFXajlPkUL8eScob4U7q5/iieR
	E9JA62kAmWqOpeG20WCod84VY/rzg4zuo23ZsynmNlE7naeW8usV7vnpidvXNjYCuaSL2cl38On
	CjLpDyBAa7SS1lQqtx/qvAi7ghv6zSKAmF1VAhe1BRkLtOSIGTFhYG/Qbai8qv0Tw6NQ8svO/l0
	5nVioQNTUrj6tCqwV4VLJWd92eLE/zzL7LF3s9Q21K0IZ7s6qTetefI0e4m9wVT/n+Jv27uF0VX
	9Az6kfOqbYgkCkXBDmAK9OXw28q2JiRTWu2mHLOfnzCjqKHgVezov0suTfTiqlM3ziyvB4KZHV3
	nRS2Gs8wLGwj/yR1bEgC5xmTQOgSMq26re8HG37zAw4m+xKxON5vuATnwXRR0UL+DVdxjnAdhFz
	UZRFHEBLo0jsfrqkaJWCnwWbVFvZL00C4AMNAxTXyvyp0r8X8guo6N56wROAn6rAnbLTvZziLGI
	fpoX
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr12281788eec.7.1795594146473;
        Wed, 25 Nov 2026 00:09:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:09:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 12/14] python3-google-auth-oauthlib: Add python3-plistlib to ptest RDEPENDS
Date: Wed, 25 Nov 2026 00:07:23 -0800
Message-ID: <20261125080732.2419614-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133070
Content-Type: text/plain; charset="utf-8"

Python 3.15's webbrowser.py does "lazy import plistlib". The
InstalledAppFlow.run_local_server tests patch webbrowser with
autospec, which reads every attribute of the module and resolves the
lazy import, so all ten of them fail with:

  ModuleNotFoundError: Standard library module 'plistlib' was not found

plistlib is packaged separately as python3-plistlib. ptest: 47 pass,
1 skipped on qemux86-64 (glibc, systemd).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-google-auth-oauthlib_1.5.0.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
index b618c5f033..384387e64b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.5.0.bb
@@ -17,6 +17,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-click \
         python3-cryptography \
         python3-mock \
+        python3-plistlib \
         python3-pytest \
         python3-unittest-automake-output \
         python3-unixadmin \
