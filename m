Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web08.189.1619189129651180291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JUWuYM/e;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id c6-20020a4aacc60000b02901e6260b12e2so8228290oon.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=qhvdcf6WSWjfOi7rykq1lpRy42bDO1M9nDaJhKMG7iY=;
        b=JUWuYM/eSvIcaYtERwU/Lae2oTLY+WdCmjduaPkEFNX3+4yZew+dwPt/BbP2Ka0RfB
         Z3rJtuhPiFZqO2QY8r+vXVBOvNf2bjC+3z1R/jF24EAgBt/qrdB4umgxQCFO6irajnw3
         VZJJkfKqOpxGypE24yydvp9cUSa+KPfD2wIUAqw0P8LrD0Hn2zs+USzeNhMCbi21MHZW
         yVeyKPl6z7xKiJxS+TVSec+gc2ADDewQokEuh9viPrIeS+th2asVNTF7MbLNt/XypXTI
         LeeNEGGFVd2z/KmEi0Tu1+8xLAnjHHpG+3uPgkT0b52birmhgaKjj23e6X9alOrtK1Mk
         K51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=qhvdcf6WSWjfOi7rykq1lpRy42bDO1M9nDaJhKMG7iY=;
        b=fFgFDoFNx5Z5ZcyiMsTutlh+oDxo7yDHg/j+3YmAr1VQgKCpIaJOdyk1G/JHWKHgTA
         A5k5HhLo36uqGheOretkYw57qZsZivthncZngkdW/rnYmYccFjsCfdK5fhAgkC3AqhJU
         Io4DHo2QtHapzICOSZk5QlW4YppahpkLZR8iidLvKS9JHli4DVh8zuS3kfsKkHkq5N5j
         7T7UvXQGcm5bnRItK2OfUJwc+3h/anpgZVlHGejrAFN4kSATOJDXb4OLDrfoAnQGbls+
         jdAAgHyp0ooDMRr11XE25IQ7SEOjgF7r5dbuuq1MSah2tOAnQBxFUW7MmJS9jbsd3JhR
         OOLg==
X-Gm-Message-State: AOAM531AYlIc+h7gi2CVCW6VIouoWBEC7vW9A/pRE+mJbKrFgNYw7eIe
	DGuuPfXGQ847V60bF6+6czs=
X-Google-Smtp-Source: ABdhPJy3+yCeOKe0PIXXQFN+6Tl9vH+rUEREAVoJa2oACXsrqgCKZRRfmijrlV4C6FpDiw1fUXat6g==
X-Received: by 2002:a4a:e512:: with SMTP id r18mr3312470oot.40.1619189128916;
        Fri, 23 Apr 2021 07:45:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e183:e120:a0a1:83e4? ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id j7sm1386608otk.65.2021.04.23.07.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 07:45:28 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Gatesgarth merge request - April 23
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7aa614e7-a401-08e6-cd4f-bcf5c11f7958@gmail.com>
Date: Fri, 23 Apr 2021 07:45:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit c9815c86bfd63b2d9479915045197e7d315ef709:

  telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
(2021-04-10 07:37:44 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to 29ca52c7826ad3044b53ccb5224016bd73abdb5c:

  gpsd: backport d-bus message time patch from upstream (2021-04-18
20:03:23 -0700)

----------------------------------------------------------------
Hermes Zhang (1):
      gpsd: backport d-bus message time patch from upstream

Khem Raj (1):
      mariadb: Fix build on musl/ppc

Stefan Ghinea (1):
      hostapd: fix CVE-2021-30004

wangmy (1):
      mariadb: upgrade 10.5.8 -> 10.5.9

 .../hostapd/hostapd/CVE-2021-30004.patch           | 123
+++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.9.bb    |   1 +
 ...b-native_10.5.8.bb => mariadb-native_10.5.9.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   5 +-
 ...-stacktrace-t.c-make-the-test-conditional.patch |  38 -------
 .../recipes-dbs/mysql/mariadb/c11_atomics.patch    |  16 +--
 .../mysql/mariadb/ppc-remove-glibc-dep.patch       |  50 +++++++++
 .../mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb} |   0
 ...busexport.c-Fix-broken-d-bus-message-time.patch |  36 ++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb       |   1 +
 10 files changed, 222 insertions(+), 48 deletions(-)
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb =>
mariadb-native_10.5.9.bb} (100%)
 delete mode 100644
meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 create mode 100644
meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb =>
mariadb_10.5.9.bb} (100%)
 create mode 100644
meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch

