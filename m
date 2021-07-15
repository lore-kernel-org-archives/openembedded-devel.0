Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.950.1626368447065207549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+VqFi6J;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 17so6052519pfz.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wPzdVsJ5blgsNHss/6Vk7EZ1w+UUIKyjUTu87fydOI4=;
        b=E+VqFi6J5aE/9u0S6a+mQhKqEZOrFgi/GVxg+aJ5StJYZTkT8l1CfVId2KhYafA2EZ
         A4ex/aWlhUKEYHHF4DSmq064V0Xik512v4eqBdgCEwuHQdW3Hdf9ibUgGO+olB43SnMy
         h3818d8NHhxgr4UCLdbygawjs4HuWRxaqjVphOkD34VaxGX2YUoGqN7bzn4AXVF7mKd+
         2z3q3gQP3hSQrkNEf1b0zPH9QuGdmf1mnPIt+H6xYzJ6QG3i8oVKJrLMzSzwalOzQdId
         SBOMQaL1hhnoqmekRybCiO90EkVhX/UZI9CdzLh0+qGQ2gKcVYYaSw1Td+jRsBwpq//V
         IuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wPzdVsJ5blgsNHss/6Vk7EZ1w+UUIKyjUTu87fydOI4=;
        b=ZimY5KWA0Ij/6lDQGROOKv+D2XeO48eA8oLl3NLcth4cRnnY8bVWI/oZ+iY4OVEH8P
         R8RjeqOILtWz6vL/oZYd3SOoMthv993zpY5DDKhFbi0BbKnV8+QkwGLmqxMjtFQULCKg
         tXYVF1Nns7iYzsgcJ0pLF2SF/6dUMMgABZil6zcSzpjjNW7sAYkZHdttnOCyIIbOA6sZ
         UYoemYUOXr8vcNXqgc5w8vhYZJnodWHQPSfe51kP+r4Ix/L3Y+9ErML4WIciNU27Kr4c
         HWA7+QBXhZCUqrksYKob2+GSCjHN93vrcbEocOLJbrxVGgPsg6zJ58x1mAfoMKPeT081
         M0IQ==
X-Gm-Message-State: AOAM533f9o33T+rYz+7p+dCA4ymR34FfGFoAs6oVtxy4o1DvkB476Qc2
	K8nOs3c8fVEeDknI1mU4G9I99egNdaQ=
X-Google-Smtp-Source: ABdhPJxOpuBv7MJ0gI77TqR7oQ1LptHSjO5AwB9fN04KcwTC1M7JWkWLQEuO6KH6b/JOiEU35OoZkA==
X-Received: by 2002:a63:1263:: with SMTP id 35mr5447971pgs.221.1626368446109;
        Thu, 15 Jul 2021 10:00:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 0/7] Patch review July 15th
Date: Thu, 15 Jul 2021 10:00:35 -0700
Message-Id: <cover.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please have comments back by Friday

The following changes since commit c51e79dd854460c6f6949a187970d05362152e84:

  python3-django: upgrade 2.2.23 -> 2.2.24 (2021-06-27 07:50:20 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Adrian Zaharia (1):
  ntp: fix ntpdate to wait for subprocesses

Akifumi Chikazawa (1):
  openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist

Changqing Li (1):
  nginx: fix CVE-2021-23017

Li Wang (1):
  apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690
    CVE-2021-26691 CVE-2021-30641

Masaki Ambai (1):
  nss: add CVE-2006-5201 to allowlist

Sam Van Den Berge (1):
  libiio: fix installing libiio when python3 bindings are enabled

massimo toscanelli (1):
  sysbench: fix memory test

 .../recipes-support/ntp/ntp/ntpdate           |  5 ++
 .../recipes-support/openvpn/openvpn_2.5.2.bb  |  3 +
 ...modifier-to-tmp-variable-in-memory-t.patch | 40 +++++++++++
 .../sysbench/sysbench_0.4.12.bb               |  4 +-
 ...rify-whether-libiio-is-installed-whe.patch | 37 +++++++++++
 meta-oe/recipes-support/libiio/libiio_git.bb  |  4 +-
 meta-oe/recipes-support/nss/nss_3.64.bb       |  3 +
 .../apache2/apache2/CVE-2020-13950.patch      | 45 +++++++++++++
 .../apache2/apache2/CVE-2020-35452.patch      | 49 ++++++++++++++
 .../apache2/apache2/CVE-2021-26690.patch      | 39 +++++++++++
 .../apache2/apache2/CVE-2021-26691.patch      | 35 ++++++++++
 .../apache2/apache2/CVE-2021-30641.patch      | 66 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.46.bb   |  5 ++
 .../nginx/files/CVE-2021-23017.patch          | 46 +++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 15 files changed, 380 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
 create mode 100644 meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch

-- 
2.25.1

