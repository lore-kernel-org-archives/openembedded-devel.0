Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A36EEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7390.1687180941223568130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=OaNKrWZS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30af56f5f52so2562715f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180939; x=1689772939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vM1qxC4mXJ8P2q9tugEen7gEjw0++Ak50sCpm8M08Og=;
        b=OaNKrWZSUP1Fjj0+bNmVZfQ+Ftrt5Ugsy9EAyC+ObhHpOj4MWmnZVCOnshfE6E70qf
         qj/hEcPU+lpD7n+0Uk5cVIxrcUlgq6AZkCq3jCXh6JRJMZ1dTwboNSK5v91dwe26H1Gm
         aQLvs5aFTyiBDS0aJJx2qF5RSEPiyg42o8J/QkAKAcHrY5WVZ8ITClgDIQ/gRxZB3hKg
         Nj8BKx1FiH71WF6n8G/Fghmwu8Nu/4lEmQInE6a0+f05Y+E2KCJfYxPscehOgblb3Ua/
         ffALnzk//X+p7wha94b9qy4gd07IH4+u5twFqBd9++IYJA8sBiskbGUk5YVjNbpQd+s9
         u+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180939; x=1689772939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM1qxC4mXJ8P2q9tugEen7gEjw0++Ak50sCpm8M08Og=;
        b=Mkl2Bb8eRy5SalgzfLA8h8xtpCbtdcm/vmY8i7Wu6QXyavpTcewI0z1RzcbGH6gH1G
         mOs9YKIIs6VHkE/TDRq7byrtQ4tgB3FE9ihjz8gGDiuF3c1lg/OpvvK0t0K+M0MMXf71
         0BqC4pTcUlax6FhsSU2SaK9Q7eCnE44XsXMdoF8ZcO+T2aCiUTyMNPMWKluMZ2b3hFdg
         HouX9ooHpkX/ED8e3KIfYmoZubUNczNIU0LKWeJZ1iGXGOnt/KSrfIOaBdCrlQRN+SXR
         ZtL1U9/9ZXNzUcE7tHU61xks6S/Oaxjtr2iZibKTJcdNx3hbh2dOL2iupVHdm7LG1+ab
         YwDA==
X-Gm-Message-State: AC+VfDyKMhGnEv2Om6qVQaqvrTAt2Feub6YcrotrMzLYHL/HDEukGDVG
	fXfRgpwM/UYtYzlMNqUyUAHiIg==
X-Google-Smtp-Source: ACHHUZ7eJ/QdzQZrX9VF2+1xJELJ0SQ7JRKTZAIyrsMU45pTMG4rvpKTOFlbgFTHlNwU/kbX9ca5mQ==
X-Received: by 2002:adf:fd02:0:b0:311:1b84:c493 with SMTP id e2-20020adffd02000000b003111b84c493mr7139062wrr.41.1687180939064;
        Mon, 19 Jun 2023 06:22:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 00/54] python3: improve run-time dependencies situation
Date: Mon, 19 Jun 2023 15:21:20 +0200
Message-Id: <20230619132214.213417-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103384

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I noticed that these patches never made their way into master. Looks
like my mailer borked when sending the series last time and this shows
up as a separate thread on the list.

So I'm resending the remaining patches now.

Bartosz Golaszewski (54):
  python3-pywbem: drop unneeded class from RDEPENDS
  python3-pywbem: don't use PYTHON_PN
  python3-pywbem: order RDEPENDS alphabetically
  python3-pywbem: add missing run-time dependencies
  python3-padatious: add missing run-time dependencies
  python3-pako: add missing run-time dependencies
  python3-paramiko: stop using PYTHON_PN
  python3-paramiko: add missing run-time dependencies
  python3-path: fix coding style
  python3-path: add missing run-time dependencies
  python3-ecdsa: don't install tests
  python3-et-xmlfile: fix coding style
  python3-et-xmlfile: add missing run-time dependencies
  python3-flask-user: fix coding style
  python3-flask-user: add missing run-time dependencies
  python3-isort: fix coding style
  python3-isort: add missing run-time dependencies
  python3-isodate: stop using PYTHON_PN
  python3-isodate: add missing run-time dependencies
  python-idna-ssl: add missing run-time dependencies
  python3-hpack: add missing run-time dependencies
  python3-h11: add missing run-time dependencies
  python3-gsocketpool: drop unneeded DEPENDS
  python3-gsocketpool: stop using PYTHON_PN
  python3-gsocketpool: add missing run-time dependencies
  python3-flask-mail: stop using PYTHON_PN
  python3-flask-mail: add missing run-time dependencies
  python3-flask-sijax: stop using PYTHON_PN
  python3-flask-sijax: add missing run-time dependencies
  python3-flask-script: remove recipe
  python3-aioserial: fix coding style
  python3-aioserial: add missing run-time dependencies
  python3-aspectlib: add missing run-time dependencies
  python3-asyncio-throttle: add missing run-time dependencies
  python3-attrdict3: add missing run-time dependencies
  python3-betamax: add missing run-time dependencies
  python3-binwalk: add missing run-time dependencies
  python3-can: fix coding style
  python3-can: add missing run-time dependencies
  python3-click-spinner: add missing run-time dependencies
  python3-colorlog: add missing run-time dependencies
  python3-colorzero: add missing run-time dependencies
  python3-configobj: fix coding style
  python3-configobj: add missing run-time dependencies
  python3-configshell-fb: add missing run-time dependencies
  python3-coverage: fix coding style and RDEPENDS
  python3-custom-inherit: add missing run-time dependencies
  python3-dateparser: fix coding style
  python3-dateparser: add missing run-time dependencies
  python3-tzlocal: fix coding style
  python3-tzlocal: add missing run-time dependencies
  python3-dbus-next: add missing run-time dependencies
  python3-defusedxml: add missing run-time dependencies
  python3-setuptools-scm-git-archive: add missing run-time dependencies

 .../python3-gsocketpool_0.1.6.bb              |  7 +++-
 .../python-hpack/python3-hpack_4.0.0.bb       |  2 +
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python-flask-script.inc            | 12 ------
 .../python/python-flask-sijax.inc             |  6 ++-
 .../python/python-idna-ssl.inc                |  5 +++
 .../python/python3-aioserial_1.3.1.bb         |  6 +--
 .../python/python3-aspectlib_2.0.0.bb         |  5 ++-
 .../python/python3-asyncio-throttle_1.0.2.bb  |  2 +
 .../python/python3-betamax_0.8.1.bb           |  6 ++-
 .../python/python3-binwalk_2.3.3.bb           |  8 +++-
 .../python/python3-can_4.2.1.bb               | 28 +++++++-------
 .../python/python3-click-spinner_0.1.10.bb    |  2 +
 .../python/python3-colorlog_6.7.0.bb          |  2 +
 .../python/python3-colorzero_2.0.bb           |  5 ++-
 .../python/python3-configobj_5.0.8.bb         |  5 ++-
 .../python/python3-configshell-fb_1.1.29.bb   |  7 +++-
 .../python/python3-coverage_7.2.7.bb          | 19 +++++-----
 .../python/python3-custom-inherit_2.3.1.bb    |  5 +++
 .../python/python3-dateparser_1.1.8.bb        | 11 ++++--
 .../python/python3-dbus-next_0.2.3.bb         |  5 +++
 .../python/python3-defusedxml_0.7.1.bb        |  2 +
 .../python/python3-ecdsa_0.18.0.bb            |  4 ++
 .../python/python3-et-xmlfile_1.1.0.bb        |  8 +++-
 .../python/python3-flask-mail_0.9.1.bb        |  5 ++-
 .../python/python3-flask-script_2.0.6.bb      |  2 -
 .../python/python3-flask-user_0.6.19.bb       | 13 +++++--
 .../python/python3-h11_0.14.0.bb              |  2 +
 .../python/python3-isodate_0.6.1.bb           |  3 +-
 .../python/python3-isort_5.12.0.bb            | 16 ++++----
 .../python/python3-padatious_0.4.8.bb         |  8 ++++
 .../python/python3-pako_0.3.1.bb              |  7 ++++
 .../python/python3-paramiko_3.2.0.bb          | 11 +++---
 .../python/python3-path_16.6.0.bb             | 12 ++++--
 .../python3-setuptools-scm-git-archive_1.1.bb |  1 +
 .../python/python3-tzlocal_5.0.1.bb           |  7 ++--
 .../python3-attrdict3_2.0.2.bb                |  2 +
 .../pywbem/python3-pywbem_1.6.1.bb            | 38 ++++++++++---------
 38 files changed, 191 insertions(+), 99 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

-- 
2.39.2


