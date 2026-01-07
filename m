Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFBBCD0433
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:28:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2340.1767778075501092710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/FyrST+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so15299225e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778074; x=1768382874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eOLMB/e/9/Hs3qYtIeWorrV8ckikxO2hI3aU64HS84=;
        b=c/FyrST+ISuVAc7OBrTybMCe2P9cqiKY2J3S1b88D8/qLdiwgnF2f0s3CzdoqALNt2
         hurrgAwV3CH8Og2I9pmdoofMIXixrmH7M345Taz7nsXzeobHMVha/FAfyedHmA/JSS+F
         Y0/R8G3gs1uf//kFIqBhqMnpEkiHYcrz5imEdAzJ2nWoSRiXcJWPdbxlCAvDpciS+8T5
         GJF9U3SPkn37Mvoh1WFNHYeOtA+Bub46S5w59QfZKFWEwX+qvOy0Y6eNAkjI5wCTt190
         6rBMwkuApvZXWKYDOXoWk3aRLJTw9yuitp8Nxt1Dtf+4RcNGwu81MjzCiO1sb0Rq+k/0
         +QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778074; x=1768382874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+eOLMB/e/9/Hs3qYtIeWorrV8ckikxO2hI3aU64HS84=;
        b=ttPZgw4bmk3shYin6aSY8GoHWGi5YRkT1yOYFsOp257kscsAasDJTD1BnV2qK5iIWE
         8uzSdLXkpjkwfebqBTgJyUQdBpsw9NnaJ+bt3eVBcJgVwy4plnZr4ZC7i5DBMZvPBVjs
         K9EF+HO6NqUBchywrD6B75R/L/7yl1Q67tERxUXYvkjzpH9cMkLzk5z+Kjsw7yuXjBeo
         pKuAii23AIDNJFjjPFtBoKMCiGSf/I3SY5sDuSvPeMhf9Q5SDTyOmtcJnzMyVaNLKU1M
         urpQBYeoAY1phv+YbyL/h2rziu8i6/NFnhXZnO9vpBwa3MP69apuPM2CHJb90lmi1Vvo
         dTcQ==
X-Gm-Message-State: AOJu0YwhHKaBkEk9zxJN6dmYBLY/TAVAXNBKB7aGDwZ+BM0udc7bWqcB
	+E0mhp/EtO9wZKALUVeAkqgSK/Gp8g7zBDyj0HH8fPRH8BwIVWfcC1f53cR/Jg==
X-Gm-Gg: AY/fxX5T2cfPnNFzeNjsLuvgpwxcbOSE9GL0w4N5Kfi9oME4dU1h4cnknWqfekPOvYn
	VmPY886+sn6Hzx8cu/KiVbbBaeDqz9YEADbDJGEizW+xjpBUvfJ0SoLRSBRdVUSq0z/ree1WJ/5
	8PEWk1a3sh6mLK4aaYSAwOS6SS45OTE8Bs0u/XlKMSd8Wily7C1w4np9L+PTBv8aTxV3d/rYtiH
	DEcreiPbzH8OY8khQiq5If2vKYAgnShRshwTA8mA9IdGDLajpeyyuU0SqUXwpWa26a1uXiRQSZ0
	cylLMBsa8Cy2YXUAMsLF/z0Z+I2N7/eSZHGH92snBjxR0z8zwSvU4gJBSAdkFenDby0+2A0UCvy
	UqBXN7bJrm5SE9ykCvEjGTA+ZPgBrX3GtwfKcEtHE7NpFzKxgCwrOwxi0jT0EKcAgR0tLvWwGtH
	2Jg0J82zU1
X-Google-Smtp-Source: AGHT+IHJESSrxfJ3ly07IWZ53TYp9CbwrFVBBkFlLHtLrVoarAJveUyPem11AYjyEZjCEOyISqyqNA==
X-Received: by 2002:a05:600c:c8a:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-47d84b4a079mr15348415e9.37.1767778073792;
        Wed, 07 Jan 2026 01:27:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm7236255e9.16.2026.01.07.01.27.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:27:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-m2crypto: ignore CVE-2009-0127
Date: Wed,  7 Jan 2026 10:27:48 +0100
Message-ID: <20260107092748.1930960-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107092748.1930960-1-skandigraun@gmail.com>
References: <20260107092748.1930960-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123188

Details: https://nvd.nist.gov/vuln/detail/CVE-2009-0127

The vulnerability is disputed[1] by upstream:
"There is no vulnerability in M2Crypto. Nowhere in the functions
are the return values of OpenSSL functions interpreted incorrectly.
The functions provide an interface to their users that may be
considered confusing, but is not incorrect, nor it is a vulnerability."

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2009-0127

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index 155a9066ca..8fc9c9ce4f 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -45,4 +45,7 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
+# disputed, upstream claims there is no bug
+CVE_CHECK_IGNORE = "CVE-2009-0127"
+
 BBCLASSEXTEND = "native"

