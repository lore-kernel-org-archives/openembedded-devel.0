Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AA4C43217
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:57:10 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.24334.1647248228245256547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=TF4jULUK;
 spf=pass (domain: qtec.com, ip: 209.85.167.44, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f44.google.com with SMTP id e6so19209465lfc.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GnGy073kaaL8V14m6NMt69HGOnHbtc6g04mLnQsN7Ls=;
        b=TF4jULUKfRP9xciwci46+i4jVnHYCKik6tcq3P9R8DMd/2X3IZW2divXUq3qPMmA0Z
         a/yJKGIBOgk0nDbhLRrge77UWO1ZmQQAZDkEiaaNIEv2jxzSDy/KY6fvKm6ytD0BKR61
         EEMH5CectPMiK7Tpur1CUIDW/Y6ui1Uhy0KnExFW197VpJ1Ce6SN5KrijMT9eRgbjvR+
         7wRSZJAke7LUK/Kk8zlDsP675bEQ3+/yyn6j78h427ORQFPw/noj9H7TVvpVF1sVVoMV
         +shbzFSfMPMIV2r3/kZOryzkj8jd6lh5cifSaywGzln0xHF4MI6prmGSAn7ZiIk73Bc2
         yvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GnGy073kaaL8V14m6NMt69HGOnHbtc6g04mLnQsN7Ls=;
        b=iTo0xXy3ZPYYZkyESk74VLihcAL10ilnrecQ9I8BUR5/nkyjMIQOjmt5RHGVBxbYmy
         pm5O56kyzFc20NgI45hJwojYy4GZYPgRG0KDdZrzieXi/FVtcS0oyFoQV5VpJNg4+ESS
         TP8G5mugq989CG7w1tNnsqWU9QLB39ECx+OmDocXFt7ipiZrm0z2j86qHRoZ+WKfBN45
         0NcdIb5PRF2iWqX8wX4Le1tIaoxoVY3HwLR7Hr3N09Zkz6XtEysO1fY3KZ+9eIN2Wbpu
         Aq2Obm5QBElZejC4rCCl2vsnvptr8HRnaykv4DqMmw/kaZxJTlyyC6rGAT2JbiDg00DU
         otZQ==
X-Gm-Message-State: AOAM532EdMvIayMDwiJAiZ+YGLGw1v3s0hBfpv54vAH0RUb6zE6CQUE3
	/LI75NI0YDOHSmUPiUF6ENIx9IoZRsO/FcXZrpkMQ8jAp+4pn3sC/5yVkNabGf8hpqxQrDwztom
	fRp8N/nbIVd0mOnml+WiB6y2VGdZUDbs6h7UgN4Cz/YheRfNNh3Jt4YHg8k993PtF+X5EROD4yT
	c6pd83NLHwFno5nA==
X-Google-Smtp-Source: 
 ABdhPJx2VPU4vKeMwk99MhB6ld6K+41mQI2eUm7AFVtdVj0UpBq6Ix6GVgA20+6SRjNaMefE88rd4w==
X-Received: by 2002:a05:6512:b27:b0:448:23da:dcb0 with SMTP id
 w39-20020a0565120b2700b0044823dadcb0mr13151594lfu.55.1647248225882;
        Mon, 14 Mar 2022 01:57:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm1751237ljg.77.2022.03.14.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 01:57:05 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 5/6] opencl-headers: Update v2020.12.18 ->
 v2022.01.04
Date: Mon, 14 Mar 2022 09:56:45 +0100
Message-Id: <20220314085646.38283-5-daniel@qtec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314085646.38283-1-daniel@qtec.com>
References: <20220314085646.38283-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 08:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95976

- Add PV to include package version + git revision.
- Add ALLOW_EMPTY to prevent error [1] when installing package in image.
- Change branch name master -> main according to upstream repository.

[1]: opencl-headers installation error:
E: Package 'opencl-headers' has no installation candidate

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index f77bf46d2..5e8e6f07f 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"

 S = "${WORKDIR}/git"
-# v2020.12.18
-SRCREV = "c57ba81c460ee97b6b9d0b8d18faf5ba6883114b"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=master;protocol=https"
+PV = "v2022.01.04+git${SRCPV}"
+SRCREV = "59ac4dc2f282286d8db83143686cfe37ec658b84"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"

 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
+ALLOW_EMPTY:${PN} = "1"

 do_install () {
 	install -d ${D}${includedir}/CL/
--
2.34.1


