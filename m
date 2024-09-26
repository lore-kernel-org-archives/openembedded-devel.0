Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F24CDE032
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 18:38:38 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.51711.1727375915188858660
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 11:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGL3xMQD;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6db9f7969fdso12402967b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727375914; x=1727980714; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fJqi0b1qYR5rp5u8Ss0hJIW/ozJrcmGFdseMSde9aU=;
        b=SGL3xMQDXqPMgLboxioAvn8VOH1MWzvos884i3dUCb7mB+ZX9wmFkIz9RG087NdXs8
         y4LTigb5smX+hfdaitRrlWuGHIgwXCsgZBquCyXONjmr786DrINRGPcoVoqwIDChJ1Bc
         14At9M6+VuxfN/eb8za+HXHiOoO3mk0hKfjD5OgrL0VLJDlep/KK7ygZ7SYqaSsaaBIk
         5vcnFcMzCTfA631DpcUJrl/S20meb181uQfWldhsq/VJvrsyBvUfvPBkQsURbuUqcYTl
         VKOUVJCGr7wNqnIpafC/oUqZ3t4j4YNy345Xj652GipC/T++jCwQ7jv3Dxo6mkVCWejj
         8Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375914; x=1727980714;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fJqi0b1qYR5rp5u8Ss0hJIW/ozJrcmGFdseMSde9aU=;
        b=NxTDGdda9iAHNGnQGuUI3oU/aMtCgVDWxfdxyM7rz4R2jvwdnJJZtxHN6hpgC7I8tO
         Kg8MqqmX27a4GQoHDotQDEbBnH+ThN3Tc2NWlf9Qs15nPuipLnvtZPkx4EVnI6jEZKZs
         w/l5djghPAq4M1QSDgP6xZ9OvvF+9Etj+6k5rUnTs3UvIeTENgLZlsEQOa8Ta8ueTLzO
         2BAoEyfuBhBFqVwKnUkhjEV9Q1/JHhgMLeZ/PqJLYOX4g1XFpJhOQo8+4gqZSzJ3WlRo
         byK/tCl5uN1+hZmGGiD9Ag8EDC/0U1CDfXuiGe2OufWgfMdj5JqePbTke7FLPN9y03OU
         39jg==
X-Forwarded-Encrypted: i=1; AJvYcCWfL/BCjDjTEoZ0gOZLo5etITzEUi+PbZRNH90+BR1iMLw142wqiEqwg8Jp11x5uANl8fzpYc5hHPQdYT1s8n+u6e4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyb7tOO2iMys4MSdbl+MNce8jdMsUItqiKt/yAUY3XrK8xcRDY8
	NIOW50nCjl++s3M+USC5wzl7a36LMRo4rQtsLGI2paUuX6ysyzg3
X-Google-Smtp-Source: AGHT+IGNXGzSJedSEHlyhCe2IhjOC6gbAEp31MYzUUr55df8f8HNCqCjWz5Y9KrN55MDKfSxXjBjaA==
X-Received: by 2002:a05:690c:718b:b0:6e2:611:7abd with SMTP id 00721157ae682-6e2454a4adbmr5421107b3.20.1727375914241;
        Thu, 26 Sep 2024 11:38:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:1779:7ccb:ff57:a0a6? ([2600:1700:45dd:7000:1779:7ccb:ff57:a0a6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2452f7865sm742547b3.7.2024.09.26.11.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 11:38:33 -0700 (PDT)
Message-ID: <0afc49d1-c255-46ea-8cfd-c614d8909e21@gmail.com>
Date: Thu, 26 Sep 2024 14:38:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Sept 26
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 18:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112523

Getting it out before the storm.

The following changes since commit 9a24b7679810628b594cc5a9b52f77f53d37004f:

   python3-django: Upgrade 4.2.10 -> 4.2.15 (2024-08-25 18:12:52 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to dd3d2293ffdf2559f8a433f241765a8ab50cd085:

   python3-smbus2: Fix LIC_FILES_CHKSUM (2024-09-22 10:16:22 -0400)

----------------------------------------------------------------
Niko Mauno (14):
       opensc: Fix LICENSE declaration
       python3-pybind11: Fix LICENSE
       python3-xlsxwriter: Fix LICENSE
       python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
       python3-crc32c: Amend LICENSE declaration
       python3-mock: Fix LICENSE
       python3-parse-type: Fix LICENSE
       python3-pillow: Fix LICENSE and change SUMMARY to DESCRIPTION
       python3-colorama: Fix LICENSE
       python3-fann2: Fix LICENSE
       python3-pycurl: Fix LICENSE
       python3-googleapis-common-protos: Fix LIC_FILES_CHKSUM
       python3-haversine: Fix LIC_FILES_CHKSUM
       python3-smbus2: Fix LIC_FILES_CHKSUM

Peter Marko (1):
       libndp: Patch CVE-2024-5564

Vijay Anusuri (1):
       squid: Security fix CVE-2023-5824

  meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch | 4340 
+++++++++++++++++++++++++++++++++++
  meta-networking/recipes-daemons/squid/squid_4.15.bb |    1 +
  meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch |   48 +
  meta-oe/recipes-connectivity/libndp/libndp_1.8.bb |    1 +
  meta-oe/recipes-support/opensc/opensc_0.22.0.bb |    2 +-
  meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb |    4 +-
  meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb |    2 +-
  meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb |    2 +-
  meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb |    2 +-
  .../recipes-devtools/python/python3-googleapis-common-protos_1.56.0.bb 
|    2 +-
  meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb |    2 +-
  meta-python/recipes-devtools/python/python3-mock_4.0.3.bb |    2 +-
  meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb |    2 +-
  meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb |    4 +-
  meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb |    2 +-
  meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb |    2 +-
  meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb |    2 +-
  meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb |    2 +-
  18 files changed, 4406 insertions(+), 16 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
  create mode 100644 
meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch


