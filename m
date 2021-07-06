Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.7377.1625583199686481224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f0916ttj;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id o4so9092286plg.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r13EMVBV/ZZ7KRQrUK8oE311e0Ppa7ByNe2Ns2ED63U=;
        b=f0916ttj+7njzqVYgajKyoJtEJTuq0zK4lD1kOCeD5Tl8MmUHXfaJbObLGGmp75idw
         u+GGdcXnjNQXBSzuvdPqj8DLKv5xa3i2J+4ylRuQDyyjNw3d9IpGjBX1kAUqjT82SEPC
         N3BL+xXC0zzh9lQsAKs+B3rQjPu70K4O+qFY7lFbTc1hSaajtJm10KOnGewgRb03IfMZ
         2jP/Y+dUtL1WPWGR7chRVJFq7Qpe11XL8vUjXB4nxQnbwZx4A1ZkeAA71XPgiAoreqt4
         DlIFUiFhkoiV/zDDt662um5czcTe1SdFscKc6mf6ggxyFld3X4WH250UVjV0LCdcVAFj
         vzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r13EMVBV/ZZ7KRQrUK8oE311e0Ppa7ByNe2Ns2ED63U=;
        b=sIUB7RDFgSeGTlgYXLpmY1surhQj5E6zwek+CrLNcvsIOUguNG69y8VWYU6B2CjY5J
         TkKxGvJTVOEXCpDDD3ajuHBPH3d6ThALQHDL5FJTYKI4FdnDyOvtZjZU+8KbpdS5a/zG
         eD7UQAB/Qu2KeuGLoXXP/KPmSuXzEWCHaz1sWiVmIqTnGU3Sgf8H7AB7qQJ3D6Ti8A2S
         6cm1Kz28lulcmxlg8JW/XhPiRA30vjQoR3SEwYO2yEX45W1taLoEJobks8eXbm5jkFPv
         BMwEVtllxAmXpJH0P/YXnfisNMZ7CtesnOqddskDsONbsJ9DegQ7YU3SCq6HXpoV0fdS
         SzkA==
X-Gm-Message-State: AOAM533+7j2huDyG91pUPPWFVUfhMJOH9QllX8tShMJ/my9Wim+3ElXa
	NI/Xac0ZWDl9/4EZvwxwobBqZiZQK2VsSw==
X-Google-Smtp-Source: ABdhPJy8osU+93BaqM7qxU0ZLg4oGVSTv7Eyg8pGtEmX8P6xfX/GStklwOjOfKxGIHVb/XMfqV9j2A==
X-Received: by 2002:a17:902:f784:b029:ef:8e2f:430e with SMTP id q4-20020a170902f784b02900ef8e2f430emr17512869pln.28.1625583199105;
        Tue, 06 Jul 2021 07:53:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/11] Patch review, July 5th
Date: Tue,  6 Jul 2021 07:53:05 -0700
Message-Id: <cover.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please have comments back by Thursday

The following changes since commit c38d2a74f762a792046f3d3c377827b08aade513:

  dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (1):
  dovecot: add CVE-2016-4983 to allowlist

Chen Qi (1):
  python3-django: upgrade to 2.2.20

Marek Vasut (1):
  nss: Fix build on Centos 7

Sekine Shigeki (1):
  add CVE-2011-2411 to allowlist

Stefan Ghinea (1):
  python3-django: fix CVE-2021-28658

Trevor Gamblin (5):
  python3-django: upgrade 2.2.7 -> 2.2.13
  python3-django: upgrade 2.2.13 -> 2.2.16
  python3-django: upgrade 2.2.20 -> 2.2.22
  python3-django: upgrade 2.2.22 -> 2.2.23
  python3-django: upgrade 2.2.23 -> 2.2.24

ito-yuichi@fujitsu.com (1):
  cyrus-sasl: add CVE-2020-8032 to allowlist

 meta-networking/recipes-connectivity/samba/samba_4.10.18.bb   | 4 ++++
 .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb           | 3 +++
 meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb   | 3 +++
 meta-oe/recipes-support/nss/nss_3.51.1.bb                     | 2 ++
 .../{python3-django_2.2.7.bb => python3-django_2.2.24.bb}     | 4 ++--
 5 files changed, 14 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.7.bb => python3-django_2.2.24.bb} (41%)

-- 
2.25.1

