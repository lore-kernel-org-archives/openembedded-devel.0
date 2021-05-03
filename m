Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.1804.1620069135564927604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y/zfD0qE;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id i26so6429819oii.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=A799GHHGXFtb9QAD1eamWgYnQpt7YdfKYY5hkhlvzQU=;
        b=Y/zfD0qEru4i3knO/Y7A4NsGZei8LqcH/Bb0FIA3Cbw/MSIGOO8O1lm0MYhA1x5mks
         Pajp9AgLIg4Fs3jOTIS8iJNmC/bJz+ihEpUKYMm1RwSbSPfE/iGvXNW8uvswgw04OBdK
         ayNK+MN6QyWGpjqLbS9a9BlQnR9g5lMl2UaQ/97ieLpqsSTrd9YN3GxkOpvu/h6fWRFb
         fIg2W3e7CF8LB1H5lThlBxu0XQmvkO9v5tHhE+O7IQFxDUxn9Bj9xrM/PMhuitzD72mR
         CBlc34sS0/wuwTts34rZcPxTfDxTdw7h4vl4mDJi40xatqV5+2K9Mbpa0O+sFTifG7nb
         AE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=A799GHHGXFtb9QAD1eamWgYnQpt7YdfKYY5hkhlvzQU=;
        b=WsFX7Ji9U/VvcSZe+ZK0wrd+dxf8V/7vv+ixstrFoweyLpdc+CNAUsOFPV3t/H7t3B
         fNA8nze5mfPhGj/iU3/By1O/CDS22wkEjmntsnlnPol5cj1ZdPE17HNS4VPokXOkSHFA
         Sg7Cy9OY2AioMzf2MG/tltTfGe8RFHweH6g7Tm500MmilHPMIoMQnLqe+xd4U82EzGOi
         t1pmcuF2Fz5z9TY9prx841p4fuvJ+3N7l2rkXxQi3oXlnnt42ul4njbI2VvMI0jd4gNt
         NIsn1mo8kOfc74U+uYKh+Er0JlFZhpYtUqoB6Ob8YtaoojrbuF93Coq52v78epkOvSGI
         KeWA==
X-Gm-Message-State: AOAM531+Hab+H1tJ7wxKVCgVs7bQ6167oEKbeguN/EqxcU+F+qr+s6/B
	wrKxMSRBmJ4eB6OThIJbccO2DrHydzULVA==
X-Google-Smtp-Source: ABdhPJx93vBRD9ELHhev1d6DfSHlonVjd7rzfFAKJo6TKRRqzU7SfoZr4G2f6lrz5gYLONVD/S+FgQ==
X-Received: by 2002:aca:bb09:: with SMTP id l9mr14917758oif.33.1620069134799;
        Mon, 03 May 2021 12:12:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/14] python3-hyperframe: Upgrade 6.0.0 -> 6.0.1
Date: Mon,  3 May 2021 12:11:58 -0700
Message-Id: <3fe42a6805c535f34ddf4ce206be38036aecc699.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 6.0.1 with the following API changes:

- Added support for Python 3.9
- Added type hints

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 239a3a3a3a95a6b2d75bf81a3b5ef1f7ab64abb3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...python3-hyperframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
index 4a936b49af..2d46e96112 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[md5sum] = "30136a712e092b1a45ae3cad3ae93131"
-SRC_URI[sha256sum] = "742d2a4bc3152a340a49d59f32e33ec420aa8e7054c1444ef5c7efff255842f1"
+SRC_URI[sha256sum] = "ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914"
 
 inherit pypi setuptools3
-- 
2.17.1

