Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.287.1623866382573593669
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OA1NPo3l;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id v7so2641762pgl.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Nj8BPvHMYwas6MjFrmrm1LZNSOecpWmrWfP+8oMzX8=;
        b=OA1NPo3lBoJs1L9C7ii6YjGtBe1dKc1O6d4rCwYDv42I9qqjhu0ljtqwie6kctqXHk
         pYgLm62J3IYlzEvRl6VdPHWePNeuD92JRoM3D2zcNr+c189di0KPTOqFqy74Q/Zl0cft
         xZIElk1R1xpaTB5cP7PEc1s6IS0XIhP2K0INse+eU8O2faFMPdVRlDH9HuT9qnuUHwnN
         Ij3G1Enc/0mFBv1p0J9GxMGIxkn/VrTj83MPezN3Irk0S3c9I0OkH9POrefVPCL3qX3k
         Lvsl2PBoFgtwr2u151U0X0BhJe/SzMXSofj1+1QleVGX+EqCMSDQwP3nOcQjMV9Y47ld
         9BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Nj8BPvHMYwas6MjFrmrm1LZNSOecpWmrWfP+8oMzX8=;
        b=TGJHy+LXoEIqGypv5LRphBTfk3TBrJcORjdA9Xfkrh6CegBdrPgV/4iCH/jjhoZsdW
         RIHxUqpjNBilDtT3mBQHufRPiWqK8juPCCCSM2KBnKFA5qBrtub0ZTK0ebd7t6Z7DDWv
         V0MoueLjE+TdP+kl6bgjb69lDNvRaveajaI01Xz/MB63cilqggK34Mif1TOUoqZ+d3I3
         h9pKxd9pu20RHyvt8QDieW37qpCBEy5UPYJUfM87dETP8M4qD45VbiYqakAwebLzQeHk
         nIK9W/U3J/WzaERDKT/VikpqxVLpIwS2GSeNS4ZG8mCTcDsrYPWCtKzlklH4RKIhIoAu
         9DuA==
X-Gm-Message-State: AOAM532+3MH2WyBKVuQ56kb93vtmgsNPYrJlgVU1v0pptVVLvLJPUkqA
	ES6sB7NFOrCByw8u6OYKZzQ8mqEK90YZlg==
X-Google-Smtp-Source: ABdhPJzSa/kcpAQL9TxfQ2Q9v8yqraPND8sDJGL5EVzoN8Px6D+PxaUvni+MacRvxuDbhDO8yYSEdw==
X-Received: by 2002:aa7:9885:0:b029:2f8:811a:d2 with SMTP id r5-20020aa798850000b02902f8811a00d2mr1032283pfl.69.1623866381821;
        Wed, 16 Jun 2021 10:59:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/9] mongodb: Enable wiredtiger only on aarch64/x86_64 hosts
Date: Wed, 16 Jun 2021 10:59:32 -0700
Message-Id: <20210616175937.323664-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other 64bit arch where its enabled is ppc64le and it does not compile
since build/opt/third_party/wiredtiger/src/checksum/power8/crc32.o is
not built, its not setting HOST_ARCH to ppc64le due to cross compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 95e0cf7a88..9c1e485b31 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -61,6 +61,9 @@ PACKAGECONFIG[system-pcre] = "--use-system-pcre,,libpcre,"
 
 MONGO_ARCH ?= "${HOST_ARCH}"
 MONGO_ARCH_powerpc64le = "ppc64le"
+WIREDTIGER ?= "off"
+WIREDTIGER_x86-64 = "on"
+WIREDTIGER_aarch64 = "on"
 
 EXTRA_OESCONS = "PREFIX=${prefix} \
                  DESTDIR=${D} \
@@ -75,7 +78,7 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  --use-system-zlib \
                  --nostrip \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
-                 --wiredtiger=${@['off','on'][d.getVar('SITEINFO_BITS') != '32']} \
+                 --wiredtiger='${WIREDTIGER}' \
                  --separate-debug \
                  ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.32.0

