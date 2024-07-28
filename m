Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35E8C3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 16:38:27 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.37728.1722184706990421820
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jul 2024 09:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8GwJjqu;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-67b709024bfso11000987b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722184706; x=1722789506; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC87plAp/S732/Xg7sSyRLdvcYj5IXBOtzoMjctIZdQ=;
        b=H8GwJjquxPTmjh3I+NpawxRilyVfDSEZp4zCyFnX9ntNQirCvcZLWDz+LRzzs5zYQR
         Fe9TqzQQEWeUDajD6o/r9fMeAQypY5apDWkoEidnix9OLzXuRncqQsfiJBR/IqSblNXA
         Q0o5BN8oZLRaxVxmTFiu8JG1awVT+5tqqJPvuI97hYx9qh4jmagtovPdU1w3DLThGAmQ
         4+jj+zSD0AwpoN+sTDL5EdAUwnCCZob47vBWrlro0xLJojiDvaB/uPCp2YcvtasLeOHM
         ENaYOhenL19KthvXz8U5gZm9yrxhnICr2J38j4kdatVOypF2WGzgnXWxd1u91TuShDdG
         5Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722184706; x=1722789506;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC87plAp/S732/Xg7sSyRLdvcYj5IXBOtzoMjctIZdQ=;
        b=o/IZ/1ahIAsf8eorNk3hmAEg0U5UrsgIbG+aOMbrbw+qBj7Fvi1lmLm+tR3TU2pyfS
         N5jVfXD53nO6NmlPp+DhvAvZGQiR/iKes5xdX/ahM6u3zQqZSbRbDy7LC6dhb0M03C9g
         cAVlVFqCzLi8IqgvYBTFJtfPF/S2tNl2nAmxGifJICyQlkNRqsJZGTjQCBuWP9QtufDD
         FqMOMtcNf8w5ltQrpDsIovjKl2Cp219OADAnr8qRPfwKm9CI9mmzAQat+V75ZfUPbstk
         EJE6IaG32OeqsEc/X5DXRbO3a1M8c66qC082JvWTzmnP+BltC+OPa+39Vat9kOdPK+nx
         jJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWikPLpz+gt3zuMv+uewdmDENYaZXFvhGFUUscIFX03oEPqxA/xMjU0REvfv6xIP5Gp12EN0Q40UPv+9Zjfz3Uaz0r39QVuh9gPJYC+JXF3L7GWFcaQaaGtyQ==
X-Gm-Message-State: AOJu0YxQwvYEanPyzvimLyREjSQYggbvGkFgvZPMDnaaGdZ63ERTEk/j
	nhpMP9st/V1+beYeJCqBMC/hh7TC8L3BsVKKdQxBXccOuJr+ZCVp
X-Google-Smtp-Source: AGHT+IEIAsIA6IHZbunzY8qk7lQjEj7XWya7vFXvelHvKghI0OJMRM1I1Ua1hha1D18642H5D4lySQ==
X-Received: by 2002:a81:9145:0:b0:660:56fb:7f00 with SMTP id 00721157ae682-67a0adc957bmr43952617b3.46.1722184705947;
        Sun, 28 Jul 2024 09:38:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:30bb:405a:cac7:4461? ([2600:1700:45dd:7000:30bb:405a:cac7:4461])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756bab4d1csm16930067b3.125.2024.07.28.09.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 09:38:25 -0700 (PDT)
Message-ID: <a372049d-8ded-4723-ad78-74568c42e845@gmail.com>
Date: Sun, 28 Jul 2024 12:38:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: July 28th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 16:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111451

The following changes since commit 18f939a5fb37528a5415b05077ece383c346a119:

   libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage 
(2024-07-09 08:18:46 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 80e01188fa822d87d301ee71973c462d7a865493:

   nftables: change ptest output format (2024-07-23 15:24:57 -0400)

----------------------------------------------------------------
Alexandre Videgrain (1):
       openbox: fix crash on alt+tab with fullscreen app

Jiaying Song (2):
       rrdtool: Fix do_populate_sysroot QA issues
       nftables: change ptest output format

Martin Jansa (2):
       bolt: package systemd_system_unitdir correctly
       giflib: fix build with gold and avoid imagemagick-native dependency

Neel Gandhi (1):
       v4l-utils: Install media ctrl header and library files

Randolph Sapp (1):
       opencl-clhpp: add native and nativesdk

Vijay Anusuri (1):
       wireshark: upgrade 4.2.4 -> 4.2.5

Yoann Congal (1):
       packagegroup-meta-oe: fix lvgl inclusion

  meta-networking/recipes-filter/nftables/nftables/run-ptest      | 8 ++-
  .../wireshark/{wireshark_4.2.4.bb => wireshark_4.2.5.bb} |  2 +-
  meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb                          | 4 +-
  meta-oe/recipes-core/opencl/opencl-clhpp_git.bb                 | 2 +
  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      | 2 +-
  .../files/add_suffix_to_convert_binary_used_in_Makefile.patch   | 42 
----------------
  .../giflib/0001-Makefile-fix-typo-in-soname-argument.patch      | 34 
+++++++++++++
  meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb                 | 8 +--
  meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb               | 5 ++
  .../0001-Fix-list-traversal-issue-in-client_calc_layer.patch    | 56 
+++++++++++++++++++++
  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb               | 1 +
  ...1-media-ctl-Install-media-ctl-header-and-library-files.patch | 78 
+++++++++++++++++++++++++++++
  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb         | 1 +
  13 files changed, 192 insertions(+), 51 deletions(-)
  rename meta-networking/recipes-support/wireshark/{wireshark_4.2.4.bb 
=> wireshark_4.2.5.bb} (97%)
  delete mode 100644 
meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_in_Makefile.patch
  create mode 100644 
meta-oe/recipes-devtools/giflib/giflib/0001-Makefile-fix-typo-in-soname-argument.patch
  create mode 100644 
meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch
  create mode 100644 
meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patc

