Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.31370.1606112686288823667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 22:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EidMzWXM;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 131so13944385pfb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 22:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OcIrpJCYNL+e6ip0snW+2jG+6VvcbmYfUcG817ntswM=;
        b=EidMzWXM102xuVTT5g44bQYVoNu9chnpnYRLg6j4K7hIr4fn2+9192/vkASzAJdDQ3
         6X1iCYurcrwlrJjKyKK0WvrIrSnCboqVoeGD7Vh+uO8naC/2krJ/ZLzlmUVpG8bgO845
         I3o8L3CKqd4b8dQyhUHXGLpmJqTiDiuKffduplP84pRA/k2Y/3poTm4XXfHyPAyt+LuG
         JirREmhL15dtz/8EAXt2O4Z3l7vJSAYGOJNrtS2nSjY+Et2x+JoQEqttbyOc4cZYojMY
         VyWgOOKKPA2wGa3dX01E+yzw05MDCQrOC930/pBM6mt6lt/gYvH3okqph09PbUawZ0Dz
         0oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OcIrpJCYNL+e6ip0snW+2jG+6VvcbmYfUcG817ntswM=;
        b=l8tMvrDXCBGUl0Q7Mu1OtW+LB3BKQ6rQ5Id4FgmpvWTiuqmGBYskcpHyQbrTJbTVLI
         aMZOlQ54lPKzI+daY5T7JW74w6P8IZ/sNZXzLA9XFx5vyZ/YThxRpTS6FyVhW6woNZwQ
         eANixfm4vOw08KwozPF30+neKlwJynFL9k8mDTzu/pu6O479ZRYPinWGfsKJPvMlFd0x
         mCtkN5Z5e6/6lIOxXHGSDWTbXFqlAIojLqrUMjbDSNJ4sR8dkDX3vWHte51j3fzYJrZ/
         qD4B0Bnqb42r/VGYx3OwzAKf4pXrgLfnW8IOgOobNLfBElesaQYxpeiuNUy1jdX4IzYo
         g1PQ==
X-Gm-Message-State: AOAM530XT8DL5XeeduczyIYN03GzIFXhcENvSHbqb9C1Oy0iA661mkcu
	rmsx63X35MZgOhOBHoj2nnWmPoSHJ8eIag==
X-Google-Smtp-Source: ABdhPJz6CSlJGdDTTX2J/il09HwIwVHlwEeU3aCJ+jXnD8LooZSJxVrYdQuX3nRHJu2QkwvCkqIErA==
X-Received: by 2002:a17:90a:f318:: with SMTP id ca24mr23456592pjb.100.1606112685574;
        Sun, 22 Nov 2020 22:24:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id gx24sm12110239pjb.38.2020.11.22.22.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:24:45 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-hypothesis: Add recipe
Date: Sun, 22 Nov 2020 22:24:40 -0800
Message-Id: <20201123062441.2998158-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123062441.2998158-1-raj.khem@gmail.com>
References: <20201123062441.2998158-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its needed by python3-numpy pytests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-hypothesis_5.41.3.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
new file mode 100644
index 0000000000..b7bf15c31e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A library for property-based testing"
+HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
+
+PYPI_PACKAGE = "hypothesis"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

