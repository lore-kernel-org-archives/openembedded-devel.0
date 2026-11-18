Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15259.1795015862078766093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T5DZSEnO;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so9752575e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015860; x=1795620660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idm3gOgXsmJjdDXNLlKTf4yELvctkPXF6Rtik4z0+oQ=;
        b=T5DZSEnO+n3RqytMAulhH+RdUtBGdTJohlJdlRsegUtCxZ8pi+dHC9D/WhiWUcqAMp
         vDI8x4I/ByIAYTSF27/5LnKRMJSsZgf+xi+zkWUNkz3LTGUA7z5VrU2npnp3fLYvlHmH
         pAkZHY7bke+NNWLNcqoTkTcmulqhJlaiHO0Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015860; x=1795620660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idm3gOgXsmJjdDXNLlKTf4yELvctkPXF6Rtik4z0+oQ=;
        b=obZg6CwmDe4YKAtUhSUTuZqODPjJVSkcM7pRM/tqQVuAtmdjPp4DCJPbvGx+LNm32I
         +Fxh7NPNcCV6dnxApkviCCN73/NriebdQm61NPRwcAhoW4P+naSjYEI204EMIyCjWxKm
         AJv/XmTI1be59AtW7VBHBtr24qfVgxaTQgtRQ/qsdVKk238Nq8kg5enPuVQ1/LOQUMtn
         w74XzJXpkVr2LyYZJTeE73BdEq7/aVBO5wp0cQBS6VcoM7uhUP1MKOd1DnjNfvhxjRr9
         AL+JwWaHOh0Bd4Ktnz3qLQY7k7L+tRIQIwdLtYWhy4GKd8YJcfuqBi3Xpbt9cd6jr2Cj
         P7dA==
X-Gm-Message-State: APuU4Z9LzRX9FwEdCTkj6tPlUSgV05XcpA8GB+9PR50VvDfPALgpdAcn
	ZxCwakSelni9EsivtVZss4mrnXWthd/lv5OcpbCkUp8AwflNfkGsulrpJjg2CRn+UBgZxksoRke
	F8O/e
X-Gm-Gg: AYBFou1GvCIuxHKQGGlIdin3M+rd0AOQq8vEfE+qqWxELE9zbjeFxgATQ56Mb2LdFpe
	HWK2UfVhkyzPAJZ81ly13+7F71hLX9iS5wdn/bm9tqRbhBe1esQPjpiwktJWS7eHEMY2ArHLo0Y
	32hjRsGeeY0zPsxjB1uHfVtswiDKNI0BVWxfEP/qFQDddnVTYCl1ZQzI5DKFV8sanerlnHJEBLn
	FmrF42gxJe/wBfymLyXqs/0bDCZsI4OKUIgAZ89eQ7mVupEmgfuGM7nra8TVQXbi2c7C0x0Y8Xa
	juVUD0Kx5rOH1yr7njEYa1njI6/Ixgs2YmA2b6CN81GTW/s80hBsWYVfblW7oV3GJz7qgYApd3r
	lql3LbbxqykjQOOC0CQ3LIAmJ6NfTJRPQwcjE5+75wCLSj78kOAiLitMKUmKbqSgYAj0nu2F9HS
	2Use33n6l2Jh1sKXsqL4JpG9P3bK+xd+h+hOTxs7/Lfrmlzzhz36R8Dt7SWNSstk296LUDvKhDw
	8udXO5VVNRdMX3L+aBogyGYa/jGfhxBYPeSmLU2u5qvIUgDRm1ieKR2O2LNe+605aacvbJygSkM
	wjdavXAEFmkUSz+hxek7uJmYDVqs0AlgukW0RDxokeQGmOZToup/qBDJSSBll8mLvV6gc59xlxa
	5Jdoql4Z1e4QwWGYBafIJSQhoUL0FjTle1uOdb1Aa00yKNTbJH4LbQQ==
X-Received: by 2002:a05:600c:6285:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb7da0c2b1mr51018755e9.10.1795015860399;
        Wed, 18 Nov 2026 07:31:00 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:31:00 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-filelock: Upgrade 4.2.11 -> 4.2.12
Date: Wed, 18 Nov 2026 17:30:53 +0200
Message-ID: <20261118153053.922769-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118153053.922769-1-leon.anavi@konsulko.com>
References: <20261118153053.922769-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132661
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.2.12:

- UnixFileLock refuses, with PermissionError, a lock file that
  another account owns under a sticky parent such as /tmp. Its
  owner could remove it during a hold, after which a second process
  locked a new file at the same path and both held the lock. A file
  owned by the directory's owner, such as root in /tmp, is still
  accepted.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_4.2.11.bb => python3-filelock_4.2.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.2.11.bb => python3-filelock_4.2.12.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb
index 47385e72fb..8c303bc062 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.12.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "0cb84119fb8dce17898e1f69c974d5019daa59c4d7656be390a5fa59ccced912"
+SRC_URI[sha256sum] = "7e7da24d3ac39268b0f156e56870001de44886318f092f9d851e692f7114d6dd"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3

