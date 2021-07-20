Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.383.1626798679299572693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hu1ovWQP;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso1859489wme.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=htJRfpThI0SsEqQvXVih/cCr+f+R6D+sVhstDn+LVgM=;
        b=hu1ovWQP6GneZxrG0AI3nSUTA4yBJ0eBMPM9QWShOUc9ghcVjml7oPFmYEgvts77Ox
         J08aMTu4vUXI6ri8iVs7HzZ7zFdUdOXXYDWSDp9Fq2GEq2KM9Cs/Qq9wwArP9sI3XCO9
         7njPWy69nUTB0ykfjY4APAadiVR4KseA3OmJmni1h6tJLflZ/Stt/DpcRFYMufvWBLAS
         XAnKiJpNByLQpXP3speN9+DNfi7sBNeThoPbyPLkm6Z0c0TGOcxJ9QfYzCZ82g9zHMAd
         CdkooMTPJtYfKwzAs6RSBg5dzo4BB5MZocI6+Dyrmp6jWxErsOeyKQAtwGaOAFWD+iW5
         v2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=htJRfpThI0SsEqQvXVih/cCr+f+R6D+sVhstDn+LVgM=;
        b=o2sCNnIhhZ/tww7vcXyN2t9BYU69kkJZvrRzLJSOm/Wx267jE49LfpM6uKABpEdJG0
         HUNYuw4m7XOhlQwle5jQPQL46r7ClTiq52Zr5KpBvqJnEWOtKzH89iMVf2yJ6Ldax52K
         vTAATSDI9MX6Ae0tj3E/xsb3bkq/QJ3pzKPJpXYQNjdFE+MZhtrGoM3tsLxLhsegxKXC
         Rz9/aTJgPByiC0UXDJ84LlPoegJiNwKLNPYDxD49zie4EKU1J8JMsODCkX0xcGB3h4By
         ctpkvCWKEGJOBFeGtujQRQZjPMDQs5D9yGgRLc6t1ABmi5yvh7SqzHhjiT56dU7ni8DK
         RhwA==
X-Gm-Message-State: AOAM532GmroW2NPBy2cVjHYUKEk2CML8KTdkN/YPcpfR5vNl7qmHc0EI
	U69oI5joYr3vmc23Py5pv88Qmw==
X-Google-Smtp-Source: ABdhPJw6b1xy6dtjgXX5h6zqf8gdA1xTTW/80om1YL4Y7B/DiNbO7bnN6eMCKqDPIsVJb42f3XKmYQ==
X-Received: by 2002:a05:600c:1d11:: with SMTP id l17mr33089961wms.169.1626798677730;
        Tue, 20 Jul 2021 09:31:17 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:16 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 4/5] python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
Date: Tue, 20 Jul 2021 18:30:51 +0200
Message-Id: <20210720163052.11295-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This specific statement in ostree recipe breaks the YP compatible
status (yocto-check-layer):

RDEPENDS_${PN}-ptest += " \
    ...
    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python',    'python3-pyyaml', '', d)} \
    ...
"

Recently python3-pyyaml was moved to OE-core (0a8600f9cec0), and the
ostree recipe was fixed with:
b9ede0cb182a (python3-pyyaml: Do not check for meta-python)

In dunfell, moving python3-pyyaml to OE-core is not a great idea, but
moving it from meta-python to meta-oe allows us to fix ostree YP
compatible issue. Since meta-python depends on meta-oe, it should not
be a change with any visible effect.

python3-cython and python3-pyparsing are collateral damages since they are
dependency for python3-pyyaml, so needed to be moved too.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../recipes-devtools/python/python-cython.inc                     | 0
 .../recipes-devtools/python/python3-cython_0.29.14.bb             | 0
 .../recipes-devtools/python/python3-pyparsing_2.4.6.bb            | 0
 .../recipes-devtools/python/python3-pyyaml_5.3.1.bb               | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-python => meta-oe}/recipes-devtools/python/python-cython.inc (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-cython_0.29.14.bb (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyparsing_2.4.6.bb (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyyaml_5.3.1.bb (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-oe/recipes-devtools/python/python-cython.inc
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython.inc
rename to meta-oe/recipes-devtools/python/python-cython.inc
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.29.14.bb b/meta-oe/recipes-devtools/python/python3-cython_0.29.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.29.14.bb
rename to meta-oe/recipes-devtools/python/python3-cython_0.29.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb b/meta-oe/recipes-devtools/python/python3-pyparsing_2.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyparsing_2.4.6.bb
rename to meta-oe/recipes-devtools/python/python3-pyparsing_2.4.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb b/meta-oe/recipes-devtools/python/python3-pyyaml_5.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
rename to meta-oe/recipes-devtools/python/python3-pyyaml_5.3.1.bb
-- 
2.29.2

