Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6819.1619386153892361969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 14:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o1xXECY6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso4100721pjn.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=vb7OMTFCuEq0F51oqxTjT739EPVGB+VY2l/uBzUZe60=;
        b=o1xXECY6bYIg2G0QpVEcsCNo4+UfsHANxT4hfkZ/qyo0ODZ+PiIMO18TQe9CN3TUjy
         cOaqtFfSi1fbJg0uwRrm04m9tlLXIXip2+8Ihap5hFrf3ReEATxIKjI6A20m4ckyT4aF
         Y4nnw2J3Ox5sM01/uJkicv0rFtGV7w2XfBqQGKHCoMTe5Kz1XAFsc7lhu/oBGmw8D42h
         4D0i51frxuiQDBGBKvwCpT0xccixJd0zMqKzU9glxwkraxd3RLes/DYvpf9FUSoWGUiN
         Pa7hZlDrg4md34ieJIqj9b6mPjd69gwqsCgnTBEp0TcBVwu2ZFchf26eGzrGnf/gIFTQ
         iALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=vb7OMTFCuEq0F51oqxTjT739EPVGB+VY2l/uBzUZe60=;
        b=OhBm5DPuOinRF6cL6tDbEyrdeykK3MJ1CY7qjZ76bhnrPLRrTZ3DhiRL5vAV53XmoZ
         bE93D+tzu+3aVPJokQpMYDzXf1moZyVfTcknpdUFeMuMnHTGUGMOyOqmMrqNDny+FaYo
         SlW3pyHZNKnZ4W6gbT4fPFrKQGu1EVT0tWujIBKFfvnhG/RSiBUDKhcPhGF4trLjVKbl
         tFDWvMQ1/2OXwq6/kg61gEvEMyBFz5GKrZd0hKAsqJ55qOqNhy7W3OgoO42SoJmDZh4t
         aDQm7qYMVvGrD8IkWLcoYIqsCIIgV1Z2fMRwYL9UVDcSauQDBf+6IPCGR6EplKNC/xjq
         ATtA==
X-Gm-Message-State: AOAM531pNWmMjsAUN9DT0dJDvPoriB0Eg2ToLL99iRDdcWUe1DoJgqHa
	OIW223/zmTPYqTuYq1ZG38g=
X-Google-Smtp-Source: ABdhPJzevByClbbk70LxRIe/JedARKnJvNyG9476pquwcIwS7SZizh+Rsa8Qn3dAQHUJAFVVURWiTQ==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id nu10mr17340220pjb.118.1619386153461;
        Sun, 25 Apr 2021 14:29:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id g15sm9376556pfv.216.2021.04.25.14.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 14:29:13 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Dunfell merge request - April 25th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <248b148e-b0f9-b13f-3ee8-c84ce1c4155a@gmail.com>
Date: Sun, 25 Apr 2021 14:29:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 430ef96fe65f62d8da995f446d5b9b093544f031:

  wireguard: fix build issue with updated 5.4 kernel (2021-04-07
08:55:15 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to c1a50683225b0bf10f8d7a18280acefa7469ecc2:

  libupnp: Fix CVE-2020-13848 (2021-04-23 19:13:09 -0700)

----------------------------------------------------------------
Andrej Kozemcak (1):
      libupnp: Fix CVE-2020-13848

Martin Jansa (3):
      uml-utilities: fix installed-vs-shipped with usrmerge
      telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
      libyui: switch to libyui-old repo which still has this SRCREV

Mingli Yu (2):
      hostapd: fix CVE-2019-5061
      hostapd: fix CVE-2021-0326 and CVE-2021-27803

Stefan Ghinea (1):
      hostapd: fix CVE-2021-30004

 .../libupnp/files/CVE-2020-13848.patch             |  75 ++
 .../recipes-connectivity/libupnp/libupnp_git.bb    |   3 +-
 .../hostapd/hostapd/CVE-2019-5061.patch            | 854
+++++++++++++++++++++
 .../hostapd/hostapd/CVE-2021-0326.patch            |  43 ++
 .../hostapd/hostapd/CVE-2021-27803.patch           |  54 ++
 .../hostapd/hostapd/CVE-2021-30004.patch           | 123 +++
 .../recipes-connectivity/hostapd/hostapd_2.9.bb    |   4 +
 .../telepathy/telepathy-glib_0.24.1.bb             |   4 +-
 .../uml-utilities/uml-utilities_20040406.bb        |   5 +-
 meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb    |   2 +-
 10 files changed, 1161 insertions(+), 6 deletions(-)
 create mode 100644
meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch

