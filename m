Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF5BC001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.162.1687531173584622928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Cf5uj2im;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fa71e253f2so18342335e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531172; x=1690123172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4gKNMlj2nf95NwIbJPJbn3bOCO4aOD67h1OA/0fVVY=;
        b=Cf5uj2im+6nlodnya0fZzfOPvqWtDp12EL1GNbsDsHbnJsWlAbAdL6y90JD8UnaWkB
         aCsmMQzmUjqvrwLyj14Z0swI+Z0W75fYuvw1cdHZLjusGyGtMfuTp8ExuEDu0KNbATi1
         272QhzEZtcO9JLwGO+BT3t1NzLERuEClSmfBpI3RANFd+73L6lnhBcgzR/uMsan5x7RF
         SJ29BLPeN6tVpyzs+Mq6i8kUtP87sT1yvPdA6hRWz4uEYYzYdGJQYBZRYZpNcWua57Da
         timXj75vyv27wMUFwyrX4Me02GFbEt2+iOhyWbDfSyPVQLu64R0mCid5NwLON8/HvqDR
         7O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531172; x=1690123172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4gKNMlj2nf95NwIbJPJbn3bOCO4aOD67h1OA/0fVVY=;
        b=DgcxJVAnHoKmD4IvBi7hS9sEYq1sygKMgs3SlxKofLHAQNPJ0LlxW9Udnz568IkdM6
         1AuiBrJCMFcMzFkdXn+vQDMuOxqKiHZEPe8roixhG/8nTmvDoOeXuMGRu5lgUOCleYQe
         Pu1XIBH+skCfP7gwdDXrHvYJkE0Ap1SxxdJB8t1ZK8rCgqE23ObV3pb0uLfOkXQkfVnG
         DXiFgtiSpMKX9n707L7ByJeSk+jPbsuFqFI4MrKgHRX8nH15FbYqVopmcQBBrgJf8HPR
         nonfpUrR/Pe0YFcpDFluGFbBAlpPK0mbaQI7rpZMF9gP0CUJjbXK0HlLk4Dfi9OuJHiz
         NH/g==
X-Gm-Message-State: AC+VfDzOHQFQI+WxgJkKRRR6ZLnzBv4ZhFzKakMzpHOt6CQ5fNrx91OZ
	NvgDNpRX8zz75Cw6CIphGbJD/g==
X-Google-Smtp-Source: ACHHUZ4CoryEjieqFRkisbAQ1EEyUhQZEB2z2XMb6iVwaH3mxTUKeZvBJsagOjoLRwKKptrskgtjxw==
X-Received: by 2002:a1c:f616:0:b0:3f6:d90:3db with SMTP id w22-20020a1cf616000000b003f60d9003dbmr19484818wmc.3.1687531171755;
        Fri, 23 Jun 2023 07:39:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 00/55] python3: improve run-time dependencies situation - take 2
Date: Fri, 23 Jun 2023 16:38:26 +0200
Message-Id: <20230623143921.146338-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103496

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

These are the remaining fixes for unmet run-time dependencies for python
packages (+ some other tweaks and fixes).

v1 -> v2:
- fixed the issue with python3-pywbem-native by removing build-time
  dependencies from python3-pywbemtools which turned out to not be
  needed

Bartosz Golaszewski (55):
  python3-pywbemtools: remove build-time dependencies
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
 .../pywbemtools/python3-pywbemtools_1.2.0.bb  |  7 ----
 39 files changed, 191 insertions(+), 106 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

-- 
2.39.2


