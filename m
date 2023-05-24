Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6248C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:43:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.10823.1684939418899128832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 07:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KGPVjCft;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so744675b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684939418; x=1687531418;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoJ4N4SGEEtjjtYHgJ0nqlvLBEykq6Jph6be9FMB/9I=;
        b=KGPVjCft4uP9XlfmH4zOkcky2/ya/tVwat83U4fGajZwRpKKu1jc9NnRhGvG6ff+5Z
         rGDg2LMWwuXKhtVljrVyEVNbOL8oIlCu6xnCZmTwg4N1LO+GShn/ySYYI+my2AYWYcsa
         zdUlt1OucIPhGK7RIRTpimYZAW4VHNOP/Myj8HTM9LU1KHBQwmHmofs/3DGs+4lfKpIa
         SOyUiTzsbLc5icRsFXGevTu6F92BpzN06sbLz2JQVHCXCXJdOK+qscLQLgR87IqDFIdo
         GaqXAaJKo2mvV2uLT6OA+IvCYwoJD8tY1glgtxBB79kVggXUrPDb4ckUDxFakGO23p5M
         vBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939418; x=1687531418;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZoJ4N4SGEEtjjtYHgJ0nqlvLBEykq6Jph6be9FMB/9I=;
        b=ivPc2xm/4DIER1lC7L1n66PPUVVdIcMWVsaf8JbyZmv6iRgG5gfuVUUgAQTo5wBf+q
         AF9WPonBVlO/PTLXVRwrCqg9k789vKVEdBZRpx8MxCnW12S6l96Ym9idp9tKVmR1/ZRs
         mJgs1JCiVzi0PG7jwMkj542A8oQ1D+eOsn0g3ikY2tTddB8091CSSyHzPz/DOtvNdE5M
         fj/xpR3qMp46qziXEzA120SyYpYwdDna16VEcUrJDeHsKhNQqWIwrB8jlcDRhcCrGiut
         We8Q+H5OScdlbQFlYPGJNk7/g0scc/A7DEnGD1F3QA+Y9Jqaz5qaJ0xh48iIJoaT2rPe
         oEEw==
X-Gm-Message-State: AC+VfDyDTTQAZcvLukwc045Wle+C2JL3WfD2LRnOU0iZ8S00Qj5nZV9j
	b/VnVwuKo46slel1Y4joDXM=
X-Google-Smtp-Source: ACHHUZ6uJP8v2TTlHel4LjWhwCXRAmeeM01xmfJ/7GnPvcrT8HopQY7tO0AJ3JCuadDF2EQQDzY/Lw==
X-Received: by 2002:a05:6a00:c92:b0:64f:4586:83fc with SMTP id a18-20020a056a000c9200b0064f458683fcmr3892840pfv.31.1684939418036;
        Wed, 24 May 2023 07:43:38 -0700 (PDT)
Received: from [192.168.153.47] ([12.32.73.67])
        by smtp.gmail.com with ESMTPSA id a14-20020a62e20e000000b00643889e30c2sm5359057pfi.180.2023.05.24.07.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:43:37 -0700 (PDT)
Message-ID: <e170e710-8558-0c1a-2ebb-6a09e8f3594c@gmail.com>
Date: Wed, 24 May 2023 10:43:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: May 24th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102781

The following changes since commit 9e539aaed608a03b1128a7361426703d8f9ba705:

   capnproto: upgrade to 0.9.2 (2023-05-09 06:51:22 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 5f120a926b0fcd55cfe7565bb7ddf23661cad498:

   libbpf: installing uapi headers for native package (2023-05-23 
23:12:51 -0400)

----------------------------------------------------------------
Chee Yang Lee (1):
       freerdp: fix CVE-2022-39316/39318/39319

Khem Raj (1):
       nodejs: Fix build with gcc13

Martin Jansa (1):
       abseil-cpp: backport a fix for build with gcc-13

Xiangyu Chen (2):
       Revert "pahole: fix native package build error"
       libbpf: installing uapi headers for native package

  ...1-absl-strings-internal-str_format-extension.h-add-mis.patch | 31 
++++++++++++
  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 1 +
  meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 75 
+++++++++++++++++++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb               | 1 +
  meta-oe/recipes-devtools/pahole/pahole_1.22.bb                  | 1 -
  meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb                   | 5 ++
  meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch    | 53 
++++++++++++++++++++
  .../recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch  | 41 
++++++++++++++++
  meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb                | 2 +
  9 files changed, 209 insertions(+), 1 deletion(-)
  create mode 100644 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal-str_format-extension.h-add-mis.patch
  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
  create mode 100644 
meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
  create mode 100644 
meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch


