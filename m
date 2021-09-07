Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.430.1631026797073466246
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D4b4OBlD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id bg1so5972526plb.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Sep 2021 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=azgLesAMj4TzeyrlAg0j0WplF4aYxa9T1Uf6d5XHLcQ=;
        b=D4b4OBlDORJ/gW2PxjblIwm/LziI9/N8b83ZFL5nu99a86jNpGLL/Tn+qB0pQAP1cc
         suyFBUIJP32Jq1uRsB5OB62pClPvRJ3KG+MZOVe7OZcIohW2iBZ6y0jmIHJmpwkhHtSG
         dTnkEl0kIE/5Bq0qKSLL+vud/iTuQRNyEDjdLd0rYPJx26efi+FASClW4/uGbWMkSzwg
         g3bQYN8bt1/vkwoM6DjYzSUSL4iWsPSfBuCuvjuDX6oahjYl4dTcPpFlXExNuRU6uzZ+
         8VAPrwlFZ8w0j9XtfQtlBeJcf+IKaaxGJiLIAO8GQfSEy/V5zsqjpkWyosExjo8yfwBI
         PlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=azgLesAMj4TzeyrlAg0j0WplF4aYxa9T1Uf6d5XHLcQ=;
        b=eKmTZpmyWSs3rBVXJpRk0dtUWLfQbq84zAx8BotzGMR+BodT/6xSEOZVyTc1SnUTh8
         ySH8h6A5jPZSoHN4ggyJokh3XUmw99iO0OXkEAqh4tX93+wYfCrXXKG9mm/LkU5YJ4JF
         1Xth/y8kxfST7NPjaHyVy8sagtGWNuNVQS7INA4bwT8VuD4m2IZbDiIL0nxFLregM8ob
         gIMT5SdLYe93PlAl+Kdf0StQ8WHskp3GZb8SlmvolzbK6b2QOW8n58ieoq6p8/kHpaOR
         9+ByEP/gUJBoI0+xoYbX88fMqvcsBSn2SbMV1s4s7ir0c/Z4cJEoscXG8/BmMSL9UVGf
         qbHw==
X-Gm-Message-State: AOAM530m0W70JI26EHtCcXESPRYCZr5crdSAfPTRXtFCcGumQChgueEP
	xEY9C443EIN+EGIyO7oOwQU=
X-Google-Smtp-Source: ABdhPJyrnmeO+6m1Qc28S/ok+Cbvcme3Dn103sVCmjIL1JD7Sof5mQeRoFs3lU/x5O/2C/08CHVhuQ==
X-Received: by 2002:a17:90a:e001:: with SMTP id u1mr4985147pjy.183.1631026796504;
        Tue, 07 Sep 2021 07:59:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ece:8e2f:f07e:736f? ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id g4sm13323719pgs.42.2021.09.07.07.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 07:59:56 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: dunfell merge request Sept 7th
Message-ID: <1041c99e-26ef-b7b2-3d80-1273fe72271e@gmail.com>
Date: Tue, 7 Sep 2021 07:59:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 4a0d93d250576177e1237fa559f55c4f9d371809:

  nginx: fix CVE-2021-3618 (2021-08-21 12:16:49 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 5c347d8ce425dcb4896e6f873810b8bfff5e4e92:

  nss: Two Security fixes CVE-2020-6829 and 12400 (2021-09-05 11:54:45
-0700)

----------------------------------------------------------------
Armin Kuster (3):
      xterm: Security fix for CVE-2021-27135
      tcpdump: Exclude CVE-2020-8036 from check
      nss: Two Security fixes CVE-2020-6829 and 12400

Changqing Li (1):
      apache2: upgrade 2.4.46 -> 2.4.48

Gianfranco (3):
      dlt-daemon: update to 2.18.5
      dlt-daemon: fix build failure when dlt-dbus is enabled, due to
missing service file.
      dlt-daemon: update from 2.18.6 to 2.18.7

Gianfranco Costamagna (3):
      dlt-daemon: fix build with upstream-proposed patch for MUSL libc
      dlt-daemon: superseed upstream pr #238 patch with pr #245 due to
unexpected behaviour
      dlt-daemon: update to new release 2.18.6

Zang Ruochen (1):
      c-ares: upgrade 1.16.0 -> 1.16.1

 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb        |     5 +
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch        |   148 -
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch        |    38 -
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch        |    43 +
 .../dlt-daemon/{dlt-daemon_2.18.4.bb => dlt-daemon_2.18.7.bb}   |    12 +-
 meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch    |    68 +
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb                  |     1 +
 .../c-ares/{c-ares_1.16.0.bb => c-ares_1.16.1.bb}               |     2 +-
 meta-oe/recipes-support/nss/nss/CVE-2020-6829_12400.patch       | 19789
++++++++++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb                       |     1 +
 .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          |    45 -
 .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          |    49 -
 .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          |    39 -
 .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          |    35 -
 .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          |    66 -
 .../apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb}            |     9 +-
 16 files changed, 19916 insertions(+), 434 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb =>
dlt-daemon_2.18.7.bb} (87%)
 create mode 100644
meta-oe/recipes-graphics/xorg-app/xterm/CVE-2021-27135.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.0.bb =>
c-ares_1.16.1.bb} (92%)
 create mode 100644
meta-oe/recipes-support/nss/nss/CVE-2020-6829_12400.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 delete mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.46.bb =>
apache2_2.4.48.bb} (96%)
