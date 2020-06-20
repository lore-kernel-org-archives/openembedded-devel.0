Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.4834.1592688032834848379
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 14:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O5ZF48OF;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id k8so10593132edq.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jun 2020 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4msXOAqJsZKZSGWXeFk6Qm/PqNd6ODLMSCknlaDxzw=;
        b=O5ZF48OFUqxA/O6Fx0sjAU7k6GQbxnswO9x+1YiP96+BN6Ip1M9J+fQhd+bppSatKS
         4ITex/YjDNvm1iYwb+TheTmtuZ1ZD/a424OlXDUOVIbHp+fo0Zs0yJqY8bRxvy5D8V2E
         4a3QCqH1lrMVMBkVNJn7mqjohmD9bVDzamlktl3SPnfoGdnkZR2BDD87nw7iUOYivVQm
         Qtp+TogDtymg5uA4rZJvmpj/g8WUq18K5W9r2lm6IOkjOgXOJl3qV1hso9OQsGzLvenW
         1gWS/HT1R/YEAvFidkdsdfH4otV+bOWOMw/6uXO5/VEuSsAK3kTr4hl79JlPxL+cOqZA
         eNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4msXOAqJsZKZSGWXeFk6Qm/PqNd6ODLMSCknlaDxzw=;
        b=EB5fUMnMA7fdICjD3NfFd2F6HHkLxm4MvcK0gaxKchHZgE69Uaslrn9l000CdFVsN0
         BRoPVLKFRQ4Hvn1+KQQJgdH+xnXmDP9+cZeg1txSqcGj5WFBK/wnNayoTnEQUYFpeDE+
         gcGbhZ7pRm/Mn+fDVFzsuTjtyg5PTjR/MhGs6QQq10pVGnIqR1t36MjzM1vLUhF8fwjN
         nuuJOY4sivPtm9IUg1LkB+qvEsYbkexnExqWZpg8ZpvHfqvbGhJ8C7nI5+hg4K39Zhxj
         qs2GQfo18SwazXHecib11CDfSe/TGaHQvDojp67+n3GgyyW91CRAXAjKFyXWcXw+wH7s
         Pbew==
X-Gm-Message-State: AOAM531cgh7z9wSAy5INRO1GnNF+ePVrBIqeeLosg/H0hez22/nX8o8i
	leMPbT1o0Osis56+mJ6UOWx5nxiPn0PDQw==
X-Google-Smtp-Source: ABdhPJxreuFk8tVERegSk7ShdOD7k66201kvJ/lmOZ3GS7CFl+e7MLP41umAasVedjOsqHYpfbvDLA==
X-Received: by 2002:a50:8b44:: with SMTP id l62mr9920116edl.72.1592688030823;
        Sat, 20 Jun 2020 14:20:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id f10sm2928010edx.5.2020.06.20.14.20.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 14:20:30 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4 v2] libgit2: upgrade 1.0.0 -> 1.0.1
Date: Sat, 20 Jun 2020 23:20:19 +0200
Message-Id: <20200620212022.82066-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgit2/{libgit2_1.0.0.bb => libgit2_1.0.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_1.0.0.bb => libgit2_1.0.1.bb} (91%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb
similarity index 91%
rename from meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
rename to meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb
index 74343683f..363ed4d65 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
-SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
+SRCREV = "0ced29612dacb67eefe0c562a5c1d3aab21cce96"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

