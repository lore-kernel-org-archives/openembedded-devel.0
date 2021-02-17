Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.7841.1613570981185881666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Li49BbDA;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u4so14604849lfs.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEkevCCu9+WsrsbHq0Nyoi8BXUpfM4EbvjUOt8kkyzM=;
        b=Li49BbDA2sLARqUY/RHiEWstNe3NEdr8zIVNEiPjcTVtRqXRmGRug2GHfg1CNZBdmW
         EYZtWclnFpeVsqmEawOG5gDGHIQ0lB4H2/FCHviaLrOZLPSES6P4ieHFOUCPMRtGy6lE
         ZjtUF4M6WlpF9GOMFC47Hr/mCbKw4r8kX1gasm2QQAjHQBzbKor6/So7zONOYy+Zus+3
         k1sQCj/sJngOl1LWOGW9ey8vjkozN9XKbSA/ywcAvcWdgy7PzOejmGtlhxUwPaWQUOHx
         mVzDKWR1ep6wIT6jMnmfcl41MiP8o3GvS3oxVJbe0FlmQGUy6s4iSX9l01kyaiBV7q/D
         4aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEkevCCu9+WsrsbHq0Nyoi8BXUpfM4EbvjUOt8kkyzM=;
        b=A9I+Sh/pjtyvOH8+wjmamWw8XlUrXgcZPmH95hFEXR88wosFnhSkryFbaAMWGegg9u
         wkSgt0+8axYUjpxTCCOP3daHB5CO8BS37qKfGHiDWbeYDzfL9P/SucEGVNAFx3zu2bep
         jW+ehmE5DKqbTwFmKIXe7iJAxfJbLZUYAwaXlbY5jA/4ROpnOftHd6m674775DFh7Wld
         YyhdAgTKK69+K0/W/gYAZVyMJA7y2Y2L0IT5xg6x2abq7cI7811TlzKZ8O24CXE1xODd
         OeSjq53/TQiE1s/9d41zCuGNsAc3kk0lISz5vO6q6KH/kP/s/J0Drs7PYAYIWjXRllHL
         OQaw==
X-Gm-Message-State: AOAM533kZdTnH38zc12O1smMNPFXH55UjC0jqPi67Ir+173jVi/3istj
	9N+16nOYLWSBNVb8RY1iM8Q=
X-Google-Smtp-Source: ABdhPJxRSzwyVdAJ3/M9Q3CJEDuHlJyps3AAgrXlpaDPyDrAvfVUs0T13udZ4IV+ikDgOhGJ7vJW0w==
X-Received: by 2002:a19:5218:: with SMTP id m24mr4963493lfb.145.1613570979316;
        Wed, 17 Feb 2021 06:09:39 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.215.157])
        by smtp.gmail.com with ESMTPSA id q26sm253363lfc.254.2021.02.17.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:09:39 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-security] [PATCH 2/5] initramfs-framework-ima: fix a wrong path
Date: Wed, 17 Feb 2021 15:09:26 +0100
Message-Id: <20210217140929.987752-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210217140929.987752-1-liu.ming50@gmail.com>
References: <20210217140929.987752-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

/etc/ima-policy > /etc/ima/ima-policy.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-core/initrdscripts/initramfs-framework-ima/ima      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
index 8616f99..16ed53f 100644
--- a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
+++ b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
@@ -46,7 +46,7 @@ ima_run() {
     # ("[Linux-ima-user] IMA policy loading via cat") and we get better error reporting when
     # checking the write of each line. To minimize the risk of policy loading going wrong we
     # also remove comments and blank lines ourselves.
-    if ! (set -e; while read i; do if echo "$i" | grep -q -e '^#' -e '^ *$'; then debug "Skipping IMA policy: $i"; else debug "Writing IMA policy: $i"; if echo $i; then sleep ${bootparam_ima_delay:-0}; else fatal "Invalid line in IMA policy: $i"; exit 1; fi; fi; done) </etc/ima-policy >/sys/kernel/security/ima/policy; then
+    if ! (set -e; while read i; do if echo "$i" | grep -q -e '^#' -e '^ *$'; then debug "Skipping IMA policy: $i"; else debug "Writing IMA policy: $i"; if echo $i; then sleep ${bootparam_ima_delay:-0}; else fatal "Invalid line in IMA policy: $i"; exit 1; fi; fi; done) </etc/ima/ima-policy >/sys/kernel/security/ima/policy; then
         fatal "Could not load IMA policy."
     fi
 }
-- 
2.29.0

