Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.9213.1620307402002996822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 06:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=esW8tQxC;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so3456325pjb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=QIOkXpfUmsR0iVkBrIwHg/9HWksEv6Pr5IT6j2KeRu0=;
        b=esW8tQxCsmqkLgasFQE3eDc3m3CDxQfz5N+DL25kX12Yw3IxW0Pg/Yg+VzfU2DJYTK
         shM3sEVRegJUHOYE+LjkFb7o2ia5s6qSpN7T4mQ3gGHXZgOXWsdjXdG+ssWLoi0rnzSq
         Ke/dkGtLBErzOxim+PMPdlc+kdo70jff3jVl06sRiYtTuk3dVGa4WFqfGs/DqOAiv12O
         0PZegPGHdlR8M2BKMbIKTEUzyE8Dp9lRU4KRhPXoKKZpiHbgK8KGN1NR768+0xfndhP8
         LXl3eSpZjJeQWthS1qnR3tDQj0q+YZ4BE9C0D2BQewn+Ek6tz5jG+ouOIEqOyBzL+piv
         Wnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=QIOkXpfUmsR0iVkBrIwHg/9HWksEv6Pr5IT6j2KeRu0=;
        b=sEcDayQ65m5QnN2qFw2+C0ofhH6BxQqGNHyRBuY9raXIiOpBzFmF4jQze/7eEL7J6X
         zu72Oi7F2DHOKsWjdD92wh1eXKDFD5Aa0+tDaw2+cjeW4G++RiLs+vDCPRiMvI3eopXK
         X3oWuaXopThOB9B06vvfA6zMeRRvecqkPqlaM3Jsml+BunBAjK2F9A8lEGp48dr/kKjX
         lAuHE07MXiAP8s2ip9GgNBm/TmI4RbCFnjngRRKSWSXcNOHdcitjiNnJQm5AZk+13+MA
         6QVG4HKD8noEIqucDoPqp79jH4qPJtMUaTk/qYOKwnod/9DoTQk8S3PNQ00aEwqcBmSm
         whSA==
X-Gm-Message-State: AOAM531Ga9lhL+ar55sKLp44nV50fPgS3M5UxeKXPQboXIUGsQaZWGpm
	lSZPvea2ur0gGabIDUMokqU=
X-Google-Smtp-Source: ABdhPJwnm7reInq4yD5tKqTTPh6VyufP42CaGcqLlT2wIeMKt5TYZ9o5negXv2jTTXQGGR3N4ekS3A==
X-Received: by 2002:a17:90a:f283:: with SMTP id fs3mr18661783pjb.122.1620307401485;
        Thu, 06 May 2021 06:23:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:899e:2fa0:8320:d89b? ([2601:202:4180:a5c0:899e:2fa0:8320:d89b])
        by smtp.gmail.com with ESMTPSA id k12sm2046877pgh.16.2021.05.06.06.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 06:23:21 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott-next merge request
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <e2bc5e89-5b18-177d-a0f2-75cc6d0b0774@gmail.com>
Date: Thu, 6 May 2021 06:23:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 71b546ed8595b14d29efc1e8b951f8c845ad10c4:

  python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to c3a36263f91e42302ad7c347e051cf1cd83e39f6:

  packagegroup-meta-webserver: remove nostromo from pkg grp (2021-04-29
18:57:25 -0700)

----------------------------------------------------------------
Armin Kuster (2):
      nostromo: Blacklist and exclude from world builds
      packagegroup-meta-webserver: remove nostromo from pkg grp

Kai Kang (1):
      freeradius: check existence of openssl's commands in bootstrap

Khem Raj (2):
      tbb: Re-introduce PE
      gimp: Disable vector icons on musl/x86

Leon Anavi (3):
      python3-pysonos: Upgrade 0.0.42 -> 0.0.43
      python3-asttokens: Upgrade 2.0.4 -> 2.0.5
      python3-hyperframe: Upgrade 6.0.0 -> 6.0.1

Sinan Kaya (1):
      zram: add support for mem_limit

Yi Zhao (1):
      gvfs: rdepend on gsettings-desktop-schemas

zangrc (4):
      networkmanager: upgrade 1.30.2 -> 1.30.4
      libdvdread: upgrade 6.1.1 -> 6.1.2
      redis: upgrade 6.2.1 -> 6.2.2
      nss: upgrade 3.63 -> 3.64

 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb       |  1 +
 meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb       |  2 ++
 .../check-openssl-cmds-in-script-bootstrap.patch   | 38
++++++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb                |  1 +
 ...kmanager_1.30.2.bb => networkmanager_1.30.4.bb} |  2 +-
 .../redis/{redis_6.2.1.bb => redis_6.2.2.bb}       |  2 +-
 meta-oe/recipes-extended/zram/zram/zram-swap-init  |  5 +++
 .../{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb}   |  4 +--
 .../nss/{nss_3.63.bb => nss_3.64.bb}               |  7 ++--
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb        |  2 ++
 ...rframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} |  3 +-
 ...ttokens_2.0.4.bb => python3-asttokens_2.0.5.bb} |  2 +-
 ...pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb} |  2 +-
 .../packagesgroups/packagegroup-meta-webserver.bb  |  1 -
 .../recipes-httpd/nostromo/nostromo_1.9.9.bb       |  3 ++
 15 files changed, 63 insertions(+), 12 deletions(-)
 create mode 100644
meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
 rename
meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.2.bb
=> networkmanager_1.30.4.bb} (98%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.1.bb =>
redis_6.2.2.bb} (96%)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.1.bb =>
libdvdread_6.1.2.bb} (71%)
 rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (96%)
 rename
meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.0.bb
=> python3-hyperframe_6.0.1.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.4.bb
=> python3-asttokens_2.0.5.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.42.bb
=> python3-pysonos_0.0.43.bb} (79%)

