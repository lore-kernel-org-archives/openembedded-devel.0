Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.6063.1623928046799031083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 04:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrhcmNjR;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id x22so1196636pll.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jun 2021 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=0Rou0CWYmPX9fZAUXpsn74XRD4aAKXeHbbNA3wL+dhg=;
        b=lrhcmNjRIAxtNdiIUjQaB6HMtLpKce6bKhK+2zzj1EOOTETlQFJtQSKO4yftSGTuwu
         DJzgiTLV0XBnnBcgk4Ad22SpEb39b5I0Sogvx5oQ9Cc9VcMOI6l9c6F0rmI7S4poieI4
         RbLx7ZVIsYB1xShg0nWjOwMvjZQfB3aNBoHxjCsnxf6vSPbXjtmYKu1YoB6deMpDYnyu
         oSDAK3gCyzpLuVrKuBEM6o2VDQSOamz3aVdwYqjrOE30HD+pBBCJRAJqIgiFmZlUXzXD
         H0XzY8Y/Y4BhSphlbh37+eO+Z3tfmnnRLzHJ+F14tTE23b8nYJRkMMXFLcO5/VoKMSps
         MT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=0Rou0CWYmPX9fZAUXpsn74XRD4aAKXeHbbNA3wL+dhg=;
        b=tFx+IgTHISKjUqs4vXMQ0+dF40ot3HgLQHypHh1c9K/B+MgjW7dDBbupga302OiaER
         eWe9yTWMWMcwvfS0YJp606UoYi5UUb6E9nifC7Coy/Do0vy8x126B6TO4k3BwfZ2q/ea
         egxvDHYtwPlShD3ncfA8DaWtRTPV09+X9nk+UBmWaRPya+NS8+4DPhW5NAqdDGwp/xtw
         lJqrnOTcu+DN8U+lK9GujYCCKWlTQRgpC2czZmap5FnNAvIsiMmOKrvtHnFJHyBXOI4P
         tC7xm8xx6tkigeGFsbn5Ps1sxNo6oeS5NbX5vQL0z8gjBSdpY40ZfmOn62fPtvourbjs
         Vvvg==
X-Gm-Message-State: AOAM532K/aJj0vBFIzLGIgF1jujDm97DKpTasXzvnF4ASS/POIBsfNXI
	s+rXaWSCrA8Kq5h3OIxyTCI=
X-Google-Smtp-Source: ABdhPJxduzIiGee94ue/ywElFA8wVl1slL4+D7n2P0ydiIpP/vvSAiSKAFzAuzuoSdL82f0o0WTZEA==
X-Received: by 2002:a17:90a:5b13:: with SMTP id o19mr5085115pji.33.1623928046327;
        Thu, 17 Jun 2021 04:07:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:fcde:b7ac:c0d6:8bc9? ([2601:202:4180:a5c0:fcde:b7ac:c0d6:8bc9])
        by smtp.gmail.com with ESMTPSA id 23sm4785585pjw.28.2021.06.17.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 04:07:25 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardknott merge request: June 17th
Message-ID: <b0175d50-c660-5ea0-6df4-adbf2cc27cea@gmail.com>
Date: Thu, 17 Jun 2021 04:07:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 9ee0e08ba2395b9cb93f2273bb1018adb3630407:

  libgtop: fix do_compile error (2021-05-23 08:29:00 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to aca88908fd329f5cef6f19995b072397fb2d8ec6:

  thunar: fix CVE-2021-32563 (2021-06-13 12:35:48 -0700)

----------------------------------------------------------------
Andrej Kozemcak (1):
      squid: upgrade 4.14 -> 4.15

Khem Raj (2):
      mongodb: Update to 4.4.6-rc0
      mongodb: Change PV to 4.4.6

Marek Vasut (1):
      nss: Fix build on Centos 7

Stefan Ghinea (1):
      thunar: fix CVE-2021-32563

 .../squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch      |  25 +-
 .../recipes-daemons/squid/{squid_4.14.bb => squid_4.15.bb}      |   2 +-
 .../0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch        | 714
----------------------------
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              |   7 +-
 meta-oe/recipes-support/nss/nss_3.64.bb                         |   2 +
 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch     |  97 ++++
 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch     | 208
++++++++
 meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb                  |   4 +
 8 files changed, 316 insertions(+), 743 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.14.bb =>
squid_4.15.bb} (98%)
 delete mode 100644
meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch
 create mode 100644
meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
 create mode 100644
meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
