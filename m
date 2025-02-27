Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71040C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:53:59 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.9863.1740660831288783606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iC1L3y0Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fcd8090fe7so7231447b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 04:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740660830; x=1741265630; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8b+hHA8UhiFbeCbWLWn8uBKFt+glmyhPYejIa+k2sQ=;
        b=iC1L3y0YgVW+2qs06Yz7O2S0mQHItHPK2Zx7U8onar/Xr4QBC5q27EqXhy4peK5nqu
         mbxp1TrfnCBxQuxNCek5toyDMtTLLgbEPYopdHaf/MWNWuKJh0mlrh3EEH1BerO4oqpr
         mrkk8tXVv5lKD0ygjREVfVOGKd//VNN3vG7UQ/M8iI/PkgZQApnkv29FHQnGTooCVW+e
         9yE6DaHiw+RRKfFM+XaYmHKYq+9aIIgO/yuNSzTm1R9c8SJpo5RVVqXh66uYoMSwCMyP
         nvNghrB/svOZlHaJtU7mwOSmQ38BQPjyDgwzvMOeCoTFl2VbKIHLVqcbO/1irkql4y9l
         FP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660830; x=1741265630;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8b+hHA8UhiFbeCbWLWn8uBKFt+glmyhPYejIa+k2sQ=;
        b=a29jMpVxQE5B1fYUezLEsF2UJ5WfQQV+3WNFa7QuD8DctFGKeykRPOgMMa2cu1RHso
         vxvTvnhTq3utj0ZYn9/K5RFWS7IX4p09HXbKxO5JWXkljYsPFfSjLNI/i0d+Sjpd22PM
         Jf9oyFcvPHJCe7n8mwdkHmIOj82mBWfwF+YqX32yB6tyKsmXz9gbY263/SMkFaqs6eYn
         0ReSiv0C7EEfOKszJHb8BX4PZeDuu74iiyqpmYcerP/qHErO606QXdcO1IUh9NPUhtVW
         PH9c910kdmO2acziptRWSkPaVGvgEs/uz7YLZhoV9mD0y5ruOEVtYg0tV/tbkJvtlCNR
         dcaA==
X-Forwarded-Encrypted: i=1; AJvYcCXz19HgupRNK9/3JWY1/UTmGdtcFx5HSbwyuzIdWEDgLlgjSWRWaiBuoP3GL7zkBDTjBS7kO9Dn5GL/ACFCuTHmvqA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBVbXk1NA/DC38jyECBhvzyCry/OV+4K9vOl89EUt9WBzfFCHq
	ZiP8rrxLpyXWtG/40VnoZXiMGwDMSpDcOIwM+zn3pN2QyYmPaLMZ
X-Gm-Gg: ASbGnct9+WAd1oUKI56gvuZ9keFSahi6m1zz2Ehwhjpw48zTNgn2Dmh6N02Fev5Jri/
	DhT/4D8FoFa/PKw4fKu2eykNJ/S1Zf652O4pWTLcPDGetJa9PYzL/MMBTqfnBg/BMNEXa/lVieb
	IpvqAgmMpkl3xfxOR0uliv4PHb+K5SgQShl0wOLGqKsBXarUl97wlGH92KtXPvvHP7p50whi2PB
	g/SpOkzld7YB8sSYOEUmrGAGjDLatbcZ9810c3K10+crVaTaY5z0c7bB2w4/JtzCgmJ6/FYkKtE
	HVBuZJ93oXAouACnG6EufBRHxgrcVrelwhxVuU4/gOtgAdTFVf9kgD3vYCUfN69fQDbtADqrQHD
	SpA==
X-Google-Smtp-Source: AGHT+IFrtdCI1zdHBtBQ0s53tvJAnvoCxGoP7pqRRF+bpZ0AqHJTxc8NUrYx2ob9sYzev34XrNEKGg==
X-Received: by 2002:a05:690c:4885:b0:6fb:a376:3848 with SMTP id 00721157ae682-6fd10b183ddmr107632067b3.34.1740660830425;
        Thu, 27 Feb 2025 04:53:50 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:5ead:a50c:2cdd:8974? ([2600:1700:45dd:7000:5ead:a50c:2cdd:8974])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3cbc5ac9sm2624877b3.121.2025.02.27.04.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:53:49 -0800 (PST)
Message-ID: <56818ccb-b03d-4ed9-a7e1-267876ef8cb5@gmail.com>
Date: Thu, 27 Feb 2025 07:53:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: styhead merge request: Feb 27th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 12:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115689

The following changes since commit 6851cbf026088a13b2b45f684838d3dc4d7ccfdd:

   lapack: fix buildpaths in ptest also when CBLAS is enabled 
(2025-02-04 14:29:37 -0800)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded styhead-next

for you to fetch changes up to c93994f1bb601c57548b588d4f77a044d90822cf:

   sip: Upgrade 6.8.3 -> 6.8.6 (2025-02-25 08:45:21 -0500)

----------------------------------------------------------------
Leon Anavi (1):
       sip: Upgrade 6.8.3 -> 6.8.6

Peter Kjellerstedt (5):
       ebtables: Remove the dependecy on bash
       tbb: Re-enable hwloc support
       lvm2: Remove a lingering reference to ${PN}-udevrules
       libeigen: Remove LGPL code
       licenses/MINPACK: Remove

  .../ebtables/ebtables-2.0.11/ebtables-legacy-save               | 19 +-
  meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb |    2 -
  meta-oe/licenses/MINPACK                                        | 51 --
  meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} |   12 +-
  .../libeigen/0002-Remove-LGPL-Code-and-references.patch         | 1040 
+++++++++++++++++++++++++++
  meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb |    9 +-
  meta-oe/recipes-support/lvm2/lvm2.bb |    2 +-
  meta-oe/recipes-support/tbb/tbb_2021.13.0.bb |    1 +
  8 files changed, 1065 insertions(+), 71 deletions(-)
  delete mode 100644 meta-oe/licenses/MINPACK
  rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (53%)
  create mode 100644 
meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch


