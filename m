Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.7404.1625810536618900455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YkSSJYZ6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso5498065pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jul 2021 23:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=/pjg8VCPYX5nH0eXZfsBIp5XD63fcIhgihtJrse2z0U=;
        b=YkSSJYZ6QADM1asOr77aNpZOScPqExcSFE6jOhX56T41PtFt+Eq088Rg1HIVWZ/jGz
         UZto3m1ncMScl+eUSG07svU8QLxFWDjzMLt1RQNmGkAQmPdcjTMr1VX1zkEUFQNDj3Cb
         fNUshsUilQxOzedHi8v3cLLDvtpfKr0bFWgNPzunFB05CbVI51qqvzdHhnwgU3AYVQw0
         ij25nQaY1WCGTcgLJXJafzhxBr/jSj5PCksNq9F/RlpzcvH70T+tdAYe+H9ghEx3I/+2
         cuG9YsbltDaMORxjPnGlihNuXdi0ux/lIt2IzhhBw19r+gOY5MT5Wz+g/uzUiYFdgwzQ
         JvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=/pjg8VCPYX5nH0eXZfsBIp5XD63fcIhgihtJrse2z0U=;
        b=EA2BBbuKMn+q/qXnH1AzAPJd0Y51RMybZPEkRBErFclstg35VxDOEq/GGovprPouav
         hPFOoWrM/VOk/sxMpzPr19MHfL9DS7Zk+KxQrpqjyrNVKsB4XSycEundSQv6Qp40Na7V
         VLzSXicLODX2/+9XzTXXR/HD7Z4ysm0KFIWDQ022Mcv7ovISH3THgrIsPCneGOTGhCsR
         SV/viN4dmB0ZjL0RjIcnc7QG2lTZQQa7AXonHTF+PV/ddS4grNlcIzw//LeKoVcLuGVz
         WFZavD8/Pr/9Qv1LS4e6rzKlEzgsv6XILQaM/HVkXddvKDBudBTbIlB3ol8wmP3cj7ph
         PPbw==
X-Gm-Message-State: AOAM5313Fp9yzDmZzTCYIFDuXgsFslTcGYwtugYp0iWEzHDL0gqb1wni
	gqutU/7QwxQPUOpzyh9fpWs=
X-Google-Smtp-Source: ABdhPJxScqZI2NBIZJxVMQfjMFrf9X//ewTsUWE7aG66il+7oYIh5rtGCd/5ajWJCOsZWrpcWojJTw==
X-Received: by 2002:a17:90a:7e81:: with SMTP id j1mr3568883pjl.26.1625810536010;
        Thu, 08 Jul 2021 23:02:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:47d7:bb6b:55b6:582f? ([2601:202:4180:a5c0:47d7:bb6b:55b6:582f])
        by smtp.gmail.com with ESMTPSA id w16sm1138475pgi.41.2021.07.08.23.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 23:02:15 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Dunfell merge request - July 8
Message-ID: <56a974ab-248a-05a3-c072-487d1ee21de9@gmail.com>
Date: Thu, 8 Jul 2021 23:02:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit c38d2a74f762a792046f3d3c377827b08aade513:

  dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
-0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 7bd47ef6c98323c95a9e527129dca98c9a65ee08:

  dovecot: add CVE-2016-4983 to allowlist (2021-07-06 07:50:13 -0700)

----------------------------------------------------------------
Armin Kuster (1):
      dovecot: add CVE-2016-4983 to allowlist

Chen Qi (1):
      python3-django: upgrade to 2.2.20

Marek Vasut (1):
      nss: Fix build on Centos 7

Sekine Shigeki (1):
      add CVE-2011-2411 to allowlist

Stefan Ghinea (1):
      python3-django: fix CVE-2021-28658

Trevor Gamblin (5):
      python3-django: upgrade 2.2.7 -> 2.2.13
      python3-django: upgrade 2.2.13 -> 2.2.16
      python3-django: upgrade 2.2.20 -> 2.2.22
      python3-django: upgrade 2.2.22 -> 2.2.23
      python3-django: upgrade 2.2.23 -> 2.2.24

ito-yuichi@fujitsu.com (1):
      cyrus-sasl: add CVE-2020-8032 to allowlist

 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     | 4 ++++
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 3 +++
 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb     | 3 +++
 meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 2 ++
 meta-python/recipes-devtools/python/python3-django_2.2.24.bb    | 9
+++++++++
 meta-python/recipes-devtools/python/python3-django_2.2.7.bb     | 9
---------
 6 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.24.bb
 delete mode 100644
meta-python/recipes-devtools/python/python3-django_2.2.7.bb

