Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C06C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.11461.1685531626850593037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KvJqE6Hz;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bacf685150cso9849533276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531626; x=1688123626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut9DpL8AwaKUC84JfcGr2uOsRvhdHJuME8rt+YcRIqw=;
        b=KvJqE6HzVgsmNTrvy4OmWgRI3oKk2aiZdioRKe1ipE9w9AtNBbFw6xast6IIN/l+u0
         Q5ENyMJiL+gEAz5bA80ocUxawO5GEejk39TOsIEEBBHUP2a5wlTIijrV3yWkhNAtDgJw
         JTyZrmnEljdZ5UUPkkpGMF9m5rCqa6LAT/qBWMx0JCOnmdnzHqgGOdGuv0BqZUu6OVS+
         3HjS8aYXQe+NlaOHGNZt97gvuQAuQRZPvkBj+6mLOofczDhfz3O59dzkU+V5cGWYND0s
         grnYiJCUmjM2GKMUhnbGI3UXS5lvYg7pm5LiyyP6kdvUZnZgKu1wpZJW8xmh1LTwX8ph
         ibDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531626; x=1688123626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut9DpL8AwaKUC84JfcGr2uOsRvhdHJuME8rt+YcRIqw=;
        b=PSbtSd5RU1Wou9lL2WHQ6r7vzOZ1sin8jJmIZW409yoyMq7IVnocKLaqU65cP1Nlka
         OJ7OF/Lt8PRz+uyCcD+ZO/E+q5YtdInV4LVpznosYaxq7Hcv92TLw1U48WgCF6pTk5yC
         72K/nf3C6qZ+587SmDRSKFR8dXK7ygFRXXqEM620Ce/+Sz9LYcjQbD7YapEBSxr9rW1z
         rs8ywzLMJj4C48kZ0Ld7tKd3QBSni/xNWUfqSczfV1YEUpS1Wu6HUw1g8nvgNUk8hrIu
         fYDsdxjjwrwlKb+COovcX/Qt8B73TTleLCgQ8Ib7Wg9j79T10ZpIjP7uxhgN/7PNIX+g
         QNnA==
X-Gm-Message-State: AC+VfDzwUolAA7opnoWnmRK1PvTW70uejH1KGmj6kigTFr50gCL3w7Ab
	W2DP6/SQ/w6DSnBIPogF0jSb0nT8MdA=
X-Google-Smtp-Source: ACHHUZ5/s2P/CbWLZkMd9PxDz4tkJhafmG7V/Zu4IlErJoGiOOrGOPav6eM2ooD5FRMJ32h83b2hlA==
X-Received: by 2002:a81:d54e:0:b0:54d:ea34:c31 with SMTP id l14-20020a81d54e000000b0054dea340c31mr6071259ywj.29.1685531625838;
        Wed, 31 May 2023 04:13:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 36/36] x265: Pass --debug-prefix-map to nasm
Date: Wed, 31 May 2023 07:13:09 -0400
Message-Id: <20230531111309.2454603-36-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103065

From: Khem Raj <raj.khem@gmail.com>

Ensures absolute source paths are not emitted into nasm assembled objects

Fixes
WARNING: x265-3.2.1-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libx265.so.179 in package x265-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6ab0ca758a901afc70104372cabaf79301f933ec)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index d786afe81e..250af58e17 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -17,6 +17,10 @@ SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b5
 
 inherit lib_package pkgconfig cmake
 
+do_generate_toolchain_file:append() {
+    echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+}
+
 EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
 EXTRA_OECMAKE:append:aarch64 = " -DENABLE_PIC=ON"
 
-- 
2.25.1


