Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8766C9832A
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:40:00 +0000 (UTC)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30002.1790469591409812162
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vw/2Slh3;
 spf=pass (domain: gmail.com, ip: 74.125.227.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bec20a6fso722182a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469591; x=1791074391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APpbIUbTG6Kivn786WnVrQv1gJd2BRDc5H0ZoqK49iE=;
        b=Vw/2Slh3z0hInXQsGNon003aByGUGBlf8hvLjggxkuD+JaQhP8l2T+m7wjmXXZKdGQ
         3RY6EKckEus/WgnRUSG/aJGkimck/WJHa2OmiZdIsNsQD+9h1g86jkiYDAXLU2Hknjrc
         NuvTWsht4hYK122LU1HDWLhSH6ToxRTFeinOu+bJhUXn4oZjK4a52kgKT5UWrrY3W1wo
         ynGWfVRppOBDxyvBMz9FsqaNGFhmuYv1OF9Ll3K4193b09N3+e1BYISSD5DLMLLI01zL
         nnkIZhxUi9ili/CxNTfjpwaThbqqTest6CV+8ksCYp6djhP6RJWiKtoJ2kSdnKPhMdsg
         GBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469591; x=1791074391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APpbIUbTG6Kivn786WnVrQv1gJd2BRDc5H0ZoqK49iE=;
        b=O8R2GCggxziwsuZ9uJO4xGLDQV+O1tmRJ8f0tBHm+DpnG1Qkor/VGalPO/xQKJBp+W
         a1jjSGjNai0Iye3IzONj8GkeH381PCeQkMJ6PVUVHhkrimDvcwsn6V9XtAhNISrgwn7w
         W9vnNw0OS5xMUts7aQfUXMkciaFYKjiuqH0pVyjriSI+l+Ufn32LyiC0AtVPoT6OaESO
         DdlIyzszwxU+1i81Es+XFgVVxmWHk1Hny57+nJCOXl8D0ricX51+hnIW6ZtmHhq5vPRI
         TYr+jAAz9Xd9WlkiGrl/lymP6jHLBjVb7eJ60iI3au8oqQzSxhDQQlM+mPcefXpecPc/
         eL1g==
X-Gm-Message-State: AFq9FYLjvwnXG/LC/eySwKCjZGnhyx8RI2wUPndhyQqS++AiKQNyfikn
	Ypj62Q8/Jl/enSCPvmyAsHDE4mjFhwXDeeCcrG90f8LHHdpsoP3zL4vmthtehQ==
X-Gm-Gg: AYBFou3xXHOGdBgRhx8IkkPQ9mbNEfhJQuyRGjFDVSuTSG5JI3k3aWnuH0Adv0+0Cqe
	gg/aF9VeTnTikohThRSLio9dra7ypim9z3Mm2kuT6nwqsRkS0KRBbSkng+VgpDlaKX7rwzv9WBj
	jWIjuSQidri7pNFlP54Q0lsM3XuQOTxanq3/PTG8WM8d5MtJyfskW+hBywMf6WnOhZdlq0X6YoZ
	BCf48JHqI2Sv9UJ9q42tJ9vJzy1K90wBXG5fRNopn3hgFI3KsIKG5c61lhcoxRMkH5a9HMv+j5s
	2ZwPqXRp5o2ES6SR9MRrFV8irv9E4/L/PVhgur1rNOjGaXo8eCtFfi0f1vI9ZH3VMGd1FIRo3tz
	BpKaKnKN9TByBxfUQc51QcahBp66v75ARNR1QAngUGvjV61YIVjzPG6D0W3MZGGxSV7BYZi/x0p
	bRbcfDjODXtX3HFjfRAe4q2pXlt8ILoxjTqrbu+tbP0/bUTFd20TDXrcY/TGDDrE7KpV5xVkfYp
	KWXSKfvrhJ3D61jQeX8g7k=
X-Received: by 2002:a17:90b:33cb:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a0f4eee4aemr979705a91.32.1790469590686;
        Sat, 26 Sep 2026 17:39:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/11] php: upgrade 8.5.10 -> 8.5.11
Date: Sun, 27 Sep 2026 13:39:20 +1300
Message-ID: <20260927003921.746786-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130329

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

CVE-2025-1218 CVE-2025-14181
CVE-2026-91765 CVE-2026-91766 CVE-2026-91767 CVE-2026-91768 CVE-2026-91769
CVE-2026-6103 CVE-2026-93682 CVE-2026-92842 CVE-2026-17545

Changelog: https://www.php.net/ChangeLog-8.php#8.5.11
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 38accdd03182817dd97a7689f8a50568410b3ac5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.10.bb => php_8.5.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.10.bb => php_8.5.11.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.10.bb b/meta-oe/recipes-devtools/php/php_8.5.11.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.10.bb
rename to meta-oe/recipes-devtools/php/php_8.5.11.bb
index aab18777c7..c9f8f478f8 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.11.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "d79bd4f3a9248e5cb5833766ba0d51cd35dd01b8727f23f30bcdba6fabc51d3e"
+SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

