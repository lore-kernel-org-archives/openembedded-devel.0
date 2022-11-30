Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBD7C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.22651.1669838478317110142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N0Z9XWW4;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3020396pje.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Pqx8U64QTdtyINL9HI0HHJm2S/1gkZnv9wSY8XjN4=;
        b=N0Z9XWW4QdVtM5wSHW1mjvlIlTXIQzguwVSoUR2ure+0Cq7gA3h5Nxn8L0mIzyrc7l
         hC3UWPrsau5CobKrQzJvils2u2epfNPOB4CCgBtwAjAdnu++WidGT2o+v2MxrJpuTRwc
         gqXNBDQn7yTa6jGSFJG/qm7NjP11QYFZ7KZT/Vp0OYE3KeoZgvybJJF/U3qhHsRHxe8Q
         +MXT/VGCLxLOo5Jd/Nm4QnI0rdKbLJhgVcHk5VgSKaY+n76XPKx4XaBGH/77uA9eJamK
         sTc/K0YJTsP7v1y/fUviy8ETzxSYcqkAqXBFNiL9iLRZ3eyZtxoSySn3iSZ3iznc6+7Q
         nLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6Pqx8U64QTdtyINL9HI0HHJm2S/1gkZnv9wSY8XjN4=;
        b=7dWFdTlTEMglRLwP2O2CsApf3Q7cTr7vzfyU42diBw7qpuJ0waVyOqH1YKE8yRGlEr
         LroISPaXkH8H04t+HW2cJ37BqHrMWefOrRJ33NZtuNjxGKW4TccS++Gv80stc/DzduRC
         XCKdhxUuZ36RkhHwkMzlXRpwZGOFrXmrSHoe2g0KO7F7IwMYk8kSiUxDaHduTLGTnWUJ
         /c8ZSHGgrbzkB0Icho/J062NEp0kvAO+2Pw0zwfhTj/MZC78+8EJQ0oKluhYhCYw2W0d
         BWTXG5kv5ttSe4LAYIml5do5LPAnt6pBpd4FCwYbzFijiFYGcKrNLOYN70dFyzAleCgU
         kD8g==
X-Gm-Message-State: ANoB5pmAwPDaHNdkoKoTcdWeca3CXeYSX58PR3imiyBj2T/oJzYbjtuc
	e4i5OcVAA96AYMeREqDg5UkeuW4KIjY=
X-Google-Smtp-Source: AA0mqf4DPC7V1KsKTdhyevCQDi9li7mB5VDXZxIib4+GTENT9S9z7xTesf8wLKidWjBpGSOvjzG1rA==
X-Received: by 2002:a17:90a:d157:b0:211:710e:7d03 with SMTP id t23-20020a17090ad15700b00211710e7d03mr59762584pjw.56.1669838477467;
        Wed, 30 Nov 2022 12:01:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/7] python3-pystemd: Regenerate .c sources using newer cython
Date: Wed, 30 Nov 2022 12:01:09 -0800
Message-Id: <20221130200115.1954308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99871

python 3.11 has moved the header "longintrepr.h" into a sub-folder [1]
the pre-generated .c files are generated using older cython, therefore
in order to compile it with python 3.11 regenerate them with OE's own
native cython

[1] https://bugs.python.org/issue35134

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pystemd_0.10.0.bb       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
index da263fe94e..da22a43deb 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
@@ -4,10 +4,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI[sha256sum] = "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e29ec811fa2ae859"
 
-DEPENDS = "systemd"
+DEPENDS = "systemd python3-cython-native"
 RDEPENDS:${PN} += "python3-xml python3-pprint"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit pypi setuptools3 features_check pkgconfig
 
+do_configure:prepend() {
+    rm -rf ${S}/pystemd/*.c
+}
+
 BBCLASSEXTEND = "native"
-- 
2.38.1


