Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.9649.1617811525355018115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 09:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XElSsxwF;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id q127-20020a4a33850000b02901b646aa81b1so4656573ooq.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=xXkCJWF4QGYYlsmIfhZFuK5H2jGR0rjIWfd9NFpFzvY=;
        b=XElSsxwFpzJNrNgVx2P96vA2ETjv8oXlsQVlIKMA0pmConPqbTTohuSiXPP9xxcES/
         /Pp2l+7CKb4u3+f4fm4k+PtWGliMnAHesULPgOzTtIrxCkK5MlA63sNBHb+VV+kqhqje
         Uw8RhC4hmKSjVHzEZOc8qZkwklOsesapZ/jl04XYzCCRedq1xP/bAt/xGLnVlpV4Wcts
         TEUsIav7iY4XA2YZFnFMSiStxwGq32PfI9Sr3L7bCh+6iqzkG4rByvQSQ5REQPXG0XF6
         uCXzxTuOr/yiWxrdFapFQgjU7i5V1k2/sMYledQ9rGiKHs6AmfLKizvF9GNt7AA88zib
         k5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=xXkCJWF4QGYYlsmIfhZFuK5H2jGR0rjIWfd9NFpFzvY=;
        b=FtjlnvHU7vhL0KtVCwjvgi62SuOKbVvI1pHwM111gbh7kRgjIDEY7q6H01mrlP9uSP
         pmHB89pX7e6nG190u+NRezPLdv4yVcMgLhBHuxUWoJhPf3E0UKIzL2bsGV2oYQq1+hnd
         J6FYrlvwcuaNDUBAj+dNQp1J9awJ2rmYPDFOkbmBRSHzk6Sao5/d+QEaI7oiRstxmWvQ
         sPWNgUESwfYDZbMXsgwKPjzLp2Lpg56yyq3z6+R+eHWAnJpK3NckcJJf1l+Fr+nNEUXQ
         N3lP9MCGNjKpUDyxQFp3gQH19iM6qojTxGDjF44lUGDHc+7OHpvpWg5BEzYJNpT3v0/y
         0sjw==
X-Gm-Message-State: AOAM531jrGthqL2oWzyfAzKCy6M2++De/rr2y3nCCbYuc9aGFAEuiLZw
	pZQo6KpgviZDXjstuYpg1mI=
X-Google-Smtp-Source: ABdhPJy0bwpByrB64ftFTmm+f+zsisOfmEvhJ8T4ms8SkfPYf2syzQt/MojxOv2jwcgpHa+I9qtBPw==
X-Received: by 2002:a4a:395d:: with SMTP id x29mr3570808oog.41.1617811524713;
        Wed, 07 Apr 2021 09:05:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d82f:cd1e:57b2:d04e? ([2601:202:4180:a5c0:d82f:cd1e:57b2:d04e])
        by smtp.gmail.com with ESMTPSA id c2sm5367385otf.66.2021.04.07.09.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 09:05:24 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: dunfell-next merge request April 7
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <c32216ce-79fe-5457-8ed4-844973a0c8e3@gmail.com>
Date: Wed, 7 Apr 2021 09:05:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 389757a7494221fea1d8437e9a01c6e4fb4700af:

  opencv: Security fixes (2021-03-16 08:40:07 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 430ef96fe65f62d8da995f446d5b9b093544f031:

  wireguard: fix build issue with updated 5.4 kernel (2021-04-07
08:55:15 -0700)

----------------------------------------------------------------
Aditya.Tayade (1):
      neon: Add ptest

Armin Kuster (1):
      wireguard: fix build issue with updated 5.4 kernel

Marek Vasut (1):
      freerdp: Add missing libxkbcommon WL dependency

Martin Jansa (5):
      opencv: refresh patches with devtool to apply cleanly
      ceres-solver: prevent fetching git hook during do_configure
      packagegroup-meta-oe: include nodejs without meta-python2 conditional
      packagegroup-meta-oe: move the packages depending on meta-python2
to separate packages
      packagegroup-meta-oe: add guider

Peace Lee (2):
      guider: Upgrade to 3.9.7
      Update commit for version 3.9.7

 ..._ndo_send-functions-were-backported-exten.patch |  32 +++++++
 .../wireguard/wireguard-module_1.0.20200401.bb     |   3 +-
 .../packagegroups/packagegroup-meta-oe.bb          |  37 ++++++--
 meta-oe/recipes-devtools/guider/guider_3.9.6.bb    |  39 --------
 meta-oe/recipes-devtools/guider/guider_3.9.7.bb    |  19 ++++
 .../ceres-solver/ceres-solver_1.14.0.bb            |   8 ++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |   2 +-
 meta-oe/recipes-support/neon/neon/run-ptest        |  25 +++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb        |  15 ++-
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |   4 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch      |   4 +-
 ...-work-around-deprecated-ffmpeg-RAW-functi.patch |   4 +-
 ...place-ipcp-unit-growth-with-ipa-cp-unit-g.patch |   9 +-
 ...-ts-create-share-library-intead-of-static.patch |   4 +-
 .../opencv/0003-To-fix-errors-as-following.patch   |   8 +-
 .../opencv/opencv/CVE-2019-14491.patch             |  56 +++++------
 .../opencv/opencv/CVE-2019-14493.patch             | 104
++++++++++-----------
 .../opencv/opencv/CVE-2019-15939.patch             |  20 ++--
 .../opencv/opencv/CVE-2019-19624.patch             |  22 ++---
 .../recipes-support/opencv/opencv/download.patch   |   9 ++
 20 files changed, 255 insertions(+), 169 deletions(-)
 create mode 100644
meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
 delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest

