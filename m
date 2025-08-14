Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDBDCA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 18:12:04 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.29362.1755195117556617902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 11:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AzrMfTtQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931cab24efso1293562276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755195117; x=1755799917; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKLAGTEZGaEay5jFO3J7QHTFrTY00qB/cgL5PjY1tQI=;
        b=AzrMfTtQe3YnLUbYSMrTpIsyvlXyaoibmSXNiD+/VNzeZrKgsBdhQ3/LSUNQMhEvpZ
         PYMSERJnrnNjsKquNsulg3SYAKrdTowKe+mC1cusq5EJZbvrg8qA2m2888s1oUs36tA3
         CPZgQDkSmLmmNZTvjOxrkJNADAuZxC+fv4ynzK8r3zEoUsgDdI9yHa1w8JJ1IAgb/SIa
         K98Y5ISN5sWYrVnulCtd9EFRfitb5mg+DPqpRMzjAYOzsJ7HQ+vB8R975jYYe4WQDXl1
         WgLxSFLXWYVA8wWiNqbc+iXUV98N7mD8oIls3W8vveVw+OhpMpoFH2XfhoNCSmGKUCBj
         xW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195117; x=1755799917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKLAGTEZGaEay5jFO3J7QHTFrTY00qB/cgL5PjY1tQI=;
        b=K1WoYxeTfymFucwc/91YkZQ/rwZYnAILnb/quLPOGKkxxISFZMEVsuvmmAXeI/z49Q
         8HHtNH36sbnpl6sfH/qNzGlKbGLlTWkqAe/Sv+P1mH7Gz1g4QSUbQaPvOzoJATR5e08J
         IdxvMo60L3DCKg8hnFtAa6KXVsM7r81tAW490xFxfA3ICRZgqZqmbkNromfyJa+l8cP8
         L8ojmRjrTzlmV/s+bkCVImAHDrPWQ+rHXZS9Ny7bEBO3F7oKAitzSRY+80uEXBgM+Eyj
         w3WVMTCMhH+dGXj5lG4yF/uMNax0Nio0cLT3MWllgFhIF0ap8TBVf9GyqIgiRCh8fL4i
         7v9A==
X-Gm-Message-State: AOJu0Yx/W4TqVvRsFSK/8k+s413fPbG7eO+7j3hFsIS/PGd7LsI1QPvb
	jt9Qo5mCKr69h0a2xu65aL98gWSBrVQuWvVg94gIXrKAEfSPNT2wkv4wcGVanfXArWlwPbY6efb
	TwZTwObgfqF+QCYRBvHteDtEUYz8F93U=
X-Gm-Gg: ASbGncviE1eZjHkKHJ47FV54XAg2LlNCZUAQBi6Kl5luNZ3j6eAqpH4z5VdkKpQEutb
	shE8OOtONQK3yfkhFrAEPLCyk+l4caKg2GLxm018vPrvY3QJV/TalPVuyM3Y/FRfjybKaLM9o1l
	GjPYwaw+1NUAk/3qWlVXCb1HnJEB7pYbwTl08W5LgO3cqoGqXwW3P5NdSf0tOGZB0mMeRn4xKVz
	iBJlWsuwIMiAfM59OE9n1999+BO7KnEwnhQ
X-Google-Smtp-Source: AGHT+IGRHEhlsmg+fe6H+vlFf0Bqr1btJR7SKRhl5hrZYfsHnG4/A5l8HWJMC4KyOG6AiqOIhYF3e07iskOUUk4FHA4=
X-Received: by 2002:a05:6902:5418:b0:e8e:124:5a3d with SMTP id
 3f1490d57ef6-e931e161e77mr5115017276.17.1755195116405; Thu, 14 Aug 2025
 11:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <9e3f12ac-a97b-4592-ab0b-fe720a5692f2@gmail.com>
In-Reply-To: <9e3f12ac-a97b-4592-ab0b-fe720a5692f2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2025 11:11:28 -0700
X-Gm-Features: Ac12FXyONYUVaJwnVKS_Tqpv4fQS1xJCry40XBJ2CshWN90adyG5P_ipXG6rjpI
Message-ID: <CAMKF1srzycEMwaw3V2ABvKLfETpV9vchc=jC45EhnYg1y8Cy8Q@mail.gmail.com>
Subject: Re: Scarthgap merge request: Aug 14th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 18:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118942

Hi Armin

Applied

Thanks
-Khem

On Thu, Aug 14, 2025 at 10:14=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit e8fd97d86af86cdcc5a6eb3f301cbaf6a20849=
43:
>
>    xfce4 update HOMEPAGEs (2025-07-10 20:29:57 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 205638f9edf8e1aa1fbcf28555625fe56f2701a5:
>
>    poco: patch CVE-2025-6375 (2025-08-02 13:37:04 -0400)
>
> ----------------------------------------------------------------
> Guocai He (3):
>        thrift: correct the SRC_URI
>        softhsm: correct the SRC_URI
>        mariadb: File conflicts for multilib
>
> Gu=C3=B0ni M=C3=A1r Gilbert (1):
>        mbedtls: upgrade 3.6.3.1 -> 3.6.4
>
> Hitendra Prajapati (3):
>        redis: fix CVE-2025-32023
>        libssh: fix CVE-2025-5351 & CVE-2025-5372
>        open-vm-tools: fix CVE-2025-22247
>
> Jinfeng Wang (1):
>        postfix: fix rootfs file difference
>
> Peter Marko (5):
>        libcoap: patch CVE-2024-31031
>        spdlog: patch CVE-2025-6140
>        minifi-cpp: patch spdlog CVE-2025-6140
>        poco: ignore additional failing tests
>        poco: patch CVE-2025-6375
>
> Swamil Jain (1):
>        kmsxx: Revert to using original name for kmstest
>
> Vijay Anusuri (2):
>        proftpd: Fix CVE-2023-51713
>        apache2: Upgrade 2.4.62 -> 2.4.64
>
> Wang Mingyu (1):
>        mbedtls: upgrade 3.6.3 -> 3.6.3.1
>
> Yogita Urade (2):
>        mariadb: upgrade 10.11.9 -> 10.11.12
>        poppler: fix CVE-2025-52886
>
>   .../mbedtls/{mbedtls_3.6.3.bb =3D> mbedtls_3.6.4.bb} |    7 +-
>   .../postfix/files/0006-postfix-add-preliminary-setting.patch    | 31 +
>   meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb |    1 +
>   .../recipes-daemons/proftpd/files/CVE-2023-51713.patch          | 278 +=
+
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb |    1 +
>   .../recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch       | 82 +
>   meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb |    1 +
>   .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 378 +=
++
>   .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb |    1 +
>   .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb |    7 -
>   meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb |    2 +-
>   .../{mariadb-native_10.11.9.bb =3D> mariadb-native_10.11.12.bb} |    0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 11 +-
>   .../mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch  | 43 +-
>   meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch               | 13 -
>   meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch    | 43 -
>   .../mysql/{mariadb_10.11.9.bb =3D> mariadb_10.11.12.bb} |    0
>   meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch   | 35 +
>   meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb |    1 +
>   meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch | 218 +=
+
>   meta-oe/recipes-extended/redis/redis_7.2.8.bb |    1 +
>   meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb |    2 +-
>   meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch       | 38 +
>   meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch       | 150 +
>   meta-oe/recipes-support/libssh/libssh_0.10.6.bb |    2 +
>   .../0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch  | 21 +-
>   meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 +
>   meta-oe/recipes-support/poco/poco_1.12.5p2.bb |    1 +
>   .../recipes-support/poppler/poppler/CVE-2025-52886-0001.patch   | 4325
> +++++++++++++++++++++++++++
>   .../recipes-support/poppler/poppler/CVE-2025-52886-0002.patch   | 58 +
>   meta-oe/recipes-support/poppler/poppler_23.04.0.bb |    2 +
>   meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 35 +
>   meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb |    4 +-
>   .../apache2/{apache2_2.4.62.bb =3D> apache2_2.4.64.bb} |    2 +-
>   34 files changed, 5722 insertions(+), 106 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb
> =3D> mbedtls_3.6.4.bb} (94%)
>   create mode 100644
> meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminar=
y-setting.patch
>   create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
>   create mode 100644
> meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-31031.patch
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-2224=
7.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb =3D>
> mariadb-native_10.11.12.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb =3D>
> mariadb_10.11.12.bb} (100%)
>   create mode 100644
> meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
>   create mode 100644
> meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-32023.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-5351.patch
>   create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2025-5372.patch
>   create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patc=
h
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0001.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-52886-0002.patch
>   create mode 100644
> meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb =3D>
> apache2_2.4.64.bb} (99%)
>

