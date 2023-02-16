Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE617C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:27:39 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.8785.1676550450909209065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cWBe2t4c;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id cr22so1819304qtb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VKjfcBwuO6q1UAb8qOM6oA0AjSkK6LcRv2NUfJkAPx0=;
        b=cWBe2t4cWTKz/TA0TnXzw/9ShCoUn+3Qpl1aMj1fvmozoZ8wDLzpF9jSrtpBht3uwn
         IN0wk5vcxrkH2R0XKtJqMDlFcgInu3bjFhq1KpMbiC7hifsHTD9anWcUpTzlVbSNLjNC
         6zDfJlwnpZtdwDYzjINJ1CDD0YKGfdv1RdrDVa57j8ny/o13K1haDI554lGIPZsrwptZ
         rPTwyHX5jnzdjzy9gdJgzZJ1dAX8uoEyqywN0CyrQFGVZoJ8qlTaIMooMWvGh3BLYDe6
         rD31jZ92nbMsSwEegCONInEpNZTp0DqH8DIC7necGKOrQce+LvYwdE0i2T+tIafOFUUe
         BBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKjfcBwuO6q1UAb8qOM6oA0AjSkK6LcRv2NUfJkAPx0=;
        b=b8eNNuLJRwCnOBB2FmfW5VHmGh0Xspqkfq/vxXS7xX3rGX4M2X4dKyxkajmHwnMz5x
         qUNvIH80AD7rNt3QZizlbvghHS8gt7ioH/0S9MoOsFir2VCyCV5zNjkVTRr1osCKiZ88
         FzqQLjfn4fm9ZGzjANL0UR9127E6YYYJ2XucJYH8ARb/kwyrMFxeY1jSOmZZ1is5piST
         f74/Iu+gnmEzIKmeEknFfpU1c9H9jd7E6fLmlV81q3yQVwrN6h6sTVgjgiHFofR67xO4
         jvMUa2pGF8dbwXEQxeanIZrgDU6osifIGslLve3pWvtBj7i9Jjhce2uckxcECYLwrCj1
         sTNg==
X-Gm-Message-State: AO0yUKV1tl/D3eJO2ZUWoi2OYHUjSLCZVOaTEK5T93Y2V+q2gyWqb686
	lok0O4E/oIfkCDNFfMq5risBwzvGT9w=
X-Google-Smtp-Source: AK7set9kwrnPQf/gjqIvORygvdbWMIqvZP/M6ByiJ5YdCF7Pknvxzs3SR3czxcuEqJucHce65LOmnA==
X-Received: by 2002:a05:622a:81:b0:3b9:bc8c:c20c with SMTP id o1-20020a05622a008100b003b9bc8cc20cmr2902604qtw.23.1676550449768;
        Thu, 16 Feb 2023 04:27:29 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.27.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:27:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 00/15] Patch review Feb 16th
Date: Thu, 16 Feb 2023 07:27:10 -0500
Message-Id: <cover.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101102

Please have comment back by Saturday.

The following changes since commit e7c754778edb25f35896137c8b174669392c492a:

  nodejs: upgrade 16.18.1 -> 16.19.0 (2023-02-04 12:16:04 -0500)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/langdale-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/langdale-nut

Chee Yang Lee (1):
  tinyproxy: fix CVE-2022-40468

Dmitry Baryshkov (1):
  nss: fix cross-compilation error

Joe Slater (1):
  phoronix-test-suite: fix CVE-2022-40704

Khem Raj (1):
  net-snmp: Fix build with clang16

Martin Jansa (2):
  exiv2: fix SRC_URI
  mdns: use git fetcher

Narpat Mali (1):
  net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception

Randy MacLeod (2):
  python3-pillow: add ptest support
  python3-pillow: Add distutils, unixadmin for ptest

Wang Mingyu (5):
  python3-pillow: upgrade 9.2.0 -> 9.3.0
  python3-pillow: upgrade 9.3.0 -> 9.4.0
  apache2: upgrade 2.4.54 -> 2.4.55
  python3-django: upgrade 4.1 -> 4.1.3
  python3-django: upgrade 4.1.3 -> 4.1.6

Yi Zhao (1):
  freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861

 .../freeradius/files/CVE-2022-41860.patch     | 118 ++++++++++++
 .../freeradius/files/CVE-2022-41861.patch     |  53 ++++++
 .../freeradius/freeradius_3.0.21.bb           |   2 +
 ...utine-for-cleaning-recent-interfaces.patch |   0
 .../0001-dns-sd-Include-missing-headers.patch |   0
 .../0001-mdns-include-stddef.h-for-NULL.patch |   0
 ...outine-for-tearing-down-an-interface.patch |   0
 ...-cross-compilation-fixes-for-bitbake.patch |   0
 .../0003-Track-interface-socket-family.patch  |   0
 ...0004-Use-list-for-changed-interfaces.patch |   0
 .../0006-Remove-unneeded-function.patch       |   0
 .../0006-make-Add-top-level-Makefile.patch    | 175 ++++++++++++++++++
 ...-deleted-interfaces-as-being-changed.patch |   0
 .../0009-Fix-possible-NULL-dereference.patch  |   0
 ...0010-Handle-errors-from-socket-calls.patch |   0
 ...ic-allocation-to-file-scope-variable.patch |   0
 .../mdns/{files => mdns}/mdns.service         |   0
 .../recipes-protocols/mdns/mdns_1310.140.1.bb |  44 +++--
 ...eturn-attribute-to-netsnmp_pci_error.patch |  32 ++++
 .../CVE-2022-44792-CVE-2022-44793.patch       | 121 ++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   2 +
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  |  33 ++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |   1 +
 .../files/CVE-2022-40704.patch                |  46 +++++
 .../phoronix-test-suite_10.8.4.bb             |   5 +-
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   2 +-
 ...0001-nss-fix-support-cross-compiling.patch |   7 +-
 ...-django_4.1.bb => python3-django_4.1.6.bb} |   2 +-
 .../python/python3-pillow/run-ptest           |   3 +
 ...illow_9.2.0.bb => python3-pillow_9.4.0.bb} |  30 ++-
 .../{apache2_2.4.54.bb => apache2_2.4.55.bb}  |   2 +-
 31 files changed, 653 insertions(+), 25 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-dns-sd-Include-missing-headers.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-mdns-include-stddef.h-for-NULL.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0002-mdns-cross-compilation-fixes-for-bitbake.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0003-Track-interface-socket-family.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0004-Use-list-for-changed-interfaces.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0006-Remove-unneeded-function.patch (100%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0008-Mark-deleted-interfaces-as-being-changed.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0009-Fix-possible-NULL-dereference.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0010-Handle-errors-from-socket-calls.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/mdns.service (100%)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
 create mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.1.bb => python3-django_4.1.6.bb} (58%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/run-ptest
 rename meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => python3-pillow_9.4.0.bb} (53%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} (99%)

-- 
2.25.1


