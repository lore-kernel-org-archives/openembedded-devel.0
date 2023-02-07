Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE71C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 02:38:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.74365.1675737503692671143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 18:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N36N/ZpS;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id a5so6779787pfv.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkz09ou83QS3oyuR5atOMQfkuOYK4dz1ILb9BnPI2h0=;
        b=N36N/ZpSkq7qlgEFYw3T9y1Sa7d5ao0l+els3mCIhal+MWT3DuuIENjyFDANL+hx/3
         ratL6HU63sPQcAFt9Hd3zUY3n8OEWjF9yWG15JNHozqHl8V437bE/G0MqiIoOWOkyJEs
         R3L3xijWOMeqXstMHXUhguUCzv6YZF4cNIbuLHoeDC3cY2WQPYZjwtboCYsGHw6mXS3X
         V69HKD1dyRbv2TqWM6Wkw1bDqykPwPVVqbhn6+YdxwHg2tXI3nJVIp3kSMtXTPRGSJ/a
         tHOzcyjhTbMK7F18pxUvKAOpc1mYP0rmrineqylTuTSgZJFpviT1xlbwn0X6Sh20dYxC
         HWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkz09ou83QS3oyuR5atOMQfkuOYK4dz1ILb9BnPI2h0=;
        b=uOBFD8O4fiGQPrBgZqDcNFrp0l8h1oz+uDiu+MOoNF7l0kNrIWRnt/0iXioKWTd2ZT
         r2KCyjEe/Ah8WJD3UDYzFOnJcgCY9EfsASVe2LwxObRpnhqBAExKOH/lVLnibtfSZCDo
         fnaycpMG+X39r+0Op2h0WdpIA64CzbNrac2eo1U/QTJ78NAjTbrUDGJ/JfZBk7dp0sGC
         Co7G15aXHsUn8mxhBF2UWy8P5mHGXA/31NoPLILTXE3Je9DAlgYTHYj2QpLe7npnqLzw
         CMGDEfv1eaq0GDAeBeRR1p2Z4ffffEgfNTLeZZ3uqrPjqIKOkIveS2VE+4ElKV268tGp
         GrIQ==
X-Gm-Message-State: AO0yUKUosEJ/jJPjaItrpQJJB+C/jI9gaZLzMGEyX2SToB6Fyr+2quiJ
	GMHZYeqfmGv4WZqLZ37ptEGkGE39OxA=
X-Google-Smtp-Source: AK7set8GTZC+k+JZQCPHRxmf4bw1Eud98WgnUG6RSLO9avb/OReTEzAn4Ysykq/na2kSSgzXUIRqjw==
X-Received: by 2002:a62:4eca:0:b0:580:ffa0:bfcf with SMTP id c193-20020a624eca000000b00580ffa0bfcfmr1783772pfb.6.1675737502876;
        Mon, 06 Feb 2023 18:38:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id c17-20020aa781d1000000b0058c8bf500bcsm7788311pfn.72.2023.02.06.18.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:38:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] oprofile: Do not use std::bind2nd
Date: Mon,  6 Feb 2023 18:38:19 -0800
Message-Id: <20230207023819.2244963-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207023819.2244963-1-raj.khem@gmail.com>
References: <20230207023819.2244963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 02:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100952

std::bind2nd is removed from c++17, therefore re-implement with generic
lambda

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lace-std-bind2nd-with-generic-lambda.patch | 34 +++++++++++++++++++
 .../recipes-kernel/oprofile/oprofile_1.4.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Replace-std-bind2nd-with-generic-lambda.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Replace-std-bind2nd-with-generic-lambda.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Replace-std-bind2nd-with-generic-lambda.patch
new file mode 100644
index 0000000000..930b90e289
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Replace-std-bind2nd-with-generic-lambda.patch
@@ -0,0 +1,34 @@
+From 5d879cb4f23c613e16b3f479ab09bbb5ff340201 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Feb 2023 17:02:41 -0800
+Subject: [PATCH] Replace std::bind2nd with generic lambda
+
+std::bind2nd is gone in c++17, therefore stop using it and replace it
+with generic lambda from c++14 onwards
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libutil++/growable_vector.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libutil++/growable_vector.h b/libutil++/growable_vector.h
+index 350246a..9846e1e 100644
+--- a/libutil++/growable_vector.h
++++ b/libutil++/growable_vector.h
+@@ -93,9 +93,9 @@ public:
+ 
+ 	/// return true if all elements have the default constructed value
+ 	bool zero() const {
+-		return std::find_if(container.begin(), container.end(),
+-	                            std::bind2nd(std::not_equal_to<T>(), T()))
+-					== container.end();
++		return std::find_if(begin(container), end(container),
++				[&](auto const& elem) {return elem != T();})
++			== end(container);
+ 	}
+ 
+ private:
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index e6eec0ab05..335ab48bb2 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0009-Prevent-running-check-tests-on-host-if-cross-compili.patch \
            file://0010-oprofile-Determine-the-root-home-directory-dynamical.patch \
            file://0001-configure-Include-unistd.h-for-getpid-API.patch \
+           file://0001-Replace-std-bind2nd-with-generic-lambda.patch \
 "
 SRC_URI[sha256sum] = "7ba06f99d7c188389d20d1d5e53ee690c7733f87aa9af62bd664fa0ca235a412"
 
-- 
2.39.1


