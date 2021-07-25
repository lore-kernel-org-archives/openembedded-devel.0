Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.14660.1627188750170870672
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TIxRs+Km;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k1so7712409plt.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA0QciRJLubw/EPwmfBupKG3vREGFt6SVcE168a5RlI=;
        b=TIxRs+KmOfdTQkU+WC0tbJeVbH3ESKkt41Kw1OldItNnJxjhFWEGw4nVGlrMkbj78M
         ln79PzXM8jxCDZRR6mZrM2vFh0MiTy0l/wqt29CEki9k9HyDFMYV8LHcRKbzTQgH5Zku
         3HytwV7qX9CX1KhNl2EE57crt3KNZa6JVuRMB1BQkZ03Y9pw25R61a52aHqwJKQci5Yt
         ZJ3ros6bJVPj+VAT6tFJEJNID43V/2ai0Zr7tMV79CS/Vfc0cVSy7idbdrdN2ggf9slU
         xB59abO1vss+5b5G9zVgdyrUSpR2tSFI0niqHZc6gHAR62nONcFyAoAQhdpXl0j73o4A
         B3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA0QciRJLubw/EPwmfBupKG3vREGFt6SVcE168a5RlI=;
        b=SD1LGmzb4rA3id6pYpUA0jVwUsAzR6jNrDoJZIWxNaAsB6gEQFl7YnEZuMCDF471rr
         WOWnyjtySAyZXJBMyMulGj8eyoZEIEqY624xbfTHkmpZUY56lDzmIC2maotbqa0CxPTj
         cQ73Hz3QNV5GvPKp5dkB7SXji2FzkePSsgLcXToirCXkBqLwoyMokqRHzOLr8H7bN8xc
         DJMgGm15txRm0zD+xLPxDQlZfx4UU/j4j70NfIJkYeHqxloiaLQR5zT0NgvPjg22g+Lo
         1ri71hCqlDQJrDFhFRWVpDpZ2e1Le42w7Uwan+ZstvqlJmctMpr7JcRjtNhgsdvIpL0+
         TosA==
X-Gm-Message-State: AOAM530B3DfWj7RoTQXvZy0wyfGGgh5xyuN54zvoUlO6xj1CQza0RVTu
	XNKKYiXTFOVjDD6hERLdb66kPMmv1ZjV0A==
X-Google-Smtp-Source: ABdhPJwkuCif7MDWkfzTUblJ/2MIJNHw2J/KgcqJHjZ8lfPerLkx5UWabCIETI75RaqRqAmcnmzMOw==
X-Received: by 2002:aa7:85cc:0:b029:359:7d78:bc4c with SMTP id z12-20020aa785cc0000b02903597d78bc4cmr11888022pfn.6.1627188749391;
        Sat, 24 Jul 2021 21:52:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/15] Patch review July 24th
Date: Sat, 24 Jul 2021 21:52:06 -0700
Message-Id: <cover.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

please have comments back by Tuesday.

The following changes since commit 10082fce3b6ddeaaae4df95f7f002356942b7577:

  postgresql: update to 12.7 (2021-07-17 07:42:33 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (2):
  mariadb: update to 10.4.20
  hiawatha: fix url.

Bruce Ashfield (1):
  vboxguestdrivers: fix build against kernel v5.10+

Gianfranco (5):
  vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
  vboxguestdrivers: Add patch proposed upstream to fix a build failure
    on i386
  vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
  vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
  vboxguestdrivers: add a fix for build failure with kernel 5.13

Gianfranco Costamagna (3):
  vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
  vboxguestdrivers: upgrade 6.1.12 -> 6.1.14 Drop kernel 5.8
    compatibility patch, now part of upstream codebase
  vboxguestdrivers: upgrade 6.1.14 -> 6.1.16

Hongxu Jia (1):
  vboxguestdrivers: fix failed to compile with kernel 5.8.0

Jate Sujjavanich (1):
  ufw: backport patches, update RRECOMMENDS, python3 support, tests

Khem Raj (2):
  vboxguestdrivers: Fix build with kernel 5.8
  vboxguestdrivers: Add __divmoddi4 builtin support

 .../0006-check-requirements-get-error.patch   |    36 +
 ...se-conntrack-instead-of-state-module.patch | 14903 ++++++++++++++++
 ...8-support-.-setup.py-build-LP-819600.patch |    93 +
 ...st-runtime-tests-to-use-daytime-port.patch |  2895 +++
 ...IPT_MODULES-and-update-documentation.patch |   106 +
 ...nts--simplify-and-support-python-3.8.patch |    33 +
 ...tect-openembedded-python-interpreter.patch |    33 +
 ...setup-only-make-one-reference-to-env.patch |    14 +-
 .../recipes-connectivity/ufw/ufw_0.33.bb      |    49 +-
 ...e_10.4.17.bb => mariadb-native_10.4.20.bb} |     0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |     4 +-
 ...{mariadb_10.4.17.bb => mariadb_10.4.20.bb} |     0
 .../40-linux-5.13-support.patch               |   276 +
 .../vboxguestdrivers/add__divmoddi4.patch     |    36 +
 ...rs_6.1.6.bb => vboxguestdrivers_6.1.22.bb} |     9 +-
 .../recipes-httpd/hiawatha/hiawatha_10.10.bb  |     2 +-
 16 files changed, 18476 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0006-check-requirements-get-error.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0007-use-conntrack-instead-of-state-module.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0008-support-.-setup.py-build-LP-819600.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0009-adjust-runtime-tests-to-use-daytime-port.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0010-empty-out-IPT_MODULES-and-update-documentation.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0011-tests-check-requirements--simplify-and-support-python-3.8.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.17.bb => mariadb-native_10.4.20.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.17.bb => mariadb_10.4.20.bb} (100%)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.22.bb} (90%)

-- 
2.25.1

