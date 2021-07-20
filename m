Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.381.1626798676185718286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HPtQErLb;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id p15-20020a05600c358fb0290245467f26a4so2435455wmq.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drJhctrOKgT8CAQEva+iSEKcQdvT1U/RaRdBk0n/cE8=;
        b=HPtQErLbt0CZ8sI+28Bt2nu9s1agjENduBDhUD4owu1IrYBM2BuqjHojwrCqhC9itD
         80QzgosxJmX0HI/svpeJcf1aC0GAB201XyuXFKc7AdErjodabgpg9ctjKJ5hH6qQcerU
         nLL4Mk2zce6380IRryd7m9qmMryilBttf9LpfCdvz4Fu9hAQtcykqFExFCj/GFOhPxWG
         d1929DOC+hLZ1H4spegAWDWKEWnpwbxss5vHqPcYVsBFS1aTDIAviBEX1wcXLQOji/Oz
         LQkhKJJsI5icWBpfqDAHR1N9XIbG0Fy76jvgCFX13YwgHgdyDj91RwImWu93F56zqV2z
         W5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drJhctrOKgT8CAQEva+iSEKcQdvT1U/RaRdBk0n/cE8=;
        b=QfG+AzgZLlPHZLiANuFHgQt/o65KNjGnoXUSL4GVIqtNzGXC639vp7DvYZYe4YXLfO
         ufqiafTCdNYijQekCY+we5l+TVn6cxu5RyPwRYhvc7QOml23eg4lmXLJKGHYL+G/4/hm
         3uqxx52Np0iTaxYl3sM44U2yjZh03mCJNxjXucogHTDYNzObKHSgdhf0ZocjNk7c16Vg
         Zws6nbiZiSY2G4RgrzCSqXCMwhhApOXAY+htfrlDP8A2Qi28glTVQY8qYDAghnkgDdFI
         a49nFATCqeUCT2kOxNvxXicyPq/3GhmAuMJ5il1VkiIyE2qQlTwmDJYMWzrCSRYVsIzp
         OJmw==
X-Gm-Message-State: AOAM5306iuPpY0Mithi9iWAVRXATmOTnhINnr5YYGdk3gLak5O/J7OiI
	44Dkwf6ZpZDXSnGHtxzF90DbkQ==
X-Google-Smtp-Source: ABdhPJxskQlLmcdmn9YoNvKmMZKw0rP+p4rkqmcPex2LT+opWl33PMB2TzOsIbcOq4uDq2+ZTwJjrQ==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr14429048wmb.82.1626798674531;
        Tue, 20 Jul 2021 09:31:14 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:13 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/5] Various fixes for YP compatible
Date: Tue, 20 Jul 2021 18:30:47 +0200
Message-Id: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some pending requests for YP compatible for layers which
depend on meta-oe, meta-python and meta-networking. In dunfell, these
layers do not PASS the yocto-check-layer compatibility script. With
these patches applied, I am able to get this:

INFO: Summary of results:
INFO:
INFO: meta-networking ... PASS
INFO: meta-python ... PASS
INFO: meta-oe ... PASS

Khem Raj (1):
  libdevmapper,lvm2: Do not inherit license

Nicolas Dechesne (4):
  python3-markupsafe: remove recipe
  python3-jinja2: remove recipe
  python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
  ostree: Do not check for meta-python

 .../recipes-devtools/python/python-cython.inc |  0
 .../python/python3-cython_0.29.14.bb          |  0
 .../python/python3-pyparsing_2.4.6.bb         |  0
 .../python/python3-pyyaml_5.3.1.bb            |  0
 .../recipes-extended/ostree/ostree_2020.3.bb  |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |  5 +--
 .../python/python3-jinja2/run-ptest           |  3 --
 .../python/python3-jinja2_2.11.2.bb           | 43 -------------------
 .../python/python3-markupsafe/run-ptest       |  3 --
 .../python/python3-markupsafe_1.1.1.bb        |  2 -
 10 files changed, 3 insertions(+), 55 deletions(-)
 rename {meta-python => meta-oe}/recipes-devtools/python/python-cython.inc (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-cython_0.29.14.bb (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyparsing_2.4.6.bb (100%)
 rename {meta-python => meta-oe}/recipes-devtools/python/python3-pyyaml_5.3.1.bb (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb

-- 
2.29.2

