Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8214.1795739719928127024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K8vgo5Fy;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so11155892eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739719; x=1796344519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/Na8Y7RFM2jf9AOkKu/jyp5bBo31Dd8TbBxttGWL+k=;
        b=K8vgo5Fy5SK7DVb5cCjwboGj3XBSKnCtAQWm56Q5j9m5/yVhSwYoHVZZly/KrOeBJv
         2V/uPd6VwES3OGrCE1iBz16ndz4ZRT9Dy/sxa9qd5nrMIjiR4e8Dio1YHzb658YH6krG
         yLAWF5XRPK9Wixc+12IneABKG2fzkGHNG3LSl24EBFI3JeYXZExZUYgGCKWVhYQADd/H
         fsASoP15TScIMd0C5NOz3wilgpAy/5lNzdObo/rUjE9uu5Dbjlmw6lT6Dg+rnpK7XWk8
         Vw8dJRMYSjBryE/DZm7ZgiTHDe1VUt4G4hMBHrXUxA9xfCriZh087EsYCojT885/AsjD
         /mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739719; x=1796344519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/Na8Y7RFM2jf9AOkKu/jyp5bBo31Dd8TbBxttGWL+k=;
        b=Y0UpnEkmmU76K8QLTBFG6eCFEGjAFcl9pBxkwLsSVKaL5vQRXpM1b+mK13xtGmAj0Y
         u7pGVtM2K8akl7ZF8B8OxlxCK8fjjDrtJKxGwV3CSaBZ2azw2GEaaVUBuSN7HEk4V2WU
         9WEq3Acxt/xHV03sBwcwyJnDFO1yMvrEEToraMkFSKvMwQJMLAKjWXcBtZYs7p3OGkhS
         wl5HbFgHaUm8XoTYQmmAw6miKXxstSaqCUlAOpVASxelhr/ibfAC7xbHk/C6wyIYkyz3
         vftyu8CrBinN7kxi4+RkXf1IwMLXEgjtGXAhens1F/H/FU+rXjlg2PyVGXB2PfDnDE+t
         R+vQ==
X-Gm-Message-State: APuU4Z8to9PgL0Pkj1/E0z0aOGRi7W4d5qYeSzpXJZ++Jx6xLuw1NhTo
	OQBkTN0daMeVHPLmCTquEcLvV3q/iPSR1jR5nT6SNF1GvN5qsiLkzz66hoXU+iYY
X-Gm-Gg: AZFdTZcabndhOpRh7//Q7HdM8kixFkarH4Xz5osbo2wT84hBls/uRRrDYw8bkgTKk9j
	cXAKM6e/L0+mq7PFTuUnVG6pg86+T0jVpwFYAZ2Y5TKCb/zJiEi/K/Dj5ioAT/3AfPk8w3nEI76
	RgICP9RGjx63Aaq9mmVTPZnu7rrPi9mYPFWZzl60Zb8gn25jXa4gQbS/APIMpzwdETVh2WYRKNV
	yEDV/L2fD23KrfgGSgsHyk+C9KfSaeW9XAuztvXB3syv/vnE8NsuCXYx1ZgnjVM0M4W18DNLC7q
	8Eblg8bEf1f+4sBZhPQPTkEyfy/vGbJZzWqnRcqMJyTVZ8rsbeiw5veTy5nC4xmkFACBBAH6m6X
	jvqmpFreHIJ1hM1fogh3pIyvyb0sCNOH49/jg7Efy1NjsN8yY85Vw5U2tfonPMXERhmSQfDI/sV
	T+D2Wej6JFqJgep1yX3HaPkSscnEhaVeETuHfWoHVXQCn1JG2L705nsr81F+4ACAquMZPZldzBZ
	P/ouN9nxofj9AFLGFc3T8qW8gL8JXdIUDYbHf34X8M86ePAIVcR8hEhia0cbQ6QESminUefwDih
	KFlgt1at6aVmH1FUJz2iEwULUQq/ZNefRmtgfIw3BF5BRCxil+EDVwgZMWr9ce3Ai8PEe0zTRX2
	DpRr9VfaUOOxIzwHurh7sw5PgPIMsRJuGkBC47yHrU62Pu1o4Y21eweBLyFrz2S6lF9kFGuKpWP
	f7NDw6qN1+4oDPW8sN6zevPCUlpOISdEV0KTGGdMPck3+U0cGFKJ6KBqVOBeQZAjNoiRgZHDPRP
	jFq8W5PYwyAG4p6SK7U8vVMO12iY4m0ckzhQs/rk2/vwXDGtK60tFO3S4vCgxiuHdbXM3DT4DUe
	11yi
X-Received: by 2002:a05:693c:8948:20b0:386:b08e:4b7b with SMTP id 5a478bee46e88-386b08e4e93mr13856074eec.29.1795739719161;
        Thu, 26 Nov 2026 16:35:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 47/69] spdm-emu: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:03 -0800
Message-ID: <20261127003425.2166632-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133147
Content-Type: text/plain; charset="utf-8"

The recipe builds untagged commits from main with PV "git", so the
tag-based check had nothing to compare and was marked unknown. Track new
commits on the main branch instead.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index 33c02dae72..ecb834a1cf 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -11,11 +11,7 @@ SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main \
            "
 
 SRCREV = "ea77f25410cc01098320c0b44b3e150192ec4d5e"
-# Upstream release tags are "X.Y.Z" (newest 3.8.0).
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-# PV is "git" (AUTOINC recipe with no numeric PV), so the resolved tag (3.8.0)
-# has nothing to compare against; reported unknown rather than broken.
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 inherit cmake pkgconfig systemd
 
 # Use mbedtls until openssl build is fixed.
