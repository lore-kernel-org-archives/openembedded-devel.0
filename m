Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3892.1794729073697154403
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DenB63Yn;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so4145197eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729073; x=1795333873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khuDy9QcM9RQr7/LikTQxwmEpTkR6M+dmU9M5Co55O8=;
        b=DenB63YniUW+7k8grO2hZcxEHNnYrpYIbbO3Im9cJ/wucPpbJ+OTYBye3QhgLuqUY0
         e9GoTgn15cYA4HcLr82Ulc1imiAhQdvZwlYQQsc1dn9r+HcBbgx/8agkMtaTCbdMkabA
         95K3dVIHG88zouH90EKk6q/ZJpqCL/+0f2gmEFBOqE8iuxCssgg2956FHQT+ECblcmky
         B+Q2ixI4PXTXRPhCI0CH8IldTZ7CfsfyKyot71vgyIkcZma5OZyG7x4UDwG4AOsk4mhQ
         VWzELThtJwuEt89t9bJzGrZ74N3C7YxfkiKzn9v6RpJ74uKJunRjea0ntISXW3lRCXtY
         Tl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729073; x=1795333873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khuDy9QcM9RQr7/LikTQxwmEpTkR6M+dmU9M5Co55O8=;
        b=ycRxBkCHxFm4kd2qdYVs1Z8BE/RAredialnV5ioJ85IiKz7mvdPrUTIjnz08cc5VIQ
         WVMB0DhcL13SHX6S4Ui2dltT+tm+f6TUGT+D7xmp/0IDePbMK+Io1acbvbA/Ei84XGy4
         NDE77XI53KdXr0mCM3GxZOoQ4ukrP7niFv4Mo/l7zWeUv6MV87ClCOA5IdJd1nCnNzjK
         EvZ61O9NFToYUcY26DjAn5KXlHdCC0Y0aG9iAHNUUu/s0r+lHt0wse0Acnlbsi6f0Ba1
         7z+GKIXT4L2aHMdFdBiPlz8qNaA8nQ01cdFdlCXtlMyAcZ2sRpLnyWK7C5s0MyrTNZzZ
         XFVQ==
X-Gm-Message-State: APuU4Z9uAXW7dW9waKeg1xfrz0AryDBoD13T4KnMV76JCthiwim/vYBs
	vOucpNTGDvFii87CcVZsjY9coFk6yRw9nhyWHhijW/W+uQLS/1eI3tWdIVJBPvkg
X-Gm-Gg: AYBFou0XWWpvT42uLUB1nA0gcT2m4AnltWTM8oKwpS3Pc0tpHrvJJ16oz7AlfhqAmPc
	jhBXwSH0uMAZ6JupQK2zYJPpe2vBH/B/bxH5BN+qnMaRx8kbJ84JiCyC4z/ZwYRXrA5+Jc+BO0c
	bBg30qu35tAdijpyFziT8Fqjlw3gEVFjuPdW8ch9wtdCgMNwHWcp9+SXqGVtEk7fbrr7vGNuLMj
	J9SWDS9EPDwV0RBUrX7RqmfW2xJLxIwSVF7vvB5S5oI5i20c8AFl0/LuERMw2dPJoWF1hLamoQl
	N2uVW9ZkcWvCzfkb2TxEHdylFEVisRfxlpLBmYQ0/VM3Pnbkr+eZTNWfIkuYfK7ZhR4cGcfV40h
	L5IpAaPcKCSK5Gas6ctJdPvAcrR1nJ2pUbOW9v2Ev9KfdU0hcUFRfnRQ+GeJQvezVKrfmwFSfCw
	0priSYqiKpRItiIzvwEITDvBIORfvKL6Jdi7RO0IYP4dqW89ZeSpJFcoOccDk8PWAbFrqovu2qb
	IhMebnI8W3uCpctTHbylWgS1cdUr3uBEgb6LX/tZJpO0j8EtG/1zafLFyTJH97YuHZMIsHmXzrn
	EwlKnYxgLLL9NtlO0YHxx523dJ3KILnV6rqeAzLAOpREOVIWchSd16Wd4MnN8XMc9q7UOOUNfvX
	ZA8uq1npSEelmOT0IFaiRZwrq3rAMpu/RWfCyeScCtFa0t+ci6n/RMNPieK3PVXerl0gSx9ntPJ
	OzN73Y1Z3clJ9L8kGoBAOV1L+q+vHyQHNPr1mVZmId42pqk0rV2d9MuFXRZ2FLZDcPKWxyAzWu9
	A9Qnunvw6wxyQW0m8zGl69OTLB7nbHkXALrasqCzhp9oZJjDEoikSF4hEUhthTrVwkS3/jW4OA+
	wNSj
X-Received: by 2002:a05:693c:8955:10b0:375:2470:c754 with SMTP id 5a478bee46e88-379659c5d4dmr6847523eec.12.1794729072989;
        Sat, 14 Nov 2026 23:51:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 69/96] mcelog: upgrade 212 -> 213
Date: Sat, 14 Nov 2026 23:48:47 -0800
Message-ID: <20261115074918.2932593-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132339
Content-Type: text/plain; charset="utf-8"

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_212.bb => mcelog_213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_212.bb => mcelog_213.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_212.bb b/meta-oe/recipes-support/mcelog/mcelog_213.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_212.bb
rename to meta-oe/recipes-support/mcelog/mcelog_213.bb
index 2a6b4accb3..0e6a5c1418 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_212.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_213.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "9edf489aec70c6b3de56878d1fb613e2465c8ca6"
+SRCREV = "90d5875e92b63a17110a8a14c891a98e7dd4df0e"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
