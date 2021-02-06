Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.13755.1612653431049588018
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QRlxR2ZD;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id l18so6039123pji.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNwAaNzXuG89p8qLBkS5FWkXfOEQd0r4QDOKaw/HFVI=;
        b=QRlxR2ZDNSTDzIvLoim2j/w3NXHnNiAPGTN+M220rnlowDhQXuXr24Rfwmvw7ZXVMf
         HmDr9rwnTtWmPRi0St1D3s8m3Xiv5EGWIxnb9qbuN25AIL+0Fykdy/V1ll3K8ghXfiW/
         yBQyyFs7b7XuyddHeqwoFzhhiMELOu0eKOiVzNrsXcK1Kgm/mvH28ADDSKgScoM8HKkU
         eDCh171pzLMPOplgVTLXx3QEkl1PnJ3wi9aO8XGWoCb+Qyg7mjpcoFFNwqFap53uegtf
         2XdLKHULb7zYdu3IfcvlUaI90acIHupITRBrSvnUrM525vOmQEqkanBkpkqBHXXL4ZlT
         4wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNwAaNzXuG89p8qLBkS5FWkXfOEQd0r4QDOKaw/HFVI=;
        b=t7hPRwWk+6cXaH+Rf8FjFMTyJxqtJ+sZQRA70v7rqOb0OpuD8gxbRiGfAScX3V7pli
         vKTKNDGaTkN/Hn+8VCw8M4SEjCL0lk6yDAswavzE9ImV6CPHVSfr2Y4Gx3phcWKEvkkB
         9FnOIwiNrCy5Y0D3T/g/r/jgTSvfe0y4K8BueAFSPWGndH600KVjVEi4HYe/OrH7wEcT
         esNEhoI5p60tpTNtY5dM7p0sjVI4RvsAMhbVSo91Ffv8qqs7sDlSzbkvW451ySo1CaCU
         DeLzvq9ccsPmPwejtB537Zg6EsgekeTBD3MHM+X2fPowHgzoAUSFtjESKYgc6xWv/ymG
         9FcA==
X-Gm-Message-State: AOAM530JLgZ3vog98tsUew82GfXAsQjZ3E5fYcqXctGnSgZmtsZmSppB
	kwEOBOu6P9DDI2R9uMbVM8/4/+cYQ5cMuw==
X-Google-Smtp-Source: ABdhPJxY4yAfJEf8Y2DcsZXjIZBN/1mdXbZ7iToNMdCbcodOnySon8oMFQud3XFddFSvUnwkU0/qEw==
X-Received: by 2002:a17:902:d4c7:b029:e2:b2cb:136a with SMTP id o7-20020a170902d4c7b02900e2b2cb136amr8394395plg.53.1612653429922;
        Sat, 06 Feb 2021 15:17:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 00/10] patch review Feb 06
Date: Sat,  6 Feb 2021 15:16:56 -0800
Message-Id: <cover.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next Gatesgarth patch review.
Please have comments back by Monday.


The following changes since commit 6ff4bd4f345b4e8030b9197d13097308df521576:

  postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

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

 ...Compare-with-max-int-instead-of-max-.patch | 48 -------------------
 ....1.2.bb => iscsi-initiator-utils_2.1.3.bb} |  3 +-
 .../flatbuffers/flatbuffers_1.12.0.bb         |  2 +
 .../giflib/files/CVE-2019-15133.patch         | 23 +++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 ++-
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 17 ++-----
 .../recipes-extended/zram/zram/zram-swap-init |  2 +-
 .../recipes-graphics/xorg-app/xterm_353.bb    | 16 ++++++-
 ...{openldap_2.4.51.bb => openldap_2.4.57.bb} |  6 +--
 .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.30.bb |  1 +
 11 files changed, 78 insertions(+), 69 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.2.bb => iscsi-initiator-utils_2.1.3.bb} (96%)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb => openldap_2.4.57.bb} (97%)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch

-- 
2.17.1

