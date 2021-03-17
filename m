Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.2462.1615956240240427596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 21:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V/DerM3n;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j25so258897pfe.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 21:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=jIYQHAX4Vr3Rqvbu2xYuZZbbwpADQNxdW0MoAfdSGGc=;
        b=V/DerM3nTwO62Eu20Wm7lBROYaqbZle1cvMWif9KzAqWRzAzHWdxVpCdmk2vnD+Y1L
         6mWGU8uxlGQKzqSsPMxKz06sAKEMe3x7qbt3DuSdLthXC7s2gEKFudCIWD83ntDGACQW
         aDM1rqSM9YePlE0K4whSQS1qSDfqE8LtbDSGVoBcmlivY2oGYfxpLSqPMmsn10nXfL5i
         6OwYF3JaBXFMaoEgXFhYCOGOvJgxQZdqc7MZ+LSm8rv28qRTIdPEX/ESra+2oDTSwuMb
         8dE+WX2CPE/jW5a9EZbsymNuo3RX7RtGb+CBDfYEVZznkNeVOU0xgQYrkfMCh7ztSCZb
         Qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=jIYQHAX4Vr3Rqvbu2xYuZZbbwpADQNxdW0MoAfdSGGc=;
        b=EudgTILQ/2gMliSdB5xv8JARNO54spovw6N6k7odsOLkSk2aVSts5sShzCEm8E6o1p
         No48JCtvmAtgOfMmJGYZaw8aNomovO1qHYrP2B0G+ll7jBW6usQc55xEGe6q6eW3KsEi
         5LYXWCZXHB4u0LsWUUE/Z8PUtvN4ptt24Jj6sxu1eMzTJAL0Qx/pUc9jNYmWlBY59h26
         b3ssq7SsJmwxPY9K+xNcCB3UguJZfuBlsGRcQGTVMW4ZHu/epgx+BA1cUl/b3GhaQrdj
         5h3DUuC7GZ/FbDri+jxGGFqu7ibvTkecwRuT+qB4l8TmXL+2SnWDSmZF1sp0j5Wu8nul
         Jd6A==
X-Gm-Message-State: AOAM530HUaYyco9sC8tfqGNcNwv5wcfgAjxJGYxetlciLgW6sFZOzmFU
	plPV6mAub6neyMCitthXZo8=
X-Google-Smtp-Source: ABdhPJxyBhXlhTscaGQJeTMS6CI7ACUDFZuuRZGqgtdXowYRQijLKQqmAWXbNxWTJ12ERWpOYWoF7A==
X-Received: by 2002:a62:ab0e:0:b029:1f6:2620:d6a8 with SMTP id p14-20020a62ab0e0000b02901f62620d6a8mr2658238pff.13.1615956239714;
        Tue, 16 Mar 2021 21:43:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:25c8:44cd:2453:cf2a? ([2601:202:4180:a5c0:25c8:44cd:2453:cf2a])
        by smtp.gmail.com with ESMTPSA id w17sm14623819pfu.29.2021.03.16.21.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 21:43:59 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: dunfell-next merge request. March 16th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <27489348-a64a-7f35-7dfb-a371dd57ddf8@gmail.com>
Date: Tue, 16 Mar 2021 21:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit f12e852c56ca897139220894d8b41e7967a70a58:

  thin-provisioning-tools: switch branch from master to main (2021-03-16
08:39:39 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 389757a7494221fea1d8437e9a01c6e4fb4700af:

  opencv: Security fixes (2021-03-16 08:40:07 -0700)

----------------------------------------------------------------
Andrei Gherzan (1):
      nss: Fix warnings generated by getcwd

Neetika Singh (1):
      opencv: Security fixes

Rahul Taya (1):
      nghttp2: Add fix for CVE-2020-11080

Sana Kazi (1):
      mdns: Whitelisted CVE-2007-0613 for mdns

 .../recipes-protocols/mdns/mdns_878.270.2.bb       |  13 +
 .../nghttp2/nghttp2/CVE-2020-11080-1.patch         |  31 +++
 .../nghttp2/nghttp2/CVE-2020-11080-2.patch         | 308
+++++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.40.0.bb      |   2 +
 meta-oe/recipes-support/nss/nss_3.51.1.bb          |   6 +-
 .../opencv/opencv/CVE-2019-14491.patch             | 148 ++++++++++
 .../opencv/opencv/CVE-2019-14493.patch             | 237 ++++++++++++++++
 .../opencv/opencv/CVE-2019-15939.patch             |  73 +++++
 .../opencv/opencv/CVE-2019-19624.patch             | 157 +++++++++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |   4 +
 10 files changed, 978 insertions(+), 1 deletion(-)
 create mode 100644
meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-1.patch
 create mode 100644
meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080-2.patch
 create mode 100644
meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
 create mode 100644
meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
 create mode 100644
meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
 create mode 100644
meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch

