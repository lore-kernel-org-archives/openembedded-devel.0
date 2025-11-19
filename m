Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD2CF2579
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7543.1763525560754586950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knY6EZ52;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso7097508b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525560; x=1764130360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aZbXlVY36l/5Iir/1gDt75G2m5s35WT8uw5Nr3EzpE=;
        b=knY6EZ52o1vWJ5GgE/+zQN9/U9r/bVEvlnLpL2sWg0+KvPKwJCdoT/seJWMuCx2NST
         gsaplk5lefRKHDs2t7scd14I+mmo/45doIHqdyapXEhqu6ZeD2JcDk2/CzKgKBcDVDRf
         d/LGkokrP00hLzrNXDOei8FFwKSK8GGbbl7wshgNW3hryJ/5mGvlvzEc+78AgohrnirL
         bCw7vZ7I0Ka/ZeFCNf1M7d6+gnkcHM9kV5srwWDT6l/NSwKstS8ikeRiqLibWI0OqI49
         DZ8KDVCuaBV9GbOjFN80yjQpmdoRkxvFua/oINmcrGV7eF/iuOBVDNPA9hrAd+OvlhoW
         rVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525560; x=1764130360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2aZbXlVY36l/5Iir/1gDt75G2m5s35WT8uw5Nr3EzpE=;
        b=MHToYtKt6ckHb8j0mO0QoxX9+zBXqK/2OmE+5v9vWKy81s/YX6xd9FLVreRG0sasFt
         xP5jcZuq3I3uFQ0SpKt8zJF5bQoH7s4iEWpxQQVeoveprHI48KsTOYyK+jQwWMYmHxrM
         U0Pq2TmyfacfIH2/1YiPhTnA6GGhv2bM8fY4JDoszSrTqYqAC/xCSY4CBe4Dh27n9I1z
         kmHzqgvwlGIleWYw2B7mQtYKcDCpOv4a74lskxCYr6APTmMtDRy3+KvXJknd1Zb6lmGP
         /5ZuNQcGvwcPE698D3e/l36VejJ615X401/wt4p1r8P6dorxadQZ+CG2Rkd09Ly+C7zI
         KvZw==
X-Gm-Message-State: AOJu0YzLOvevkQmxQm2emfxvU2D3BCpmPv/L2upQCnnYvK8Kfkj1cMYF
	kIN/IcPjb1WQt1wMQBzYxNaaSK+RFhuM4Df84EFYcntf4tJwkv3uA5kTSmGCQNBRsPo=
X-Gm-Gg: ASbGncs5N52E6phKRVcmUFv/zKt1OzWVCqWGH7xg0GBq671Bf0wkr886EGp8ZCDE+4s
	8M1ZwPChZKRqj7Yri26TFOeqKtFw6RQ6k+9N4hDDsDpfc1eWaszkmQlxVDqoJpAFvRTQU9GHh4j
	4jM+Ln6AC46NAm5tUrCiSLlX2gkx3aFijzGSVLIyp6ojGlWbQRu996pibTW0Qeo+MKzrGtfPP90
	XE+buXJBbnUlIPFYTWIqqg7l1Pj/ljHBroPU1dW6K8vmyqzgw5yW8OmTOwEXK9OgXAKKiFQK6MD
	50Gg+VCoDFWbckWWpr0VU/ZJV8TCQgDuBIEtvg6782N/o/wBLAV7FaT4dObNiZWb2wCbnEP/VDl
	RZSWWAySAs3Ty3E43ThAotcZAdJsavloEcRX19LWAjqBQ+Cbfyh2E2dajawDZ8Ta/a/Yq2AcYFB
	UdPp+CfOVFmVg4DbPOl7g0KPxI2mL2fnBvaFik95SeQKXShzxR8Wdtqnm842wb/BJhmKTUX9J4+
	sjXimBLW0RmOELdea2FfJspK9ftHtgV
X-Google-Smtp-Source: AGHT+IGBeH/GTuReKYyRKhmJsiBbyKWblMex1AQOKR03pyfLbqUHoQsNId27tpKKXcJis5A1cuBO2Q==
X-Received: by 2002:a05:7022:a8e:b0:11b:9386:a3cd with SMTP id a92af1059eb24-11c8d9d3ceamr587413c88.46.1763525559632;
        Tue, 18 Nov 2025 20:12:39 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 2/9] python3-pyzmq: Upgrade to 27.1.0
Date: Tue, 18 Nov 2025 20:12:28 -0800
Message-ID: <20251119041235.2448193-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121876

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pyzmq_27.0.2.bb => python3-pyzmq_27.1.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_27.0.2.bb => python3-pyzmq_27.1.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
index 121ca322a0..02518f43aa 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
@@ -29,8 +29,7 @@ PEP517_BUILD_OPTS = "--skip-dependency-check \
 SRC_URI:append = " \
     file://run-ptest \
 "
-
-SRC_URI[sha256sum] = "b398dd713b18de89730447347e96a0240225e154db56e35b6bb8447ffdb07798"
+SRC_URI[sha256sum] = "ac0765e3d44455adb6ddbf4417dcce460fc40a05978c08efdf2948072f6db540"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 

