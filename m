Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.12797.1611774450154792735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DotwUYSM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id b17so1572594plz.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 11:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F3boKu3CAr7uHF1UFV7HuP/l33fGcxJJaot9MyAClZ4=;
        b=DotwUYSMI4zURw/kkbMTMNgjROaENcCQXchA6LXGRqpsOct+Ih4oSt9lZPRS8KWDfZ
         ryraO9ugkPu7/2w/Shi3b9htTgJG68CttqbTWerubpkkO3qiQ4N/Ad20jfKKBCAXRwl5
         Sjyi6SevjS2SSHsCBwMbm04k9LbLQ8Mp8/6TJY6F/0xlx4bMKULkzS/pjUnenxEMhYmM
         B9XurWm3pgLrjS0Qp4AK+LlTMgNvy/mnQs1SLMvxLIH22Y0Hdw0sCPVjGTnQF8PXIq1z
         +DQ0+PQKNXAVBBOMdpp9DQrA3Fw24Oa4MvYVUFoMCqiL1ux1Z4SW5uTdm2xi6IU2Z0Py
         FMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F3boKu3CAr7uHF1UFV7HuP/l33fGcxJJaot9MyAClZ4=;
        b=mDFcnlkZZ4+p+OHg1zRXNbi4FfMnD42Tqsk1seuOntDMemIiQtqliB+mo8SFz12zof
         0gr0nVid7WURFxxsrKmY3qHvsCCNc6esSa/wo1m4/HBqIjOnimCg4HCiTyFFfHMrSqL/
         jgs16RDyAlObKRDl3gszTtS3fDHw5Yhz6MBr/Oquzp1ZvBJiyfUrRWO9ngY9oZaY4e37
         +lW1PihthwvO0ivwO2IBONjacaZgEYpC0dvRQ75evRkR7kotQ5JYvOiN9Ula4VJqWHFy
         5SN281LMFlFccfGsMrfMipMUNyPq7ZpAoyNzf+Opeg7xUuGZsPPdzfxq6z+65Q72jviv
         ZKqw==
X-Gm-Message-State: AOAM531bS1D1fXItJesKKXnp3b2yrOGrc1G3XAnCT6d/ZCMRrY7DTlI7
	GYX7yXxjFEJec78fogH6j1ZQGCtqagDmR5HR9Sw=
X-Google-Smtp-Source: ABdhPJxnSjxqp0V59R5e3VVp/9/6Wh8dNOeWJ8xuP1DjQj4FplsJW+YBjdAqij6yAhfJJWt1Tf9ZRQ==
X-Received: by 2002:a17:90a:7e82:: with SMTP id j2mr7100691pjl.217.1611774449097;
        Wed, 27 Jan 2021 11:07:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gg6sm6095055pjb.2.2021.01.27.11.07.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:07:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][dunfell 0/3] Update sip3 to 4.19.23
Date: Wed, 27 Jan 2021 09:07:09 -1000
Message-Id: <20210127190712.818807-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Builds of the dunfell branch of meta-qt5 fail in the python3-pyqt5 recipe.

The fix for this issue is blocked on the need for sip 4.19.23:

https://github.com/meta-qt5/meta-qt5/issues/376

Also, meta-qt5 gatesgarth identifies dunfell oe-core as a supported
layer.  This type of build also fails due to the need for sip 4.19.23

This patch series cherry-picked from master without change should fix both issues

Leon Anavi (2):
  sip3: Consolidate in a single file
  sip3: Upgrade 4.19.19 -> 4.19.23

S. Lockwood-Childs (1):
  sip3: simplify recipe

 meta-oe/recipes-devtools/sip/sip.inc         | 36 ------------------
 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb | 11 ------
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 40 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip.inc
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
 create mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb

-- 
2.25.1

