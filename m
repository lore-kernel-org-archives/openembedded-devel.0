Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.36472.1606592832023241357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vHNQ71jK;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u2so4281261pls.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvzQ+T1BuQiiFX5zLEzLp81FZST8LL5in47ci2jXoJk=;
        b=vHNQ71jK0u4Dmx80nuEkNrI9aZqSI3HFsf0h2qm67K9HpcCjk0QGd42spRyN+EQ0/H
         tLP/k4Sye62JiJNyDvihcqjmg8mbfqpM/j1SgmByc3PkcD4ndRLkH4BsOhEcxwDbGACv
         MlSbZBEDW7OdqKwBb307lAGTd3HZ/fqKNXczJC31usJ4Ykwu9oB/DRwKmELy5HKaTh0t
         yI+zNrJK4YzNQvAdISlkqFBWzXmEXOxRYo/aaaoxUL4yjtM4Rd/Jl8M+ce0IHtyjm28k
         0sZJFBvGAuUCanf8x3hTm/GfFcLqKjCEtmxYt4HtX84YpyDmnf8XK62G2ymI4JLotrxy
         khHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvzQ+T1BuQiiFX5zLEzLp81FZST8LL5in47ci2jXoJk=;
        b=Q4zp0TBQUYMPincNCiN8dfTTwnxyHeUj6p34097wMBwKNXq7C0t/QPhRWcB8JiEDzz
         e3xdUTiMSRCCh5jA7qMdIdqb8TcfrRKuN+we3unYUsQV44ux9MWmDZ9jrvq0xgUU8n/M
         zUJdnFu47wOErVrEZDULa8szaggAtOitOrqhCO5uJkY1mel7YKJFapdgclUObd4CNQyr
         q4XZL7vBVbDVtiLCWaUibMmPkIfG1tn+LGE8fwkS/8QMbxdaNYJf1p/2mzCU65BPAJZ4
         nFR48l0Co/WljKcU4bF6xaVNGC8Pn9mGLXXM5ZPMdMBV4MmgYJN02M50OzcMpPKWPHgE
         MQwA==
X-Gm-Message-State: AOAM533RmVKnD31H2XK3+HYp3y491C1URljy33kYlnEZqfCejMO5rLlc
	2J6YeRvpdw56fF/vvfwmkXK8RcfQg+N6qA==
X-Google-Smtp-Source: ABdhPJxJkQ0pt7onY6QlscheugcFdLXqSGHvvfIMmI+RbLtG+A69FZuUAJBHyPMdvC/D/Di9ZYLGng==
X-Received: by 2002:a17:902:b948:b029:da:877:6b94 with SMTP id h8-20020a170902b948b02900da08776b94mr12064351pls.63.1606592831182;
        Sat, 28 Nov 2020 11:47:11 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:10 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 00/16] Drop python3-pytest and others
Date: Sat, 28 Nov 2020 11:46:40 -0800
Message-Id: <cover.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Once the 2 series for moving python3-pytest and the numpy ptest
dependencies from meta-python are merged to openembedded-core, this
series drops the moved recipes.

The following changes since commit d9874ce27c7a2ff3ed2a3a2e5f6de810f10421ae:

  python3-transitions: Upgrade 0.8.4 -> 0.8.5 (2020-11-27 11:54:04 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/drop-moved-python-modules
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/drop-moved-python-modules

Tim Orling (16):
  python3-atomicwrites: drop (moved to oe-core)
  python3-attrs: drop (moved to oe-core)
  python3-iniconfig: drop (moved to oe-core)
  python3-more-itertools: drop (moved to oe-core)
  python3-pathlib2: drop (moved to oe-core)
  python3-toml: drop (moved to oe-core)
  python3-py: drop (moved to oe-core)
  python3-setuptools-scm: drop (moved to oe-core)
  python3-packaging: drop (moved to oe-core)
  python3-wcwidth: drop (moved to oe-core)
  python3-zipp: drop (moved to oe-core)
  python3-importlib-metadata: drop (moved to oe-core)
  python3-pluggy: drop (moved to oe-core)
  python3-pytest: drop (moved to oe-core)
  python3-hypothesis: drop (moved to oe-core)
  python3-sortedcontainers: drop (moved to oe-core)

 .../python/python3-atomicwrites/run-ptest     |  3 --
 .../python/python3-atomicwrites_1.4.0.bb      | 25 ------------
 .../python/python3-attrs_20.3.0.bb            | 20 ----------
 .../python/python3-hypothesis_5.41.3.bb       | 14 -------
 .../python3-importlib-metadata_2.0.0.bb       | 18 ---------
 .../python/python3-iniconfig_1.1.1.bb         |  9 -----
 .../python/python3-more-itertools/run-ptest   |  3 --
 .../python/python3-more-itertools_8.5.0.bb    | 24 ------------
 .../python/python3-packaging_20.4.bb          | 14 -------
 .../python/python3-pathlib2_2.3.5.bb          | 13 -------
 .../python/python3-pluggy/run-ptest           |  3 --
 .../python/python3-pluggy_0.13.1.bb           | 27 -------------
 .../python/python3-py_1.9.0.bb                | 15 -------
 ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
 .../python/python3-pytest_6.1.2.bb            | 38 ------------------
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 ----------
 .../python/python3-sortedcontainers_2.3.0.bb  |  9 -----
 .../python/python3-toml_0.10.2.bb             | 15 -------
 .../python/python3-wcwidth/run-ptest          |  3 --
 .../python/python3-wcwidth_0.2.5.bb           | 25 ------------
 .../python/python3-zipp_3.4.0.bb              | 19 ---------
 21 files changed, 357 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb

-- 
2.25.0

