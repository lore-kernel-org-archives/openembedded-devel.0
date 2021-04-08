Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.258.1617899788257780918
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OQSRNjsJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id d12so2760211oiw.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0Okoh5Z+IL3CSpYQGDMi1xBwjIy6MXBJKy6eax9ognU=;
        b=OQSRNjsJhnxABR8yNK7bMaYrLUn22gAtwNL94O9IY/a3krrQl0qDYSCbRnWFGYNWdY
         KeecaZAJ1twJZG8ryyxRjkAJ6JUU8z6HE0G7FU7kmnBZtcCqocEcx+YA1cLZ/mhBzOj3
         wmKTMoGTFJD7wJWWM3iKFeHxkCcPgYhFAfga8U1G41p0Z0i/AYpGOT4b3nmgTuAnRffQ
         235C7UXOhmPIevVOzH4//BE8D2mGJkqSM7Wv06acjvEF0es0uWQpg5ACPT5neBXsPGt2
         ydm+J39qZQyPxS9ofED/rUaPLFLqpi+k50MojI1ZE5ChJjO47vylhgJZAgO/SUgcHreR
         FQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0Okoh5Z+IL3CSpYQGDMi1xBwjIy6MXBJKy6eax9ognU=;
        b=lftfc+p+mpIABPFlhLi+3TaCV5Nz+Y+6kDKj2UAVyUrRU7muKHcBm8jUnP/q/4N59v
         CnEvqWYwk1ZSLQ+gZY3RIae5/TII6ryqtSMXn94uVvJuWS0RkiWBmetrOmTvtxG2WuRs
         h0/50UD7MCng8rsUQGxoKAEIi3jo7GvwKGWX+rXAOBrWcr7HPrbq8I0p/0/tOXWtTsNM
         BMLZz1vD7KPwi60UAXjSqT9qfRMUpeCnjMPyBrz2ncu2MdJOrgOipxRuZabaWHK4bC7e
         GXMSJOhNKxkyKyXjApMBraoDhryajfoVjqK3q9MRIUZLXJEKG+XEpbxLA+/ODUMTcpHk
         iwlA==
X-Gm-Message-State: AOAM530UN6AEOIgVcSyHhG4zKC8M13jKSNDo3LDW8KkXKiX//b6Il2vL
	DP1/BsJ8uohXMcqHrqKqnsd+fZlei68=
X-Google-Smtp-Source: ABdhPJwWXV2BN9i0uUc4gjIAddG6y23tgvtcaB2/LNEzYZiYW89mg9MgySwipApq1yZg+nmfbWUwdw==
X-Received: by 2002:aca:3007:: with SMTP id w7mr6673180oiw.154.1617899787482;
        Thu, 08 Apr 2021 09:36:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 15/64] python3-bitarray: Upgrade 1.8.1 -> 1.8.2
Date: Thu,  8 Apr 2021 09:35:22 -0700
Message-Id: <8a8f58dced80ab98f92b0e1f3fe60b55a5ba4500.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.8.2:

- fix crash caused by unsupported types in binary operations
- speedup initializing or extending a bitarray from another with
  different bit endianness
- add formatting options to `bitarray.util.pprint()`
- add documentation on bitarray representations
- add and improve tests (all 291 tests run in less than half a
  second on a modern machine)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit db7fca08f36c1ac452acdfc05458cbb294503382)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-bitarray_1.8.1.bb => python3-bitarray_1.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.8.1.bb => python3-bitarray_1.8.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
index 9bb5f280d9d..8fd4b6c31f4 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "e02f79fba7a470d438eb39017d503498faaf760b17b6b46af1a9de12fd58d311"
+SRC_URI[sha256sum] = "96136d9add2b9b3b73e1eb7538b8d12547ee82dc3fbd31addef829371ce2a1bd"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

