Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F64BCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:16 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149.1790811072197511858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SvVVypYP;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so2887288b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811071; x=1791415871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNOI+ZB8w+otJjhsnpBW9EUbo//rZHX34lYa9khTE7o=;
        b=SvVVypYPSjIuputT9WPW7PD74BjgfnuDN9w9IXMRUgAKeqgki5j4SeJUjM0Fv5X9Dm
         okXeedbpQdjDdXsumtkMr3o+Kufuy2FSEo8rHBojiZhhEkHUomDt2WzdNualxuhWV2Vq
         8taVbMDbtrvXJddaNREj8Tv/fvAWBf2zmbSt6+K43xncsocPRUiBFXGVPUzkg/YS6Pfg
         60ouNfzCWU5GcArQk29NmMhitKkRX0sVS8AMUGYyMlQntawrTj1dh/UWhsFFnshTlFTm
         ZIGde4OjF72ugzGYe+RvQshSog8rCX1p7fOW1fY3R/c6AFnJgCpDnR40ZxhXrxyVlC6e
         PX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811071; x=1791415871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNOI+ZB8w+otJjhsnpBW9EUbo//rZHX34lYa9khTE7o=;
        b=sn6hCd2k31sqGeay3BD5IAg+exWn3nwatnAzTFXFJVfbwAOZqL0qG2l+xz3XDTvCxz
         KLCo/L8xZhBXFWuFOwFqXMi2UQ2+l6ndyQnKtWmP7iFFBJrpDaYxkhLM/HsB4Aw5aOAw
         G8w9eVeig729FOukNQTKe8r+YYYP+utnvxylIbpXJ0izjaNB7Acb8zPjFes06+sXkccR
         gmoB9lSWF5TEo0KTYGZZ8MOAgDNjWYcjWFCv2PrOL4BaQHFuN5BZx1CnJoIccA6aNW5F
         CWnzQV0JelHOAeD+pT9d2DejwdY7qjRiBtLwZ4TNInuiEUZh8BVSqGRWO98u37BBAXjS
         wiUA==
X-Gm-Message-State: AFuF++moayRQIHPseiH7mhTrS2E2XsJnBDsHRqAGA6RKZ0MGOrXELLV+
	TQ7rn9RGGF1lx2ps5bMaKQq2G/QKij1SLE4TJUrgU7l+x/tEdW1IuRlZJ8kyNw==
X-Gm-Gg: AYBFou2/eG8gkvtlrv7JMMVC7Wc4lWi9+6K41W5u72YkmnL0WpS6Q6w9sLbQu3p+BtT
	VEOGiUsAF1rHRnb2ATkZHR3FM1E3EcDMGUcvaJHVExfNKyQ+AD5se6t0+PDutk0GIR2yXGgfjzR
	lJXkAugogbuB/Dab5gcj7FtAwiwssay7veb1oTX6eqrDNTzOaDYUmAYRtJoG3Suv5ZrdiBA92Is
	9IAmXehfR30ERRR3jGypQU44r75oq7ieoR+i3p/M3HC1NyKdtdy+ZtDgC7tp5bq4bN0W9dywHE8
	1Uc7p6stOCb6aZI2mgjCZJSBexrKDlGvz4mOv668AkpQC7+p9N2rk/mhaOmI4n5DD6+Nb+KdOaK
	W3DXFpM8eXCqE1Gh1AyxJ3jT57bRbC2mddsVIiL8e4gaX6D7ddgQJm8YTG1eLXozcde2YMgVlkQ
	j0pWm4QqBSd1+AYpv+Aiqh09eYrK0kmZWKF6gqVCIMQJkaJUSScoe85AyM4QJlBh+1mLf4Puxrj
	+Keloe5C0RMI2ao5KutkDIHWiYGBpaLjw==
X-Received: by 2002:a05:6a00:4f88:b0:878:3658:23dd with SMTP id d2e1a72fcca58-8874de639c4mr2283688b3a.54.1790811071376;
        Wed, 30 Sep 2026 16:31:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 14/14] xfsprogs: upgrade 7.1.1 -> 7.2.0
Date: Thu,  1 Oct 2026 12:30:34 +1300
Message-ID: <20260930233034.659237-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130547

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?id=84c54d6c0c3b65a3d1f10c4d3ac926bf9ef49b0b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xfsprogs/{xfsprogs_7.1.1.bb => xfsprogs_7.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_7.1.1.bb => xfsprogs_7.2.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb
index 38d049ea68..64f0da8ebf 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.1.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "063edc31ba8e85c95c7faf9be465a04898bba7c6e622fdd9b146eed4ca5415e8"
+SRC_URI[sha256sum] = "501dfa363cd8e19997a4a1a71f70ded88241b45e9db233e8875c23b80520cc83"
 
 inherit autotools-brokensep pkgconfig
 

