Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.12950.1612888121375084887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qPipH1+j;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id u143so5998569pfc.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 08:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=PJzG7d7ReZaxsmTbdpqT5XVnvnicPNXgIffQX0jkbXg=;
        b=qPipH1+jnINia8jThj7WJqauulH8LFm/JizFFa+MzOv6NoKMpzzJMoYVeV7vUkkE7M
         s6OVaI61WxQqZ+tCcsDEBLVzayOoxp4UU2+2s5y+lFSy/BXUSYS1OYYhaYXwEk+CQKxd
         dkuWdxAGAqF5bXqRJfJ1QPn1jQMjd4DevDiRTxzEuizuRu+7Y8japeqy/dENOiDXZNB2
         JYMM8mB0h7ybaxvw6P6gILkuSPcmnhTaYHDZmqZ9gRWaNIszDXiJ9Y0vAmC4INvX60X/
         Fhh4wV/9fkEK8BnaiOrJ90xL749/t4K08sasdPa5GCfTQT6r1rUzo6xgJC6Fpkfw1k/t
         0p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=PJzG7d7ReZaxsmTbdpqT5XVnvnicPNXgIffQX0jkbXg=;
        b=QJEdDGh216+aby+bnL9owzoP4QKyhd6Qb/oJ7pFhidSKPyhk4NRrxXqbzW42WWkUxW
         2pkIk1Plj5v8ab/6sM29URLfWs3F8wC6xtK19jco9hklWEzceBmGAdYJudP1ucy0MeNI
         HNI0CMLlQCgFo+jfRzJNCZvpmwyE39uqSlHrgwXcERoamnlRAxvPz7GlK5DWEzXxRphu
         hjbEeQ9yTqtox8Vq5abeH/aBkLr++Z0l7xYmoyS5A7eqPjuY74ZgBNnabTOea6EmqMBq
         PTxa/BBsSUkzjOijRki1V2RQjXVBv0TkusXkIPuJIG4XFe03xnzyqllOjl4XRaFnX4u+
         9v0w==
X-Gm-Message-State: AOAM5329IfakrC1CMpimrwMwCyZo1v3AAaKqA25Zejwhg923QYboStNU
	Vo1OYs3X9ziQtueGBcpX7Cw=
X-Google-Smtp-Source: ABdhPJzB0pdmVDOmuRHUxU5i2LBVr4AwbKqVefrjeAXJz8IqDg/b12WRuXf/HndvDn5/WkRGTVqRdA==
X-Received: by 2002:aa7:96ca:0:b029:1df:9d3d:7fe6 with SMTP id h10-20020aa796ca0000b02901df9d3d7fe6mr6799939pfq.10.1612888120919;
        Tue, 09 Feb 2021 08:28:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c8e5:6880:dee3:cafb? ([2601:202:4180:a5c0:c8e5:6880:dee3:cafb])
        by smtp.gmail.com with ESMTPSA id j9sm2888137pjn.32.2021.02.09.08.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 08:28:40 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Pull request: Gatesgarth Feb 9
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <9cd7ddd4-0eea-438d-b66d-3c0693ea5866@gmail.com>
Date: Tue, 9 Feb 2021 08:28:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

he following changes since commit 6ff4bd4f345b4e8030b9197d13097308df521576:

  postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to cef93b7b00e620d90a610112ee574fa60b691cf8:

  openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)

----------------------------------------------------------------
Anatol Belski (1):
      xmlsec1: Fix configure QA error caused by host lookup path

Dmitry Baryshkov (2):
      xterm: install xterm and uxterm desktop files
      xterm: provide virtual/x-terminal-emulator

Mikko Rapeli (2):
      flatbuffers: whitelist CVE-2020-35864
      giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT

S. Lockwood-Childs (1):
      sip3: simplify recipe

Søren Andersen (1):
      zram: fix sourcing of zram parameters

zangrc (2):
      iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
      openldap: upgrade 2.4.51 -> 2.4.56

zhengruoqin (1):
      openldap: upgrade 2.4.56 -> 2.4.57

 ...iusr-Compare-with-max-int-instead-of-max-.patch | 48
----------------------
 ...ils_2.1.2.bb => iscsi-initiator-utils_2.1.3.bb} |  3 +-
 .../flatbuffers/flatbuffers_1.12.0.bb              |  2 +
 .../giflib/files/CVE-2019-15133.patch              | 23 +++++++++++
 meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb    |  7 +++-
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb       | 17 +++-----
 meta-oe/recipes-extended/zram/zram/zram-swap-init  |  2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb     | 16 +++++++-
 .../{openldap_2.4.51.bb => openldap_2.4.57.bb}     |  6 +--
 .../xmlsec1/ensure-search-path-non-host.patch      | 22 ++++++++++
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb  |  1 +
 11 files changed, 78 insertions(+), 69 deletions(-)
 delete mode 100644
meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
 rename
meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.2.bb
=> iscsi-initiator-utils_2.1.3.bb} (96%)
 create mode 100644
meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb =>
openldap_2.4.57.bb} (97%)
 create mode 100644
meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch


