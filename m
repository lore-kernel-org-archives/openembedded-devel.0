Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BED3C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:25:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.16280.1737735896941232391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ew2sqh8W;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso42538495ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737735896; x=1738340696; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeHj1/wsiP0tLnQWW5SiFfCoKHuuFiBq1Edd7E4YMlU=;
        b=ew2sqh8WlCj361sWNf+pTVxkAdKcmhhFeRzxecOsxyVAGA2Sjyx3DkCYAk1Bg8WCFp
         PF6e3khGIA4G0erywWRyanwoHDNbgoSKTWlNMIYEmL3noh/33dhx2sIk9ik3ijeHEfPo
         DYJ5v/P/6zDqlh9seeIwLKN9rWNDQpdCh9X5eJcVRYAwA4gvXMp0nJIvA87CD7MYLbcx
         ty580BsM1cHf8sbYE2/GtYsEmGp+gSW+Z1E6guiFVIKKXLr5cM4gfRU0VUhJlpxUTOrf
         b/G5MFlvrjMaJGbz1Qqrci7nofiYmi2W5POHGOvlcwgINE9xHyO7pjDDVAZiMol2ilA0
         a3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737735896; x=1738340696;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jeHj1/wsiP0tLnQWW5SiFfCoKHuuFiBq1Edd7E4YMlU=;
        b=dj6kgzKFRWkdcHamm79Gmvbj327eNsbz7+inv7lgTGHQUaJwGJEB4OYljC+9omNtXX
         EfrXSC1otP6pNNLEgtaSnoBHWHq7j740d/QW88+VBoEek1JJwuDQsVAuQ8bTVQeHVyvT
         gg5n4vzZ1IYcelgFw4XkbQGu6sv1L4JChmz8ePC45gHY8QEIXlI8yCcfHskYA6chGf2w
         d1jZgkHYnOliviM+XvWhllW+v1nxle7JG1SCTThf2mnllSMbg/63Tnf0hYGOiTiq2I93
         7ghAI5oRK+ffyGyrMolYtbQ5EOcn0TiEBT12Bv2gqJ1ThVd4WcYQXhoQuG3/wM0oC2jR
         DtRw==
X-Forwarded-Encrypted: i=1; AJvYcCUzS4jtpLqoFQs2t2j75laW971SJ3nFzDtNlJJBiQUI45xGvxlw9+C2axCYiMyT4cA/VzlhGGSxpGIqp+wZOJEummc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5qo5EfGlGBkI0o3ZBcv5M+JPGt+coyVK3u07xJLju0DrYRtFe
	/O1daZ88H4WKk1Dlc1nIZmF737Tp5/1/8UixEuKT0R+Z3wR52q9Q
X-Gm-Gg: ASbGncuTdCPJvknTG0bExCd8qoPqHp7hPPZJCM7u45gQ2BbGl+gqAI8CO1jiP5BiVed
	PusU+Cbecr+BYj/UidZ5P3p6TPRzZy1WQXDYQ2HWMYD5a4tcjihPKABKnIKQV/vonSDvTRrQWEs
	tDNBHW2k9LDqhFWWq1mvuJaNzI+vLwTQODru48zZTBqKVASf70u3E6rUrFoCv8uFSXGFzzVkuCt
	35wjOlgenu7rXsCdx92Gi4aItrtEA2HXitlzvDTJHs3npDo5Qoi7WexEIKpelFX4pHBlcykimNT
	TOQGlTW7/5seGu9kzxBtU5eU0KiIIgm6rF+2YFwLi/4yARoYLt2Q8w==
X-Google-Smtp-Source: AGHT+IEZQLvZCHexNm+M65fuZIgSnjj9RyDsDQx5n4n80Wbp6c2VixRtj/4BfsgyMZWVBJb92vRt6w==
X-Received: by 2002:a05:6a20:432b:b0:1e6:8f39:d607 with SMTP id adf61e73a8af0-1eb2156845dmr57499613637.31.1737735896039;
        Fri, 24 Jan 2025 08:24:56 -0800 (PST)
Received: from ?IPV6:2601:646:8182:b790:57c4:cb9a:23d4:8a77? ([2601:646:8182:b790:57c4:cb9a:23d4:8a77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b30bbsm2136159b3a.51.2025.01.24.08.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 08:24:55 -0800 (PST)
Message-ID: <c36f58fb-8afd-4540-983a-d54e19fbe324@gmail.com>
Date: Fri, 24 Jan 2025 11:24:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Jan 24th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 16:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115066

The following changes since commit 66ec16850573a7ec69248b81f9904cdfba79b930:

   packagegroup-meta-multimedia: Remove library only packages from rdeps 
(2025-01-01 09:13:52 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to de8681b4a2a101b99dd2c48d89a7de2ccd9a961f:

   python3-sqlparse: Fix CVE-2024-4340 (2025-01-22 19:29:37 -0500)

----------------------------------------------------------------
Soumya Sambu (11):
       python3-django: Fix CVE-2024-38875
       python3-django: upgrade 4.2.15 -> 4.2.17
       python3-django: Fix CVE-2023-23969
       python3-django: Fix CVE-2024-39614
       python3-django: Fix CVE-2024-41989
       python3-django: Fix CVE-2024-41990
       python3-django: Fix CVE-2024-41991
       python3-django: Fix CVE-2024-45230
       python3-django: Fix CVE-2024-45231
       python3-django: Fix CVE-2024-53907
       python3-sqlparse: Fix CVE-2024-4340

Wang Mingyu (1):
       libsass: upgrade 3.6.5 -> 3.6.6

Yogita Urade (2):
       poppler: fix CVE-2024-6239
       poppler: fix CVE-2024-56378

Zhang Peng (11):
       glade: fix CVE-2020-36774
       openjpeg: fix CVE-2024-56826
       openjpeg: fix CVE-2024-56827
       opensc: fix CVE-2024-1454
       opensc: fix CVE-2024-8443
       opensc: fix CVE-2024-45615
       opensc: fix CVE-2024-45616
       opensc: fix CVE-2024-45617
       opensc: fix CVE-2024-45618
       opensc: fix CVE-2024-45619
       opensc: fix CVE-2024-45620

akash hadke (1):
       meta-oe: Remove True option to getVar calls

  meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 ++
  meta-oe/recipes-devtools/glade/glade_3.22.2.bb |    1 +
  meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb |    2 +-
  meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb      | 12 +-
  ...1-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch | 33 +
  ...1-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch | 130 +++
  meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb |    2 +
  meta-oe/recipes-kernel/spidev-test/spidev-test.bb |    2 +-
  meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb |    2 +-
  meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch        | 37 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch  | 67 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch  | 36 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch  | 35 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch  | 36 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch  | 34 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch  | 52 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch  | 48 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch  | 42 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch  | 43 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch  | 34 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch  | 50 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch  | 56 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch  | 74 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch  | 68 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch  | 33 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch  | 38 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch  | 33 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch  | 33 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch  | 42 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch  | 42 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch  | 34 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch  | 91 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch  | 83 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch  | 49 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch  | 33 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch  | 63 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch  | 42 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch  | 34 +
  meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch  | 50 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch   | 60 ++
  meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch   | 55 ++
  meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 32 +
  meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch    | 78 ++
  .../recipes-support/poppler/poppler/CVE-2024-6239-0001.patch    | 1255 
+++++++++++++++++++++++++++
  .../recipes-support/poppler/poppler/CVE-2024-6239-0002.patch    | 112 +++
  meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    5 +-
  meta-oe/recipes-support/sass/libsass_git.bb |    4 +-
  .../recipes-devtools/python/python3-django/CVE-2023-23969.patch | 108 +++
  .../recipes-devtools/python/python3-django/CVE-2024-38875.patch | 161 ++++
  .../recipes-devtools/python/python3-django/CVE-2024-39614.patch | 138 +++
  .../python/python3-django/CVE-2024-41989-0001.patch             | 48 +
  .../python/python3-django/CVE-2024-41989-0002.patch             | 48 +
  .../python/python3-django/CVE-2024-41989-0003.patch             | 57 ++
  .../python/python3-django/CVE-2024-41989-0004.patch             | 81 ++
  .../recipes-devtools/python/python3-django/CVE-2024-41990.patch | 69 ++
  .../recipes-devtools/python/python3-django/CVE-2024-41991.patch | 122 +++
  .../recipes-devtools/python/python3-django/CVE-2024-45230.patch | 137 +++
  .../recipes-devtools/python/python3-django/CVE-2024-45231.patch | 120 +++
  .../recipes-devtools/python/python3-django/CVE-2024-53907.patch | 92 ++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 12 +
  .../{python3-django_4.2.15.bb => python3-django_4.2.17.bb} |    4 +-
  .../python/python3-sqlparse/CVE-2024-4340.patch                 | 48 +
  meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb |    1 +
  63 files changed, 4483 insertions(+), 14 deletions(-)
  create mode 100644 
meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
  create mode 100644 
meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch
  create mode 100644 
meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
  create mode 100644 
meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-38875.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-39614.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0001.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0002.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0003.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0004.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.2.15.bb 
=> python3-django_4.2.17.bb} (61%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch


