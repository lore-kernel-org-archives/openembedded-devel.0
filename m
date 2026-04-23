Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9153CF589C4
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:50:05 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18558.1776948595557913286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k6X6YwQg;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-356337f058aso4250413a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948595; x=1777553395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi3hEtFKJB4DbjefTneMbapQ6EpjXo3mDZM0IHyERho=;
        b=k6X6YwQg9nwrlKk3mXFvwss52aQMjqdcPSHzKJeNeNsd30kyYx9s0LIytdGxqW5Qxa
         UTMLdkl9HEBbl8W7omPEI6xipgXI57j/Ur04zxAevkOFbigG5HAzfkAT7OwCbKqn781z
         YQ9lKUI3RHE/f0ogMptSX3BGcaDZaEKNas/I0h3/9B4IW/doa21nBIvmfcg8Eo+PrA47
         uhgg88o70pwTmivpx+nXjC04m3WxySowx13FN3H4m5wDrOdDQs5lLapDau7B2+NIy9G8
         xxdxH+zWrS8AyINmvtqAtynJtEthZgYdmAvXULfEltrgecyWfBhzFy3r/J/2bZqYD64F
         p33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948595; x=1777553395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hi3hEtFKJB4DbjefTneMbapQ6EpjXo3mDZM0IHyERho=;
        b=jlvMUURlRPXCdyuWT5/Hk8AJjVB6PyOsJDob9o56CRYQwANd87epQQ+nuqigqInCeM
         cvXPMf3s9r/5fPsiOmsGFozJjkVukqTYsV8t9xZxcLNxNze6RBQw66I3wsc5/+L1bxvI
         YifguRdMOtxuv49XupZhgumYlQLGR5/M2ipfRqxurR2dwpE+T0lIYUczvN0wYs8+10mi
         18k/AnhhgRaZpgMMLqFRzD5TgkZRk/2xqvVMdv34XeZKkk7Y1CvoVNnSphCOyK0Z7qZF
         /jYbeqKyuSSxEDOqV2FVddY3H4PMyGGUNVQtjMBO/ONcPewkWJJ8wJTZrnunul5mPaX5
         8zjQ==
X-Gm-Message-State: AOJu0Yxa46IIn5cqGWfnD6RPySotpCGygMUocy6GQH+ls+1WWfLjsTXi
	VodNNMhA0HMv+bXgR35l/323Tri4zJb+AYON8TsgSV/6LOcdQnn0VABbnXtHs+TK
X-Gm-Gg: AeBDievAQuukqQ0s5yKU2bhR4H6dP4xwXA8IsWrRKzQxJEEvqmtwuJnOsHDsxI5Zgpw
	Yxs4VvsSKj7cABvum53ReNNBDy6zV8WsiG44Hx76G0WxVa+uE39kzbq8Ip9NfnamrdnO5YJuC3w
	WwJKesGAEntSrgJH69Z0/SvxcL+FshKAxX/NQJoRPhh62R6UUg7pbNOf3rS7wyopBAPU0TGGhXQ
	Y4Q+dovD3IkiNqLcTgaxvlJDbFRfSV/i81Pl/SFYbEDLMv0Ds9gP3HsDOwotus97d1DnKXAj5+d
	9pkPX+zNCL5mJorRwx3wI5mdr7koD/7zz+UWi1i5uwTaaJ8PgOkc2TPoYrHPCspdgsiU0dRjU/x
	VUHvsKrudj+Zwhwb26S1JQwSMl5VS9Tev3IcU0j3Ymr0O/6YZCz5//LD6WiPKIGCOrHzzcbSfUY
	d/KeyGoQXrS62KkZOCnU9b+YPFpWOyq4Gy81i551KQrPHKc1k=
X-Received: by 2002:a17:902:a98a:b0:2ae:5eab:132e with SMTP id d9443c01a7336-2b5f9eb0965mr200231405ad.12.1776948594743;
        Thu, 23 Apr 2026 05:49:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 18/19] python3-grpcio: ignore CVE-2026-33186
Date: Fri, 24 Apr 2026 00:48:16 +1200
Message-ID: <20260423124823.1983261-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126594

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33186

The vulnerability only affects the Go implememtation of the library,
not the Python one. Ignore this CVE due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 468ee626f88272eedf275efe6f68640ee643c3f4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
index 037614da3e..6dbffaf7b9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
@@ -44,3 +44,4 @@ BBCLASSEXTEND = "native nativesdk"
 CCACHE_DISABLE = "1"
 
 CVE_PRODUCT += "grpc:grpc"
+CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: the vulnerabilty affects only the go implementation"

