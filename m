Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A49EE8FDBA
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 19:10:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157475.1766776204877129181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 11:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AS42AghE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314f52so4147284f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 11:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766776203; x=1767381003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB5Zun0ePNLfWhfk1LZQncvVCiTof/wV7beVx2F9dvo=;
        b=AS42AghEaWBT3MIFxH2Egc8v8ijyxrN5rGMFuohb1rs3FNRKSM/a6E6P6HeCvjadYi
         evBPdb78hQ0J9VeaLnCDXfNMvDPDCnTah+QOnL7uwxGXUvSGyRemAEccK3GUHLBnN2yg
         2gKVLFl2vrwnnTZyE6heUXwN1aIhFgzCAUCvPGgNI55onawU8BX0VtxBEaiJ2uozzkdZ
         ohjQrXB4FqeC4jxScmaxd3h8eV5XJvhd9kS8twCPvbaO2iT7tbq9vxF1xRDyfe7HQUaz
         aFaMeiWVnKmwbXDS0W+b3kWE54295rnYiNVEbWTQtJFc6Y23tU/oDaFqqXidv930uk1H
         S/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776203; x=1767381003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qB5Zun0ePNLfWhfk1LZQncvVCiTof/wV7beVx2F9dvo=;
        b=OXjcbGtwb8GC5Vs4vlcP4Ef54igjg1hVQ0Cz0QGUegav+0FPFZz5MIJItY8F0Ihtaj
         pXtjVh4APJNfXVRI4jVhpIvWh5ScF7Fbiy05ITmcImChJ7tqE+TSn9Jr4xR+olZFxjnp
         U4opkqsYyJdFI3l1mbQ1w3//9rX7Vb2w9WUXEBZwNGelYNuRGrLnsQYuvCMKJJ+eGLbm
         sdWPr8uoAm3FUToJ68g2f7mMY52LGFSphRZbxKgXPYxu1t2oeGWBiBft0Z48nH9Kom4k
         hQJNUgwZQdOoSCgNqkLgRfGL/cn6mwxF+RjFp6T2Erw+7QwBEBA6Ne9C3fN1PaaWAw/O
         a5Vw==
X-Gm-Message-State: AOJu0Yw1YSZv3dnNakvNbmakvmDLlFjdp7ZDVTHTSCFvFK3oxAFg+Qx5
	gTrX7rzDucehl/iaIAni5pO5JIIK0uIpHQAEd5+CdNuJbvy+kmifa6EWQ/cWZw==
X-Gm-Gg: AY/fxX4ANniLGYDA3VaubUMloZcK3usqZUhtzNC85QmTlEpmysKPVEPu6Iym9eutvWk
	7vmiyd2xow6DGPqXHz7qJ+eTGrTP+fPQ/9pg3IGcxt07D6kl931unG/vOc6NIXO0wElJIALnwli
	HlUCwyJu26U3S4qmStZYt6QSo1dOVTRb8JZ+F/E2APJsatejlwHX2yNnco2yyAVjgfLkRX+L97a
	gbtteSfpWX16v0m6QAjHQctf4Ra2t7FrsC5mmQsuvFuTvrVUEqo0wPoyH4EFqdRHEatfvZtOxd/
	kop7SsZ/gHH4cxrG8NQZqm+0bLRkSU9yCd1kqQU8Vdza9Q7c7UyBmcOxShXRCq1/svwt//xyuJL
	EDTl6czG6wHcpat2WICOaGa13+t0vY6ZB4bsQ44Tz5zcZJYUjOjYJ7+ad4Tj5E4lXljbdjO2e75
	xwaurwR1ObFMZ0bPloeH8=
X-Google-Smtp-Source: AGHT+IGikxAvLemEJbXtle9qvRK1vgoBxHJ4XvsT2RQOH4kTlqccqVXWIDFPQbs5UTxZC5b0ww03+Q==
X-Received: by 2002:a05:6000:4024:b0:42f:b9c6:c894 with SMTP id ffacd0b85a97d-4324e70957dmr27980367f8f.52.1766776203064;
        Fri, 26 Dec 2025 11:10:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm47583330f8f.9.2025.12.26.11.10.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 11:10:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 2/5] simple-mtpfs: update to latest revision
Date: Fri, 26 Dec 2025 20:09:58 +0100
Message-ID: <20251226191001.2920748-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226191001.2920748-1-skandigraun@gmail.com>
References: <20251226191001.2920748-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 19:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122940

The application hasn't received updates lately, but there is a bugfix
that is missing from the recipe.

Changelog:
On partial read/write, keep reading:
This avoids rsync errors and avoids data loss with cp, due to
failing to copy the last byte of 0.1953125% of files.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
index 05a1004b65..97c5940e15 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
@@ -9,5 +9,6 @@ DEPENDS = "fuse libmtp autoconf-archive"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/phatina/simple-mtpfs.git;protocol=https;branch=master"
-SRCREV = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
+SRCREV = "5dfd25c72caf83bc85fc636804f1456bc0f6c1c6"
 
+PV .= "+git"

