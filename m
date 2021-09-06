Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.22906.1630939692486513300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FqBwjaph;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id w7so6996386pgk.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Sep 2021 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=tpOkvmPgQ0DHthH3Awcu30R5gTOem9ZSom71SY0youU=;
        b=FqBwjaphwgbGd0v/GgYDQdLzJa3cYdBOUqIi4T1lBLdS0Dz+dJfQO+blYJxAaP/Rue
         uZf9x4bNwi7sNKmHuhP0mo4qZKFQSJNNeRlHZRDQ398D7/kgBK/vI1kIzJdfo+OuYjQa
         M4oI8zxUnlOC4FCFFHZxKOsGi7BAW5kIgIzzt2V2OlGc+5xYgK7AlrHOIHFgNiYeG03V
         4qZYoqDl2zaDodX4XdOke+Tqt/3it733X3bMWRceb3Ip+6Y6glwxkDp0VCgHOuNZ79DB
         NeCOT5gHWtSsHamiFbNBWRchL9kCvHx7/Vxm8rd3bvymI9+a0BHwflhytbmngk/d2kfe
         X7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=tpOkvmPgQ0DHthH3Awcu30R5gTOem9ZSom71SY0youU=;
        b=Kwt21BVswiBXP4Mz6AeSFdTPiO2X12GTdm/CB6RwCF9RsgNjmorFnldOqmk1L0vgi8
         oYZxP+e2N2PxNl0XZTcLQG0LaO+7odVzfiOeJGoom9p3IVSmIKOc6J5p26pV7EHolzhi
         3YqavFmidYizYiqiaebkdePXv2O9QYGKfy1opY3Katej96ciHuhWLcS78JQaHgc5p9xF
         TIin4wIg9fbCdTJ+JbjF1P/jpvyA+N0pa4Q/81cT5bqhfDX1stfH6C1d+xyYcNXd/MHF
         VtTcOX+zArTNGqilr9MwSs8bIvwcHVDHj1Z5KFjigRysTZnBh6vMmDvgg/5kEPC2z3Qe
         EQIg==
X-Gm-Message-State: AOAM531gBRfe6Mw5VAeRLioN0p0/quDbYlAh7V5DM6E/72zHq0kYvYmf
	3OO2nzuA5uaZ19uFRQ2Wt+o=
X-Google-Smtp-Source: ABdhPJx5EYGTJViOZ7ib5wDGvmB/NkQWXo3tTHqgm/vlpNsnQCERX630lS1iD0Gn7jna6nOj2hzg4A==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr12773580pgk.448.1630939691995;
        Mon, 06 Sep 2021 07:48:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:352e:86c8:8f80:ca55? ([2601:202:4180:a5c0:352e:86c8:8f80:ca55])
        by smtp.gmail.com with ESMTPSA id c15sm7729303pfl.181.2021.09.06.07.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 07:48:11 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request Sept 6
Message-ID: <bb99eff8-23b6-63e0-4a72-505555b6074d@gmail.com>
Date: Mon, 6 Sep 2021 07:48:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 5741b949a875b07335d4920aefa6defd13ed45c6:

  gd: fix CVE-2021-38115 (2021-08-26 19:18:35 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 7bd7e1da9034e72ca4262dba55f70b2b23499aae:

  dlt-daemon: update from 2.18.6 to 2.18.7 (2021-09-04 10:39:29 -0700)

----------------------------------------------------------------
Changqing Li (1):
      apache2: upgrade 2.4.46 -> 2.4.48

Gianfranco (1):
      dlt-daemon: update from 2.18.6 to 2.18.7

Joe Slater (1):
      nginx: fix CVE-2021-3618

 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch        |  43
+++++++++++
 .../dlt-daemon/{dlt-daemon_2.18.6.bb => dlt-daemon_2.18.7.bb}   |   7 +-
 .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          |  45
------------
 .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          |  49
-------------
 .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          |  39
----------
 .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          |  35
---------
 .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          |  66
-----------------
 .../apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb}            |   9 +--
 meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch    | 107
++++++++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb              |   2 +
 10 files changed, 158 insertions(+), 244 deletions(-)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =>
dlt-daemon_2.18.7.bb} (93%)
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
 create mode 100644
meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch

