Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.159.1593141282409379188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SE324YBA;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id u8so4104089pje.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 20:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=y/sbNfY4WuuHrNClkYmus2Y0jtAnC5Q6ED7TSL4EqH0=;
        b=SE324YBA6HvlBPZpljkpxKKuTiniC0kg+76hCDE4WHe1gMegS8fc8TcfLahdZiVxrJ
         51IlAtk2k2TCpHYyOLcZJBe/oNiH39o5BQYE9hKUaR3ChJB1hyZD+6SWQYoSZk2lkEvi
         XjAdwQ2l5QIhZFmpqnDaXRsoj8laapFNgZMx1h8HRAL+mv3+dmT2FPv3RYWlPyunoU37
         Zy8745+Q8NEDo86RxEaV2JBsrZLO0yRW569c7FNgwJ/Qh7mTLR3e5JExb8qRC0UsRIu7
         KOoZxT83RoeaL8Z9TBwNv9x92qZwi589b5z39te1X79FxumQ8Q/ZYtdoH0c9iD3X5SQ7
         FK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=y/sbNfY4WuuHrNClkYmus2Y0jtAnC5Q6ED7TSL4EqH0=;
        b=Ywtr7fTTDW7yUKIY/pWs8WOBvWb5KAV1/7FHvrPU0Ju7R492aeB7twFqnPRuVAOqrV
         EZpARG22a1aHERq2o2TmG1GNu44SkTdxd4TEoS1iAdj5tocQHNo7Zu+78TeHNPEP0GvE
         66eUGPk3IOx45NHkhodyEdHBvjPm9FguNZw93EQ5fnkMnGP2v3eLuSN98yYbmi3WrZ/1
         gDMskMftV/f3mqJ0+2Hyr8ra9a6scch5bX7Xu+l90c4W7tb4o7bW1bkUQyumnL16soGp
         hOmnlEFk9nAup4HDm0Zpqu26IqULkSLca5Tz1Z+6OUkDuut3kdESsS1aAVLBGZ4QnYpA
         2rHg==
X-Gm-Message-State: AOAM530FYLiUvydjLARceO5s2+48nB1+whAOpoP8yXKInTsjlK7Lo3wY
	HZOkNfJ9ihMmcx5rNnk2tJnwlobz
X-Google-Smtp-Source: ABdhPJzyPCJLqb6DcBPKIntFc4V14IeycJGuQ7cN+PdM4xXXX0cBmEqibglJiUCFVI2IhkjpRhviYg==
X-Received: by 2002:a17:902:aa42:: with SMTP id c2mr871346plr.216.1593141281463;
        Thu, 25 Jun 2020 20:14:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:acbe:8216:8a55:1b44])
        by smtp.gmail.com with ESMTPSA id z1sm24506070pfr.88.2020.06.25.20.14.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:14:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 0/6] Patch review
Date: Thu, 25 Jun 2020 20:14:32 -0700
Message-Id: <cover.1593141198.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have reviews back by Saturday

The following changes since commit 9e60d30669a2ad0598e9abf0cd15ee06b523986b:

  sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15 13:30:34 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Armin Kuster (1):
  tremor: update SRC_URI as project moved to gitlab

Haiqing Bai (2):
  gd: fix CVE-2017-6363
  python-urllib3/python3-urllib3: fix CVE-2020-7212

Wang Mingyu (2):
  libssh2: CVE-2019-17498.patch
  opensc: CVE-2019-19479 CVE-2019-19480

Wenlin Kang (1):
  ipmitool: fix CVE-2020-5208

 .../tremor/tremor_20180319.bb                 |   2 +-
 ...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++
 ...uffer-overflow-in-ipmi_spd_print_fru.patch |  53 +++++++
 ...er-overflow-in-ipmi_get_session_info.patch |  53 +++++++
 .../0004-channel-Fix-buffer-overflow.patch    |  69 +++++++++
 ...er-overflows-in-get_lan_param_select.patch |  94 ++++++++++++
 ...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |   6 +
 .../recipes-support/gd/gd/CVE-2017-6363.patch |  35 +++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb        |   1 +
 .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
 .../opensc/opensc/CVE-2019-19479.patch        |  30 ++++
 .../opensc/opensc/CVE-2019-19480.patch        |  34 +++++
 .../recipes-support/opensc/opensc_0.19.0.bb   |   2 +
 .../python/python-urllib3/CVE-2020-7212.patch |  54 +++++++
 .../python/python-urllib3_1.25.6.bb           |   2 +
 .../python3-urllib3/CVE-2020-7212.patch       |  54 +++++++
 .../python/python3-urllib3_1.25.6.bb          |   2 +
 19 files changed, 897 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch

-- 
2.17.1

