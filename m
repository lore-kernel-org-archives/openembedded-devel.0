Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B42C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 18:38:06 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.23117.1753036682897128045
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 11:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzQJC1Ht;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e1d8c2dc2so34296157b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753036682; x=1753641482; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dJmsUISLkicY04hvnBONlrFfjTMGSEJ6O90GJQ91sg=;
        b=HzQJC1HtkGpcePYWt8l/W+wby/6Fqt30g2iec6sC96HaRZjmVuTxvrLWe4BrJqCckY
         iEBJbtDDBMnkmX+pjaZxts6nI09A3aSDWnMzUcSCuSIeTcoSlMDHv4xXTOXcvcTJnUts
         CNLKUZ6/yc4DiJLR0wcWRJEg93vmoAr+Z1pSCysuVEPPHGpks9mNQmhwNY0cDCmWMNap
         c1fk1EtyG6tQH1SxoeI6GGtSgdY3CvLDKp1MatvzKnWc6cruUSMfRbJI7CR9Df7p8pCQ
         HJ1S6nDQ15nZ+BAIV+jNGOdYCIhxmzAzfxgo/jupGuMXExjaILW+7waAeaZ1J8P1r+HC
         hD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753036682; x=1753641482;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dJmsUISLkicY04hvnBONlrFfjTMGSEJ6O90GJQ91sg=;
        b=VtHK+17W4wkaAeveaxqJ/lA6bZkmBU6PLfKi/b0xbMKfzaVJUAqkINy9gvPdA2XNux
         OnK/pi+rozAJF3Kjt/ZjRP5gAiBmuv5B5WqBfRpcoBri1XiOe7j3ITs4QDyw+c/T78xK
         cKzmeAfTcdZL4AXCPGdi/yc4ZPD0hBqI6Eg9ZDuAScEpWwxRgjvyxTkteHMgPwsqclbV
         +Vets6beTM/7gf6ZKrXjcXvk1xo1416vWaIeYkMJBhokpjGWtCkvhL/q0c7qwc/z6qgR
         mad9b7cqlwBPK+d5wr3lgSECgqzfpHnIoR4jm+elNwOFWvVJRXCZgYxPe9mfJ2SkAWNF
         Mq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfSIIZtkPj7pq1aT9hjGvzrIx41v5gZ0LlF3KEYBxE7U1GmyqSOjKxrqfNoZFOTXdFK3idWCyeE4pDq4lP5GKdGfU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaA5Ppy7jVl2vtwPLkhzBsfD0GELYj1rUOoQie8l7v3r7WPSf6
	FuVXL9E2D9NzCnDgFz5G5/tdV21Bc1uPxzBwJ/WmFVMdmZqFZj09hmsV
X-Gm-Gg: ASbGncs6/fUUBBGi/V977a9Izbr2QgDW4/HRGWl8RDWOgWooDr8E+2jpK4Hs8PmlKDK
	j2nsn/5io6C2Y0n91C/PfinLOF3eRkXdrVxUHAA+BFq1F8t7brEonoJGGyF9iGZAgjgxGlxQl5O
	d16L7EJPExbdKVGxxCj72Hof1iybuZQs3ViIh9u4rXlqoEv5lT6dUtwwj5QG/ngQ8fJYSp/ttQ2
	QnJicbIrvWkwz/oErxKtkTheloasOIUUOOa4gLQYG741+qo/HEWf+6fDIwTSs/iVQpjZgppuAzH
	nv2AgNOOcq4iEfC0gdNaybEbJCDvmij9o7241EYV//OaqvJF9+iHtoM0DUxVrVzd/ICyMn18czE
	SsGCCocGLWbI/OiRi7ROYnVuMNfWI2aCtPGiIbA0cpmLlg6uX6nVc31MFfos6Mi0+JBFxegx4rq
	tzzj3mqGoK
X-Google-Smtp-Source: AGHT+IGA/cSzFbuTMLjUQF6AVYqUc0i4C4EluSZTXzJ0yScwkPBzLVEN+nFSl+r0nrTGWdl+ssB37g==
X-Received: by 2002:a05:690c:4c04:b0:712:d70b:45f0 with SMTP id 00721157ae682-7183751a9dbmr232399907b3.32.1753036681940;
        Sun, 20 Jul 2025 11:38:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:c250:6623:1070:2f22? ([2600:1700:45dd:7000:c250:6623:1070:2f22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71953145a83sm14945447b3.34.2025.07.20.11.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 11:38:01 -0700 (PDT)
Message-ID: <848eafbf-de50-4a28-87a0-6f30eadfa543@gmail.com>
Date: Sun, 20 Jul 2025 14:38:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: Kirkstone merge request: July 20th.
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 18:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118640

The following changes since commit 058249f9a836e3aa866436aa6e37d6d48ff768fd:

   libssh: fix CVE-2025-5318 (2025-07-02 20:42:48 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 06fc0278f10d630838d703dde707bbf0e2999873:

   poco: Fix ptests (2025-07-13 14:41:35 -0400)

----------------------------------------------------------------
Archana Polampalli (1):
       tcpreplay: fix CVE-2024-22654

Changqing Li (2):
       libblockdev: fix CVE-2025-6019
       udisks2: Hardening measure of CVE-2025-6019

Colin McAllister (1):
       jq: Fix CVEs

Hitendra Prajapati (1):
       open-vm-tools: fix CVE-2025-22247

Khem Raj (2):
       poco: Remove pushd/popd from run-ptest
       poco: Fix ptests

Peter Marko (2):
       spdlog: patch CVE-2025-6140
       poco: patch CVE-2025-6375

Sana Kazi (1):
       imagemagick: Fix CVE vulnerablities

  .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 383 
++++++++++++++++++++++++++++
  .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
  .../tcpreplay/tcpreplay/CVE-2024-22654-0001.patch               | 90 
+++++++
  .../tcpreplay/tcpreplay/CVE-2024-22654-0002.patch               | 35 +++
  meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb    | 2 +
  meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch             | 219 
++++++++++++++++
  meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch          | 69 +++++
  meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch          | 56 ++++
  meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch             | 46 ++++
  meta-oe/recipes-devtools/jq/jq_git.bb                           | 8 +-
  meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 +++
  meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb        | 1 +
  meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch   | 44 ++++
  meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch | 114 
+++++++++
  meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch   | 21 ++
  meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch  | 35 +++
  meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch   | 28 ++
  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb       | 5 +
  meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch           | 34 +++
  meta-oe/recipes-support/poco/poco/run-ptest                     | 7 +-
  meta-oe/recipes-support/poco/poco_1.11.2.bb                     | 10 +-
  meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch       | 35 +++
  meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb                  | 4 +-
  meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++++
  meta-oe/recipes-support/udisks/udisks2_2.9.4.bb                 | 3 +-
  25 files changed, 1321 insertions(+), 11 deletions(-)
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-22247.patch
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0001.patch
  create mode 100644 
meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2024-22654-0002.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch
  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
  create mode 100644 
meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
  create mode 100644 
meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
  create mode 100644 meta-oe/recipes-support/poco/poco/CVE-2025-6375.patch
  create mode 100644 
meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
  create mode 100644 
meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch


