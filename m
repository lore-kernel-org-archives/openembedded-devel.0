Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC953ECE587
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 19:07:56 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.4358.1725908872687463934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 12:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQrSKavn;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso4944877276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725908872; x=1726513672; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTF0/2Tp5fvPMNAuTBPTVIpY0viml8GAVHf5oZeZ9a0=;
        b=KQrSKavnInysodz2jkS8ny0TnnZqEej4MlZ3FMpZd0OJtupzPfppR6xHMsOzMM0EuM
         A3L0KWk+8BWN7hvY2kq02cEqa39SN4lt02UdmL8ZoivjnJSJs5X2rm0oBgIZ+ZpLH4dP
         gUl24LpJ7P453IweTdmaKWJ4MmK5ui+9LI1tYYxCGj79q/x9tvE4C+abgoeZyO5zLioz
         q3et8+uv4zzOmZil3t+VcMLqP2Mza0xN6P+UPpfQ3p2OOUpZvfPnhprlo0WSbfF61Ddd
         iA2dyr4sjq9ErW+BzUzQYcbX+TUiWIaWEHhvVcIhyG9b898VXad+rbfsa0o3Vxbs+LX+
         D6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908872; x=1726513672;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTF0/2Tp5fvPMNAuTBPTVIpY0viml8GAVHf5oZeZ9a0=;
        b=lsI37It3rmlVRTJ6d/Oo9r8oyxM4RIW92CZJ4JlMS26L1U8wCQ6YSckKdAaQGXY3O8
         Oovk3rhNfj/IxdYCv+t8tsHi0IV9rclNJkMX3pjY7Al0kgkw3f7dHdvn9QUrwHnz2tJh
         yPk0+do6Po5VstUZcc8qoqU4S5tQAbCB8xM0bg91jngwknDJb543CEKO98lllEqFgwZ4
         cvKKluQo1plQsfwS2Bb/ZHB9HOqQddfshSx/l5CLneNN//jN2kYGuDPyFxrx7501HHKn
         zZa05SdzSLYJC7sVf/33XqjtL49zkG2JEkXWCUWywOVDjTHKNwQ93poCblRgoTZhTi4O
         Cn6g==
X-Forwarded-Encrypted: i=1; AJvYcCUTrRJWFVTiw6T/edNQDgzDJJ6rgSwNL6OOByfnT2dKHXulAIzg01Jo4MWr4wXOsSSlf9T7uMmuhOWZr6+AtuMFzQY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQx+wEPiOYwPmxa9TJwLUlrkR16KaqnJWV5oxNUYduu7dcOkx4
	sK/7QC2fTGMshO1dPyZHyixQIBmDJc90keupHvQL6NUc5U4lcNQp
X-Google-Smtp-Source: AGHT+IH44jQ/1czQ3e/XKOW3AZxLzP+asjhvLnbW+oRXOoz4irBg1fnQsL5dxyW2bTqsS0+kuyO+JQ==
X-Received: by 2002:a25:660d:0:b0:e1d:418c:710 with SMTP id 3f1490d57ef6-e1d418c08ccmr10688842276.44.1725908871602;
        Mon, 09 Sep 2024 12:07:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:1544:f84e:dd24:7287? ([2600:1700:45dd:7000:1544:f84e:dd24:7287])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7ba2bef2sm26768276.38.2024.09.09.12.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 12:07:51 -0700 (PDT)
Message-ID: <03a2bd82-a804-4794-9d1d-c42cc2f51cf8@gmail.com>
Date: Mon, 9 Sep 2024 15:07:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Sept 9th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 19:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112184

The following changes since commit 52ecd66835dcfd8b4e55c9cb6325908ccea6a4e7:

   nss: fix failed test of nss. (2024-07-30 09:45:11 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 9a24b7679810628b594cc5a9b52f77f53d37004f:

   python3-django: Upgrade 4.2.10 -> 4.2.15 (2024-08-25 18:12:52 -0400)

----------------------------------------------------------------
Ashish Sharma (1):
       nginx: Backport fix for CVE-2024-7347

Hitendra Prajapati (1):
       krb5: fix CVE-2024-26458 and CVE-2024-26461

Soumya Sambu (2):
       python3-django: Fix CVE-2024-42005
       python3-django: Upgrade 4.2.10 -> 4.2.15

Vijay Anusuri (1):
       postgresql: upgrade 14.11 -> 14.13

  .../krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch               | 207 
++++++++++++++++++++++++++++
  meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 1 +
  .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 4 +-
  .../postgresql/{postgresql_14.11.bb => postgresql_14.13.bb} |   2 +-
  .../recipes-devtools/python/python3-django/CVE-2024-42005.patch | 84 
+++++++++++
  meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
  .../{python3-django_4.2.10.bb => python3-django_4.2.15.bb} |   4 +-
  meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch  | 34 +++++
  meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch  | 52 
+++++++
  meta-webserver/recipes-httpd/nginx/nginx.inc                    | 2 +
  10 files changed, 386 insertions(+), 5 deletions(-)
  create mode 100644 
meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.11.bb => 
postgresql_14.13.bb} (84%)
  create mode 100644 
meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch
  rename meta-python/recipes-devtools/python/{python3-django_4.2.10.bb 
=> python3-django_4.2.15.bb} (59%)
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch


