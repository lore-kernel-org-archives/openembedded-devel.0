Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297A2C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.17976.1635592564101466832
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FaegfAjt;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id x66so11674520pfx.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fd7sZL1cwrnTGWzABMVX5l15wqyPyW8d7zHxZ/j/PGg=;
        b=FaegfAjtll00h8/pIX/bKKaJi5BdjaO0vUFsjz9HTJjuhBdTSXDGrJq+NlUXDIGYmf
         GKonb9idv8epcXAhmm0/aZ2yAd80A82RCV7SMuGnVTC81Nh5uDiHNttO4ICeUtRh63jc
         OoePMeRaX2thdraBuGoSc8ESHyhyTdYVD65Jko5ByWqJoaur3+UO56hmhXQ2zQulxJI2
         VhGXZ2hvQI1wJPKbe+YLouUOv7vwueO9VGgw19pH2hL8vw28fFVQRQdRi8w/WlDMAVVf
         5rWUCCfeJPACx6Su54S8PR9yHin7KV7C1xin/GRwfEKtNQ7dy47snajcUHh8PjckNtZZ
         p7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fd7sZL1cwrnTGWzABMVX5l15wqyPyW8d7zHxZ/j/PGg=;
        b=X9+eEq9SdHgcB1HnTOzNlrme+OseW5ZaaHsnCVaHKYBaEaUgZeoSyhkcgqRvW3idP2
         IPqS4BD8gdNFGEKsULEnWSto3+hoQLs5KrzPzrK5HBd+O3gQlBU1MqJDnYYWHulGMttw
         1Pq8+vNWBHmXBHoq6fTYDFOeWjXUDtoGWzAX4ANVSnhbFHrqfmuVeQ3PmNcPAdtkJLqb
         gAzCKPQR7fyqPGtwm5sHX/hayuVed+V+1MG1uqyz1u33Cwktx7QDvbsVwL9FnEWPKe/z
         c7GOiPo7cfvB3vNeU3JiGIwAsrHX30JFsJx7N2RID0SRl4glpZhslDOfFkAxhNfc8WYs
         ISFg==
X-Gm-Message-State: AOAM5313CKjP4iFPeczKntVX+i7tgMI47Z+OItzd1jyORJcAFn7+iOui
	7HRDxkxk7Re5tt+MbZ+t7ifojAVWnuI=
X-Google-Smtp-Source: 
 ABdhPJzXxItODIl7l3lkAtAhKabXiiofpk6u6f6gzcF1HtLbB2CUio/8d+DlqyYwR7qWZaAXjw4pwQ==
X-Received: by 2002:a63:7247:: with SMTP id c7mr12442751pgn.365.1635592563401;
        Sat, 30 Oct 2021 04:16:03 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 05/14] python3-behave: Switch to using github src_uri
Date: Sat, 30 Oct 2021 04:15:42 -0700
Message-Id: 
 <4b3a6bec0c9b4eb870a1cd7df7e07f67f9b31f1c.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93662

From: Khem Raj <raj.khem@gmail.com>

1.2.6 release does not have fixes to work with setuptools 0.58+
the patches are part of github 1.2.7 pre-release, until the release
comes out switch to using github

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 55534f9d10210120d47ad18526fadf77a752a83c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-behave_1.2.6.bb      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 04e24a607f..89bf29fd7a 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "https://github.com/behave/behave"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
 
-SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
-SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
+PV .= "+git${SRCREV}"
+SRCREV = "9520119376046aeff73804b5f1ea05d87a63f370"
+SRC_URI += "git://github.com/behave/behave;branch=master"
 
-inherit pypi setuptools3
+S = "${WORKDIR}/git"
+
+inherit setuptools3
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-parse-type \
-- 
2.25.1


