Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA713C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:32 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.3772.1640899891802658380
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=chnDvFwD;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id w7so18485045plp.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r4TDkjphn65KDG9daSCxgxBAjmckdsx/aKReychB4wo=;
        b=chnDvFwDR1yqDa9l7jTxP2fCekFUSWLsWXf5KIsO1NWqPvQ3sOJKbVDBVCq9OPx48c
         /v3QhVfg9ol4rFpUvAcDdnDhklUHIog9CZiGMgeBn8U4rhxCGHdS1SkLwE2wjEa82kal
         qzeny2RcTrFOLFDjWJpCVZ9T4uytfp90npAfvs6D4afN+tnsmWd1DyvuDpwHpC1idmi3
         heEExjewo4x6go4RZPzGWEGHS8emrs7+aN2HlfaaTKZs3n96J1fZ+Rfy92jXQsCbbOPY
         mwUkitWoqdQThhhs4/94BC3yxfjkpx5YNuW3zo31SBe62tP3aRHwPC5c+6jXYgXPL+Q4
         GQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4TDkjphn65KDG9daSCxgxBAjmckdsx/aKReychB4wo=;
        b=ubTELMwOZVG77OGyY2xhJVHjKSjOvuvfn9R14gBqi/DyjC0SpFR1H+Ut6eHK8Pz3LF
         yUOg23kN7qdHNOYthd9z7oF63O2p8/PwP4erfOrArSgnZyVb9poJZdcUS2HGUaXsbkHz
         eXYutDw1Xz1Cnz/UvLv4jvYARB2TUna5ZneiGMyYEs8hriJIL0500QwXDDaPi6lkVa+H
         E3Oi7sAmiIgx+Pba3/BKtSzKwItto/6aGEmrDu4Tl1zNWgT3szUco/ImKF8L3PB89ivO
         ASRYi1Yya3KW0n9B1buPpx2aobl3Lxzf9fj7B/JKApMgxtybnPo7x45iSnWhjdSN1J6M
         Jo9A==
X-Gm-Message-State: AOAM5324SVaDpt8xjNYjotUAfcr2I3oz4oWsTWrx55SRD/64mItQRfUG
	eXualk7VQY1tV+fI0QUokELx+kl6cGc=
X-Google-Smtp-Source: 
 ABdhPJyjQ5aMweLz8FkIAlCZjLCOnqpK42hoi1j3Mp5xBGUqoR0xl2lP/g0VaFyNSpNfzS0ycq7XBg==
X-Received: by 2002:a17:90b:4d8e:: with SMTP id
 oj14mr39828349pjb.121.1640899891276;
        Thu, 30 Dec 2021 13:31:31 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 6/7] libfile-slurper-perl: upgrade 0.012 -> 0.013
Date: Thu, 30 Dec 2021 13:31:22 -0800
Message-Id: 
 <6fc97431a9d77168e83450595632f5dbe324532b.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640899794.git.akuster808@gmail.com>
References: <cover.1640899794.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94575

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
Always split on newlines in read_lines

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d830b7ad4a957a4667d000f840d9442db13250d2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ile-slurper-perl_0.012.bb => libfile-slurper-perl_0.013.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libfile/{libfile-slurper-perl_0.012.bb => libfile-slurper-perl_0.013.bb} (88%)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
similarity index 88%
rename from meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
rename to meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
index 4a2cb73e86..c7e5c56b6e 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
@@ -13,8 +13,7 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=30c0b8a5048cc2f4be5ff15ef0d8cf
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5742c63096392dfee50b8db314bcca18"
-SRC_URI[sha256sum] = "4efb2ea416b110a1bda6f8133549cc6ea3676402e3caf7529fce0313250aa578"
+SRC_URI[sha256sum] = "e2f6a4029a6a242d50054044f1fb86770b9b5cc4daeb1a967f91ffb42716a8c5"
 RDEPENDS:${PN} = " \
     perl-module-carp \
     perl-module-encode \
-- 
2.25.1


