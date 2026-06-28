Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C678C44509
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14745.1782634348693421737
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oxQc+Bqg;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so251019eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634348; x=1783239148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq7pq+cCq1PWKqOPvu5AEIVfeiKdrOfU/3KLhGzp87s=;
        b=oxQc+Bqgl6kws/xfPdkALRGI+3JGdol5aeEcJTkj20olLtp3sU3zPFC5Qqbs1hUtac
         7oxdByGHivmg/Z8+BjTv0o/t/cmgeV07mUxO8wavC5zMPHtJDLXKaEoH9eS5kHCQS9Hi
         s5ZgF5tAsxsrzielmSWvZ/jEON2Wz08cKnT9L+fj6fkpapXYtjJOFq4EOlWROB0CW145
         Ro2bX48fiHhaviMAO22ecc0t+TFlIB7krcW0PVPMHpFulpVVklf1RTAIX4D+bKuls6A6
         6RTWfTLKOy0L/rcV5O/oGCkj/2gIVVUDkAncBrkMzSH2i3pZFiDIx5NQTZhKF7Pgm7Ns
         NvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634348; x=1783239148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lq7pq+cCq1PWKqOPvu5AEIVfeiKdrOfU/3KLhGzp87s=;
        b=M2vFGTChnYaf3caFYUV4jEbU4SF6CBk7D7TqQuC6GC2jSW+Cipj5Pn2TzviCmTXbA1
         /eaC58DEDvzn61v4x305FlZ1+Z12dxpYnhmKl5YyP/ljjcCiZnv35cuJf4+HzeXLz+i8
         SGCVIonZR43Pb7QzTAvfB65ZX+LPDq4c3glvYsiZzN7bmFewKPjQAboqEoebRcD6sLwy
         Jr/X/DDs9criuAonRmtt1DLYs9iFurliJXu2Wwy/nORpNMK6eFTpqXAWWORQIVlXR+jU
         oSdWTc+D3Y3L5qWH4PRiN9LImYs0jrOzeKLtFL14794B1GlfUs0+VPJiuEz4pk6CdEkT
         LSDA==
X-Gm-Message-State: AOJu0YzgPgl8KQqJ4IJnZthDRRWzhE6OQnP2eRnPutPOlrtAWpqFirHy
	9+Tl9NvHBxK5tBRin+iwbs8zhK0jRsizPy5r3yUd41yZWxqA60V7QGAiWdc/q/zkyliXZA==
X-Gm-Gg: AfdE7cnxA/8CMTHOfuK29mVGVu1zRKZkbazwvC3k6xgq0XMVGq7VJ7LVSzymwUC/Iba
	z946LOBQbOmwV6+kVkm6gy+jHbm0YrY/BARshfhqqopRWTe2ezcGYU4TJyyGa9jkZj9nzbdN6D/
	A6PG2RlYJSdmOhsfl4yfxPD/+rtYjb2Udiqi+GtR04i3cqQ3mzUztKxzkCo8PmUKXwEfmRxU2wh
	brRhKrwyxX1Xz/glMD37V7AVXvFkiGb7nfETzAeu5Qkf+XOANU0enWOk4sANwGRTC+FnqPpcmxr
	AuqRyqvjzqKUiXt6G+YnyMmgH0q0ErKLA/1GlTHVIQOIkPN9IpIDDMGwTPhvUz5Qx3wKz7xeZfU
	K5r7gmdxLpzmOz0Sk9VHSiVRI01faPt0D2cM+rXB06G4dyaZNsWGhnsrsUlpLlbW1ezT9erYGLp
	sxEoY/fX7twfvwd5WF7DdMh7EghpcHQT4TKRDYV/mfhY3M9C6p3In2ZuTMpRelD0/R8sHH+Kk5R
	vqQUz+3Uj37klQrDN2qm0/d/ueGF1mNCC5fCU2Wt12EhHGdo1SEBqNYkNXPRYd3JqDy1vTOwf+z
	VC//L/lk9uFaNItLZgXT9+ee6EALXg==
X-Received: by 2002:a05:7300:578f:b0:30c:7dcb:c8fb with SMTP id 5a478bee46e88-30c84d51fc8mr13065429eec.11.1782634348009;
        Sun, 28 Jun 2026 01:12:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 068/128] joe: upgrade 4.6 -> 4.8
Date: Sun, 28 Jun 2026 01:10:19 -0700
Message-ID: <20260628081122.178348-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127878

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/joe/{joe_4.6.bb => joe_4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/joe/{joe_4.6.bb => joe_4.8.bb} (84%)

diff --git a/meta-oe/recipes-support/joe/joe_4.6.bb b/meta-oe/recipes-support/joe/joe_4.8.bb
similarity index 84%
rename from meta-oe/recipes-support/joe/joe_4.6.bb
rename to meta-oe/recipes-support/joe/joe_4.8.bb
index 510d8f8498..77ffc14517 100644
--- a/meta-oe/recipes-support/joe/joe_4.6.bb
+++ b/meta-oe/recipes-support/joe/joe_4.8.bb
@@ -11,4 +11,4 @@ PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-termin
 
 inherit autotools-brokensep mime-xdg
 
-SRC_URI[sha256sum] = "495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de"
+SRC_URI[sha256sum] = "6995b28ee20dcdbbcb5a45a4c110642dc96d67748aea27450c74cdb4dd07cc20"

