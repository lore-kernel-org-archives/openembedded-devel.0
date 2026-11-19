Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1894.1795113381867923395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vrOxAl3I;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso55986b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113381; x=1795718181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMWNcYSuvUjVv1i2YqzO4vOhLgAs51nSCdiJykx35Bo=;
        b=vrOxAl3IGxLFZTNK3HLaD6JEN8kxsyvBbSZ91/0DFvv/tord5Wc8IXWv5z3bFiuCAC
         eBmxkPxp9s8cISvZvKl2t2Es2vhRyQ19htaEBoOD5mbLmtPUIGJzvecG5uwdiuZyNuXo
         burMTuM85rNnNR7kg1u7gi5Qxr1CAgnnm96IDnTX17YPofibHsAUxciWxttiG9HBWoT0
         W5BR4gMuTgTbguKZgIms9g6a2V6cD0jpn2j88I6l/vaW2eEyk6Vd+DybtSJq4Zc8PgyB
         yKD0sg9YGOP8SJue4kEdPs+wQQM/It5FxPBWgTjbRT/LcyIYCDwb0axDzMWolerKCFSM
         BWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113381; x=1795718181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XMWNcYSuvUjVv1i2YqzO4vOhLgAs51nSCdiJykx35Bo=;
        b=PPOP4xkhWxDqRxjHQ6u9JVPhOTK4ZoU2R39CxtwBm81SYVHB1zXh1o4y76hshg4NVT
         dhRq30i+7JaTQWiWzqTva0nQiorOjlKaSOtJufQoIVJaZqhj8ZEp12+N8EjfrjR10SCQ
         tzQ6czgd+NSv8son5XxIMhExY2I/4Y8VPAFICKDh49+s5CB48Sa5LOeYO57GC2f966a9
         3D7viVKvnpG82ffQaHWW7l/O+BCg3Z10Xgy+xLfu5uFhv1dUngAdCJ+XXTGbBSp6akmP
         T+3IG0e8AGoQrm8YLvUGq5LYm9i7yB4QvJn/yiQyV5YzQEbcKtc6OP3b2+D+ieFhltCp
         F0gA==
X-Gm-Message-State: APuU4Z+d/z/+1Gd0OgOf2eRMXPjXC0zZKMc0lel12JkCOaABAkI/KULU
	YxV7W3mdAEEC0z4+AGFhkQaYQjyFnA3ciQdIJt8DpoM2ADr+hgXB6dkmXYK+lw==
X-Gm-Gg: AYBFou3t3OzNosI+FFGVhF6Jbac6cvICt35WrlqxsxnrgdtJN9zTMA+3A5/dfWeKkA9
	YrSvR9VNTSj08qoXi7BdvaQEh8GFMq91W0q9Um/WqzjgNHPU2ofBC8Wsib3pddBC62TNEUj43M1
	JKdN8V5dGpPfus5yOuSa49/PV+zQnWjCL1PUovulLOK6OpGSPiQrlGf6PAFOI1ByFV3RqWcmmp5
	7dJu5Wuxz3kseoHk0/ZI99fvHSRqWcicnn2RgQHIvcwO20+OYSCrb0oP70UYF/4q+yP0HhiSrRJ
	0kPuctHvy52AFsKC1SNaxGfYSb8d3N0ZE37MSO4ros3wDcWDjDB72fwqWO8fGy17oshI1RXm6LJ
	YUru0WzEeOSQqqtzI8sKahNOS1pPjZJw9+M9gfl3Ly2Vv9hoTLSevAzz8WYeLeVJe6S3TvcYd/e
	ChfC8RcfqTmSF7hrACKpdQNv6Qu7mOxPsdq5dLqXYgygBy6mYaJZ8QKSUQMGuU8dM9eICMGPQIf
	HL2SShsoCr7ROLsOF7a2dCq2jZ3hK2rq5tOrjrJcAbXrGvWJB/4AoSh27z+OwDNi6vD9weuaOay
	6JnREnDjJyb6UrOtWnFMEd+IBKg4f9Srm9mosJ5OVJbSEpxioogsCgHt4n0S5LALzFmegUtUGYQ
	L1jePCWY=
X-Received: by 2002:a05:6300:4086:b0:3e2:8b69:eef0 with SMTP id adf61e73a8af0-4014d25474fmr484722637.19.1795113381206;
        Thu, 19 Nov 2026 10:36:21 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 10/64] python3-httplib2: Upgrade 0.32.0 -> 0.32.1
Date: Fri, 20 Nov 2026 07:32:38 +1300
Message-ID: <1e1e2f5331f25bf685bd1253a6501a94ae485aca.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132700
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.32.1:

- cacerts: remove distrusted Comodo AAA Certificate Services root
  CA due to eMudhra incident https://emudhra.we-have-a-problem.com/

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cbeb9338439eb0f017e82d74d2e28add8edc9bd3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-httplib2_0.32.0.bb => python3-httplib2_0.32.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.32.0.bb => python3-httplib2_0.32.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
index 341cb3dd04..54af71c097 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
+SRC_URI[sha256sum] = "37900eb8a74576bd99fc39ae1dc8409f95f965d45b56cbcb2194bb55f58a90e1"
 
 inherit pypi python_setuptools_build_meta
 
