Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.10176.1629865507969605777
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rrp1Nv85;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j1so15683028pjv.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 21:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=m2NvxyGtpGaPi87afWmMhxi7KTa7FBbYPBXQlOi+OIk=;
        b=rrp1Nv85OOpUPssLnz78M7b23ggW8fdOdzloRy4ryFUXNW4nh/4w0620K1P+PFMzNS
         Pf8aMvalfwsNbnIpABbltD/wetPygMVGwzuK4LIhbpHhgOXl1e48hhDeaWUp660N4CKR
         r0HqgnL66HzRG3Mk+MXTCug0LUoKbr92r5VT33boMrm7m/GSk8NFfQmh1vAO+5Oj05OC
         EHOJ9SYjSXuBDqbcUuUHR600BL7pd7N6k3iVltSrPjdZiePrQ5ahF8SeS0+dhQ/TIdpf
         G/UY+thqM1q/aqhCMBYPDqTKxJEFluAXw/iEcdU17xWUXZB+nMukAprgD2Qxd59vGGA1
         ngUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=m2NvxyGtpGaPi87afWmMhxi7KTa7FBbYPBXQlOi+OIk=;
        b=Wvi0Q3HxSOOjAtKuQlHMARJmr58WqvkvUi+vJSIggvI72X5I6er4zYGyHAp0xfQYQh
         3qheNovQhjAQM2ufUtRhAGOLXc6y6zHk0iVLLU1GtbFeQ189tZeATcgClaKflCO1LAsm
         Ra/S2Xnjo+xDD1JBO8W/D1y3LVkcu/uFk56ui1W/rdpf2L+5YbRVtRZtojDS2S3vGJX8
         Hh4aVNhNa/VmnnbAn4gqbHdNyji/lEc4gAov5H8rLMMFGDDXiiRK0Nx1mK8MaNh4qAsN
         IwzlZXPLGMhl80lJdaK2tJAF4RmcWrtFPH/yJBHG6bK7XS+wTYyxuFI3DXBovIKzlyoB
         vfdA==
X-Gm-Message-State: AOAM531JVbub7Y0Z7cZfXO/MGQupp9mfWGM3VU/zCRV1UG3IMNiIo7a/
	KmDwJL1QM+KuJPbrt9cG6zE=
X-Google-Smtp-Source: ABdhPJwaNj5l9gOFdKbYuMg4u6F5Kdq4+ZsG4cP/NazNKGjXuts2kOT4kOtw87VSvUY1kbmK5e8RGw==
X-Received: by 2002:a17:90a:64c1:: with SMTP id i1mr8183645pjm.111.1629865507426;
        Tue, 24 Aug 2021 21:25:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9989:489c:6f9c:8144? ([2601:202:4180:a5c0:9989:489c:6f9c:8144])
        by smtp.gmail.com with ESMTPSA id a4sm19457512pfa.203.2021.08.24.21.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 21:25:07 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: dunfell merge request Aug 24th
Message-ID: <a131f078-9c98-5677-6660-484595441866@gmail.com>
Date: Tue, 24 Aug 2021 21:25:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 85f8047c71047d93cf79a954142157f85079968d:

  php: Upgrade to 7.4.16 (2021-07-26 16:05:08 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 4a0d93d250576177e1237fa559f55c4f9d371809:

  nginx: fix CVE-2021-3618 (2021-08-21 12:16:49 -0700)

----------------------------------------------------------------
Anatol Belski (1):
      backport: xmlsec1: Fix configure QA error caused by host lookup path

Jate Sujjavanich (1):
      ufw: Fix interpreter for installed ufw and test ufw

Joe Slater (2):
      php: move to version 7.4.21
      nginx: fix CVE-2021-3618

Kai Kang (1):
      libdbi-perl: fix CVE-2014-10402

Khem Raj (2):
      fvwm: Package extra files and man pages
      fvwm: Fix build time paths in target perl/python scripts

Michael Opdenacker (1):
      bigbuckbunny-1080p: fix sample video URL

 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     |  2 +-
 .../Add-code-to-detect-openembedded-python-interpreter.patch    |  8 +--
 .../ufw/ufw/setup-only-make-one-reference-to-env.patch          | 14 +----
 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch  | 56
++++++++++++++++++
 meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb              |  4 +-
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb}   |  3 +-
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb                     | 23
++++++--
 .../xmlsec1/xmlsec1/ensure-search-path-non-host.patch           | 22
+++++++
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb               |  1 +
 meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch    | 89
+++++++++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc                    |  1 +
 11 files changed, 199 insertions(+), 24 deletions(-)
 create mode 100644
meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
 create mode 100644
meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
 create mode 100644
meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
