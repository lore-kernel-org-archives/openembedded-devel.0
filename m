Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33621.1794851646382960158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GfPsodrD;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so5162346c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851645; x=1795456445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3ZWfGI1KHdlNxhHgS/eX9q3UvWJjnJZ9QueVlFS9dg=;
        b=GfPsodrDFPHadduNsf48Y3ONLcA9peITcxVhFx74BI0Au60tBMm43olZswei6MBBHM
         pYDIXIpEIp9jvUvFfYGok7DNY97EcgLwlF4P5EzWkcwppfkhZvJaOqxjoQnwJgy3hM7S
         o7u1TXNSk9k655h6Cz9dgOrKE3Upzlh6RZ4slHR84n2ROl+wGYye0O3vmQnrSpQFQlDN
         z83PHLryfe+61lltzWIdIycqDBJDItov8X1xav6tBcOM06+Bibk/R+O1s7GuPJKr4Uyz
         wrwKK2jvb7knCFDAEMatEqPPM/YdCseXmqHt2era6auNakczUfx93VkUEDfdDeHzeV/f
         eFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851645; x=1795456445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3ZWfGI1KHdlNxhHgS/eX9q3UvWJjnJZ9QueVlFS9dg=;
        b=xqusQuAWA9iWFEoS3rT8uthq6Qu6TX7Hh4BDA1BH/l7mRarL2Fq3L9rCCDr+GXHIGz
         SjEEAEPQZbJ6O0ooB+ryrgApRXoq6v02Wp9JXywjZk2oL/vqOBPDu4BCw8bfGs1f74sJ
         qUQN6/tt21C5p6jt8kgQv6/aRAEFJvRsLZjQsDIXdeU3B9WlyDL85VziwoVl5whqQERk
         b253qLkLIa+Ki2zWR2b8YInqmjL3Pb3fmktnld383HEaSSEcZUTEjHZukNR8bK7a6shH
         bP2lmLI+IWa5qylw6QzbJJK9NrTn2yPu2qDQgQ6F2u0u3zOfDSGIa+vAV0EWd3+O1KNM
         wVXQ==
X-Gm-Message-State: APuU4Z/9JCpBcJZK14TxbqbkUM40qSuseE62nN3+QPckIIQZlRSQ9fSp
	bSOVUwy5rzDUf8Cwv9QWkZp/sVyNXfQoz1QmP9RkXjIPbSLrg7hzbVrTc1yk1w9y
X-Gm-Gg: AYBFou1nlmZQJo6X99/xyo6Rrnc7MjzS2k3Hb0jnwrHPiPqclsgJJeg3gnY1MDQkoee
	C9ac6TR8tWmRrp3nuZ+Blyynr38Dta1hfkg4Z4ci0/q3rXATgAbikkRmk+8r4umdtRo17/Lxy/4
	yxPKBMoQyE1xmrTKOnSvk6HOAAif/zj0qvVn/lJbDPpBd2REGGtYqAcq9TqHmn41y8XXBwZsvyC
	lb31yBYpejtVLUCR/lr677FtGEq/zybMg06ulTl4pGEzrSlbgkKlrz1fuDIVAHGm5XylVoG8wbt
	mVcBUqatL99LPb36O10Sdc0276YeNqwojtT1cJoeumWK1v5VulzHsZ+GmS4JzFyAfG9YEjAJuCt
	cTRfBlJNltUPOJk/q6+Ck7OXeG6ufNMgS8SuB8CYOY+ybp8MIbTxNom5OESbhUbMW7p2uNJ55Ba
	FzKKKhWG03NRd6QkiVThv7zAxJjr6qvbwy5XRbteXf8IUx8Mc/DYigVRkzDLFl8apmPpzwjnA6F
	BWk+E1J8e3dLHjRNWRQNv4lEk8puKoesgllKYu/PA4Ch/AY1wRIH1yAMDmilh1Fay06RA1hpcCZ
	aY0GpK0Qn5SA7aiopjYccO4MiDGkCwi6ZeBlorISI3P3rDOyC7Zsezu6hYMkvmIVG05dC5b7fjx
	fEa/xISleWDlBnNMoGsrnKwq1xMD8ny3VxfsKJrXb98hBw4Rq7uh8nfBOS6R55Wffnr2dua1Asw
	hUL8Dk6lCYZxTvdQdLBb8awP0Baww/K05upfrPq14sHKSRswgLvLoDgRH4LdnR5w38Q7JMqC7eG
	0mQots9IHXaVKayd/zFNPRLI2rp3ZpPzha6qxM7TrFH23QBuT2I0IPbEpZaHhePE5rFAoQyYxsn
	pSALOEnt9DRAQIqImUXYsX66EA==
X-Received: by 2002:a05:7300:d40b:b0:376:b957:c08 with SMTP id 5a478bee46e88-37966c489d6mr12065880eec.9.1794851645208;
        Mon, 16 Nov 2026 09:54:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 003/105] python3-apiflask: upgrade 3.1.2 -> 3.1.3
Date: Mon, 16 Nov 2026 09:52:15 -0800
Message-ID: <20261116175359.342679-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132459
Content-Type: text/plain; charset="utf-8"

Changes:
- Fix marshmallow parameter schemas using the OpenAPI 3.0 "nullable"
  style in the default OpenAPI 3.1 spec (issue 771).
- Fix the OpenAPI version not being respected by the OpenAPI helper
  class used to generate spec elements (issue 773).
- Package metadata now declares requires-python >=3.9; linting moved
  to ruff.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-apiflask_3.1.2.bb => python3-apiflask_3.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.1.2.bb => python3-apiflask_3.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.1.3.bb
index e480172d1a..ebff01b16e 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.1.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9e19b554631a518a637c8a77887be37f37d46aeeee3d4a863bc4f6f0128bde23"
+SRC_URI[sha256sum] = "cf1cc66e69b0c129d7540cc275e87b558802d30f3e23290295191fa442feada3"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
