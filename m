Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6805C43217
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.1846.1652344921078886699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=3SjeZCcK;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id h16so5521993wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsSgY1TsdFjY6uVLNziGdYimhUSbNhSv5cscNg8hmsM=;
        b=3SjeZCcKZhRMshtS1TSD48gUJWxDG3UUU64jstR8OF/DvUE3z+9lds/SWuupg3+CFJ
         lAff3GGlIqnWULYoC5OYsK0zKIdClSvWDL0dMh5uKroX0S5kMkHcImLrZAdybL20qvtX
         UaZKpOVcDMVWG404dyb0jCCv2PW9nFF3jgNEth0KMNTfcknoRrfxh1hUR9Hgj2Rfl82h
         HvYCRjEHXhpv0Wdjqd44d077cPIWmtQ9s3mbSX+wU7AOrTzJG8sOv3+sgJDYMj2+xvkN
         he700Z6ffj7TZaOGNVyh6MNG9zi4fwJaYCOCg/11+JNLqh6+wJlXqClrmqaCvYZfaFZi
         P87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EsSgY1TsdFjY6uVLNziGdYimhUSbNhSv5cscNg8hmsM=;
        b=HEHMOoDmaGTXMvMJFAJeSjsMB6psf81yI7l5lknymtoSYfJKZLSx/l/fQiVI5AGVK7
         +dSDeyz1+/ralLSZV78S72hOOfPo8P6ifBuUVgEmoFioPVC5HOcbZrzHx9xL95QqaeBW
         ve3N/E8vBvBLv2seF1IVck0+Ph3f/omb7zGRvaZKAMY5L50pNrRlXXUdFn0yLzVVVodJ
         sP6ahJA3qAsYCVgUFnSMut/RFkvehjLJi6EFm927AJs3asR5hejCa/dPjmCm+9HPn/ho
         kZjg/vvCCblXkyB0oAzY1EahRKmFWq9s5zqtvR4Wwhjrn66OPBLMlybDAAlQW/N06M6H
         AVLw==
X-Gm-Message-State: AOAM533o8McWVNxIOPD+R1Q8fWKg3llbW4J2ZPosL3qFoLDB2YxgUWq7
	PFlNazJq93QlpUgfkYcfUbfp5A==
X-Google-Smtp-Source: 
 ABdhPJzA/kH9bqrd8TuhhOPqV3p3E5B7ogpiowFPbgVFcolMGfMMuj7UDqFhCJgrZFkRBJ2jYheVrw==
X-Received: by 2002:adf:ec51:0:b0:20a:cd42:fe3b with SMTP id
 w17-20020adfec51000000b0020acd42fe3bmr26214088wrn.719.1652344919475;
        Thu, 12 May 2022 01:41:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:41:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 00/16] python: add a bunch of packages for
 interacting with ethereum blockchains
Date: Thu, 12 May 2022 10:41:36 +0200
Message-Id: <20220512084152.1388464-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97048

This adds recipes for several python packages allowing to interact with
ethereum. The high-level package that we're adding is python3-web3, the rest
are its direct or indirect dependencies. There's nothing controversial here
other than two packages using a deprecated setuptools-markdown package where
we add local patches to simply not use it.

Bartosz Golaszewski (16):
  python3-toolz: new package
  python3-cytoolz: new package
  python3-decouple: new package
  python3-eth-hash: new package
  python3-eth-typing: new package
  python3-eth-utils: new package
  python3-eth-keys: new package
  python3-eth-keyfile: new package
  python3-hexbytes: new package
  python3-rlp: new package
  python3-eth-rlp: new package
  python3-parsimonious: new package
  python3-eth-abi: new package
  python3-eth-account: new package
  python3-lru-dict: new package
  python3-web3: new package

 .../packagegroups/packagegroup-meta-python.bb | 16 ++++++++
 .../python/python3-cytoolz_0.11.2.bb          | 12 ++++++
 .../python/python3-decouple_3.6.bb            | 16 ++++++++
 .../python/python3-eth-abi_3.0.0.bb           | 18 +++++++++
 .../python/python3-eth-account_0.6.1.bb       | 18 +++++++++
 .../python/python3-eth-hash_0.3.2.bb          |  9 +++++
 ...-setup-don-t-use-setuptools-markdown.patch | 36 ++++++++++++++++++
 .../python/python3-eth-keyfile_0.6.0.bb       | 16 ++++++++
 .../python/python3-eth-keys_0.4.0.bb          | 11 ++++++
 .../python/python3-eth-rlp_0.3.0.bb           | 15 ++++++++
 .../python/python3-eth-typing_3.0.0.bb        |  9 +++++
 ...-setup-don-t-use-setuptools-markdown.patch | 37 +++++++++++++++++++
 .../python/python3-eth-utils_2.0.0.bb         | 16 ++++++++
 .../python/python3-hexbytes_0.2.2.bb          |  9 +++++
 .../python/python3-lru-dict_1.1.7.bb          |  9 +++++
 .../python/python3-parsimonious_0.9.0.bb      | 11 ++++++
 ...-setup-don-t-use-setuptools-markdown.patch | 35 ++++++++++++++++++
 .../python/python3-rlp_3.0.0.bb               | 14 +++++++
 .../python/python3-toolz_0.11.2.bb            | 14 +++++++
 .../python/python3-web3_5.29.0.bb             | 20 ++++++++++
 20 files changed, 341 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-decouple_3.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-abi_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keyfile/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keyfile_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-rlp_0.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-typing_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-rlp_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-web3_5.29.0.bb

-- 
2.34.1


