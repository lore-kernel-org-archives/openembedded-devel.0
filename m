Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CF8C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 08:28:11 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.52496.1752392647738053477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 00:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=M4zb5WO2;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.167.53, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-558f7472d64so3538802e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1752392645; x=1752997445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G767Oigo0FerenWxFtwU0p5/pvV+AKaYJMBLK+y/3UI=;
        b=M4zb5WO24DEWaab4expkh3HmyuR1xet9FN6pYatwgXJ4iY7kB1aSBWlc6JuuX850pK
         JtFu88lJD9JImyDMgQ+Xq6sRVwdhHAdMemnLI1AaXz7pgTNkRQEW/6NuhDg3Yn/SVNi2
         eiCPd4mCg/JtpmmRrv1nfFVdzFcJJfiXtKyLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752392645; x=1752997445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G767Oigo0FerenWxFtwU0p5/pvV+AKaYJMBLK+y/3UI=;
        b=BJG3jJIeheRUhTD2WlEBaJHbWOQWDk1CfjhJOz1t2Ahc3TSNQ7G7eQnwwgoE1eIVVj
         Ay/Rkw9cAcipXYihtN3ow7Qgh8kM02sIq9ReRoh53Y5ekn5l8Mx6igLNjdnN6FA2qEPX
         Xljvd4y+SpZ87W4XR3AT/JGs+ibz0ZXKFJH+0YbyDqyQ43jp+nESi+EgfhF835ZDFScb
         y2WJAgb44dXkjVaRXxNm5jLWpqfkGEOhmHxPym3I00zrSQdIU8l8mVhkrpXGfrdGIW+/
         5tSn9vR2dxYb6wu7krtKI2k51WZkKL9UwlU9VxJJsfqVNzqe/d0UxD4wsUxrP/pZb5+e
         xHbg==
X-Gm-Message-State: AOJu0YyTrKsTUGRgxmTmwn7PxbkL0WpSM/+85W7AsyfjdHVin3KCaJOq
	Xu3qTrkEwYgsUomU22RUvkWhhtuw/pkKw87ziLC5kCKVKipPqWBKeJEIkJAM3cQMXfPk2OCeAQY
	SkKAv
X-Gm-Gg: ASbGnctViJGuvjXz4ZxKpyusio9dm9yyKw1wZ0GP+2Afga6YPwju6rjlDA+M7Y55YgK
	MQTWqhoJ+aP3JpJNrxjwzWItJNsGLBW8+VkWeFWxY9X82rfUs5RZYJcC2Fk+zLSQDOvSfuCXLkh
	bLEaY/Sx+O//Uw6BmzMoghYXH94VNRlikW1l2TiBW80wGnmb4NIAxYBNqjDuscSyz35tlmq3kGi
	yftEHAHEdzSL0x4goEUMP06rtfh//aTVQh8F7dbyIaMBrDhxrbqsPVjJJdqJahuYYUvz9GW7zeC
	wInFbTfTiUCJITougjjZ0qRl6dIEHslSwRbY0CP1E4aM5vpnfcNwG1WUuRgwx27vbXikuyHiekF
	mTtOe+RsOSvD83LSHEATw0nweTtbws5iMVuZdnC695EH2Y7PM7idxFa0zFqYGFYGLJ2JJA6SdJ6
	zGGS1JyaB5uHQ84z+HpaxyFETGAueDtbagqJ0qJro9J4OtFqmrMa3X6h5GCg==
X-Google-Smtp-Source: AGHT+IEjjeCtFDPguii4pI7+4Xe1thOGYlNcwSTuezdwWQaPw9yox0md9BSkzNKPALrn+1F+QIclKQ==
X-Received: by 2002:a05:6402:35d3:b0:60c:679e:b957 with SMTP id 4fb4d7f45d1cf-611c1cb733fmr12954114a12.1.1752392288174;
        Sun, 13 Jul 2025 00:38:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c973439bsm4568952a12.47.2025.07.13.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 00:38:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-filesystems][PATCH] ufs-utils: upgrade 6.14.11 -> 7.14.11
Date: Sun, 13 Jul 2025 09:37:46 +0200
Message-ID: <20250713073746.43627-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118501

Extending _GNU_SOURCE to the CFGLAS of all platforms, not just
mipsarchn64, was necessary to fix the following error raised during the
compilation of the new version:

ufs_emon.c: In function ‘do_emon’:
ufs_emon.c:455:51: error: ‘O_DIRECT’ undeclared (first use in this function); did you mean ‘O_DIRECTORY’?
  455 |         fill_data_fd = open("fill_file", O_RDWR | O_DIRECT | O_CREAT,
      |                                                   ^~~~~~~~
      |                                                   O_DIRECTORY
ufs_emon.c:455:51: note: each undeclared identifier is reported only once for each function it appears in

This _GNU_SOURCE define was added upstream in commit [1] in the Makefile
default CFLAGS, but since Yocto redefines those it needs to be added
back.

Release notes:
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v7.14.11

[1] https://github.com/SanDisk-Open-Source/ufs-utils/commit/183e0deb28f13cfb3caf161fc6d0f3cd1edb05c2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../ufs-utils/{ufs-utils_6.14.11.bb => ufs-utils_7.14.11.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_6.14.11.bb => ufs-utils_7.14.11.bb} (80%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb
similarity index 80%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb
index a22e54e24c44..50b6b5a16cfd 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "5539a8ad8e1a9b7ea8b62213ed72eb939c5381b7"
+SRCREV = "92c8e4d732c34f8d0754d0e076879ca7008bace4"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
@@ -14,7 +14,8 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
 
-CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__ -D_GNU_SOURCE"
+CFLAGS:append = " -D_GNU_SOURCE"
+CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 
 do_configure() {
 	sed -i -e "s|-static$||g" ${S}/Makefile
-- 
2.43.0


