Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13570C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:22:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.13413.1641932548868638354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQIq8b6C;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id l8so547994plt.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAKKzXsW7LhfZZNxBk/IkMiRSmheqDT08YXl2mOVh4U=;
        b=HQIq8b6CQsUbhJLwgm1sXvGNIsNkS0C7YWSHVXvkJ5IQ55XjrQWuYDrDPT9JaFg4wo
         uw8lqnsfJZrOCNWaeMn4pVS+EQSaIqdB6PUhkfK/Zv6bSOhzEl1B2GIz2Z3lin6R34r7
         HWv5/FSqFyZhlGxrq0zzRKeI9gHmijLiImbXwknPbT5/bEqrSCwcD25xK1/cc3E2fdp2
         ySpo0nI/F9xQJ/dzbyTfSUd0TGuCaJ4L3dcJQHBP/mR+5rDHKTKU+MSgCVEtQsPFjjoo
         5+EP0LhJnNzRBSk9cEA1jT8A30cgJMqdbeUkJBdDBsubBKdCdrB1gUKu6ASUHU1oiK7X
         MarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vAKKzXsW7LhfZZNxBk/IkMiRSmheqDT08YXl2mOVh4U=;
        b=M/mpeFqUdstWPxTwqY8MuzLLBIqsXN9k6uY8c2HfW7/vmy4ZkuXfH0Re2v/mFZ9Ef4
         gzJIV7XZoVRGlOWJ54BbZkfFoDXsVkFRuOxzi09tFm6ukoM1kAsZWZDQWPQvqHcbOfPd
         fmNPYtZg/W3VHBUIhwm1RRi5Zpx5otFJ5dYHRxq5g2BVhy3Jzw9F+RIun6kvw78X6bKV
         Ek07Ib+K/2YFMnQ7f3vOst9JIZ/MmqAvO8jED0YR8sbfjUMXo1gRwT9hnB6prlY+1hjk
         FkNlVThpkQZL0emIoroaA0ZA1B7ni7bd3h/fH0PTL0iHjuNczXuFd1OWzrgBpPo7vv24
         dTpg==
X-Gm-Message-State: AOAM532CWJ8Cn+ldCmi+2YJRdzLYsIEtOhMIifwr4y/BJQtkwy6JH+d6
	OV+k7gQiVsECmw/LFC+VJDgFMeZxcBDcuQ==
X-Google-Smtp-Source: 
 ABdhPJx9ExufkM9/9JAaD9BnKd0vBhIPhfvJlnwOgw15T+Sgw6cO8XIqPKpGpB4SCSMdr+vrfZIrNw==
X-Received: by 2002:aa7:9188:0:b0:4be:3d3a:c6d0 with SMTP id
 x8-20020aa79188000000b004be3d3ac6d0mr6038160pfa.4.1641932548184;
        Tue, 11 Jan 2022 12:22:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 v7sm2378224pjg.14.2022.01.11.12.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:22:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-matplotlib: Do not use
 setuptools_scm_git_archive
Date: Tue, 11 Jan 2022 12:22:23 -0800
Message-Id: <20220111202225.1526283-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 20:22:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94757

this gets invoked during compile task which is not disabling network
access, any network activity should be explicitly enabled except during
do_fetch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../matplotlib-disable-download.patch         | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
index e032ceb2c9..42ffeb8970 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -4,9 +4,19 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 
---- a/setupext.py.orig 2021-12-14 09:44:33.499041044 -0800
-+++ a/setupext.py      2021-12-14 09:45:00.447041706 -0800
-@@ -64,40 +64,7 @@
+--- a/setup.py
++++ b/setup.py
+@@ -317,7 +317,6 @@ setup(  # Finally, pass this all along t
+         "certifi>=2020.06.20",
+         "numpy>=1.17",
+         "setuptools_scm>=4",
+-        "setuptools_scm_git_archive",
+     ],
+     install_requires=[
+         "cycler>=0.10",
+--- a/setupext.py
++++ b/setupext.py
+@@ -64,40 +64,7 @@ def get_from_cache_or_download(url, sha)
      BytesIO
          The file loaded into memory.
      """
@@ -45,6 +55,6 @@ Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 -
 -    return BytesIO(data)
 +    raise IOError(f"Automatic downloading is disabled.")
-
-
+ 
+ 
  def get_and_extract_tarball(urls, sha, dirname):
-- 
2.34.1


