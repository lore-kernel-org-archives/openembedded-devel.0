Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10247.1795752990487334460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RhrOrtwY;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so11673908c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752990; x=1796357790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p18SGfSd3mvO/S6vTL1REv8xW7payUaTSqPGPvRcjFw=;
        b=RhrOrtwYXEHqxAzkafrXlUuSizYSZ1+AoMKJYhaMEm+p8HgH/HShcDBTvUFZz1AUXF
         WnNNAe6e+t8br2fA6LvO+h14NDUYzTqAd35kF9ZWiovzms33ForX2yYgiUfeUDadD2eM
         tKp7fRL1QuUWjneNGhT/10QJWmYOPc5bPn9ebHgLPhW4LuF3ghRg9JRnBZ24dCUWmu1g
         vHZzkVJ+/Hq2j/ByvEwjqhJ1RlY/XkO34tstX3dLSuc47TjfvoQWyDPUTZTj30CyjXFe
         70VqCnf8oAR5tgA2xVvnIZPoJoWXkwgERkRoh3Io54EXY/VMR02AYG2RNwurAC55L5Vu
         ewCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752990; x=1796357790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p18SGfSd3mvO/S6vTL1REv8xW7payUaTSqPGPvRcjFw=;
        b=dzaH8Yog4HKJ6fHijI1NpjzM28xWSfWqV4RuQN/FgXwJJB5o2mOMclsBOUoxemoSzO
         FF1YsfPP6f8AQ3+E1/aLwmm7Msp6YWYLF+IUOHOxE2O6r9kjDQzwGJhInuANs3FCecVo
         BaIaQdeSOM4AzqtsMkJY4ZHX+OmtBHhgfEFzZGk/rKRRM2mnhC5smEV7rM8iFHnxpnQa
         0xkiIwzGY5zKHEiFwMkrwPSq1V1Jod/7vBw8IW28IDmlVudbrRHrXS/IQigOWS28SiBy
         3U32r5WCRPxfH4qC3n2Oj4lNnJjvFUy1ETuDG05QxIJ+gplZ5Iv1SRprGwqvmO505KTS
         ua6w==
X-Gm-Message-State: APuU4Z+3WRgWq9GS5wSrR3rvTMVWdYvmwGZBpLsUhBQvU9hDTsyiSv51
	kmiZXoanU9NohJDkTFzpEFllsRKVEAcMXqOaMc/gLNNkWmtVf+MhSxtvTSN9uHcO
X-Gm-Gg: AZFdTZfLNVRFMxvDAs8WFFtSn0EJ2q/Vrwq73dofec6Hie4Y8dpFdinqcxHUA9UuO7C
	140KvfY8QW9MDIyn9Pzlddw0dUibvTbpB1j3S06dq2Pz4+FV9ZOdSKliDSJgAmqL5W8GaWh3e0n
	29iL2POD5CavoPKseDizJ4SkSMPeOC2ivRmnXdomyfTAj2gcdVxbH+XATgV2P6nUIHhCPSsNrlb
	fi4fE4Gp7Vn5rO7AutfzSxurtKHpgVKyKEq1d5OBGzeNsit6x21Fsu5RgiNZ1hdm00ChcvbbFhr
	tjXj40Zp97Libqgi9ScyYtdibKtw/70kMX3VHD4tFS3amXXcRNj7f15AqdsVZ9Vjbpmg7Lwtgkr
	JmdkSJQ5Xtms/ZRzaTqKkAtPwY+BFgAzWn9SjbY0h1GD2SuLjmEX+3r/EC1HGqkAqxEIcs7wCTc
	WmnW106K7RJReX41WaATj17DdjK1bsXp9zniwGhelipIrIdLs8XO3WJglX9TqDEZljxVLnW5lfA
	3wUC86c7Gwk5veOZJt8x+vu3rKC57HLMf+GlXnJpDgC9lvk9j9nLMSHEQynUrodTmVbYVMvZNIq
	uFI+H0j2Y+YzFQJs51XnrexVvn+CbV0N7pq0F6Ja45BJFVEhaJRKauHPlCPSSZ/bFobg9imMAnt
	oCU+JAvRG1z/GjATbBFt8KfPDRXjZXTkJhcLhgGJj8u+jAuM1+mBPSwFjHrm/qpJVQW3dxObI8Y
	Vaf6teIDBi1feKXftMbHcUzLhse2HH38o9k1EmjMQ36/BB0Ko8zG+Cz0z3K/5l+dqeLL8/6jUM1
	Fb9s1+Ak7B2R/8M240QnC0qFloy5pmLxYX/fq6pQMMGSSISHaj4bizBRaMXm0Vfx8P9FwD7gqML
	dkG9
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr20804676c88.19.1795752989719;
        Thu, 26 Nov 2026 20:16:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 10/32] python3-cvxopt: Look for SuiteSparse headers in include/suitesparse
Date: Thu, 26 Nov 2026 20:15:52 -0800
Message-ID: <20261127041614.1775064-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133229
Content-Type: text/plain; charset="utf-8"

SuiteSparse 7 installs its headers in include/suitesparse.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
index bf522f3e7a..550ec7c492 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
@@ -18,6 +18,6 @@ inherit python_setuptools_build_meta
 
 export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
 export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
-export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
+export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}/suitesparse"
 
 EXCLUDE_FROM_WORLD = "1"
