Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.3479.1630157272517465225
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 06:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DRsAiAtc;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id n12so5836041plk.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=WOrKWDFwHfocyi7Ce4Dppxa8IpQKthfN8tgnkDMEsBs=;
        b=DRsAiAtcRGAbHUDLBpUE3/N7D5GBSdxnmiHJZYUmWcdxUFIiJokC7T55XcBCs3rzJO
         tcgJ1UbMtV5hxjWFV96mOJL6h4kbUOPz++RVOYf5E9Hbx9Oqr5fajmkgmxmd1ltjqgkq
         4b89DCKLQlGQlMHHlOw2vd/gVRYSp3D/AgK2mNCLjGR7bpJX3cuGwRCwQtLPkj72ehQM
         AAQWbP5dBSGeKyfjrk2nwMgkGl4TeBM+Jw+J6Ms2T/pjVYLS8PwETFRcTmKchZ0zM+F+
         qyZc1W6MfaNJ1HppXHsD7Lqd5EtgCI2/xmxXw3kRf+1gKYjStxaglWOoAGG+2m/vM05L
         iiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=WOrKWDFwHfocyi7Ce4Dppxa8IpQKthfN8tgnkDMEsBs=;
        b=S8QkieS4fML8PjPyUfZGpPlxC4I9henH/VzKCHAtMk0C0IPstPghaTiSz1fVTxXdzR
         ANmvQ1d+keloiiFFlkLApzLu9qeJLKnhiyLD6+CRbW4R5EtWintOmmj0me3Tk1Cba/D4
         OCaexscQbAUHUtcjxOnKvPk527xnAy3M9R1F6rnrwp170JQ+EBGf0Jq2ZGf6VmM+Ewow
         lyLaOJshfJFxKG7oHpytk7Q05jn/wrCL9sV8J49ElGo0Ub5Kj0uZ8sByIbTHresCorWi
         ughZJr60Wx/dA8LeYBlegEiTGpde83c547eR7wV1JsX/YNs+cpoIwW2barE8ksM207L9
         orJA==
X-Gm-Message-State: AOAM530tw8zvbJ7yMjz9wxFWXBkn5ab92LHLJ1CdADrlWYd1z1rtYPb4
	ToTcMiN6jEQ4HcxyVdKalIo=
X-Google-Smtp-Source: ABdhPJwVOz+89sUQM4iRZ0CiYc6J0UZhHznBcN0y1exjJJUgqgOk/CdQWdAjvldCFJcCHxHC3v7wxA==
X-Received: by 2002:a17:90a:de04:: with SMTP id m4mr28513120pjv.187.1630157271925;
        Sat, 28 Aug 2021 06:27:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b66e:f798:4f1:7aab? ([2601:202:4180:a5c0:b66e:f798:4f1:7aab])
        by smtp.gmail.com with ESMTPSA id a15sm9349340pfn.219.2021.08.28.06.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 06:27:51 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request Aug 28th
Message-ID: <1e504e7a-4245-967b-74fb-29859377f19e@gmail.com>
Date: Sat, 28 Aug 2021 06:27:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit d323115ecd437e397bd504758ba52988900f4747:

  fvwm: Fix build time paths in target perl/python scripts (2021-08-15
07:09:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 5741b949a875b07335d4920aefa6defd13ed45c6:

  gd: fix CVE-2021-38115 (2021-08-26 19:18:35 -0700)

----------------------------------------------------------------
Changqing Li (1):
      linuxptp: upgrade 3.1 -> 3.1.1

Mingli Yu (1):
      polkit: fix CVE-2021-3560

Roland Hieber (2):
      curlpp: fix override syntax
      ldns: fix override syntax

Sakib Sajal (1):
      gd: fix CVE-2021-38115

 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          |  2 +-
 .../linuxptp/{linuxptp_3.1.bb => linuxptp_3.1.1.bb}             |  6 +++---
 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb                     |  2 +-
 meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch      | 31
+++++++++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.116.bb                 |  1 +
 .../0001-fix-read-out-of-bands-in-reading-tga-header-file.patch | 33
+++++++++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.2.bb                          |  1 +
 7 files changed, 71 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_3.1.bb =>
linuxptp_3.1.1.bb} (73%)
 create mode 100644
meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
 create mode 100644
meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch

