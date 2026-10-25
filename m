Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30956.1792964617425428990
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k5U7KRmW;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so39772eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964617; x=1793569417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZfjCvzT1Yep/dqtKC0NFsPRzzo+KyoLHpKGaVGZ0L4=;
        b=k5U7KRmW9Mn+aFm3n9l4DFmN3uAFsnIhL55oVIMh3I7MtSrwlrulmVoGfRDU3gHuzi
         bcP083XVgZLZKcylu/XQgpgOrSJJj9FPAgQ/xhxFmv7F8O58YG8+0vPRUCamtEZo2VwS
         r48NeL+82AVLXEYCYS9YQft1m8ZJohjnwBrHvEC0+uqOOXs5tUxYnmhTrTa04eOQujef
         ukFt3D3Gsm/cZxgo0rvkVWydB//1S9LyppVF/1gjnyqZehxrL7APnU+e+sZSGIDBG2e0
         yldAJ+8wFb4ATaPb/ZhZpKmdi4TjeOwoj0kkkqRFlgYNXZx3F2/eR2977ISgpI5xIQxG
         9vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964617; x=1793569417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZfjCvzT1Yep/dqtKC0NFsPRzzo+KyoLHpKGaVGZ0L4=;
        b=OTY4qojrkqlEwCmVBDnaO0xM2KGoP35rB2l/jYkoug0MLBLjliRCGZNzfrNrAOg/SR
         LdtydWAp2iJDFxortRh7XBIhmuj0d3ymvW7wo9puPkkIM4oPyehjg++7MWUqrbaJQg4h
         E+BwlFm/kv+9P+ucWjUZkkjh4L/75Nut//pMeoREGKz7vdg+/h1bzW1TAfZKMbC3Yw0S
         9XmUtLSq4IY765akfauunMOlDJmAq6moIz759WRS2zf4xhackq6FmmWuMDd1AtlOvTxM
         8wSLD8pNtb5eBDGohClIWPnmWvLlILGxxPyPNT0eO7GhPJH8dcAqAobHa4z1mmDa/l+D
         iXhw==
X-Gm-Message-State: AFq9FYL1+ufykg2VtM6XifPM2AjNBCZ9CTg08IqEgfOCh4AAtZKunOCj
	1n3IVZZ8lnvr/twfH9i4rc0KVQO+5sdVnA0i66+O9x6oTnIkJa89maYq6sghe/j3QB8=
X-Gm-Gg: AYBFou1AAhaHjsnwWDKFUlm4C1FTNRNG/m6wRDf6ru/+6qDsZPgm6mTrDH6+xzzKYne
	nQh52Ym2+COO7FBcQSkDdMdQvASuPARgqf/bt+/5KUg5hbT/e46+ZTODv0ng3KBaIlUHDlRHAXM
	/uYLczxnK404yDFBfuIynmeXDes9QPISb1xI6Ngr60lVwuI2ZGJ/P4IMs4wdj0xTRr7MID9eCiN
	cfUiRP6RxgG1egScNXhJtJf34FT4rVpohTPBBDBwhR9wJ1SBx4t5R1JyZh1fYjtprt3N/+A2up8
	1nudJcx40FzcRg3jnndk7vzzPjaYQltzTJYJimBEPzJhZM0Qntas3Dvwd+9fU171FIjnS/h6SXE
	+/mqfG0xUD0d1KYyKxEz52jCUhU4xlHGi03oS6OILnuWEj1ji8g6mk5nFVLKA99Nt703zBNnAC+
	3/yl2oPCmimu7tOXfLtQBUIVmWFcwfA7YSeKpSUreOBsTfxkdV9V1eaNs3LTkUWIIPp53gsWikO
	yXPn9ASJRd6Tr5nuwtVHCZA8DNVfI8Z0OAxCL41bTnM0MEXZ+Mxoz5adN1U2qvUa13J25YpPfIx
	RV/qaIV4GQ0eaqmIgUpXzxJJOFIGYxDZ8fF2e0N6WfL2LpGWMPuW/ZrYIWsNUF6SoL6pKcLTWEb
	BV8RxsA/rh/50zo+iFXiSD3ZaVyXa5hKB2e6kToAzVT3vF4tSM7/HEX2Xb8Jknyzwl5RwSVs5A2
	vsjF+EaSwYk8+D9aFvRBRPOVSKsMe00ETJn3aQvKpVJf8Q56ojhK633xEegtAHZL7aH6bDGjRmV
	wnCDli0KwWWunYWMHwkdam0GlP6DtINj8soohSZtUhNvIdNfQ50
X-Received: by 2002:a05:7022:220a:b0:19b:1202:77f8 with SMTP id a92af1059eb24-19b1202783dmr8381936c88.32.1792964616559;
        Sun, 25 Oct 2026 14:43:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/6] libgpiod: Show the output of failing tests in ptest log
Date: Sun, 25 Oct 2026 14:43:28 -0700
Message-ID: <20261025214330.653779-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131409
Content-Type: text/plain; charset="utf-8"

run-ptest wrote each test's output into a file in the image, so an
intermittent gpiod-glib-test failure in testimage left nothing to debug.
Print the output when a test fails.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
index eae172116f..8403102d4d 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
@@ -20,6 +20,8 @@ run_one_test() {

 	./$testbin > ./$testbin.out 2>&1
 	if [ $? -ne 0 ]; then
+		# keep the details of intermittent failures in the ptest log
+		cat ./$testbin.out
 		echo "FAIL: $testbin"
 	else
 		echo "PASS: $testbin"
