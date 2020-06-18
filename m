Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.10181.1592494088599087767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rVQ2RTLK;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x207so2945628pfc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=+B3oefysaCjK4miC4D470RPs+PH6PUZRWc0M1Hoc6Mg=;
        b=rVQ2RTLKkA6doqy/WcK2WmHjmXhoAnK+aNjS9m3EFD/RrioV4SXwMIppdZX90Avcvl
         4JQXDxdx+ihPzHYCaEhnZ4L4ufqE/Xv6qzPE4gegfm1ZPybeMEerQp9MtjTuvbR6/5kI
         WO7pU760uu0g9AxHbZuSeviWptlsu3QR9sioskbJaOdKr2H7KL1R2zXI7gczqrwE+AT4
         zayXU5nhCBCNhZUcX7RFBzzIkhiODqGChUmOJhz76b3dlktTX92+2HsvWbHsdxwgUU16
         dLrP6dzuXYdwnPg+VfSpRYnWO4ksEoNl5nQ+TrPC42KFUavhwzlw6MrFfWd8Y1VYTNNy
         DL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+B3oefysaCjK4miC4D470RPs+PH6PUZRWc0M1Hoc6Mg=;
        b=Tf9WrY2BAN3HNRN/3ya8Wj9W3qP7N6PHFixiYxqlOPE9ut5H7T8Kv6LsjrJbovDa41
         I0FHUa6qVRP78xGB6lS6k+P9Xib4E2vWLQdMxkupJ8LdmHacqiaD7gsPPw09T9Lk38ZH
         yJK5LVA3TiZalSEQbssJqgZYlwqbWoSHJ+bjRAfqYB87qB4VGT1ZQIOdh5G+w7a1L3v2
         tHQn74A7GJha0zbDK46J0GSdoAvDSs7bWelD8L9EBm1Tm2CpnQQch0R9L6d1P+9RHBOf
         3IP0kk5mVr/jQ50F3QVaR4XKQ3a97xm/o9qLGZfGutTad+cU9SSnLZm2R753vRjsya8A
         bXUA==
X-Gm-Message-State: AOAM530+WoST8lT6h+1abvQ/0gP4TMdRPVIdEaRioAEY/t0rNZNufnoi
	MoZ1f/OM+RmELEqBsSzamSNXmut2
X-Google-Smtp-Source: ABdhPJy8U02hBtudaxygo+q2D8CWEPlS+i6tsCyf1QtAKVouRn9yg9Z84GPiFPPil8l3C+VXq48g2g==
X-Received: by 2002:a65:46c9:: with SMTP id n9mr3618795pgr.89.1592494087666;
        Thu, 18 Jun 2020 08:28:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:06 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/7] Adding new packages
Date: Thu, 18 Jun 2020 08:27:58 -0700
Message-Id: <20200618152805.13075-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

This set is needed for a recipe in meta-security so if any of these are
rejected for meta-python, I will keep them in that layer.

Armin Kuster (7):
  python3-configobj: Add package
  python3-croniter: add package
  python3-flask-versioned: Add package
  python3-huey: Add package
  python3-sqlsoup: add package
  python3-smpplib: add package
  python3-pyrad: add package

 .../python/python3-configobj_5.0.6.bb                 |  9 +++++++++
 .../python/python3-croniter_0.3.33.bb                 | 11 +++++++++++
 .../python/python3-flask-versioned_0.9.4-20101221.bb  |  9 +++++++++
 .../recipes-devtools/python/python3-huey_2.2.0.bb     | 10 ++++++++++
 .../recipes-devtools/python/python3-pyrad_2.3.bb      |  9 +++++++++
 .../recipes-devtools/python/python3-smpplib_2.1.0.bb  |  9 +++++++++
 .../recipes-devtools/python/python3-sqlsoup_0.9.1.bb  |  9 +++++++++
 7 files changed, 66 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-huey_2.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb

-- 
2.17.1

