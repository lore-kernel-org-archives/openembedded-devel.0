Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0485FEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:52:16 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.7692.1687427531044712064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 02:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UK9vzH94;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-400813cff23so419371cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687427530; x=1690019530;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUZQgRx1iVrwoJt0ATs11bp6YnctlJOduw6RfQgf2z0=;
        b=UK9vzH94oAbBACM7ChVRobFc30bNkyE3XGQzT604gJjZ1moSWHsmpBsKfwPTu7zFfL
         I/lIRe3DoOP5zS2WfdU/Y6azqCoaXyYegQQLVE0YQ+hQC56QSHBBireUCxHgdP+PY3cg
         KQIqmkW3CIlufOMD8y7ojUOhNyY7iZRoA3mv+EBmIELmuqORXMZ8q8WzL8BVcKxuxNIp
         WdADHVgaPFAcPPZA39e3GUwqZXDBoti0K8vYFRky8aoGEFWULLnF2TJMIQ9wMvJNoRKS
         6gG0qhmBYeD3WwFsgqlJ4Sp08GkdJxHOwihFOzXwXIsSvrdIelpknki4GvQqWhOVE9N2
         28dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687427530; x=1690019530;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUZQgRx1iVrwoJt0ATs11bp6YnctlJOduw6RfQgf2z0=;
        b=AcvTQ3/IWTf/1MY09MiEFs06YFC3Nb/6HwbF7sB7YhFAj7X6w3Fb8JzhT6HMo4W6XP
         ZlwElJncMNq9e02Iq757rlIaFtoNzJyVIP/3oAJ5UFT0VLDRUGhxhAwkXy9mVjxf+2Zr
         SQxgbuGi2BkGsgN2tZG/gyFRPEZRIni0AEaa/qsi97sMcQP7r9pRs+qDRzU4yPe/m9FU
         IC37GzijxDYJTOdTaanHIqMWxLGanBqOiFrtoTkfUCWtftX87J7CLwGFAtSX8fSBxOmK
         XihLgbhi7gicxVWYTBiDX2Z7HH3iJk6E47ldKAroIjDE4+szgtnO941JhMsIpqIJh69D
         1+qA==
X-Gm-Message-State: AC+VfDwspxcXpj+iXDyPDbHjhXS9ppCZ264mFdQ3q9C5M3WRWwkpF/mW
	jn6uoBNyXgyKfHhnCbYXoZE=
X-Google-Smtp-Source: ACHHUZ5gWr8q5V7ii9+EYAAZPmTgQgW5bZ/kJmzIUexkmqrOyqooCtn/3pcISgxDdCbj7vyN7tLMGg==
X-Received: by 2002:a05:622a:110a:b0:3fd:eca6:8aed with SMTP id e10-20020a05622a110a00b003fdeca68aedmr14752326qty.44.1687427529912;
        Thu, 22 Jun 2023 02:52:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:dc27:e982:11fd:2a21? ([2600:1700:9190:ba10:dc27:e982:11fd:2a21])
        by smtp.gmail.com with ESMTPSA id c22-20020a25c016000000b00bb144da7d68sm1469709ybf.13.2023.06.22.02.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:52:09 -0700 (PDT)
Message-ID: <5b6db4a5-9c0f-e83d-f6de-9ae7551aed56@gmail.com>
Date: Thu, 22 Jun 2023 05:52:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: June 22nd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 09:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103484

The following changes since commit bdad2a789e30703a825b876279665720d06d55dc:

   python3-werkzeug: fix for CVE-2023-23934 (2023-06-11 11:43:33 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d:

   ExprTk: Update package to release/0.0.2 (2023-06-19 09:17:01 -0400)

----------------------------------------------------------------
Adrian Zaharia (1):
       lapack: add packageconfig for lapacke

Arash Partow (1):
       ExprTk: Update package to release/0.0.2

Ashish Sharma (1):
       openldap: Fix CVE-2023-2953

Chen Qi (1):
       redis: use the files path correctly

Hitendra Prajapati (1):
       wireshark: CVE-2023-2952 XRA dissector infinite loop

Narpat Mali (3):
       python3-django: fix for CVE-2023-31047
       python3-django: upgrade 3.2.12 -> 3.2.19
       python3-sqlparse: fix for CVE-2023-30608

Peter Marko (1):
       c-ares: ignore CVE-2023-31124

Polampalli, Archana (2):
       samba: fix CVE-2022-41916
       samba: fix CVE-2021-44758

Polampalli, Archana A (1):
       samba: fix CVE-2022-3437

Polampalli, Archana ñ (1):
       samba: fix CVE-2022-45142

Soumya (1):
       opencv: Fix for CVE-2023-2617

Xiangyu Chen (1):
       meta-oe: add pahole to NON_MULTILIB_RECIPES

sana kazi (1):
       Googletest: Adapt googletest 1.11.0 with gcc11

  .../recipes-connectivity/samba/samba/CVE-2021-44758.patch      | 72 ++++++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch  | 77 ++++++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch  | 35 +++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch  | 50 ++++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch  | 57 +++++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch  | 37 +++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch  | 65 +++++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch  | 39 +++
  .../recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch  | 48 ++++
  .../recipes-connectivity/samba/samba/CVE-2022-41916.patch      | 38 +++
  .../recipes-connectivity/samba/samba/CVE-2022-45142.patch      | 51 ++++
  meta-networking/recipes-connectivity/samba/samba_4.14.14.bb    | 11 +
  .../recipes-support/wireshark/files/CVE-2023-2952.patch        | 98 
++++++++
  meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb  | 1 +
  meta-oe/conf/layer.conf                                        | 2 +-
  meta-oe/recipes-devtools/exprtk/exprtk_git.bb                  | 4 +-
  meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb               | 3 +
  .../0001-src-Do-not-reset-FINAL_LIBS.patch                     | 0
  .../0006-Define-correct-gregs-for-RISCV32.patch                | 0
  .../redis/{redis-7 => redis-7.0.11}/GNU_SOURCE-7.patch |   0
  .../hiredis-use-default-CC-if-it-is-set.patch                  | 0
  .../redis/{redis-7 => redis-7.0.11}/init-redis-server |   0
  .../lua-update-Makefile-to-use-environment-build-setting.patch | 0
  .../redis/{redis-7 => redis-7.0.11}/oe-use-libc-malloc.patch |   0
  .../redis/{redis-7 => redis-7.0.11}/redis.conf |   0
  .../redis/{redis-7 => redis-7.0.11}/redis.service |   0
  meta-oe/recipes-extended/redis/redis_7.0.11.bb                 | 2 -
  meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                | 4 +
  meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch      | 88 
+++++++
  meta-oe/recipes-support/opencv/opencv_4.5.5.bb                 | 1 +
  .../recipes-support/openldap/openldap/CVE-2023-2953-1.patch    | 30 +++
  .../recipes-support/openldap/openldap/CVE-2023-2953-2.patch    | 76 ++++++
  meta-oe/recipes-support/openldap/openldap_2.5.12.bb            | 2 +
  .../googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch   | 42 ++++
  meta-oe/recipes-test/googletest/googletest_git.bb              | 3 +-
  .../python/python3-django/CVE-2023-31047.patch                 | 352 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb   | 2 +
  .../{python3-django_3.2.12.bb => python3-django_3.2.19.bb} |   2 +-
  .../python/python3-sqlparse/CVE-2023-30608.patch               | 75 ++++++
  meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb  | 1 +
  40 files changed, 1361 insertions(+), 7 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch
  create mode 100644 
meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/GNU_SOURCE-7.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/hiredis-use-default-CC-if-it-is-set.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/init-redis-server (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/lua-update-Makefile-to-use-environment-build-setting.patch 
(100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/oe-use-libc-malloc.patch (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/redis.conf (100%)
  rename meta-oe/recipes-extended/redis/{redis-7 => 
redis-7.0.11}/redis.service (100%)
  create mode 100644 
meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
  create mode 100644 
meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
  create mode 100644 
meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.patch
  rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb 
=> python3-django_3.2.19.bb} (77%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch

