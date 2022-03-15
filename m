Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF6FC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 16:10:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.12800.1647360605005452948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tv+5jN03;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id a5so20467018pfv.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSqsE4jk8XWkIFVOBwZzAlItnMwaU2a6CEyPXjuqGFo=;
        b=Tv+5jN03bRntCFq1GEjJwnr75o80eOd+8A2mTTA5Jq//N5i2Kw5wCflUyw2K1Ju3ug
         6Z4oyiW9P8YY+W62B0+m2ct7KE9nMkokfz/N9Cp0wJJk0M2PEGv7E3r0sH8IjL40W3l6
         VzxE6Lr1R1IouYXaza/VlkSQLayGlX6cOVRkzSnKzgJtmEn6dgFGjHhlzUd2zHTHfct6
         Gozo9EVzQGbl2HCK1DX0+TL81H5V/1w4om1HNVTLgqkGvLd8o8L1R0LT7R56XkPphh1c
         7R/lEP886+fjt6AR0+HBRbOaNx/Kr2DFykVas+jZnNABZzXIDmtBawwdmh2NgOUEKvh0
         QDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSqsE4jk8XWkIFVOBwZzAlItnMwaU2a6CEyPXjuqGFo=;
        b=Z8qHBSb+JDmbfKLW0osP1Bj4rVUPpqzO+49j2mHHWmUs6d8aPrlkNinAZTeRZf16WV
         dxIqAPMMWL69/Fo36fH4YbAJAzkU92CcKP02qxvuUW6i71zpxZZbCYg8wMae4nAq7TJA
         2yOuK7WsS+liQaWG9db2CEeJ1PKyMYg8IKdRRcVvnS6dUSBnE8x+7RIThGkVvvsamfKG
         1P4dfJ5tN0yeHMo8sV0aBx0HDBSx+Xj8S/iJ5/YZy1QC4k6haL2Gk0OVSp/M52HQLusa
         z/rRIwmedirbfBMbEwA5aMecGqcAHN9WZiIYC9mxOqtFHNsPPDeSyrzFbCSTA0XFZdMO
         T04w==
X-Gm-Message-State: AOAM5315Hl4Fu2glXfm6RYnS59/mii91RdgdTgAG/xwNcJVx6DPH7l13
	bQqxxR5LIGKrR9Rhlsp5xIKeQSGdZSA=
X-Google-Smtp-Source: 
 ABdhPJytCd5f9NcgL1v6dwNUCDvTnIt48pn1/WMwn5Mpr6PKSf22oDg2GQVcdaKDSxvUieu8qK9mVg==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id
 q16-20020a056a00089000b004f6686ea8a9mr29007330pfj.83.1647360603840;
        Tue, 15 Mar 2022 09:10:03 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 j64-20020a638b43000000b0038178751c87sm1100349pge.92.2022.03.15.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:10:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: drop recipes moved to
 core
Date: Tue, 15 Mar 2022 09:09:55 -0700
Message-Id: <20220315160955.1513366-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 16:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96000

Drop the recipes moved to core in the python3-cryptography move.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 66a11d2dd9..5fa9b9f832 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -33,7 +33,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-argh \
     python3-arpeggio \
     python3-asciitree \
-    python3-asn1crypto \
     python3-aspectlib \
     python3-astor \
     python3-astroid \
@@ -47,7 +46,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-babel \
     python3-backcall \
     python3-bandit \
-    python3-bcrypt \
     python3-beautifulsoup4 \
     python3-behave \
     python3-betamax \
@@ -67,7 +65,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-cchardet \
     python3-cerberus \
     python3-certifi \
-    python3-cffi \
     python3-chardet \
     python3-charset-normalizer \
     python3-cheetah \
@@ -88,8 +85,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-cppy \
     python3-crcmod \
     python3-croniter \
-    python3-cryptography \
-    python3-cryptography-vectors \
     python3-cson \
     python3-custom-inherit \
     python3-cvxopt \
@@ -191,7 +186,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-ipython \
     python3-ipython-genutils \
     python3-iso3166 \
-    python3-iso8601 \
     python3-isodate \
     python3-isort \
     python3-itsdangerous \
@@ -277,22 +271,18 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pint \
     python3-pkcs11 \
     python3-pkgconfig \
-    python3-ply \
-    python3-poetry-core \
     python3-pocketsphinx \
     python3-polyline \
     python3-portalocker \
     python3-posix-ipc \
     python3-prctl \
     python3-precise-runner \
-    python3-pretend \
     python3-prettytable \
     python3-priority \
     python3-process-tests \
     python3-progress \
     python3-prompt-toolkit \
     python3-protobuf \
-    python3-psutil \
     python3-ptyprocess \
     python3-pulsectl \
     python3-py-cpuinfo \
@@ -309,7 +299,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pycocotools \
     python3-pycodestyle \
     python3-pyconnman \
-    python3-pycparser \
     python3-pycurl \
     python3-pydbus \
     python3-pydbus-manager \
@@ -354,7 +343,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-html \
     python3-pytest-metadata \
     python3-pytest-runner \
-    python3-pytest-subtests \
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
@@ -362,7 +350,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-python-vlc \
     python3-pytoml \
     python3-pytun \
-    python3-pytz \
     python3-pytz-deprecation-shim \
     python3-pyudev \
     python3-pyusb \
@@ -391,7 +378,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-scrypt \
     python3-sdnotify \
     python3-semver \
-    python3-semantic-version \
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
@@ -439,7 +425,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-txws \
     python3-typed-ast \
     python3-typeguard \
-    python3-typing-extensions \
     python3-tzlocal \
     python3-u-msgpack-python \
     python3-ujson \
@@ -478,18 +463,15 @@ RDEPENDS:packagegroup-meta-python3 = "\
 RDEPENDS:packagegroup-meta-python3:remove:libc-musl:powerpc64le = "python3-grpcio python3-grpcio-tools"
 
 RDEPENDS:packagegroup-meta-python3-ptest = "\
-    python3-cryptography-ptest \
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
     python3-ansicolors-ptest \
     python3-appdirs-ptest \
-    python3-bcrypt-ptest \
     python3-betamax-ptest \
     python3-blinker-ptest \
     python3-cachetools-ptest \
     python3-cbor2-ptest \
     python3-click-ptest \
-    python3-cryptography-ptest \
     python3-dnspython-ptest \
     python3-dominate-ptest \
     python3-geojson-ptest \
@@ -519,7 +501,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
     python3-pytoml-ptest \
-    python3-pytz-ptest \
     python3-requests-file-ptest \
     python3-requests-toolbelt-ptest \
     python3-scrypt-ptest \
-- 
2.30.2


