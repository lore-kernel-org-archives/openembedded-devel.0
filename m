Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36200.1793161491289255522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=b2yXFiFz;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab41538192so433653a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161491; x=1793766291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWghLus5FIsI1p2bO0m9DN1k5gCt8m3ix9byWCCur2o=;
        b=b2yXFiFzogLx0dg28ccEFjx19utObJLuTxoYWcEkfb4QFW3/b21bz4TGm1u1aczOSF
         tNAEHsQaV/pwCkMDERdtKYuq8SRebBpvidNVbNYum1jFZkWpswagN5PMyvkSqRejr2HZ
         XYwP8UQTy/TyTwyMXsZaK0uKfbOVHvC05K+01Dm8vVddytJ5FVTZRQcWuSCFYB/vVMvX
         YvbW65xAjVEh75x26CpT4MVejq9eFhHz5mF8zV02BeEOeCT2Xmr3Aw0bI6Ohx/2ewUMc
         4/NVqMB9R0jJb8RqgH8DVPGdth+TdikCSQXmFnBTgKAWlbAthnpeixNYS4oyrt/nyzil
         8Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161491; x=1793766291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWghLus5FIsI1p2bO0m9DN1k5gCt8m3ix9byWCCur2o=;
        b=1yCWA0qCkJLhD4QaZItXzX9cHcqERS4gjpXgKiietUHgS5RqMOyGq8WcFZ9DbOYsHT
         84XbIjomMhRWxTzL0HyaLGw4qUiEU8iVoh90g/Sr26PoKomdYyFqaZs9PU8a/SyF8QVP
         IZSLeeWqNN2Boolr67nNKiQIcDLEx3X6lFJhhCGbT9Ow1WO76ABTXpkXSIGMKeoEdOzY
         u2dXl5IDEz49EQcuoRpuFeBOVC1gejhxllnuA5vbYnGcBKDDr9fan6+rQZ8eEaE1S4vF
         HaCz/tjGK6+XAHFd7G5CRhaO5AJs6xZBj7Gf5TUt1rblRN2BpXyen/PLGlaBhFedpciI
         +2VQ==
X-Gm-Message-State: AFq9FYJF7SbzslliLC1OVQPEGC7y2xVRUPejzCGwBU3B0f6cohLdzruX
	iAHh3GLyvf9LZmByU6k4+5yUWq5opmui/YCBRL2q6JOaK2OYpTrxfMz8izmnmw==
X-Gm-Gg: AYBFou00iLWUBXiI0pnBPDlG62JZW9XEZMnzbdppVo8I4qXW6VkE2OCtPOIZMgcUvZs
	xjnp6sRsmLEUC9Ij45rYilUwJtBTwHJU/n2Nsv9LnWbRTgLz/QpfAuiU2/41Zp9jOupPQFQf+uO
	7zsyYgWYReaveOVzjxMYBSrNqS9O5rk0pqkVsidwBEVd/S1ojcNk8bXrIyuqbTv+sphl44PvMSl
	Ff04ITphrjPQlsggo1lzSfr5E0GcCOPYay95Go8X3eiTqyi9l7Lx0cLfNUVXnZeCewJbVeLTFQd
	D5FAqMe3d0bo89SkNgS2aYja17PYse34FBy9rtzvVQ36/YtPO2swLR8Vv9k8uMOaG+Zc7SzDJoD
	XaObWesCHIzwWEgi2BrVwd483Lt9pK2Nfk3XcUowEgyTusKM9oMHijH0+eAvHUGEJ0fP70WJtSp
	3BaHz5oIGTU/3DH7t7+B7dw4oQjaOYKcHbW7Cv48dm799KdrorzEzHd5Hp/boYwezSv3eTaZdrW
	ynf2d4C7+bHp//dIDz5MIb1p2v2jge7c7B17zXXXwYbdBpz+eDSipUsMtEC3KipK/vYfIgWQUMo
	SvhJtrMYDcuK0Z/Y+mSM4/1E0c46K5RNq8VTactH3nh7unBjsHMcf8syG25DOA==
X-Received: by 2002:a17:90b:4c:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3ae583138fdmr841783a91.52.1793161490704;
        Tue, 27 Oct 2026 21:24:50 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 19/60] postfix: ignore CVE-2023-32182
Date: Wed, 28 Oct 2026 17:23:17 +1300
Message-ID: <bedbe1184fe38d6996b560bbf3e9d569ffb62247.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131571
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-32182

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
index 99a77dd6c3..fe0dd95994 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
@@ -249,3 +249,5 @@ FILES:${PN}-bin += "${localstatedir} ${bindir}/* ${sbindir}/* \
 FILES:${PN}-cfg = "${sysconfdir}"
 FILES:${PN}-dbg += "${libexecdir}/postfix/.debug"
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_STATUS[CVE-2023-32182] = "not-applicable-platform: this vulnerability is Suse specific"
