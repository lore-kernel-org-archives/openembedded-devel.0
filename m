Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.3583.1618693582295353710
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TWkV4cI3;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id lt13so6961285pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+qwxrTV9ml3jj+iIVm9ymwlhd8V2Jgz3wJRDCGoluJo=;
        b=TWkV4cI3U9Tu9l7xwe+cFYWjAigskgK84r30x8CTBLuHvFbFoIMdaT/s/ggC0InjGR
         icB25XX7G1OhIh3esIOL3F/NxOyf5YHnlf5hmZs1n5f3iaRI+Ll0jMq+4/s9kkkzGOEu
         heUThDQ8YF4POarNGIkFpUsFfWJHafaKsR/+DAS/vChiGqhnyBRJ66qWvdZM4uPPvnWs
         Q4x9DM0foXCD1kq+Sy7OazSItv1gkQjOmsbPBGC/qh3t9a6jp/pp+JWurj806U3jNy5t
         ptqbgd37BZUnPaikdsOujBWkV0TeXcA9HgizRqdl+t7vs+hLG5t95QmwxamTeBObGuF8
         zchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+qwxrTV9ml3jj+iIVm9ymwlhd8V2Jgz3wJRDCGoluJo=;
        b=WEXm/bf4gi3WsaRPYnNniAIIFPCtDSFV7Vrevb2eLzGh8uF5XZbWknTw1P+YTQIle5
         QAuJ8BewxJ9zm4Clk0x5iGQ3knjhQlPQrcW21GOgATiXT7GfUCQ+ukCq+a3YsDvJLmcx
         IWMkVGldpa1IQIDWFJkXCRd6aqFuIHmIikLKux1RAovTxqnxDNR5P338VxD8scP8Uzze
         PUCsvR68HNrURePnYfJIBlaibLoy+R5pby3vosNNRbEDsvDJ9CJ4X6VeWFBnTt1A4W1C
         EYXU36ohLtw2Ne1/JvzeUNpy9cZSCo/BoMlpORANWU7QuMAsgBR7bVULeapW4X5BGdtr
         0VvA==
X-Gm-Message-State: AOAM531+FvM+Y155CPajceJkZg03TrOEsHF8AJY07DPhfSO9/xRYFQaW
	vO2xh8ztPt36vYisHpdZSJGpR6d2pUtJ6A==
X-Google-Smtp-Source: ABdhPJyHjwtRO5n+SibK7uJNmXol0PFkZ5tpnFsr24svxaM5Ve0IRI9VyFBJVjtooEZX2Oh7D691Mg==
X-Received: by 2002:a17:90a:dc13:: with SMTP id i19mr16458075pjv.194.1618693581766;
        Sat, 17 Apr 2021 14:06:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:21 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 17/50] python3-monotonic: Upgrade 1.5 -> 1.6
Date: Sat, 17 Apr 2021 14:05:26 -0700
Message-Id: <70f8006b1637dd838f20832168d52a95a75e8786.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.6:

- Fix order for converting mach absolute time

Get the source code from the git repository because an archive
is not available in PyPI for this release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 70768130796d5ac7ec049d0b85ff9b037c06d8f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...thon3-monotonic_1.5.bb => python3-monotonic_1.6.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-monotonic_1.5.bb => python3-monotonic_1.6.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
rename to meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index 94b90524b04..080c41e38be 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -1,9 +1,13 @@
 SUMMARY = "This module provides a monotonic() function which returns the value (in fractional seconds) of a clock which never goes backwards."
 HOMEPAGE = "https://github.com/atdt/monotonic"
+SECTION = "devel/python"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
-SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
+SRCREV = "80681f6604e136e513550342f977edb98f5fc5ad"
+SRC_URI = "git://github.com/atdt/monotonic.git"
+
+S = "${WORKDIR}/git"
 
-inherit pypi setuptools3
+inherit setuptools3
-- 
2.17.1

