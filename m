Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.930.1632338568141523134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cWNxTzKZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 5so2451290plo.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aDcrscN/bnW0YEnv9wJFGQcd4ErKVsB5Btx0KIGJFuI=;
        b=cWNxTzKZp3abK5uAji/PZjIv4Bt1tuPrgMrgIKTyGN8oCQ8lcd1aRE7vi9mCIYVMu2
         zTxYyAb6RfMnP6r/q1tPyWGAZUAvlxXhTRDXoqno5t1sM+1++A4xtPx98ydzvQxRrN85
         BJh2HeBPdtTksoIC/jJS3F9AAY2AwbmA0LP1NReqXHtb2frFHJyZ2V1rw6XkSE9flTFe
         5Y3UsoBF956QCQV0np8h/CPYRo/RzaheVTVS3WY4a4wVpJifU0kp62xNkaVD0CtAMMri
         o4FU9wlWXjVcujojnAS7AlUymlM4a19Ex2oSCRtzDbkZR/d3YorbThkgS5K+YBP5XkBc
         jJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDcrscN/bnW0YEnv9wJFGQcd4ErKVsB5Btx0KIGJFuI=;
        b=dl0lKEX0i6mdWR7TqK8ldekoJwwJwBFz5bmVicTfNDbi7WwrEHlGJHLt7Rhgp3rR32
         aH8AxTD82Xzag5T37KxDTkoQB4NtHiSWQaOFPS/6ptiY5OJp9ercvOmhY7bS9igCZYZo
         PpLs9WYo9u1E2KYAaEwGYgH90V8MWYVijlDsiYrKzbFSB6zSdTvsCbjtbFj1xbdqzhG8
         BrZ2UJdEG0wtn2c3QfKm3KC6/K7bdpVMYRFMRGOo5brE9dwfvFLB6b0HTXMY+1X13HMk
         asMSbeRNe8Jg/AAkM0ybRM6/AT+Y8e9z//8l9A6Axz1uOr+UgMkDJeJnrqq5jZUx9ieU
         g1Jg==
X-Gm-Message-State: AOAM531w/CyIATotgTHJZEv3smJCnhws5zGOOZMpVLcWcw0qmD2nCQ1t
	hGllhlyy1dH3ytLSf3ja6NxiW5cqD/zbrQ==
X-Google-Smtp-Source: ABdhPJyRXzEVXlRPgsUurZcENn5CqrubzrlF7KAdEgk09PjF2Ypr2lnxVj4CsbR1Uq63KUWWBhY6YQ==
X-Received: by 2002:a17:902:7c8d:b0:13a:768b:d6c0 with SMTP id y13-20020a1709027c8d00b0013a768bd6c0mr416175pll.83.1632338567451;
        Wed, 22 Sep 2021 12:22:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 36/39] fetchmail: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:10 -0700
Message-Id: <20210922192213.3062719-36-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure.ac:1: error: possibly undefined macro: dnl
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
index 33a05ed61a..892e02844d 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d"
 
-inherit autotools gettext python3-dir python3native
+inherit autotools gettext pkgconfig python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
 
-- 
2.33.0

