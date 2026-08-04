Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDAFC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 23:04:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28846.1785884650580388091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 16:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G//D5Q8g;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceaf8a1265so5866815ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785884650; x=1786489450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw4jdFhhlfheTXNzLSeInYybXIGHn2jPRow6Lm+EGng=;
        b=G//D5Q8gBIsg9Ib41SlQZs7MHfcYXrn0gZ20sdAicLnUxb281hfPmkCH4jCfcCUuhd
         qNsEjpOKPWzu1US+U+lDDULxrU3DJRmExMeXsoyCT6m8LafG40VUmqGdkWKIR9Q4vPuw
         +Ic9kQFl5gCxOAmkP9wGMgZX3eZngPAnqDKqpa3u6J51wQzI0dzyVv0hPcGwvg/CZrR8
         TCOdF6/DqTpfjDZBLpIKlBx8p09UaLTorRhUNmZGFe16jrfjieAk6A1gPndQf5SgGHcX
         /rzUo9WIMnRR37EAWtXEN1YnhRwgYO+3Hbig7dE5S7vigYHOf2Fu0mAU894SW4FFStDZ
         1b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785884650; x=1786489450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uw4jdFhhlfheTXNzLSeInYybXIGHn2jPRow6Lm+EGng=;
        b=bpvdgATNO1D1LHfUapLkwL4YkLapLQT5m/orcXxil/y7rHyTyq+nEadrTNeUNdB3nS
         +NFZRPofIN7Ig/0CzZrMM+lNCnRUtyjXaB8swxGgtgfrvINR7AG2BNbU+WD1OvvWINqj
         umaFAm1ZWE8xb/pGubalSoNV2Byy4zGhLLQzhZOaqoO7YAIQOzRbO9AoGgxTvTxZOY52
         L0jh0mV7s8EoB3uZNNdwxg83k2hmwh8bT9fZ9MU97tZDdSvGvPXsDZiOnwVhNjEIyM9J
         +gV5uClmvi/LZVQC4W/ENaqaRhG/Ce8PzBmMF1TBFHuYeE5zE6H4q2xtYIyN1pu2mIYJ
         Ibgw==
X-Gm-Message-State: AOJu0YxH0yCv8lQGG6cIZG6d9I35Hp+C5eTKKFDVicmSqMfyx177CcTg
	8kC2lWlVr6JPwDPNueAyfuetIocMdGdrKWV7pbnoq6eAwp+i6p7q+kuMbbRLbx/E
X-Gm-Gg: AR+sD12WV7unP9vzz9wtN9/NIiER7q+7YlvXMoz1fRy3pdmOdv5SlaYyFBXd8q6cCE+
	k/A2BcODeZ5bqIAGsncHpaDIKU3VHi0TzIKoQ275ltYBa+QIYrlghIn7qGmnBgJq+Sh191d5QKX
	+uWM0gj1ZsdF66M26gh+fdwLHotvvqzS7qT2Az4dxz6DqD3/Bff1GPXLI6dguiDa3WeNRq9K8a5
	fKKxxzB1sGAjAloVsW/Vgqn9Wwomu41rOXcsiPBI7DPK5TUmcaWBp64CwRVewPV//BM5FlpStpu
	0lOwmaJMn07xpTkktiOkNehY3qfiRmikxG4m/2j6HHU+cnhwUxcl/2qPqvRq+CEDOQ66l8YxamS
	OlBLC5Jth7YTEyiROSlS0MzHVNxTHUOQDaD7vbh2+8Z+V/GHS8kHSe3+RFy7KtePSfz1o6IOoWp
	I7exWC1/OMo2RsJ+mVjl1PaQX/jVkOsnGXFXattIr7UoWC8Q1KrJQHOzOtVFnWcGSGWCpCZdRZ6
	w==
X-Received: by 2002:a17:903:32c1:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2d0ca76a1ddmr21021715ad.11.1785884649923;
        Tue, 04 Aug 2026 16:04:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm13444844eec.21.2026.08.04.16.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 16:04:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/4] python3-django: upgrade 6.0.7 -> 6.0.8
Date: Wed,  5 Aug 2026 11:03:56 +1200
Message-ID: <20260804230358.365670-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
References: <20260804230358.365670-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 23:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128786

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/6.0.8/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.7.bb => python3-django_6.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.7.bb => python3-django_6.0.8.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.7.bb b/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.7.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.8.bb
index 4542485154..0c7fb2197d 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2998503fc083124fb58037084bfa00de323c7c743f05f1b4284e77bff0ab8890"
+SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

