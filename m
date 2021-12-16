Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339F7C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.11861.1639668207873140672
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=faPb5C/5;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id l10so12383289pgm.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUukufRTgtcfmhRlNU2SJbi76/z3UfQrZyuUA8ogDlE=;
        b=faPb5C/5Imjh4E6+72iTzrwT4ekuDVsYg7pkOg1HEq+ma5+2JIXeLC2ErFN2kd/Lco
         Y3dzQaBdX6QzjWFjvkd16ieRXN4Dzp+MZmn4V1JAUaLSt26eTmiIEUsMurBI78Y/wslR
         jBFSzqwbygkMjefzeM1iuBCcELng1ES707/K2A0RBp6/dUXs5fxHJhmOkf8Dmp7TYRBk
         JjCCTS7JuSuGi5Dz34sO1dbpahg9uahrkNFBOoB1buvCbpdsbGYolITV3Vdw6+a9c/H2
         xsufBFc8AH9rOAIEijpyvSZgfAb9/OGKDilk6x/fJOePMHuKVQ48fpCBrMG9QgmnaBFx
         uTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUukufRTgtcfmhRlNU2SJbi76/z3UfQrZyuUA8ogDlE=;
        b=sJMv53Mgsp4gSu/8ud/A1XO+dNQ9GlO7gjBGsD+nQiAaadnYdnUa+KY0++TSMirec6
         RpdV1PZZSdxYFxHemrvT2PpEDuY9GiG5X/AkMkvWi4Y9CJD0YqLJjCYvhKIJ+TqmIC1R
         RiTxzHi573GIMdLJLlzGCyh35gMqlzvz8FQB3VhPJ6wO7KUTzeJKRvHZG9wgpYCN70a2
         nbAe/9C8ZJq1R1zEvMwwozrnf/lDGGDA9yS7c9Lx3g4gh3W280O+5to7vVVg9MsdJqUP
         B94yX3EOQk9+tQgHV0QB1bgVQoVOQSkpeJN+GJA/bSBgDu/Kh4bpqVqzvJK1v1WlN7QO
         tXxQ==
X-Gm-Message-State: AOAM532hKgsGkLI1aVQ5qwrLohYipL/f44L4RZzYfASH5C2n9pUwPfX0
	VMhwg9cDcgjjbxyrhOrN0+3Jt9JFeEY=
X-Google-Smtp-Source: 
 ABdhPJwQDfL/m6bqD/8LIkix3h2jjV9EzP7DaUCtOVOYz7P2tnRtIshmJyx+1GVobkPWsQb1G0kyIg==
X-Received: by 2002:a05:6a00:2349:b0:4a8:d87:e8ad with SMTP id
 j9-20020a056a00234900b004a80d87e8admr14354112pfj.15.1639668207002;
        Thu, 16 Dec 2021 07:23:27 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 00/18] Patch review Dec 16th
Date: Thu, 16 Dec 2021 07:23:05 -0800
Message-Id: <cover.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94385

Please have comments back by Saturday.

The following changes since commit f632403d1800363ac63a1ad5543278b82c659832:

  ifenslave: switch from master to main (2021-11-30 14:27:58 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/honister-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/honister-nut

Luca Boccassi (1):
  lvm2: do not install systemd units/initscripts when building native
    SDK tools

Oleksandr Kravchuk (1):
  fb-test: fix SRC_URI

Ross Burton (15):
  imlib2: clarify license
  xmlrpc-c: set precise BSD license
  dash: set precise BSD license
  sg3-utils: set precise BSD license
  nodejs: set precise BSD license
  libkcapi: set precise BSD license
  pcsc-lite: set precise BSD license
  python3-cryptography: set precise BSD license
  python3-crypto-vectors: set precise BSD license
  python3-gevent: use system libraries instead of embedding
  python3-gevent: update license
  python3-lxml: set precise BSD license
  python3-posix-ipc: set precise BSD license
  python3-posix-ipc: remove spurious dependencies
  python3-pyzmq: set precise BSD license

Sean Nyekjaer (1):
  msgpack-cpp: fix msgpack-cpp is a header only library

 .../recipes-crypto/libkcapi/libkcapi_1.2.1.bb |  2 +-
 .../msgpack/msgpack-cpp_4.0.2.bb              |  2 ++
 .../recipes-devtools/nodejs/nodejs_14.17.1.bb |  2 +-
 .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  2 +-
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb |  2 +-
 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb  |  2 +-
 meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb  | 17 ++++++-----
 .../pcsc-lite/pcsc-lite_1.9.0.bb              | 12 ++++----
 .../sg3-utils/sg3-utils_1.45.bb               |  2 +-
 .../{fb-test_git.bb => fb-test_1.1.0.bb}      |  4 +--
 .../python/python-gevent/libev-conf.patch     | 26 -----------------
 .../python3-cryptography-vectors_3.4.8.bb     |  6 ++--
 .../python/python3-cryptography_3.3.2.bb      |  6 ++--
 .../python/python3-gevent_21.8.0.bb           | 29 +++++++------------
 .../python/python3-lxml_4.6.3.bb              |  4 +--
 .../python/python3-posix-ipc_1.0.5.bb         | 12 +-------
 .../python/python3-pyzmq_22.3.0.bb            |  2 +-
 17 files changed, 47 insertions(+), 85 deletions(-)
 rename meta-oe/recipes-test/fbtest/{fb-test_git.bb => fb-test_1.1.0.bb} (82%)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent/libev-conf.patch

-- 
2.25.1


