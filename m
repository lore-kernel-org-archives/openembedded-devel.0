Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10320.1795752979356686769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xLVZ4skU;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so7953400c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752979; x=1796357779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBp3RkZl7CFy9LPaN9EY88ch0Q1zLl2NN5xc8NkQ7AM=;
        b=xLVZ4skUAutzhcy1JMDbKZp2/oP436W37Thp3kvbAM4g6RWYkE1WAsp0QkAOPS2nET
         pC39uCMSLG3QARXuFWfDVfWUAX8Wb6JhZJSNq4KnZVD/dFVYjGa0Htt5FChtp1LCrinR
         E33naUvD8GKKQNb+A27UrtImCFOy3fCKwCZvvLDN/MwwFzQGlUci86fKF2rNXpHPCdlS
         ST/9YvwTeKGIIxOf1r7eyaSu2HvcmKptkbR/nx1jMMZgbR6xjNG4A8hke71Zn5gVJlGU
         LW3/ekNPaGtaAJuQoWV8+BE8Iyy/KRIj5kcJUvudBs14yUuQdChHIDwocBsgn1hTDgJU
         Cqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752979; x=1796357779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBp3RkZl7CFy9LPaN9EY88ch0Q1zLl2NN5xc8NkQ7AM=;
        b=Q0PiHxJQnnu7bz14Kp8wjN4MpZXkTPCj/4uozQENNBKO3h+CiqmbAk4B9qVanuqsNr
         iyFP0Na4TAMJfZqINyIYsGubLaHPu2Sc5d1p/P/GklDsilVl3qQY/pIprI4UBCR9zORx
         qphP6rFnauGiWSvvWl8aT6kyqO0leFK8K2tscqld36YID7jdHZbscV3RKwHfhLPp9teQ
         JuTQgNVFgtdGb/cIRVUr6zUDPQu3cL4P2tp/JJbDoMs3FGqxVgU3HRPyyoEskcT6IeYS
         1cSf+yc1usjRCqk4Lhc6TneThoWLqd/NEVPkkJVEBBNflKldDmO8+Mlngr84Y/d8M1Hd
         hgLw==
X-Gm-Message-State: APuU4Z+n0QA8XiN4fudTTMRzR7LnUv0fw1BkUmK2EE25n5snJgw51ex7
	IrvoI3ArzEZPKfmbA6r1pxQWvGQVot1Lj5wuYJKumx2ibINcdt49mudN72Brogyk
X-Gm-Gg: AZFdTZdSEN9hO/g8rzFtGqrO56hSxpbDfNcKpIY2nJwa7ESfKyaEBqfFskVscRxubC0
	muzsPlulJmL4tS0GJui0xPq/x5SGCOT1eC4yRwfcHodELlHdVSy6r4PE8gV7ePj5lBiVxCrPnHu
	XHxHEeOt1oW8/M0j8ShOQyxAyZ9fT02Yu+lzdy/GMpaNf7Sh/xEoyxbVS0Qc9BGI3M2f2E8CS2v
	SzuS+8UUGyqtrA/5qEtCgrw5Gd+LnVMw0ypCGGmUZuOHhGQFwrseXtFzxk0DxDyougqvIwrPqxg
	3WwxBKpAyXauG3T+GUUEh+JXo+A2PSXjAHCk0ItJuebZ7ByI8Uqe8AC3A4jRMubwklwcDtrcfr8
	p47MRXMOtudj1B2IpryK3gsFyaKFFCB6vhtXu8Kqz/x7K33ZEDvtRoPIS255lBiazeQbsTyze9Y
	oxQDV3oS2pA/SABLvI1nzCOas0KiFxrTtfjKgf02uW15mwmhaI0Ra6YEYembsf5v6SvfqdA/2uh
	0/tIJNL6R98z0f6HmwGLNkn+aVvIm1xk1BATHlA8b/wGiFi1PG8dbDlcaEGMIP7hK3cLiVWTa77
	Z90wXeeA4bsModlrJ0O+dkC4UdgvS7fcmsjPRQ5QMaSA14561qid6aUR+Q+nmLU5FinR8n7qG1a
	VnczZ08f8F3+5l94abdpMQ7zEFIH+N3LJM813Rff8S4dxQo8mYc9EBzxhmwTLbdjr+m1YEJ6qGk
	O/kFrUoxcjIV+PqTkkzKa4ju9RThhbDON8vS0JDHBIkPDjLUW249jvMrw8lnKKc9uakUGCyWbYf
	PEq29A6x4Tr/HIQtrMj8ksTiZacItbia/peI+fK6lPCoZ07kQ0vv0lMJn+EI6NOuuMiuiWQNsLi
	wEzO3VeoF3rsiGFjckZvmv/q0Q==
X-Received: by 2002:a05:7022:287:20b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b5568d3d0cmr23261297c88.26.1795752978578;
        Thu, 26 Nov 2026 20:16:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 00/32] Upstream checks, upgrades and ptest fixes
Date: Thu, 26 Nov 2026 20:15:42 -0800
Message-ID: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133219
Content-Type: text/plain; charset="utf-8"

Upstream version check fixes, same-series upgrades, the python-sbom and
zipremove recipes that the newer tox-dev packages need for their hatch
build hook (python3-filelock is switched to it too), and python3-cvxopt
fixes for SuiteSparse 7 (needs suitesparse from the meta-oe major
upgrades series).

Khem Raj (32):
  gyp: Fix upstream version check
  python3-behave: Fix upstream version check
  python3-opentelemetry-semantic-conventions: Fix upstream version check
  python3-pika: Fix upstream version check
  python3-pydantic: Fix upstream version check
  python3-slip-dbus: Fix upstream version check
  python3-reedsolo: Fix upstream version check
  python3-cvxopt: Fetch by tag and add upstream version check
  python3-cvxopt: Build with python_setuptools_build_meta
  python3-cvxopt: Look for SuiteSparse headers in include/suitesparse
  python3-zipremove: Add recipe
  python3-python-sbom: Add recipe
  python3-autobahn: upgrade 26.11.1 -> 26.11.2
  python3-cachetools: upgrade 8.0.2 -> 8.0.3
  python3-fonttools: upgrade 4.68.0 -> 4.69.1
  python3-reportlab: upgrade 5.1.1 -> 5.1.2
  python3-regex: upgrade 2026.11.24 -> 2026.11.25
  python3-sentry-sdk: upgrade 3.0.0 -> 3.0.1
  python3-pymongo: upgrade 4.20.1 -> 4.20.2
  python3-types-psutil: upgrade 7.2.2.20261111 -> 7.2.2.20261122
  python3-types-python-dateutil: upgrade 2.9.0.20261116 ->
    2.9.0.20261122
  python3-types-setuptools: upgrade 84.2.0.20261104 -> 84.2.0.20261122
  python3-discovery: upgrade 1.9.5 -> 1.9.7
  python3-platformdirs: upgrade 4.14.5 -> 4.14.8
  python3-pyproject-api: upgrade 1.12.5 -> 1.12.6
  python3-pytest-env: upgrade 1.8.5 -> 1.8.8
  python3-tox: upgrade 4.67.13 -> 4.67.16
  python3-virtualenv: upgrade 21.15.6 -> 21.15.13
  python3-pika: upgrade 1.4.4 -> 1.5.0
  python3-filelock: Build with the python-sbom hatch hook
  python3-watchdog: Build with python_setuptools_build_meta
  python3-javaobj-py3: Build with python_setuptools_build_meta

 meta-python/recipes-devtools/gyp/gyp_git.bb   |  2 +
 ...26.11.1.bb => python3-autobahn_26.11.2.bb} |  2 +-
 .../python/python3-behave_1.4.0.bb            |  2 +
 ...s_8.0.2.bb => python3-cachetools_8.0.3.bb} |  2 +-
 .../python/python3-cvxopt_1.3.3.bb            | 10 +++--
 ...ry_1.9.5.bb => python3-discovery_1.9.7.bb} |  4 +-
 .../python/python3-filelock_4.3.1.bb          |  6 +--
 ..._4.68.0.bb => python3-fonttools_4.69.1.bb} |  2 +-
 .../python/python3-javaobj-py3_0.6.1.bb       |  2 +-
 ...entelemetry-semantic-conventions_0.66b2.bb |  2 +
 ...n3-pika_1.4.4.bb => python3-pika_1.5.0.bb} |  6 ++-
 .../python/python3-platformdirs/run-ptest     |  6 ++-
 ...14.5.bb => python3-platformdirs_4.14.8.bb} |  3 +-
 .../python/python3-pydantic_2.14.4.bb         |  2 +
 ...go_4.20.1.bb => python3-pymongo_4.20.2.bb} |  2 +-
 ...2.5.bb => python3-pyproject-api_1.12.6.bb} |  3 +-
 ...v_1.8.5.bb => python3-pytest-env_1.8.8.bb} |  4 +-
 .../python/python3-python-sbom_0.5.0.bb       | 41 +++++++++++++++++++
 ...6.11.24.bb => python3-regex_2026.11.25.bb} |  2 +-
 ...ab_5.1.1.bb => python3-reportlab_5.1.2.bb} |  2 +-
 ...k_3.0.0.bb => python3-sentry-sdk_3.0.1.bb} |  2 +-
 .../python/python3-slip-dbus_0.6.5.bb         |  3 ++
 ...-tox_4.67.13.bb => python3-tox_4.67.16.bb} |  3 +-
 ...=> python3-types-psutil_7.2.2.20261122.bb} |  2 +-
 ...3-types-python-dateutil_2.9.0.20261122.bb} |  2 +-
 ...thon3-types-setuptools_84.2.0.20261122.bb} |  2 +-
 ...15.6.bb => python3-virtualenv_21.15.13.bb} |  3 +-
 .../python/python3-watchdog_7.1.1.bb          |  2 +-
 .../python/python3-zipremove_0.10.0.bb        | 18 ++++++++
 .../python3-reedsolo_2.1.0b1.bb               |  2 +
 30 files changed, 112 insertions(+), 32 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.11.1.bb => python3-autobahn_26.11.2.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-cachetools_8.0.2.bb => python3-cachetools_8.0.3.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.9.5.bb => python3-discovery_1.9.7.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-fonttools_4.68.0.bb => python3-fonttools_4.69.1.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-pika_1.4.4.bb => python3-pika_1.5.0.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.14.5.bb => python3-platformdirs_4.14.8.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.20.1.bb => python3-pymongo_4.20.2.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.12.5.bb => python3-pyproject-api_1.12.6.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.8.5.bb => python3-pytest-env_1.8.8.bb} (79%)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-sbom_0.5.0.bb
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.24.bb => python3-regex_2026.11.25.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-reportlab_5.1.1.bb => python3-reportlab_5.1.2.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_3.0.0.bb => python3-sentry-sdk_3.0.1.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-tox_4.67.13.bb => python3-tox_4.67.16.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20261111.bb => python3-types-psutil_7.2.2.20261122.bb} (76%)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20261116.bb => python3-types-python-dateutil_2.9.0.20261122.bb} (74%)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_84.2.0.20261104.bb => python3-types-setuptools_84.2.0.20261122.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.15.6.bb => python3-virtualenv_21.15.13.bb} (83%)
 create mode 100644 meta-python/recipes-devtools/python/python3-zipremove_0.10.0.bb

