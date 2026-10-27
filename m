Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14860.1793092888884633600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EfnMMsla;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so21440105e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092887; x=1793697687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uv+7L/+AH3pr947mtkd+95K9EbSxN5UHRWuN5Csxqak=;
        b=EfnMMslaqnwHvpAoc13siqntAmDNZ9HgrppTous1Q3mfSjdkeSfg2ecixzkYKoYJAI
         PdbWT+tdhq+kRFWqynwehHnpGzcTxIjm74Q8nv6L9CsW9tuiQBbchCSlMp3AYwzd3ihg
         yafLI9gLr4VB9YMGe6jrPCEVoaBj3TrYPuHvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092887; x=1793697687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uv+7L/+AH3pr947mtkd+95K9EbSxN5UHRWuN5Csxqak=;
        b=Hr+GF187SRe7MIsJRGu7HsHOzW+JVdfk2RGzXwwwj6T44rhSBUoi2O7tJT+Wtw0+63
         Dop6MFFDtyzoXLNngF+oclqBlDWTLFOe5RMa2fCCtmfX1Gecxyq3GjX4XuoDxuEvXJ4Q
         rb7n3Vw6/cspirv0YVwP9csSk3D3d/E08p5B3Sq0v2a0EV3Wu0mGfarb35nCHR8b+Tvw
         ICVLtAl8vj8ypCQXxl56GAqd+1SmXWLkWaztCSPK/jsz8m02VYSLAYUqszqJMZVyGcZZ
         8f9efP2pMkCwirhNZIshNeJXpFwKnsfXXBEe7nAjpC90LW7m9YSiAvOAe5G3DOBpKItp
         /ynw==
X-Gm-Message-State: AFq9FYLZdIZqB93oKxxb9SWjN6A0EDgCc1okueP6y2lwCZtQJRl3cpnO
	jHKriSSM/0XHq4GAnwqeFl1p8FsQrh3jPAO5ZytnjuWmFruxAQP4qH7frRybvU9pCCNgXSP7Jqy
	U8NJ2
X-Gm-Gg: AYBFou2xABuXEM75GzjVbIFB5iKkPhufSp85F4hTipgBjotuwE7J2qz2ZZuGubxWk52
	GiABp3XK54xXY2H1lssKdUqq522iG0baFfj/wzyoxjNEi22Li39nmmMCSjU7+JDAqyY4ERgcB0w
	GkK7nyS2cOM2DBy0BCkYv9rzNjtWChF8PtixHeztmngFQhebyaxCKe27NMgIWf0HbkCUVY9RQyw
	ZvYhgTylo5+3asEEo2YHVPLetHBeNaozhFbL9YtoNlp5Dlyy1Yk26lYEe9ZJB5m/+D1u0QjU4sc
	O5a+7/9qIlzPUzCLwa0LrML2Az/1TbnkHhOM4oxtMV2bxMM9u6R6hhVjGOpbADqXoymeY6bDP0a
	wg8HvjX9zrKhf8xj3HdEZUPejICUORcKSwioN/OkUkOpy82e/IIPmlXqWJp8M5tX94E0HjOkjf/
	GRRwiVuLUVZyben2tfZp28s7bI9SNK9jJcSPWB3njTlbzJrcNCOB/OGb/mNYKmiPjogpYzs/hMh
	gp3bEkY/DAgRhK85U34GS4ruNtWXXEtqTRIVCNfeWptWiZTE4bxFJFpN3QTWst2uCVHY70sv8aQ
	iVPzmSajFVsQmlKStxIbaN/jjpAwEYzYZmZ8/8ejqF8wVzceXkzh0Tj6HdnV8r4Dz0VboLE4rhN
	IgYf7
X-Received: by 2002:a05:600c:1992:b0:4a2:1a:a121 with SMTP id 5b1f17b1804b1-4a35acaf98emr159827225e9.18.1793092887197;
        Tue, 27 Oct 2026 02:21:27 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 47/61] python3-toolz: Upgrade 1.1.0 -> 1.2.0
Date: Tue, 27 Oct 2026 11:20:14 +0200
Message-ID: <20261027092028.782979-47-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131511
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.0:

- Support Python 3.15
    - Add signature for frozendict
    - Support Python 3.15 and refresh dev tooling
- Add more tests for merge, get_in, and dissoc
- Expose combined __annotations__ on composed functions
- Fix interpose([]) raising StopIteration
- Add pysentry-pre-commit

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-toolz_1.1.0.bb => python3-toolz_1.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-toolz_1.1.0.bb => python3-toolz_1.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb b/meta-python/recipes-devtools/python/python3-toolz_1.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-toolz_1.2.0.bb
index ec0e02cde7..892bb38276 100644
--- a/meta-python/recipes-devtools/python/python3-toolz_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toolz_1.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
 
-SRC_URI[sha256sum] = "27a5c770d068c110d9ed9323f24f1543e83b2f300a687b7891c1a6d56b697b5b"
+SRC_URI[sha256sum] = "9667a038e9d6ecba37995e26cb2f59ec6420b6ad8dd9677de59db9b956b08490"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

