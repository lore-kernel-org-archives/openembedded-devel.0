Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9088CCA5FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:06 +0000 (UTC)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.142.1790811061515233150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ip+nMR4i;
 spf=pass (domain: gmail.com, ip: 74.125.228.37, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88732460a36so751959b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811061; x=1791415861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEERL7ssve3MHE9newLZ8nXyrgcM8fQ7LJYOq4xLeXM=;
        b=Ip+nMR4iJSDUMiDdsjZ4eBs9hNnB0EXZvXQY3VzfJkH2W/rsavpNIwyMZji1bmuVA7
         53RuwS1Rtm7CVdt7SnxWNMLFTm+zic2b3cfIft0qDcn2PFpXhDBKiTmxp7BVFQlQz+OG
         M4CgfiEaL2mCzYtlOjDPBbcSf56qowOot/zGqBjmXCWbo8vFpV2o7Qq61c0svxnugjF6
         3xR/dJ0uP+xa6+kNALMPLwD/fg/XNo/aLlJ3Ny+8SOprTRhawOYpMuLivRrvwIbPixFk
         n7/xbOagUZXE7/c6XhjerTOcH3TrP4MOE9UIvs6TBdqE+POSS2NEE7lFPEG9gmiXhwYD
         cztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811061; x=1791415861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEERL7ssve3MHE9newLZ8nXyrgcM8fQ7LJYOq4xLeXM=;
        b=S1NTlwKq/i88GNUUlDaV/QcwHMIKnDF6b1pWyrz0cLT24j+yQe9WKyQd4ng1CXeVhz
         PVmBmmVL9rx2W/eKVda9WgAm0zUFieusTFGESDPOacRUgz0kLTyCfIW00yhu+nvqniqZ
         mdpILS2tqLN8ZzbomGRJ3p7D+xdh9iVMgvG1EPGm+XOnncIYmk+MvKg8mbhQBqzPwRMC
         zLXk7dJiBW6pfps03/klZMUoiS7fD9XcnOwstJXKZiu8mCw6l6FwIu+ifG3SmX/yBJfQ
         SPsxccTdWEjVLPvHHCw2TgodjNy4A0jVupC2bMGr/k03Lb5ODxtTXP4CGeTBHfJK+bZG
         MWSw==
X-Gm-Message-State: AFq9FYJkrRO6EjYmAZEI8ZistLS2CW8g+YBDM2Mcj88Uh3QPgx+nb5+T
	/S9T0Lz2pZ9jb+DhPGDzxEoZYL3IrG8xI3eIH3tYdMNTCtZSDs0oST5SUDFNGg==
X-Gm-Gg: AYBFou3NWq244pxV++fRSJe2l+NuDNaahTItOtmUHr1BzHdny8a1urHuUBF654jRAFX
	ubosgZcW/LTLwRy2aEUlnrAjXwDKSoMUZlq2V01gnBTFuUQpuHYlv0RMjHuzq9vXf4OzdQnJlDD
	XN/uic77zvpFt5TxWdFVIwkzqxPY6uXlGAH/5tZBFBlKGVHEHERK2jUgY7VZMaP1P4uruQ82vEX
	OXDymduNYeNeuJCxEuXLcO/sNjC9g+kklBG8ZS7oG4+5fB/N+7FbDEOcZhO+JisWvIeftdkK0zV
	KlTahGy1i6HICMsdNbHH62W3imm1kzpl3lwnztrfeJL0cwJ7n8DwupTllwvCXIhgotLDUH2QwNX
	XgN4pa3DNQMyJ2wu6CpNfLlDideZ1l7uCwYHfXDAB1WqjRyjxip9FUM9q+tjcpTEtmo4S9uCt6s
	OQPdPjATreF/t4NCB75c5s1TjhWVHq/eAV2cw1pdsVFD2t2WxaTxU60lkrUz2q67leQcZ1PDivV
	OAYeiidei7gKXS6BMbBkGA=
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a74c with SMTP id d2e1a72fcca58-8880addcfe9mr624899b3a.4.1790811060904;
        Wed, 30 Sep 2026 16:31:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 9/14] fatresize: add UPSTREAM_CHECK_GITTAGREGEX variable
Date: Thu,  1 Oct 2026 12:30:29 +1300
Message-ID: <20260930233034.659237-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130542

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version fatresize
...
INFO: Current version: 1.1.0-3
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index fc18b2cef8..4ce36cbc7c 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branc
           "
 SRCREV = "7494fba0f14f706c17b9d89ae273efd113c944ca"
 
+UPSTREAM_CHECK_GITTAGREGEX = "debian/(?P<pver>\d+(.\d+)+-\d+)"
+
 DEPENDS = "parted"
 
 inherit autotools pkgconfig

