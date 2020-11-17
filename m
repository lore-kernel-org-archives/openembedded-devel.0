Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.16253.1605654249885366429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N+MrKQLR;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id b63so136428pfg.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 15:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MIVcgiJzo3HISi0CwGoLHpEYrK5WzpjfaImtfoQ0G1M=;
        b=N+MrKQLRw54LuVWHXOsRt69Yn+WmpS0aqj2ryxi2474fackveFXSGGOs+t5adEo/rY
         MIKNUwBhnGs/9KE8H89BlYTtPH6TjSLAKXxhzNI3M833LlYhYfrBn5I+TxI1bkYSZ2pU
         3hqQ9/m1Yg0s658fLh8L3bkQ1Cjh7975/CHHNJKWEX15s+ET7royMzf58nDZhgkaorI8
         jNirklQrKqQ5xFgWA7BJNsuPaaf1+sHhi/eXNezNCKETGSp98bwIVbRQmrKSMZUB9hSD
         nUDbs/+NCqQ1qoJOTgaLig9Yanc8Ga/SI4wzhyW4gHG22eXwoafAslGVfhf6VE8qpMAX
         40Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MIVcgiJzo3HISi0CwGoLHpEYrK5WzpjfaImtfoQ0G1M=;
        b=ReAGl+Rwj7+toHWS3OOlGLXXphw4+6upJspEnFhKM108JfF9C4SLYENDrPBjeXU02y
         hO9FWT8C6tRPSfULMJVNccCdIKvcrg0UAt5PSBExnYkq0thC6CP5SCLeLiYNMpt1TYeu
         mnSmyyGfMxTb3IcoL2B6o4Roi+Emr+rh9fRhE9tVWmbBZmDvP+D5T4TCBVVbuZDy06Qy
         Rp/UoCo41RA1i9eXe0XMkXLOVKiMIngo/EBM1htVNEYTx6aaidYtzV2uEDPBpDgYn6Ei
         ptfYp4/TwC7zMb5psqXNN/ACLbK7Od8dgmbuEkV10HLglkK2ntyTX0ez/nzCvJxiy4yP
         sMsw==
X-Gm-Message-State: AOAM532l4ANimOEZ8A7Ri5YmAq0nErgVf1E4JH+C1YUEARpcmyf1Swx7
	jGhgDTZKyvfFxqezlRIrWApDQ51mcb74Bg==
X-Google-Smtp-Source: ABdhPJzbgEHfPFcYVTN77W0XIFkEfDDelloaJWqMY47dvXMnUv/zfFLKrooObRU65HBJOlzYBrS1dg==
X-Received: by 2002:a62:51c4:0:b029:160:922:d7a1 with SMTP id f187-20020a6251c40000b02901600922d7a1mr1702986pfb.34.1605654249116;
        Tue, 17 Nov 2020 15:04:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id t21sm133587pjr.42.2020.11.17.15.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:04:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] postgresql: Inherit python3targetconfig
Date: Tue, 17 Nov 2020 15:04:02 -0800
Message-Id: <20201117230404.880724-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117230404.880724-1-raj.khem@gmail.com>
References: <20201117230404.880724-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it now ends up searching native python shared libraries and tries to
link with it and fails on non-host architectures

recipe-sysroot-native/usr/lib/libpython3.9.so: file not recognized: file format not recognized
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 090e16f58e..a1665ab2b2 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -36,7 +36,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative python3native useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
-- 
2.29.2

