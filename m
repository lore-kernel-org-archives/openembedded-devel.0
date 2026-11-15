Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10709.1794762019376984741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FsBF9pDz;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso3326272c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762019; x=1795366819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmtlLq2IIVXafVLah3IgSBLq6cfGIKi19ApimhTTXOk=;
        b=FsBF9pDzj/DEnYDbB+qvkirT3o17KTmJvMu3mmtxEE+Br+8HH2dgfhZWPJ2BC6brKT
         YTEB+kLtLmBDFKfqS6twnmun2uUwUEFdziXSnN6Hs2PhyfP7Dao74eSjrnmeYqK5ZJBo
         oim6JSL3X6W2ug+Af0UQZxDmH1MZogwdFVZ8lSAfElGWoe80AqDDlFr9XwFM9YSW/gWO
         05W0oBx6WKOK18Z/HacRj+dkIibDsUbwzvs+SUhcipJFIYtwNgPNmiH9Be2gafC5K+KP
         c7Q2+iYwN3UYxyfSqqw6RwQ+15N6GwUE7fFEojOMvQrs2WdoQBh+UHtghVJTLIs0m9f0
         R3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762019; x=1795366819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmtlLq2IIVXafVLah3IgSBLq6cfGIKi19ApimhTTXOk=;
        b=DVkj8SbFec7MiU90sgBZpXnJDGRv2EAez1nl2QnToBx52ZrwWaokug5PQ6PpDsmSs3
         KJa3GDKWziFZVGe+cks0e8KXQk7lYI9sKcvbEquk2qRx9D1r7KDCkCIhEW4kIlALLyMA
         S5Tz6qLJxrGoHxyzV1tv7gEQ1LQG0yvf1rTuVYLyDXxksni4ekSU8RzqMf1du6qcKhFv
         rvFFKOLdw4ZiQLUhE02v6UWGk2WqBiijfYEK+/FcYcfuvKd+1tD7hfZVECNVeaOEJtHE
         wVL+/exObQlcCyr8Jp2YXOEu/99PB99a/ijYe7q29sZyflUGPXZSlIcUuL6WGMxesFcR
         8ytw==
X-Gm-Message-State: APuU4Z93E7NgvRmPue2rCpsclomli/3wEBT5YCaa9ub2w3jui/tQ3NPn
	AcFXZNACdsS3JfKxTzsptgWl41lzNqG9SjkizulFEkpbQcK4kVrDPZiIpcVqT4IG
X-Gm-Gg: AYBFou37bniJCgkzqwJfeaaKX551pRF3Gk0U9NTbAiwFW0L5sEi7NOFvfSmqXAQXKIk
	PWCYZhzSllkL4+wI/enT+3+PIwwbKGtVpEyDZ+hGQ8AR0t0B7EbNGIiBdxaZBTxCp3hKh8qpAgc
	WaP/6Xa+915cJY9dd4+Yc+diDvlJRrIXoEvBshwjI/V2XhJPgm+zo6+FkK2N3n9NdP+T+yXlAAe
	ja7HbMfD7/H7WfF+mkbr7198eWz1YSopSHyAe0MEx6pfCFdUfVvMHTCBn+7hICQRDGTp31LY8hH
	v5cxwd8Zc6Ps2aR9T6HWEt2NqTcx05y/a1mLB8f8rpJEiYo6PtU0YbQtSWKE0R+x7zSoVH2787+
	vk3N/vuhOgOIHSNKTvpO6nRiwSipiggfAZy48mvxF4JjJwTnoPBrK4oMupDFiku4RzkuK5eftyn
	vZcrNNrWDiefvrYrwIWIhB+PlJ2nbqgv/NUd/jG+PH7a7zMycp2JNYKc55tuC0czK8denwuq/8X
	A7amXhYsG+N29qia+vKrjWu0vV/AoKXNm7s9C8yKYdXy8W5vJF8l6XCd4k8+lGC1Z9a0CoZVZuh
	v0X6o6bNPvmLdX+7ErPoApTLQ2ECR2i/xwPAsYI7o/88/e88PATgeFPz2H40a8rCs6gMu/L/Yjc
	U6MiW7/JPIp4cZK/ElBvZSoICgZ06b07Botoae4GqxKV7+rnBRmiSIaORySKU+o8SO7YC10rLeU
	mPpg5Ej0JaPNsI0sO5mhqjitTt3yqzyXesfjcd/wLIIprIw2S0mkx+xbwzUeTyebGr3EfQ9/I0E
	ZaRwljFqL7cSIQJttRLMN9n+oJFZk1SQWc7HyElr/m5mdRSbHYINa0csqqNSig+ZIsR8bWSYnTu
	9CS4
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr9052599c88.19.1794762017188;
        Sun, 15 Nov 2026 09:00:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 12/15] xfsprogs: upgrade 7.2.1 -> 7.3.0
Date: Sun, 15 Nov 2026 08:59:51 -0800
Message-ID: <20261115165955.3485789-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132378
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xfsprogs/{xfsprogs_7.2.1.bb => xfsprogs_7.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_7.2.1.bb => xfsprogs_7.3.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.3.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.3.0.bb
index 9c4602d450..7a16cec1c8 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.3.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "

-SRC_URI[sha256sum] = "c45f5fd81fdebcdae61938fcfdff86c9960b39fc89a06df633730d93876cd27d"
+SRC_URI[sha256sum] = "310c11e9e1d336064921cc123de5c84a331d5abe3c3b82aeadb89a191d34b449"

 inherit autotools-brokensep pkgconfig

