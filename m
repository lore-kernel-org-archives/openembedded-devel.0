Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406C9D35E4C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.27850.1730831913899073374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4pCNem9;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38ebcc0abso65946027b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831913; x=1731436713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnidI/HXPxgpimjCVj0nRhB8VMvRk/iooTeyMVsgQ44=;
        b=i4pCNem97Z0vjOLAq8l/51vFCeypjZL0pPpDXcJX+QgijTL9pKejkJ8GHSCXfWLyNZ
         7kx40h6iR2GumyYAhvgiw6kdLhka8885zqMrqfGfR6Gqqck61pmq7FXYkXS2Nfs2JMHl
         /fA9aZXLJ3wvacCcI7fUGmUj/W/G0clR04qimAjjMZ62bgu2/KGy6P2HvadHiumbfybJ
         g+YtbpYE0sHdufpn9KpzOTZmR+ylBo/psGB/PNgBav1KiZ+Wn63QHhZM4pi6NVmveeNG
         sRftZKPlaw770MW8xGU5FsUz9GqetH9ZtQxdbF01yIiLdp7cPQG9/Qna/2jbDY47xPZl
         zBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831913; x=1731436713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnidI/HXPxgpimjCVj0nRhB8VMvRk/iooTeyMVsgQ44=;
        b=S8OqRxwzy8ebw8lGTDGSMXX2MWc63pNHMw/iarF+YEDLwgJsIcb5ceVJhcN4C62IVy
         CTZ7XfRT2KHd4pvJQT4VlMipQTYQMtAN+5dJk4FdkHiBLfMf5T0rSQAB5xEWa5KuzgPY
         PfSJyvxJTjved+4RZgx/UUvoiCviJoQr8wRNzg2wsmcvS6P2FIBmZDIvakU5ugWUKp5T
         lkWwuDraSP9jfhF4NAB5UNlSudQNzqOPLRsv9RXWM7RDVzcVwZRCh0LUxWFrDx88OuWd
         KOIZr8D7xaXM00FOOywD27ZV+fI8wiUAVFh0kVEoQZQvfX/kI8TgeFwb4pNNy66CAt+E
         h7Zw==
X-Gm-Message-State: AOJu0YznTiBGlSYKjLiXc/xWoTyLjb+uwwjjjR+5Uxm/190Db7VtqHof
	8yfZt8/wnruTlq1anqE8POuVXgXP/vvk1WM1CYGzkLoDzI4SzTZcGi7z2l6Q
X-Google-Smtp-Source: AGHT+IER8pLNlNVt0DT5rlw0ig/PHeF5A6gSUb/J4p+48+rnS6hYFjLYhNz2z0UR4/Yyjhuw/mcqfQ==
X-Received: by 2002:a05:690c:3345:b0:6e3:958:4de with SMTP id 00721157ae682-6e9d8ad5a4emr399953427b3.42.1730831912555;
        Tue, 05 Nov 2024 10:38:32 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:32 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 040/161] collectd: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:16 -0500
Message-ID: <20241105183658.34982-42-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113555

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index df36b6469..ade688df7 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
-SRC_URI[md5sum] = "2b23a65960bc323d065234776a542e04"
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
 inherit autotools python3native update-rc.d pkgconfig systemd
-- 
2.43.0


