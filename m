Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBA2C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 11:13:02 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.19071.1684235576132711428
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 04:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=A5Qg4cG7;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ba7bf25a010so3579891276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684235575; x=1686827575;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtQh2nXM5bZzI06UgvZWw/NyV0jlUUpFNDirGQkE66E=;
        b=A5Qg4cG73sgBFYxCETaJJbezlWK3TTwI00Xa5fz+WGsMkhHVdI+TvwaPnIPh1/z3jd
         WP1ITVlD+YZu4S9HbVl8otHoFdh9vETmhzYqoky+DFDAjlM2mOrPBUhKp+YGl1G9XqV8
         ZFH8UVq8IhTzZ/M4RBnIVeOE4oXJ/T/rPznLDMtGbIWOzUL6r/GfaolVd4JYFV112zYP
         2ferzemlJ9o2Ajs612sPNVxER12tYyRSW8mz0SoPiabFEDpfobViR5WHm+5WxOyeKdjM
         1N6EaSWdEXwM4KPxu+kP3kB93zxx8hrxV5OAklq1c8Ch84fV5hX+f+JfWPX5p56QzuT6
         2fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684235575; x=1686827575;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BtQh2nXM5bZzI06UgvZWw/NyV0jlUUpFNDirGQkE66E=;
        b=YuJweGJO3hfquWLDEtidhDIpg7rZ8XHj3+BVCG2vB/kDsGY1F4ijax70dIKJeXldt8
         dPmofdXv14FO5T6nXsld8z5sGJ4R5svtkej0wKWqntqyTsSTrSy6BJ3fKz0c/SXXdqfw
         9Rqwxgv/7deX5bXV+z7xRFXRPcyKsGFUZbTiWRYizBzuIOzwCA1xMo88Q40TesFtdLML
         Le4RxEqSydTTdsLLCfe90hugJzuTHDebzN5CWpiLDyw6eoKGT8UkYtaVVUBItL+tin/x
         GQMZL26zr8J5dc2zZLEOkBUhgxo1KWKr/CC4vhxdgvcoNSrVMacKHNMXhTMtlOanSogk
         7NYg==
X-Gm-Message-State: AC+VfDxOJVTdZP9s32gquToZOiLBXLxjvKHdBucXmcSNM4YXZpDz3EqB
	HBoZyjiOlj7OIMLOJ86oiX8=
X-Google-Smtp-Source: ACHHUZ5AlCsdOKkxSs0tH87s4ySdJhfahWICVug7OugGucSURDv2C30j22W18E+f2il9eaMc/oEVnQ==
X-Received: by 2002:a25:ab53:0:b0:b73:5908:5388 with SMTP id u77-20020a25ab53000000b00b7359085388mr32571309ybi.49.1684235575063;
        Tue, 16 May 2023 04:12:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:d39b:358:15bd:3174? ([2600:1700:9190:ba10:d39b:358:15bd:3174])
        by smtp.gmail.com with ESMTPSA id g5-20020a255205000000b00ba72da47017sm396625ybb.60.2023.05.16.04.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 04:12:54 -0700 (PDT)
Message-ID: <095ad873-2d15-5f66-52fc-5c4e34be3348@gmail.com>
Date: Tue, 16 May 2023 07:12:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: dunfell merge request: May 16th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 11:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102626

The following changes since commit e39b002df9675776cc99dccdcac07607ce783b15:

   multipath-tools: CVE-2022-41973 Symlink attack multipathd operates 
insecurely (2023-05-05 07:20:59 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee:

   nodejs: make 14.18.1 available but not default (2023-05-16 07:09:25 
-0400)

----------------------------------------------------------------
Jack Mitchell (2):
       nss: backport fix for native build failure due to implicit 
casting with gcc13
       nss: backport fix for native build failure due to dangling 
pointer with gcc13

Narpat Mali (1):
       nodejs: make 14.18.1 available but not default

Valeria Petrov (1):
       apache2: upgrade 2.4.56 -> 2.4.57

  ...01-Disable-running-gyp-files-for-bundled-deps-nodejs14.patch | 22 +++
  .../nodejs/0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch   | 40 
++++++
  ...0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14.patch | 27 ++++
  .../nodejs/nodejs/0002-Using-native-binaries-nodejs14.patch     | 62 
+++++++++
  .../0003-Install-both-binaries-and-use-libdir-nodejs14.patch    | 84 
++++++++++++
  meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch | 21 +++
  .../nodejs/nodejs/mips-less-memory-nodejs14.patch               | 32 +++++
  meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb               | 205 
++++++++++++++++++++++++++++
  ...1-Bug-1812671-build-failure-while-implicitly-casting-S.patch | 46 
+++++++
  ...1-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch | 75 
++++++++++
  meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 2 +
  ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 +++++
  .../apache2/{apache2_2.4.56.bb => apache2_2.4.57.bb} |   3 +-
  13 files changed, 649 insertions(+), 1 deletion(-)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-nodejs14.patch
  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
  create mode 100644 
meta-oe/recipes-support/nss/nss/0001-Bug-1812671-build-failure-while-implicitly-casting-S.patch
  create mode 100644 
meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch
  create mode 100644 
meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb => 
apache2_2.4.57.bb} (98%)


