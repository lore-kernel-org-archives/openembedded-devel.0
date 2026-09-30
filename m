Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547B3CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:30:54 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129.1790811045766003510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ineRnKNV;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so4575907b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811045; x=1791415845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJiazD2iZAbZxHJq2gKzGpYRcRVwJL53yz3/O35orEw=;
        b=ineRnKNVkCEFYlI9TtK1nwrMWdrez208JQUn/ckEQpigV7J2pj9c0epOrhRqUse8Lu
         xPXjxD0VBhSn5BjkhkRB1MJ1pptmzhPPTsy8FDsGd3R9tQYPJrtehlvk4ds6afuJhtXg
         HOsheC0Y4KzCuIy4CENu7i3RmIF+jEZRumo85oWY7yp3zNSi2mkmdrgEkBltSMCizJq0
         ih7VVq7wtpa7r9cnL80THtlqfNLyubIYW5mL5jGhFQn7vwrA5iO9AzwbrLfv6rH6hDgt
         aez2lAxNck5SVMXu1IKxCfcgChIk7mAD0/HbIHI+Pg2aDiIc1BrRldKS3d/X+uQueH8n
         hR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811045; x=1791415845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJiazD2iZAbZxHJq2gKzGpYRcRVwJL53yz3/O35orEw=;
        b=yXikwPK1V/Q0BksM4qC76e/wEwk47hldGP0aogRMt0Du7Gv586J1vekMN73TC+TJ4s
         T+e8JzkhEexFh+xEXZ91MfOS2ILMasWwRslGjZ3uS6Fi++zjYWsgO1k4H17ehJ+KLR5b
         7Gvtk5Qem9BIBYpoAmHd2lgbFjwzOoSLPUygh+EEmgN30rbToJ29tzA24GaEiuXStAFu
         K/umeBqDlfktorbwjd1L7Ala2+kVT6Y5uKblVkzia4oN5l4N5E1Rke7bU2WueIMknC7Z
         A151Uzms8AFgvbmO/V+gHvKOtbin2oSm1yFUW2kJkgMkTs64QajWsmKZSkfes5sL/3TQ
         yKeA==
X-Gm-Message-State: AFuF++ltRc6ZMmlO81pjiOOzmH9TOEOoTl5/T8rxLfVETworP9pN1tx+
	uiWPmqWznL/+XjolzH5/sS0lxsAO5Sj0yuyyHrwp9SR1NfeEy06cJU+QIJqzRA==
X-Gm-Gg: AYBFou2x26tWyhvqbz3xenMM26MKMVqBXSAMjRHXd0Tq8Vf0ypynrX86xoTRja5xD3w
	YqtxD/AgR4fREeQlEZoip3O7Xz7nwmBcKqTieISI9SA1osMVY+cWHJmlu2aWuEzGWpTHlf0z+aJ
	dTLBNB98h9i+D9GbaKYbsNMElVEAb9q9s5NacbVdwHK1v8WJI2VBHypaburOe3UKJlIi19a5nbo
	I1D1QocoIth3r7+gQyf3keZOTTXAm9UuUWrtRcuJgNReuFgUK0njsfS+lHXeU+LXuN1IO1wMNSF
	Ht8F/O45zohwYhfsfFxFymqlScRYuWWyMt2w1B7YqDnCWawm0KOfPsZPwNEAt+y9RPur+crr6zO
	qIWMKqPvzBoYhuwvyEpiI4IUBYG9ORgjj+tzVxEANoNSbZeoosXQ/89a2AR7johWLN84QQkOKjp
	n85uJPr9PlTI0TfZ61ulP0Slr5J8xZX7aZ5De49Apsp+Gsl47MFZMKLTrQVANGeS/sLcGvMy2UE
	pu3WiYCXfYlcT1YIZ7fA2k=
X-Received: by 2002:a05:6a00:3491:b0:880:ee58:2768 with SMTP id d2e1a72fcca58-8874ea227cdmr2251522b3a.56.1790811044996;
        Wed, 30 Sep 2026 16:30:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 2/14] fuse-archive: upgrade 1.22 -> 1.24
Date: Thu,  1 Oct 2026 12:30:22 +1300
Message-ID: <20260930233034.659237-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130535

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/google/fuse-archive/releases/tag/v1.24

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fuse-archive/{fuse-archive_1.22.bb => fuse-archive_1.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/fuse-archive/{fuse-archive_1.22.bb => fuse-archive_1.24.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.24.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
rename to meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.24.bb
index 729062adef..884d59e9a7 100644
--- a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.24.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/google/fuse-archive.git;branch=main;protocol=https;tag=v${PV} \
            file://0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch \
            "
-SRCREV = "e218685189aabebb95d33e2542e2a122ea81392d"
+SRCREV = "3e1298e581c169313db994a1a237afafa908d39f"
 
 DEPENDS = "boost fuse3 libarchive"
 

