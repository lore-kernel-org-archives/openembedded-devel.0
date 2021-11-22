Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C58C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 01:18:24 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.843.1637543904097633942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Nov 2021 17:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ef3D/dDM;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso15525467pji.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Nov 2021 17:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1QL4WnRw2ozOsDYR5usjLQc4Ke8yy7PUFQkRR8o1ts=;
        b=ef3D/dDMc1Z4upsxaRYlpsMTHzIabK7ViouXG2A0OK5PCDul3+mQqtnr5uviu9QsG7
         GEiBPH+5/wdp1/8ihdEHyNdUyUC++fZdSo/0pUpCXu12Mkpgl5ucQPSiTlwmcPdGQH1H
         sJZB7+bMbTTek9SZcjbMmO1t7B3nYviQCvj4XGhXYg6qcrhE0QUqD7EzhdGot3JuvXPm
         du6hv0g+5bkyBE8U1C0QFSnr5wj79zdl7cDtv3+hWB3XaGXx9lxvpTWrGAxmIHA2n/ks
         yGcghuZfwYCp2cIK3kdsFZ4/O3PgVaaXhQn+o0J6QPiDMe2tsluDnIZ5/P/5+sxxq/a9
         AY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j1QL4WnRw2ozOsDYR5usjLQc4Ke8yy7PUFQkRR8o1ts=;
        b=3l29VFtJkV3uiTO/8kOema+F4jIRIGuKWxdW8Qz2e1EIf8tzQhBi30nrIgssLBS90v
         qRnJUYKZVoSKgnxWXPQ+IAIQcx8M9btTA0v5WiWw9UCIv8igkjfbix6xueLs1NjMLKf4
         WLfSTg3Ic2agv8dJn4sfEb0OAWnMuH3D4G1k2wObycLHs881qMxTeM3ukAgwN9PfEA4X
         K23r4tpayKHRl7HIbetvjx+P/Y9HjCKcfp1u80vVi/s5vLjMsXPZKchVDHeq7t/8v0KB
         dhitM45HMOsqroXW75KLs0xZLZwtQlw98u/GyT7Smd8tCnuK9fSF5puTHGkqEdWzmbpR
         FIPA==
X-Gm-Message-State: AOAM531O7nbf5Ln5zLWb1HUEjCroE2IYJu+ysMnlAA/Igt9zP6T4DPJy
	+ej+W2R0/s5aue759BoGZ5hF6aBM8KI=
X-Google-Smtp-Source: 
 ABdhPJzoG+05Tvcplp02m6/+exbehL8WWgOjyixdF9CGpnW84ne0fjvpG+fCvEq2hwJGx2JP3NxODA==
X-Received: by 2002:a17:90b:38c9:: with SMTP id
 nn9mr25900946pjb.241.1637543903462;
        Sun, 21 Nov 2021 17:18:23 -0800 (PST)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com.
 [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id
 j17sm4376911pgh.85.2021.11.21.17.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 17:18:23 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-aiosignal,
 python3-frozenlist: Add native & nativestdk package support
Date: Sun, 21 Nov 2021 17:18:19 -0800
Message-Id: <20211122011819.554221-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 01:18:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94088

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add 'BBCLASSEXTEND = "native nativesdk"' to python3-aiosignal and it's RDEPENDS
python3-frozenlist.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-aiosignal_1.2.0.bb | 2 ++
 .../recipes-devtools/python/python3-frozenlist_1.2.0.bb        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiosignal_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiosignal_1.2.0.bb
index 601ac8f45..efd94f793 100644
--- a/meta-python/recipes-devtools/python/python3-aiosignal_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiosignal_1.2.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "78ed67db6c7b7ced4f98e495e572106d5c432a93e1ddd1bf475e1dc05f
 
 inherit pypi setuptools3
 
+BBCLASSEXTEND = "native nativesdk"
+
 RDEPENDS:${PN} = "\
 	${PYTHON_PN}-frozenlist \
 "
diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb
index b56e2e5e6..e8359418b 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb
@@ -6,3 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 SRC_URI[sha256sum] = "68201be60ac56aff972dc18085800b6ee07973c49103a8aba669dee3d71079de"
 
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.30.2


