Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1E0C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:40:54 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.44578.1702492847255350657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 10:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3Dj8MQ2;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbcae1e53bcso3096252276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702492846; x=1703097646; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2GT5M/XpHwc9iDLW6FJHMWpts8ejuzVQNwgkL1oEkU=;
        b=f3Dj8MQ2G5WEH+psjqD07Ur9DngqF9NcZ6iGbRKI6YFjoB1o/oly3WFle/z7bCih/e
         5/MUH+FuBu/mh+FLVQb/KGgEOem3Vs8rlJoRsMLgqYx61Adn3weVvVhRZaZyngVGe8DP
         p3an86t2uWF1pZ6PEUU1cH4qwXjjlLdKPMEz8cAcd5vMmWA1OxV9c0rSxNgp3zl0/I+o
         i/O+mMAV4c3ybkcsAp2GLSsCyMISZFv5eDFSqDzfcSxR9L1rRURSBRB3gCixiu+bBrkx
         fxFh0s8XhfNGvOeUcEYmhhu34L3W4vK1Rnhn51CY0Y/wls3TilIrk9vQt/p4CNbtb07z
         M7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702492846; x=1703097646;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2GT5M/XpHwc9iDLW6FJHMWpts8ejuzVQNwgkL1oEkU=;
        b=IFZEDe3CTmuqA6joRo0+4dpqt3/F0Xz5kTY6tRBxVa32PdCGOB2Ddb7tJondWpzJA/
         PpHeIt2sbl3INbXcvDT39UQHAJZ6jSyODIPmFNKmg4eScBskqYSIMZemsDY09TNsGWeN
         tyaTpUZooz4oa0ZAEQPtCEJZwqOSORoF1KxA1/EefZrdCZmPM9Xw2fj/5hqm7h+gztgh
         mDvtrgwJEH9z3qjNDFkisgtGMGNH+BQoQfhTkQa670tPFSdm+wyYOtsaWvt4vLoa0dZB
         tQ9aRODUHLpoc1HYIjXxfNuOZywWm5Ko0QDmGKoqe1kS5u0zESf9biBrCr1sdN+4Wggc
         OvZQ==
X-Gm-Message-State: AOJu0YylMBvv/Rmo0rD/JzG5c8qMIDahqPTcKA1EBWbIhC/fqqzZ2aWI
	oRcT0Uvn6gPGIBz5sxOR0apCJetgUmugkw==
X-Google-Smtp-Source: AGHT+IGzafEBsemKECZyIImiK6iUZcorYdpen3p9Zi6xmLmoon0uX5iaGVzt6nX2KScUdyKnYY8HMQ==
X-Received: by 2002:a5b:151:0:b0:dbc:692e:b08 with SMTP id c17-20020a5b0151000000b00dbc692e0b08mr5233408ybp.80.1702492846397;
        Wed, 13 Dec 2023 10:40:46 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:51d0:97cc:dfc5:1a02? ([2600:1700:9190:ba10:51d0:97cc:dfc5:1a02])
        by smtp.gmail.com with ESMTPSA id h5-20020a255f45000000b00dbcb57c64fbsm330000ybm.8.2023.12.13.10.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 10:40:45 -0800 (PST)
Message-ID: <70658be6-8b04-4cfa-9682-ab87086c274e@gmail.com>
Date: Wed, 13 Dec 2023 13:40:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Dec 13th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 18:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107395

The following changes since commit 8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4:

   nginx: upgrade to 1.24.0 release (2023-11-18 10:03:19 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 402affcc073db39f782c1ebfd718edd5f11eed4c:

   squid: fix CVE-2023-46847 Denial of Service in HTTP Digest 
Authentication (2023-12-13 13:35:51 -0500)

----------------------------------------------------------------
Archana Polampalli (1):
       samba: fix CVE-2023-4091

Christian Eggers (1):
       python3-gcovr: switch to main branch

Jasper Orschulko (1):
       nginx: Mitigate HTTP/2 Stream Resets Flood impact

Narpat Mali (1):
       frr: Fix for multiple CVE's

Poonam Jadhav (1):
       sdbus-c++: Update ptest path

Yogita Urade (1):
       postgresql: fix CVE-2023-5868 CVE-2023-5869 CVE-2023-5870

vkumbhar (1):
       squid: fix CVE-2023-46847 Denial of Service in HTTP Digest 
Authentication

  .../recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch   | 193 
++++++++++++++++++
  .../recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch   | 59 
++++++
  meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 2 +
  .../recipes-daemons/squid/files/CVE-2023-46847.patch            | 47 +++++
  meta-networking/recipes-daemons/squid/squid_4.15.bb             | 1 +
  meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch  | 42 ++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch  | 63 
++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch  | 127 
++++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch  | 119 
+++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch  | 98 
++++++++++
  meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch  | 114 
+++++++++++
  meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 6 +
  meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb               | 7 +-
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch        | 125 
++++++++++++
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch        | 294 
++++++++++++++++++++++++++++
  meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch        | 108 
++++++++++
  meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb               | 3 +
  meta-python/recipes-devtools/python/python3-gcovr_5.1.bb        | 2 +-
  .../files/0001-HTTP-2-per-iteration-stream-handling-limit.patch | 92 
+++++++++
  meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb              | 1 +
  meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb              | 2 +
  21 files changed, 1503 insertions(+), 2 deletions(-)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-0002.patch
  create mode 100644 
meta-networking/recipes-daemons/squid/files/CVE-2023-46847.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-38406.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-38407.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
  create mode 100644 
meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
  create mode 100644 
meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-stream-handling-limit.patch


