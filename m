Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.36763.1606592841564711669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3PibDl9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id l1so4301648pld.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aHEU3D6kc0XgOYG/4BlTETzRz2jZGA8ZSA7JxKVIts8=;
        b=g3PibDl9YISy5i5euVaK9wijCqU4rUCq/03UW1YWwkt+V6mKwAEG0tDqMDQk7zZDdv
         xj0XY/UVrlQKqZBUxiTIrT9JCXUOMx2gst5gZIyjbQTrBPEy4NL+JRsm/h1TxHxp0mu/
         d8SgdvPGgXWRWnHi3RidvcSv7xHf3IxUM6a6sHjN6CKmITWLUkNhecZ6dgYVM0b5kZK+
         7alE2Ye61yXM2ka2M4Z8OJdGKHAb7QIpdNcioqsWuJjxkY2a3WuMzCQSD8Bed9pTrvV1
         +NZqzYDT5s0Cx61qC3jvs/FCXxJPNr5BAr79I0sb7twbiG2aGFmT62q0ynVE/M1C33me
         cdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHEU3D6kc0XgOYG/4BlTETzRz2jZGA8ZSA7JxKVIts8=;
        b=ClQBUNNbjnr55i4vXk2L1606CpSgjpKnI9oCFv/kEBizPx4Q/k6WSa79Gqh4fpPVpZ
         wnZ96gWuObW4SCBe15I971O/Pg8FAr/ULTFdJ01H8vyI+iUgtXnDT1r/J4dPu34kucu2
         1EfSwS1zJk1HTiNzkBX/co0HAfPhPYref5GF5voxH3Y6wvXgdIkXd9A06kfCNAHIbYXG
         rPDrGTw2m6qD61eItkA1bs93RFr+nPp+c3pIvp7RDC8VmNK+U121aXHE8OiLl71ittvi
         m3E2Rh3zojwK1e6L6tsW0YfV4yPaVuZ6PBdz7cURu2I1bjMrlGsoh6eDFaDRyfaVIw0Y
         aqfA==
X-Gm-Message-State: AOAM532W7SJXZaZ0kxghGmIp5+WZ/9MSsm/CSUL+ufHfn2iHl8eaMDCJ
	MWBsE/YD7tENb1LOHcmagXV+Dla/7+v6Ow==
X-Google-Smtp-Source: ABdhPJwv94v8XInB5ReyMPB2SxHVWt8VR4dWCZHIX+lLBjU0SR2sWOKWfXNILt/l9BSel8PrAWRCxQ==
X-Received: by 2002:a17:902:a415:b029:d9:ef8:afa1 with SMTP id p21-20020a170902a415b02900d90ef8afa1mr12188594plq.66.1606592840960;
        Sat, 28 Nov 2020 11:47:20 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:20 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/16] python3-iniconfig: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:43 -0800
Message-Id: <315b9b7c2401bee51c0d5b4d41e5f2d14bbe1738.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-devtools/python/python3-iniconfig_1.1.1.bb   | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
deleted file mode 100644
index af4291bbf4..0000000000
--- a/meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A small and simple INI-file parser module"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
-SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
-
-inherit pypi setuptools3
-- 
2.25.0

