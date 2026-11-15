Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3796.1794728966336769092
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JyMS36MC;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so3565472eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728966; x=1795333766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+ntavfsgKSPegECUPfqg2LMKnkkJAmrF2Iv4XToLps=;
        b=JyMS36MCWK01WsbIKTf8oZB3AVsVWRQ/wbYDnZ52ARqymRSr/n01ZizJyigXStqDbT
         wwVsjhXW4zOiGPW5EH0U9lwx3r2t/bl6JnHAjhGYYZI55SFEZ9vZ2YRmUJOFjwPPGmtg
         BMV0YuFZNzWeRtPbzhHM7yNGGjmj0kKCvYdhZI+q7jHT2I+3AowL23uxHoQplUjo1Qku
         bCxtxqXCMhDmoWu20lQEdnrIKUpkDacFeNXud2hgLe1hE5KehQCUxcTJvvl3SX3gthqY
         wGiL6KvnFnKp4JnvMprn/Cbmz6Qx8guvbd2eBdLzaF/TFPcorRCPIxw5uMtOrrSFkxbU
         ZNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728966; x=1795333766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+ntavfsgKSPegECUPfqg2LMKnkkJAmrF2Iv4XToLps=;
        b=sE5bm6Gf/tI9x1Z+VNnpcbLs0ZMRGup6AHkVVgr+RAGFBv9QmYg2hjnBxvEkd0cPw5
         YAFeaJ5NwkfaV2t6X1lQmYIecu13A9+9USAy9u5oByIUSeqdfgSCDkUrQfkc7MdsTZvM
         vo/aPoSMjjzHeVQXd7DEwlrrLifAJ1cmn+hRf6cefyKLHvkvIoD8Ix3LznrOBSFM7fpA
         ZEDqpoWwqXeJ2aGacFOvIztJGihW8AR+PD4dnsl8P2NCwX4fJv96B8iuYRs9ufaaATww
         XzzqtCGRtAZ7JWw4Fg//vG8VNobZoK6nPkaB2ONo5TiW2JRThB5oYtG7c4DlRhPc/reA
         WhEg==
X-Gm-Message-State: APuU4Z/CA4vqrFnwGX573WEp5O2heYTDjnBDCNXrq5l1dIP8yNNH6Fuh
	igAnNkEi5HBfrNFFk6tYXt7biVzuAv3OXdhxY6gq9ZwVzmM6rKGKSfzPnTsQJySY
X-Gm-Gg: AYBFou3zzJUy5sYp1CnJsESLjyUWOWpnnXR3mJl9YfsQ0vVcdfYwvGVufcCZRTmsCgT
	ntiZuW3ijj6A0uAHbWnMTS4zjreFMbeEuO/FMVkRZaQNwY3vb9iPVUl8JJW22GQYQ16lt/BLvio
	iR/XgqNPAk71K+sGRxk4sJs/Ag0Mxb+2f+TebkhewcHjtDjbx3uYXp5eqTEUYjViSmHkREsdon/
	UVo42RFZegk6AnsJCRZof4LmnKtALXANBfhae7ncNlOLzMgEKqKSfIiu+Vh0UcH39GjfG2S8Bxl
	CeQKdNbAtTfmJ6RQGrwnq2tGEg6k9Q1wVlZVbnRT1Wpn0jJmHgUHQWAuPeUzfbh/Bo2DADGgJWz
	BjN2rXqweub9LX/jMuIit2P4Ry32iaJEkFpB3qNbGNicfjQBgaceJfLxhW9LHvjCz4cPE7zGI45
	499E/opTNi9iZEWgzSdNg5pVa1vUdPlzFO1YrEtwZ6PR4X1BrERkBkBbjUwFuHzHI4uQ16UMaJT
	rKTbsx+b1t2yeuYBZ3W1Wchj4nu/OMEeCNkjg9O2UHmmfLU2OchE9mxSpklEOAia4IQ/THxNWTE
	k6QAdAgPPGupvjgwCWnqySIMNzrkv1eXTizl+RJUt+XIcYaL5T4oi+1ML9nQOhRBRkc4Kt11dwW
	nN8pP3W4W0MnG3FTFMK/7IEtJyavp7dYsA5OfdyoGUIux7uAMqI/uj6V3DbsPEuPCaYBI+N7+tQ
	U5UV9+xWQf37/A4Fzb1OtuzoIC4q92ArH7zGk+YNrUHMtkV36lztUneWdaUwVRzEMQztfBG5lxO
	dUtfOfqgLVFo6PWxaEdruMT6oDEAEleDQeMMklkWswXg4sFMzJxlvjD/0WRq1OuMrUl2tZZrcJ/
	9rye
X-Received: by 2002:a05:7301:7193:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3796366047bmr7556286eec.5.1794728965664;
        Sat, 14 Nov 2026 23:49:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/96] dash: upgrade 0.5.13.5 -> 0.5.13.6
Date: Sat, 14 Nov 2026 23:47:41 -0800
Message-ID: <20261115074918.2932593-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132273
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-shells/dash/{dash_0.5.13.5.bb => dash_0.5.13.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.13.5.bb => dash_0.5.13.6.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.13.5.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.6.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.13.5.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.6.bb
index 438d712e9a..0be7ec7cc7 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.13.5.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "40090101a2a491f13e901d3d48e90414f26634628b9bfff35ff540363c227a7d"
+SRC_URI[sha256sum] = "26aac476f476cef391c600cb064417d82a5465d8fc7c4fd56158c276e86538c1"
 
 CVE_PRODUCT = "dash:dash"
 
