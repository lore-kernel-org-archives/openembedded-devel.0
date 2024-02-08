Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9975C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:14:06 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.15430.1707390845714435232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=ZGmGGs3N;
 spf=pass (domain: smile.fr, ip: 209.85.167.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51147d0abd1so1992234e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707390843; x=1707995643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnrUpXSh7is851gZPybSeWZ9tAwHWpGF0k5osnbnJEs=;
        b=ZGmGGs3NrY8rw5uGoGCsBVflyxCna7fYV0lGzEd+Zr+dKWTxAJfKc7EZsdF2ETChNm
         1srQcyl1rpiB/HdMqYd1fAgXjvac8CFeGJUBgm1wVxK+lJB3HYzHUxx8rjISbGDDg/9w
         fJe0aodFEwrT6qBXy/jcxCuYVHBBX5jPTIohSKQblX3paAiG44X4o8XjOFhyIPhUl6Tv
         j/gLf2nzYU70KiJBaytgkrisFl6KpKw+qJcNxMhfE3fsUyELEgn5BAebXwY7KBto43t5
         LzXwx8MdCV8ZSfr51P/th+No8uuUWbwQJr3O4bH5XK1OZ/cjd2yZYoDQxt+wciH4cZ2H
         b05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707390843; x=1707995643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnrUpXSh7is851gZPybSeWZ9tAwHWpGF0k5osnbnJEs=;
        b=HgRQXwksV430OLuJUEG5cbbRCgZbcEd2Sz1Tp09URFdCagtmXBpZI7T2I+hgbnhQEc
         VDsWEQq563NI9XTVkEjxC6L2YpJNABAQNWoGNhi8ZPjIUUEEmqcE6GLBNhL+7fOUzJDA
         z+krfnEfam0BDRF7q+hXHcKvobTh8rbmIKVBdcsAIulah6sZgOFUhq8MMC8AJGtu9CyW
         QBJy+fGI8NruvJ8J5884nJvSa+tJ5QmUbFhMO/9uv3jAuCscLLgugYIztX2xco9oDCVP
         zBehdUWGi3d3c472KKswIi8oOXxiQsdPCV0bQtzqyuIwB/g7fYGSNtFheFxFGvWPUtZO
         V6sg==
X-Gm-Message-State: AOJu0YwSKYxxG/IuI7I9tpg7V6x6MMsWEj4632qe22W5X1gyjoGRYP5i
	S/anw9ruobQSE4KObFfRrP2PHi+BJHW9j0T2WVyNKrC3jbgn/Z3W+4YGnCKcGNhOXEH13TeywwX
	XaWg=
X-Google-Smtp-Source: AGHT+IGivqRajxndOUmiKPvIlwJzGtWIfMifxki1Y+k068NzvV8WZx7VebSAq45uK2KvCxmRZHTJ8g==
X-Received: by 2002:ac2:59c2:0:b0:511:2e7c:768f with SMTP id x2-20020ac259c2000000b005112e7c768fmr5572213lfn.46.1707390843240;
        Thu, 08 Feb 2024 03:14:03 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b0041039d20454sm1263925wmb.41.2024.02.08.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:14:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] radvd: Fix build in reproducible test
Date: Thu,  8 Feb 2024 12:13:48 +0100
Message-Id: <20240208111348.344696-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 11:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108662

In reproducible test, useradd config comes from static files:
  meta-networking/files/static-{passwd,group}-meta-networking

Those files were not coherent :
* an unused "rasvd" was defined (a typo for "radvd")
* passwd referenced a unexisting group id.

This patch aligns static files to the USERADD_PARAM recipe value.

This will fix the errors seen during reproducibility tests:
stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: radvd: useradd command did not succeed.
stdio: ERROR: radvd-2.19-r0 do_prepare_recipe_sysroot: ExecutionError('/home/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-st-meta-networking/build-st/reproducibleA/tmp/work/core2-64-poky-linux/radvd/2.19/temp/run.useradd_sysroot.1178426', 1, None, None)
stdio: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/reproducible-meta-oe/build/build/build-st-meta-networking/build-st/reproducibleA/tmp/work/core2-64-poky-linux/radvd/2.19/temp/log.do_prepare_recipe_sysroot.1178426
stdio: ERROR: Task (/home/pokybuild/yocto-worker/reproducible-meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/radvd/radvd_2.19.bb:do_prepare_recipe_sysroot) failed with exit code '1'

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/files/static-group-meta-networking  | 1 -
 meta-networking/files/static-passwd-meta-networking | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group-meta-networking
index 6896a181e..1b6de8d1c 100644
--- a/meta-networking/files/static-group-meta-networking
+++ b/meta-networking/files/static-group-meta-networking
@@ -4,7 +4,6 @@ dovenull:x:632:
 postfix:x:633:
 postdrop:x:634:
 vmail:x:635:
-rasvd:x:636:
 frr:x:637:
 frrvty:x:638:
 nogroup:x:65534:
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd-meta-networking
index 77c2b36f9..03dc2133c 100644
--- a/meta-networking/files/static-passwd-meta-networking
+++ b/meta-networking/files/static-passwd-meta-networking
@@ -3,7 +3,7 @@ dovecot:x:631:631::/:/bin/nologin
 dovenull:x:632:632::/:/bin/nologin
 postfix:x:633:633::/:/bin/nologin
 vmail:x:635:635::/:/bin/nologin
-radvd:x:636:636::/:/bin/nologin
+radvd:x:636:nogroup::${localstatedir}/run/radvd/:/bin/nologin
 frr:x:637:637::/:/bin/nologin
 ftp:x:640:640::/:/bin/nologin
 rwhod:x:641:641::/:/bin/nologin
-- 
2.39.2


