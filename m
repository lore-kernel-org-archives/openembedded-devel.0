Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.1051.1629567346081559690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q8ynursh;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o2so12435559pgr.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WycEPIVFCLuNKKeTy3a8BqwCi17aZLHSdjmidzAK98=;
        b=q8ynursh3vjlPRaitKgjPtntaVEVI7JNnPWi+9n7QEBnXpNR88EyQxYqSxhDuZZNfJ
         Z+TjcnM6mgfE4eGY8ZbIwYwQ/f83XM3m01eZPoAWXELjgO8bqLOraLgvUpBbongXK/oJ
         tyxls0RcSiKpoAB5bDagrn0KSfy/T+K/EW0Dk6jzfh5PrYRMvPsp7MTsNTOr4QwlQPdM
         v2Rf8OcddJcttX6TFb6vjilV+3XJwrVP75MgdZrmy847vGJbHjmRl+UsPwBds8QFHjRZ
         9VcwKTOFPrX7M5kCDV3wltgTA4n/azLg+QI2O3Dh2FgFvuCoZc1lpTKM/+ROrJHPwLoK
         /96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WycEPIVFCLuNKKeTy3a8BqwCi17aZLHSdjmidzAK98=;
        b=egMZkwxWUIkx09mWBK2LospYO2+O+fNI/LAkXc3AzxM3hgoOnOkfvNAsw5wND3QgPB
         k4QTu6YpTfjFiWcvBmLaTHo9osRvEZ7Cl6KgQjSt+PFh/j6CVyPpl/ER2JpgOF4CGeoc
         3yEBeS7gzqHhXcARWV8m9kMkozZSS//Z37hrICz76ajpmyYULZbh6Y/0QXelMM5eCC1O
         oqtAQx4b6SvEiseT98AfkHrSD9+0rPEMQ8wTxzhfyZh4u7Cj+SWeOaGLiaaDroD+xy+s
         cE2jNhdqQ1rSnsfYjiu8zQbNo1oVBqeOGGfog/VOEV81qkqKzJslZKLI/vi35qFVlywv
         eV8g==
X-Gm-Message-State: AOAM531r1NUf/3WutT62IljAof4UiXbTBZlqxa0juj6sN8/Yz6DUyhQ/
	kboYed/+jGYORdER8RPob7gbZ5Uv+sY=
X-Google-Smtp-Source: ABdhPJzwmKh17gfJUI9tKtKlFR4CIByFgQTnCRFrzahQLlu1XDphFiGM4Sa7GagFqvn1RqKWsQoUZQ==
X-Received: by 2002:a63:4d18:: with SMTP id a24mr23823344pgb.324.1629567345275;
        Sat, 21 Aug 2021 10:35:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/7] Patch review Aug 21st
Date: Sat, 21 Aug 2021 10:35:34 -0700
Message-Id: <cover.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please have comments back by Monday

The following changes since commit 85f8047c71047d93cf79a954142157f85079968d:

  php: Upgrade to 7.4.16 (2021-07-26 16:05:08 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Anatol Belski (1):
  backport: xmlsec1: Fix configure QA error caused by host lookup path

Jate Sujjavanich (1):
  ufw: Fix interpreter for installed ufw and test ufw

Joe Slater (1):
  php: move to version 7.4.21

Kai Kang (1):
  libdbi-perl: fix CVE-2014-10402

Khem Raj (2):
  fvwm: Package extra files and man pages
  fvwm: Fix build time paths in target perl/python scripts

Michael Opdenacker (1):
  bigbuckbunny-1080p: fix sample video URL

 .../sample-content/bigbuckbunny-1080p.bb      |  2 +-
 ...tect-openembedded-python-interpreter.patch |  8 +--
 ...setup-only-make-one-reference-to-env.patch | 14 +----
 .../perl/libdbi-perl/CVE-2014-10402.patch     | 56 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  4 +-
 .../php/{php_7.4.16.bb => php_7.4.21.bb}      |  3 +-
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb   | 23 ++++++--
 .../xmlsec1/ensure-search-path-non-host.patch | 22 ++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.30.bb |  1 +
 9 files changed, 109 insertions(+), 24 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch

-- 
2.25.1

