Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33669.1794851720429336452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=s5DYPSqm;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so5474003eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851720; x=1795456520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTqpCRW29GqwJqv44ofP9wBzAOiIIzZMrdXDzIt1Cxw=;
        b=s5DYPSqm9gTLVd8emkito75NVYwDKtRKiBw1d2Um2PuvULnrjZ+ULBDnYovZtb4Cdg
         iU4fICidEYsvXcWsJBS7I/j/3GLcWpiDpoofNeKDKEHXM4zqlWMYq/n81LsIzTlY4loM
         WjMXjdHZYQ8kHofLuQw8wBUIlv1ihq/AijOnwNg6W8buDrfaX6Ogr6xgjFiJBFWa6kgG
         I/tMlFP6Buj8t8Yl3vgygjgIL6/e/9KGMN3crdslNUixCHa6z6kV3c4NDR7w7X7dORFy
         Avxs/ECU5vaoUFZKtM+ws7c0nJSkFcnCeHoHgvjVIGMELsUv7Q45Gxs2PcLqFlq90cyv
         M8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851720; x=1795456520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTqpCRW29GqwJqv44ofP9wBzAOiIIzZMrdXDzIt1Cxw=;
        b=pI5FUvFkWD66T4VyGNlQ1BtKkdGyetUtQwmvOyKu7Rip7kzmuaJxcB8o3JKBQEGkSH
         dToEgQYkmsJdbhxAliikogKTmSAZuccjH96lC7tmbiJ8b6BAfplhztpXZ4J0Socoi+Rf
         kGa1uhO/46Gid8zwMWv6jhg0qIOBeCsqhf+03tTE7tYtykBcoOYF90BbDVdXlojnGT6s
         jTrbevQe/GQRRvV0GBznL+WpD421sS9ZHPkJxKo0cJ0/ezaaS1BZiu37J8rI1xBgacr9
         f+rh/z/PLqC+sdmPR5HmAb8kAA2s3nsGMIS6N8DRwUrmmh8wRQnYZbgec0jfNkC+JFj1
         on/A==
X-Gm-Message-State: APuU4Z8kt8OWUWU6gE3LZrNcu30Flgah24SsRLYgNkuRve6gPC+Zm+s+
	n192P/AA+u2ZDDj8AWG5VvDL84T4OrpUFCPvDA9v7IOu3Xih0LVKalxslDv1xCbO
X-Gm-Gg: AZFdTZc5f3MCDKdtsFDHYWShAtvQdJWIqKbpoN5wWYre6YjuFjpWJrUmwq53IuvY6+C
	rU7tw9Qz7BBOC4EE4ADlmzyDTQI+npR3dYAXa4Nab7Gvh2/PKduOEgzXmjWKE0oCHyvzIBvk129
	s2We5OIkBzMBjetkOPURJDuzqjxFN5o6yRWKbAlmNeA85xihJ/WYOXPs91F7ojOTOV8IrM4LbyL
	nNzGlgqle00YFXmAJ6jvjO3N2dQ+VU7vjiH8lzTYZ5F/ujrd/Jav6ERcW6EsNIr3gOmIadXZ38o
	/nMlqdmY4soiuUlDmLSVetsNgAHakxKF0DBk/cHcHZ7PNu+H/gYDBRMEoTDzb9jdAqhNDKzBrJ4
	m/B1abxxnTdjqlPb5MEixVHAJIfp0ja0IvFzMoJM4jh+x+GuDCulMml0DlFIdMacCIinrzf1Rfz
	4qd9Bjo1Z19VMyNIX3/S2bkU5NCWrPH6Xd9dw5d0rYqOsmw9LRk6GTE+Jkaroog08RfooctpdFw
	JxCzXIBOGm5uwgJtTNwGB0nQlynvx7ElUgjAKL8sAiwSMY5TCN/gOImjK7/eWLATT5xwyCoLkgq
	uYzzKCNIaZ/AC/Q7jbBOT/Su/aEgDYa0UOkU2vz33yCfLKLg7tilaaUe3DAyEwf4TgoKo/Xg5x+
	QYpS8Rb81dmqaNUobvJksFEIE5CBehHKSSViy28lpzMlh0tIJb5LCL1UaDw7p7pTd4mG836N535
	hGOq5EQ6FILB31dVnlpVGGLTLQykdEmPC/evPs5TCNFuHFhL9Xmjv5ejawiwfI+rLu5iyRwJJjP
	00tV6w4tQ7mH9kAeX4rs7dDof+xKD1Own9hMi8H/tlnBpgK2wQe3kLcJSI+8pXUfcBbeFBOr0N0
	m4RM
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr10186502eec.32.1794851719677;
        Mon, 16 Nov 2026 09:55:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 053/105] python3-pandas: upgrade 3.0.6 -> 3.1.1
Date: Mon, 16 Nov 2026 09:53:05 -0800
Message-ID: <20261116175359.342679-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132509
Content-Type: text/plain; charset="utf-8"

Refresh the numpy include dir patch; meson.options exists upstream now.

Changes:
- BREAKING: NumPy >= 2.0.2 and python-dateutil >= 2.9.0 now required;
  C++20 is required to build from source; optional dependency minimums
  raised (matplotlib 3.10.5, lxml 6.0.0, Jinja2 3.1.6, numba 0.61.2...).
- Add DataFrame.select (with pandas.col expressions); new read_csv
  options; Index.values/Index.array return read-only arrays; Timestamp
  and to_datetime return datetime.timezone.utc; stricter Timedelta
  string parsing; infer_freq QS anchor reporting changed.
- Deprecate xlrd/pyxlsb engines in read_excel (use calamine),
  DataFrame.join lsuffix/rsuffix, mode.chained_assignment, and
  integers passed to Period.
- Building no longer needs MSVC on Windows; CRLF checkout fixes.
- 3.1.1 is a regression-fix release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ion-to-specify-numpy-header-location.patch | 20 ++++++++-----------
 ...andas_3.0.6.bb => python3-pandas_3.1.1.bb} |  2 +-
 2 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.6.bb => python3-pandas_3.1.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
index ed5eb767e9..37f6881a15 100644
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
@@ -21,23 +21,22 @@ Upstream-Status: Submitted [https://github.com/pandas-dev/pandas/pull/61095]
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- meson.options      |  1 +
- pandas/meson.build | 12 +++++++++---
+ meson.options      |    1 +
+ pandas/meson.build |   12 +++++++++---
  2 files changed, 10 insertions(+), 3 deletions(-)
- create mode 100644 meson.options
 
 diff --git a/meson.options b/meson.options
-new file mode 100644
-index 0000000..3d3a18d
---- /dev/null
+--- a/meson.options
 +++ b/meson.options
-@@ -0,0 +1 @@
+@@ -4,3 +4,4 @@
+     value: false,
+     description: 'Enable UBSan checks beyond the default `undefined` set on the hand-written C/C++ sources. Cython-generated code is excluded because its codegen would drown the results in noise. Only meaningful together with -Db_sanitize=undefined.',
+ )
 +option('numpy_inc_dir', type : 'string', description : 'The absolute path to the numpy headers')
 diff --git a/pandas/meson.build b/pandas/meson.build
-index 840ac25..2c3423e 100644
 --- a/pandas/meson.build
 +++ b/pandas/meson.build
-@@ -4,17 +4,23 @@ incdir_numpy = run_command(
+@@ -4,17 +4,23 @@
          '-c',
          '''
  import os
@@ -64,6 +63,3 @@ index 840ac25..2c3423e 100644
      check: true,
  ).stdout().strip()
  
--- 
-2.47.3
-
diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb b/meta-python/recipes-devtools/python/python3-pandas_3.1.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.1.1.bb
index 75581a83a3..b4d1b2e8d2 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.1.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "66b07ef7315a31bfe1089cd3d71a7de781c9dca986762d0b4fe7c0ef17465d10"
+SRC_URI[sha256sum] = "05fed3e3b7c99b226f160e29d7d6cb7ef39638c758cbfe42b3f24ba34f04b859"
 
 CVE_PRODUCT = "pandas"
 
