Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11826.1795763025963617383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yFi0UBZ5;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0213202fdso40523235ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763025; x=1796367825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwZLoXR0LKw/f65axSaaf/shOOXta+45fWr2giXxStY=;
        b=yFi0UBZ5QkOUD5HGYJKtvPvRiLO0B5w1LWTg4QxkuuG2kb7h6krfHPzoUMxs7WeVbg
         4jJKsYM/3pjwLZ3aGLkxCM5kdTSSZOfFwhVS0di/BOpVHM5BQuHn5/zU//V/pKnjAMch
         0bOEXMjUMqytzDpMavUrXBYQgPtBkPscsSDk0QDGclIVhYWyiV2B7krQf5qBFy7Lq89h
         iEeEPWJgfELPhlLQurwIMdfCbvsV2yNYTYdiHTBQrNXmy/Us7zFa5iLdD7ssocKAN1kK
         kzpBRgcWqjxHsLYzjjzVS1bagNC6owY8WBFS0ca3fhXovL06JKL/Vmgp0j/KpHSzBdke
         yXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763025; x=1796367825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwZLoXR0LKw/f65axSaaf/shOOXta+45fWr2giXxStY=;
        b=JzetTNW4/Q+Oa4I1OrEp40HzwBBLmxgO1jMijtAV4HhqKw56Fq6t8xK1fmXpqFBrdT
         +77xxPNrMKSXEUGYCPiHLbI8ss39nJFadKNMXGuqTdugtQPt9Q0vSIZ0gsrsdyNEKLLj
         b1oM6qdqcSyd0JKeSfBxisgrMepJE+L7UJ+wsHlYyByRsDK4FDqvSJU/cGzG9OUHx0Pn
         l0gr22C/CQK5Ei0N45QNH/LoLPGfIv/pDCqa+8gbG/lRH28XautXwLyPscuYsxY5t4cL
         8G5WEX+JvDavuZ9YQj/z8GOtLGhragA0mfgnulTxjkfrCCIw/voDyfVq8fCX/oM4xSoy
         pYNg==
X-Gm-Message-State: APuU4Z9lxeoBnjbvkv6E8z7yV5CO7x90GRptfWLnnzbQg9HL5oMqoivH
	euBQn5ZjfX4080kL4dM3R7rJx6vxI+ey9A1e5/7j2YEZ+XAGV7thTQ+gi4+az79S
X-Gm-Gg: AZFdTZcgWAdmL6C3M0/UU3tR4XFqEJkIV3jLX903eX19l5RE0k+9Z36YG4juus9DOhQ
	i/Jdgead0i74N+VbI9JmNYVROmRkKhw9EmeJxuuYpz97jpnlN38T34otjweLLppuOvjwoxG0LrJ
	t5/4upYGIs1stQWm+fQX0Jy8hGHH7WkD4FQf7e/1lXq1jX7u0j6CbqFvAOa8IcbaJUoaWRlykmH
	Y/XjoMN1ZNcKPj5SGzRy3WOhfeT6jbrbVJNQ/uuCsb+0hKywwYmhFaO3OoszD7Zh2EF92UhOMVh
	0zLeW15MIoEXi7FoF6ciRy0yYSuD/5uUz+zZuFXrZEjh6bQE82BcDseAuHwueNf3MrAULPlTXIJ
	bZfoI0BpGGL5/mTeI+GpqMP+u52KgU5Oxp0w4FB8rmA5o49sF26MItGj5574uCrDI6tH3m+GIxL
	wUKyYBl9TzE3NBxM/STs1NE9VRuEIblyL6sIndLJcnOLRomRRS+dJtNUYFfkGadfQNP6OzZIvG/
	pDvSN2QbfG/cmo8BthdS+w59pjRq75SFY5rrG9rr/2lLeDMOxmjNF2RTWPtTwx79Vnfs5prVsa5
	+3PBdAnsvxqT3o9zIz9cHSG7QzPc9a4vHK9/yOqWHsskqUxUIMo5h1a5PjeFJYpjHXJFdF481So
	GRw9ZF+rvh3i47FeimfcEwkOOCthS/AWiyScgg56ysSow9f5imQvJhWDvzcXVL3W3dE4Pej33Ec
	GWRHhKwSEZytIW4APXGvvQpZ7ef/kdKmZwxQ/PEpI+6EiuCWnfMVNeqU3p5mnjKWcj7izqI3PkX
	CihgzUrITo2nonrIBFHFgNLJ71wakr54wnAv9MgnpGyuscqUZNnhOK/YwbdouS7YhLG5mVGkeyK
	l5Qe
X-Received: by 2002:a17:902:ecc1:b0:2f0:f6a2:213c with SMTP id d9443c01a7336-2f0f6a223afmr39195525ad.8.1795763024949;
        Thu, 26 Nov 2026 23:03:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm112292155ad.73.2026.11.26.23.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 0/4] Upstream checks, mod-dnssd source and swagger-ui upgrade
Date: Thu, 26 Nov 2026 23:03:38 -0800
Message-ID: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133364
Content-Type: text/plain; charset="utf-8"

Upstream version check fixes, fetch mod-dnssd from the 0.6 release
tarball and upgrade swagger-ui.

Khem Raj (4):
  webmin: Fix upstream version check
  fcgiwrap: Fix upstream version check
  mod-dnssd: Fetch the 0.6 release tarball
  swagger-ui: upgrade 5.35.1 -> 5.36.0

 ...gger-ui_5.35.1.bb => swagger-ui_5.36.0.bb} |  3 +-
 ...-properly-quote-CFLAGS-LIBS-for-apxs.patch | 30 ++++++++++++++++
 ...mod_dnssd.c-Use-ap_unixd_setup_child.patch | 36 +++++++++++++++++++
 .../recipes-httpd/apache-mod/mod-dnssd_0.6.bb | 10 ++++--
 .../recipes-support/fcgiwrap/fcgiwrap_git.bb  |  2 ++
 .../recipes-webadmin/webmin/webmin_2.670.bb   |  4 +--
 6 files changed, 80 insertions(+), 5 deletions(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.35.1.bb => swagger-ui_5.36.0.bb} (90%)
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch

