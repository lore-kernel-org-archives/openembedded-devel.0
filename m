Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043BFC77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 12:50:46 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.66332.1684068640294415115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 05:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZzaLhrwv;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba6f8e0b39cso4009562276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684068639; x=1686660639;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEcSThOvRCGMdDpQXrCVM9bWlICOt98huuUqLS2k5xM=;
        b=ZzaLhrwvDV9gi08BVlhwgbl30l0H8a95lzXqkJkb7Bw56cBWsnwdDjq5Hqwv7WLOkf
         KmNR63Bm3Te08r1kn5AbYakpJWHyTFyRixf8c/T2cE2t93HVi3tnSMaJ3MXY6O3wa43K
         bvgFnC+umuFXpSuY9HCOdimYWGKzG+3489o//WoB/fC42hs9IFyTCN9KRLD8vPUXM8cf
         H4A1It/umtCUmeyIotJ+DKe2A8mNLQhSXuYFWdhAlt7QJ+8hZ/o+76MGJb5tuQcYesST
         NVhmYs1JrHNAk6MTRDczMrj1+tJ3wRI/7eTyB0ynGVrENOUBtMYYgBht2hQ2c1isZ0GA
         qvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684068639; x=1686660639;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEcSThOvRCGMdDpQXrCVM9bWlICOt98huuUqLS2k5xM=;
        b=jtDFm3u6q4gggwT7vC6bhTNfn9c/9rHpOpMHTc7QlDhfs6f6QS6NmHHcgvrbRAcJFi
         eF/YE4f4/76FnIAez0I3m6CjBkR5+qAH+QuvrWdmzbwVTui8WHaqjznDc5FNtiFHGabg
         SrO7BkRA/ryTEpBJppfX3iLdwy0RWxZ9VOzXI1mFSSaC8Mvp7mc+9Wevaih2TOlqE8GI
         EFnFh2wIlsvOt3pJNCjPxPagt1SbK3Oqnyc8io6rz7AnRlAueZrYE3Oa16NKD+UKfL+P
         kHsWQsr1/NQCKI8iR599aSgju6AFcH/VY6DKYb7Vwn1ozlyAbN4LdwmijdrqG/rzgUeA
         0yLQ==
X-Gm-Message-State: AC+VfDzhXdw4mIxNnQd85kpVsFUhLYAK984kLlvMVnfZHjTb3Whufnb0
	mizCFvG0vzeiWV/D7RtYcgs=
X-Google-Smtp-Source: ACHHUZ6xG1I1c5jvoXnh9Zn0i+e0DCvs/SBe7RMDBMvi148s+C2wOAt4SRJd7rWYF24LrmC5ucl2FA==
X-Received: by 2002:a25:3202:0:b0:ba6:ffa6:4b3e with SMTP id y2-20020a253202000000b00ba6ffa64b3emr6926548yby.2.1684068639280;
        Sun, 14 May 2023 05:50:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3335:7534:9f49:975c? ([2600:1700:9190:ba10:3335:7534:9f49:975c])
        by smtp.gmail.com with ESMTPSA id b12-20020a25b84c000000b00b8f6ec5a955sm6260424ybm.49.2023.05.14.05.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 05:50:38 -0700 (PDT)
Message-ID: <00cd0caf-b0ec-e755-3b17-8481ef2b8d17@gmail.com>
Date: Sun, 14 May 2023 08:50:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: May 14th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 12:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102565

The following changes since commit df452d9d98659b49888fa8a5428a0a8bd3e3aaec:

   redis: upgrade 7.0.10 -> 7.0.11 (2023-04-28 07:25:03 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 9e539aaed608a03b1128a7361426703d8f9ba705:

   capnproto: upgrade to 0.9.2 (2023-05-09 06:51:22 -0400)

----------------------------------------------------------------
Arsalan H. Awan (1):
       meta-networking/licenses/netperf: remove unused license

Bhargav Das (2):
       tslib: Add native & nativestdk package support
       pointercal: Add native & nativestdk package support

Changqing Li (1):
       redis: fix do_patch fuzz warning

Chee Yang Lee (2):
       tinyproxy: fix CVE-2022-40468
       capnproto: upgrade to 0.9.2

Gianluigi Spagnuolo (1):
       libbpf: add native and nativesdk BBCLASSEXTEND

Jasper Orschulko (1):
       python3-gcovr: Add missing runtime dependency

Narpat Mali (1):
       python3-werkzeug: fix for CVE-2023-25577

Valeria Petrov (1):
       apache2: upgrade 2.4.56 -> 2.4.57

Xiangyu Chen (1):
       pahole: fix native package build error

  meta-networking/licenses/netperf                                | 43 
------
  .../recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch    | 33 ++++
  meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb   | 1 +
  meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb                | 2 +
  .../capnproto/{capnproto_0.9.1.bb => capnproto_0.9.2.bb} |   2 +-
  meta-oe/recipes-devtools/pahole/pahole_1.22.bb                  | 1 +
  .../redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch} |   0
  meta-oe/recipes-extended/redis/redis_7.0.11.bb                  | 4 +-
  meta-oe/recipes-graphics/tslib/tslib_1.22.bb                    | 2 +
  meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb                   | 2 +
  meta-python/recipes-devtools/python/python3-gcovr_5.1.bb        | 2 +-
  .../python/python3-werkzeug/CVE-2023-25577.patch                | 231 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb   | 2 +
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 ++++
  .../apache2/{apache2_2.4.56.bb => apache2_2.4.57.bb} |   3 +-
  15 files changed, 311 insertions(+), 48 deletions(-)
  delete mode 100644 meta-networking/licenses/netperf
  create mode 100644 
meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
  rename meta-oe/recipes-devtools/capnproto/{capnproto_0.9.1.bb => 
capnproto_0.9.2.bb} (93%)
  rename meta-oe/recipes-extended/redis/redis-7/{GNU_SOURCE.patch => 
GNU_SOURCE-7.patch} (100%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
  create mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb => 
apache2_2.4.57.bb} (98%)


