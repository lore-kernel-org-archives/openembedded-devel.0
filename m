Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.10155.1593395406243120014
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 18:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UKFMqAut;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id y18so6468263plr.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 18:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=P8nhGn5SmbGyaITvR7nGg+b/sO8g5YnLSxL44/YRGeM=;
        b=UKFMqAutyK+VDA9BjPfjWaKNA3ivP6zdXssh8+MvtXjPxwRKNFoqydFZHVU9WPgacm
         qGYsbgc7TXP4li1TrC7sSzwVHEfFtnhMvGdTH81tPNYzK085VIkXjaz7ELWAESHvSZHn
         HH8pzFyzlih4CWUQiHJ8vIcfUmd0inuDZF89z0XLGsVhTFfd6TwOezHPgwLAefka5XkF
         qAcEKOizZp2bKi4daNxWXdUVUrdliEdQ54l/q37SCpaK2xzo712+OjIAucMYZSas2M7+
         4oOvlwS6gorgkPNTN7o7CsJmUfBeClGy8ZZ77cnJtB5SFdQP8+Oq78twEX1IZJtQfiMG
         KofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=P8nhGn5SmbGyaITvR7nGg+b/sO8g5YnLSxL44/YRGeM=;
        b=KR9xFCNkRYfypYy95E06vPLanCojDT+ZL75vTXfP4rV0vqHlaWdlUPs6E8oYqghip7
         2X/IKFWGrQmPfxgVUZtGmR8a3yFlmerlU+v8x2iXYbiyMU1+piIgIlqrLFKUN0taNwXX
         BQt+DmfHVhQ7eVxIH0/9R2NDfGfnjD1J26SjpAr3JRm7+ykOZEC//OumTqqbooMylCnG
         f4l7Ekw5df7bQOzLe4BaQAsnhgKyZjB8X6iXcrhaRJu+TrBO4UeafeKyP+qYPLi1JYQw
         A1mPLotOpCh5ytMg7FSsjPZR7c7DQHr+JGSrDY901PG1s1YVXnDlnaUBq2Urif4As8zd
         0Sqg==
X-Gm-Message-State: AOAM532A1zCN5sNU4rZu2U8MbK1QR1T+LwV3rEOVoNXDv6wJm6TiC9Ay
	QORCTyTkzEhoJ6RV7YnRS8CHVGCh
X-Google-Smtp-Source: ABdhPJynjMGeFJhbLSboW98kJmw9P2Ek5uPbVgkSg09vaxyWcNggv+v4JYv1Re5XeURFkcKkIoBFLA==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr11465973plq.341.1593395405376;
        Sun, 28 Jun 2020 18:50:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:c4f0:9f8d:a81:ca7e])
        by smtp.gmail.com with ESMTPSA id w1sm11278370pfq.53.2020.06.28.18.50.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 18:50:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [zeus 0/6] Pull request
Date: Sun, 28 Jun 2020 18:49:56 -0700
Message-Id: <cover.1593395011.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please merge these changes to zeus.
Cover leter only

The following changes since commit 9e60d30669a2ad0598e9abf0cd15ee06b523986b:

  sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15 13:30:34 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded zeus-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=zeus-next

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

