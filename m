Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.15755.1602255354184509771
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RiS6d+5T;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id g10so7077833pfc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iWiC4QIUHs1KUDtGLL8x1w1mW8ilNYAy3Sn/SXZROM=;
        b=RiS6d+5TKH2CcZtmDXG6oIrSdIv2jVWgx8ZfpCJ1Xl9aLyzcUAdFBVKjVoPxVBhYCG
         bYvHeRO0gFssO05OtNPW3t5Mpe+02n3qVo3/XEL+NqWqXoy1zsf82kYC0Wbne4VtgnGD
         tqE8t3Im0I/VMwel+z/o3nzu5V3t3EjEYFf75z/omPeS1Mlulupo6FurAuXkjuYHIr5O
         IzaU15xGRpOpqsAk73FZlTimHysde4X1gdE+xD3V9EW4/EkXA9Is0vwt0XtVhZ5e3IiZ
         /4OgUZcywjHPAGNksmzoO4aLLrpjxhtoXAcvvjEz44E49j/V9zHJxRR/JDkKfYj/Zskp
         yMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iWiC4QIUHs1KUDtGLL8x1w1mW8ilNYAy3Sn/SXZROM=;
        b=DVHsdGMChU2ZD2AKMjGXh96gKPmKfXGzXvqF8o5J5UDwbpaieVdxglbF7VmdlxUvpd
         JbDxpfoxbW5uMmccZ0JINd6mgiaU6lQaoTNt7411rNZ0k1hFBsHHXPmedv+aGwK1jd+a
         8BjHP/mufApkLEwY3c2J9Ha5G6f420Wl1/s0huSSmNCrAqeKqMNDVnPFidFCAjCGjFef
         KExaMVBpMfUpNedkrLFiCcWxV13oPxnxTcBeiZLgdcoghWzBRi8vs3xv34LZQZAFwd2F
         pQnXd7N//yjycvgH/rJoWPaH1etXq1PJd0HJX0IDMriqtJ2B1AtQ34ozxpn24DimEl3k
         n0Rg==
X-Gm-Message-State: AOAM5335AvuzMRmQP9QWogx054NHzrjUWxRC/J3am4inanHBgfnQmjsC
	2uIDNUtOxVfb1JiWmwMOORwwZgbu0q0=
X-Google-Smtp-Source: ABdhPJxcXfzlwc3nlgpBk+7rjysnP3GGPbgLvI2YZUvZ8VxM8uNogdVR558ym43g4f3yvTIujJ9Niw==
X-Received: by 2002:a17:90a:4e47:: with SMTP id t7mr4868995pjl.26.1602255353490;
        Fri, 09 Oct 2020 07:55:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id z10sm11642010pff.218.2020.10.09.07.55.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:55:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/9] pull request
Date: Fri,  9 Oct 2020 07:55:33 -0700
Message-Id: <cover.1602255255.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only

please merge this to dunfell

The following changes since commit 144077083457ccb75700777d5e6b1da9aaff01aa:

  iwd: Upgrade to 1.9 (2020-09-19 11:22:44 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next

Andreas Müller (1):
  gnome-settings-daemon: Remove wrong RDEPEND

Hongxu Jia (1):
  python3-pykwalify: fix missing comma

Khem Raj (1):
  ssmtp: Use update alternatives for conflicts with esmtp

Martin Jansa (2):
  netkit-rsh: inherit update-alternatives
  ssmtp: adjust u-a

Mingli Yu (2):
  smartmontools: Remove obsolete setting regarding the Standard Output
  strongswan: Remove obsolete setting regarding the Standard Output

Pierre-Jean Texier (1):
  haveged: upgrade 1.9.9 -> 1.9.13

Robert Yang (1):
  crda: rdepends on wireless-regdb-static

 .../gnome-settings-daemon_3.34.2.bb           |  2 --
 .../recipes-connectivity/crda/crda_3.18.bb    |  2 +-
 .../netkit-rsh/netkit-rsh_0.17.bb             |  2 +-
 .../recipes-support/ssmtp/ssmtp_2.64.bb       |  9 ++++-
 ...setting-regarding-the-Standard-Outpu.patch | 34 +++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  1 +
 .../{haveged_1.9.9.bb => haveged_1.9.13.bb}   |  2 +-
 .../smartmontools/files/smartd.service        |  1 -
 .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
 .../python/python3-pykwalify_1.7.0.bb         |  2 ++
 10 files changed, 82 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch

-- 
2.17.1

