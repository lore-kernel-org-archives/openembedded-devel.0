Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB826CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:30:54 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132.1790811049877356314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W8tBi4ie;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso2521751b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811049; x=1791415849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7v+obu9jIAfpgw0x4JXoXWXKhjB1x/hoVdWReDuQ+4Y=;
        b=W8tBi4ieDowANCV8Anep/W/KW35yz5WS+X1UjcSzVPpIxZ8CCpTPhU581ufJMFHL1A
         F4Ja38B4U17HO1ZqYTLAs5NMGYs+Fk1ju0tjr0uSDu8oUwipXTZdumgjL/h0tNVeh5i3
         zENEbGzmyxp9HcjhIX/+cJHqqkbM+JGBJ8iXc3CNKlPJeEGMuTMot/OcU9WpZzCvs8V6
         /PvBKqDqat9t/iUGFB5TVB1jPi7h4g4Jn6wBzRkp7a8l1VRCB3olvVj31ZHKBSEoXIIr
         cVly+UtFFyd0sZ2wwTJLBB10sD43b5HlaZLshwqlFrgXR6jvSqdBP8+TVRchlkAnRXxg
         y5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811049; x=1791415849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7v+obu9jIAfpgw0x4JXoXWXKhjB1x/hoVdWReDuQ+4Y=;
        b=gQ0ntweKKpxdo74Ic+EPsAe0/QuF+m8coBm9Gb+iNl6in7ZhVhgaC6bNmr8YUlfILE
         qdcICAGaFZxi02MMWFLDSe6zLH/gg42ftWVVO2GyAm4kwAUtMmQgVZ84tSIOeBKnqd37
         CyGZDtLPVtI2AKbBb5O3qWp/1zoJocdTHmhjElhk2Cd8kC+Fvub08X9GqyAhfU8Wn1bF
         DTpvFDymbyZqG5p+MI/Qe6ZC3Csb4eqTWDN268JsTdqC43894m+PxxFq0G0UEoVVPgg/
         8wKJ/uX0JBxCvQxxQjFidlc2K+AhoWvnuThV7qKVYNjCvd5hiXA4xR7H2++QPdxhysuO
         JS6Q==
X-Gm-Message-State: AFuF++k1zXAOylJenQpqV0sUI2wyvncg9QfdEEeRPHucKxhsKpDopNYJ
	OItnGQtd4OeBpuGHrLn6kR+OES5vg0KivAZc2FqkdXNMa3Wf/6KiiB9PJP7WaQ==
X-Gm-Gg: AYBFou1WuBi9AJjc0MQqOfwEn43BktFLGkSSHGJn/spvEiS+manxGcBQV+RySYhib6G
	jLKQSDcXXOPHO3DNjgH96lFaf4yj2FU/sXyWY3Wh622kg8qYRcRPlUpbGhavn6jdtZ+7kbgdXte
	W9bVpTrDU9jrE9cT+sEvHBJlLsF5n0npnXxUwBJsanmQA0O36V6GvfMFXRmJZfldpnoVMcAuNDs
	DmE+OpNpbe6Dm3lOAXiwR5lbydFJC1Fkc1/XkNDbM6guGGlePfrv++90NOM25O656/pugTazW3r
	JNIeXhv/ej712qBCrtWUuzOBcaO++LwyfJpDehEhIh/yYxbgVjHnyKbOBLPHoAKS9F1xrD+E/kS
	WIr1KCsqOaC8Y6KT7fYy4NXFSkPE9n8x/UU6x2961ObfSvu5mjsPgRwtN9HvjePqOQzJjR5++KS
	H6yi1DX+aOSl5d2eqEsdoZjMDkSnrmc2F4fiPczbZ9M3LV68VNFZWI54YplLyn+iK71AmUY8MRk
	kv4TPCN2VnIQoYBHCzzv0yDSQ9L7MlllQ==
X-Received: by 2002:a05:6a00:9296:b0:87d:d878:5eb1 with SMTP id d2e1a72fcca58-8874d29ffc1mr2401622b3a.56.1790811049182;
        Wed, 30 Sep 2026 16:30:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 4/14] fuse-exfat: add UPSTREAM_CHECK_REGEX variable
Date: Thu,  1 Oct 2026 12:30:24 +1300
Message-ID: <20260930233034.659237-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130537

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version fuse-exfat
...
INFO: Current version: 1.4.0
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
index 48e3d7af5d..33e1cb0d9b 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
 
 UPSTREAM_CHECK_URI = "https://github.com/relan/exfat/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "fuse virtual/libc"
 RRECOMMENDS:${PN} = "util-linux-mount"

