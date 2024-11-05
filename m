Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E709D35E59
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.27749.1730831919759862314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SS38iZB3;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e5e5c43497so46796167b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831919; x=1731436719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YF8OkuGgURqaEd6Sv/qxKoL27fm+FhDq1oSpokPeOc=;
        b=SS38iZB3qcgrs8ZZ4Y+1TkUZGL1yXEj1kBXxUKmdFnXZomHf7sGtQaaSS1k55OmwwO
         ItFz8evZFdL8Gz44rwWWJAO98RWXe9SG850zUFILj4fZuQ+NjwyPE20Vf6V4BkIOigXU
         cbk5wYcOfVp2ZAu5TBbtSpq1isMkVzeCsLjcjegZYzI+MfqJKW360aRs6eUMZXShfWVv
         SdT3bjIhrEhP2jFxgPtJ38U+rV4GUYK1KLUv3ArXo+E/O1amVIFzkdC6yjupb9KtSdVE
         /iqf08DGcaGP+sUbvWt2aiLQvrpL5p34n64dn+rVgE1D6yKKmon85mV50EpGcL4djXPj
         BDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831919; x=1731436719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YF8OkuGgURqaEd6Sv/qxKoL27fm+FhDq1oSpokPeOc=;
        b=f6lALCOkaQ1OGb7P70KtNiyLbduqjvgzAuFkqJvZ6rxkiaF5tvEMXDymCg9oZYQ6A2
         GT5E5dO1xukyycrMCt9YeJwHlFPTKMsN2EUUjtrpq/prcOmbYoj1OV6Bv4hQNfFPktUR
         MHvo1g8JJ3ButJsu99yuAHitTLpRIHKTsHWYwVaeT8GUdoKTMUlzopYcHjgmpB+BvRn3
         fm5NleQbHetHKPj1O8d1+PFsJ+WAABM/FzYUnCR3QRTRHQMsJDOa00Y4LS9SZB/8Ifd6
         mdCGniNQhsQAAXqZoVCbzGnKsrI1ftcmuW5ckd87ysYdXluri9QCHU2n+7pK/vB6/aWr
         kmig==
X-Gm-Message-State: AOJu0Yy6rU8sLkmfUWmFrxh8P66FP6leyh/DFxz6uRuWvsiO53e1FZ5x
	ov9qG3CnM8vcnSGeNMtN27VfFcOCL+HZm/9hyKI5wLRSyXfNOKDdhO+qHWPW
X-Google-Smtp-Source: AGHT+IHDkt7gLx1mNitud8PcSIjAiYa78UGc6lVlj5dujB6kkr4Y2sEEdEWhH8575EaxXf/q5qBOwg==
X-Received: by 2002:a05:690c:4b83:b0:6ea:8901:dacb with SMTP id 00721157ae682-6ea8901e079mr112681087b3.39.1730831918387;
        Tue, 05 Nov 2024 10:38:38 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:38 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 048/161] lprng: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:24 -0500
Message-ID: <20241105183658.34982-50-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113563

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index c1a8aadff..fd20860a0 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch \
           "
-SRC_URI[md5sum] = "5901bed95e61d2bea3ba3056056af432"
 SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lprng/files/lprng/"
-- 
2.43.0


