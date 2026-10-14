Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E543FCC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:39 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10239.1791973356791732857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FJDSWNxt;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so1566978a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973356; x=1792578156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srO94dqdUJfJTrB4MkToFCedIFVJBKBtnqJs8zFy/UI=;
        b=FJDSWNxtKkpYKHuLcHsBzycoUF8JMG+B1glapZzjSKWnK9Qp+zVQfLRYtp8VVZy4R7
         GAF9h/axPdX5XcS3wFVYfsYULey9XiQfTqxq7KV14kobucMHmwmy+c9FO4aJnFeoXIwB
         MxfeCR04RxAumWne+mAw1CP0lNGAL6/1lvH6AlZmyeOMBm8+Q6TLbD1n0Ti5m5jTiFyf
         i5ekWe39eKUD1ZAvsgf1hrUgmIschKjWK12dLcOdgiwcEbLP1Z6bRuxkP+kjoJJpwNuh
         HhaUsL4REXZcy0qYT5QIy3Jpa7F2tgk2XjOhRKpL/r6KsywSvfqFUDcdsqyu+dXxxhtf
         m4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973356; x=1792578156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srO94dqdUJfJTrB4MkToFCedIFVJBKBtnqJs8zFy/UI=;
        b=nhC22udIsiMTsa/syxVcPkKnJwJSALLSuaMcTqj597MHm6YfE3J3ZsPeJuADv+hwNN
         QvbILmbq0HHKYbRgYjrmvHHhFg4tGCzC0gaRIv30vtAVkyBpKDyJ9Qb5g0VUggVOl3gi
         JG0pNwKRMmCv1qGh32ZWW/4HFT+YbWgb85sPQeVfaS4smyG+2t6fZkQh0ke5ml+gjOHf
         fBYnIzRSp2nPPiRTdySWhIHk7b99fhwDiCB6NtxKfcFPRsO7y9TvLW02CLgBAyc/Rvfc
         Wre5TfvtBiIVcl+Resd64atPh+3qNx/HbJn48jbDyMyQbebLPWiSu4lvyJh6TPyknFCK
         6tyA==
X-Gm-Message-State: AFq9FYJHLlgSf9wlzPm3+SNeCzid41M5BCIKaqfgRel/qCL2q4ucecpb
	8QkutZK17WCeP5WtHJ4dFsexKoaId3W1ZCXln94QelmKDZ/meQ/Sf/+X46Yx2g==
X-Gm-Gg: AYBFou0pWmQZIuYqlb+F9XpOaz+5yvbBPOghsnlBd0kYvUWkjR/9ogFYMzhGHHFvLix
	TBh8i07HRsxDoSTX+KMaCNbT+34WyOIP6PH1Y+oclm0UijxBt7igt+Bz/dLW9DJzvJa4ZkNdMr+
	1tVPQS+S7A6YfPkmXFbj34yCmsXMgRX9FCFP31uvNys4+nTDdk5QcY0rxBJcPD6YRJlatywfUWK
	WRptr0oo6Iux8v9dtX5I1B1ze/vMDk81z6JSWZBFU9LVmtJdnxUTFjTIeHzZn5d+o2Ldbn0ODtd
	5MDopoH2B1YfXWLjeiIcBtZaDbVK035apaHqSwjaHUG3Cs6lI7a+fTJ+c9Hj+NDeuE6JfAhglTN
	z5lV22iiOjebSp1hK5oFOIwbKYajEYIsTPMukhWDx7N6CBcLg6PTnEwnuxDXFHplNkNanYIG+M6
	WobcsU7e7J0gLLaPJc7J3FvcNKKFVO59IYX4RC6T+vQFiYiPW++wYcXlpnYgDfWoroZZ30jWbAw
	EOP/mBwaE6hqNnkOqJ1pRR7+cJziBljFk03ulU=
X-Received: by 2002:a17:90b:4c42:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3ac80dd01bcmr479394a91.25.1791973355986;
        Wed, 14 Oct 2026 03:22:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 5/11] python3-django: upgrade 6.0.8 -> 6.0.9
Date: Wed, 14 Oct 2026 23:22:11 +1300
Message-ID: <20261014102218.880640-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130891

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.9/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c39562d398bdde11ba32c9144a8189f87ef922d7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_6.0.8.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.9.bb
index f8a5d6962c..f4e29dc645 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cb0bd962d27fc866f3c514b20aae6a7df56ec80b488f9899da46d675cd051526"
+SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
 SRC_URI += "file://0001-Revert-Bumped-minimum-setuptools-version-to-83.patch"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by

