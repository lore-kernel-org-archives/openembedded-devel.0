Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5E1CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:44:40 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2810.1760600678061776740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=DRy1ytja;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.47, mailfrom: dse@thaumatec.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63bd822b007so632939a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1760600676; x=1761205476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+NtZuWJpvL9TYYgYzXNBv8k2zsNlIxcshfADytbbJY=;
        b=DRy1ytjaNVUUYzecS6ahwRBagb5/ecj6hp+cKLIc8FSDvD3khRBzun4KlK6hmPY7+6
         m4EwG3xXxhSMKMGunDx6qpNo+Ck4ep/pERr+DJRy4QGskMD87PtVjB44lfwrHd+9wdvm
         mWLo7DW2C+0S+MN/TosWV0deOXvqYxW/i6v0641qoHSCamHqsGfwu4XDwRAkKHD1ynjY
         /3QTb1R2wapQqkmgh3j4Yvgf0jo1vujfq9aHf2MYdxTElcQwycMRS0kQykgh4UFujYX2
         RjoHU8g7G8y37ggPSpSLrUn6/6LuAL0WXafTqUwxVhKpUvdGKXAqzAwGuKbMB5UyjfFS
         pU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600676; x=1761205476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+NtZuWJpvL9TYYgYzXNBv8k2zsNlIxcshfADytbbJY=;
        b=V7ClRD3//5zq+tdd9NhBarwydCkYg48qA9kPcYGnMrcH3yNUpnMrgArTZAU8ug17i1
         1LQfvEfXPLKZxUqCPO7G/Svc0FUJHYuhNc7hG17774mK4IirGNngMapdF3VpN/1R/Yyt
         QkXg7atms3MDQZ0sRbbuA2oczA9WOZaJSbj6L3SDYdLoWIot6orfTaanE0aGhL1Zyhy4
         r2RDz4d8prbnVcy8/YBh3NqcueCq4IxMrDtf0J3nL/EcLmklrfMqE+EkPUqmS/pDtjY6
         yAf1js/uv6mNKWnJj0PBqT/u/VkWBNPKC5BYk2dtYGvseG+1c8c2g5K5x2RG6KAcgNoJ
         xorw==
X-Gm-Message-State: AOJu0Yz4UvejMDmomwV1tVzpTs1U5RH1AnTvxtQTjkt3YWmrnExzyF4g
	DYRU46KyLlglABS//ZbFlnC4Cht7xTEc+NU5KUXJ8TijqMXks63Zj+fkZTdjR5tU2JJAtFgY8uN
	YjCuG
X-Gm-Gg: ASbGnctdJlypbF2J+6I+LjeUg1flzg709Ssb1LV+6nBGFNPR8NG1K53mDsUWmaTg5L2
	ap/p2XYVNZQVVY4w8V6VW+RT3tHv0OWcf/LFeVh6if98/Bbhrz8g+P/OapBZnVeXkmW1/D11S9X
	gShm00gZOZorIZ72jUTbdNvlge8Fysf7czG8qbwBRY545ncVXRRhcXZYNnBMI6oPup5/sI8zSpD
	E2xH/Czngu5Gs2Qz0M5gnttTZx0Ntr97IgIMGnDLV8rPbTFvN2AK/COO100PO+78IyABCnPqYxQ
	mHWxn3BrGNzO50PHGlTeYdWuYYeyX/OkafjoJmT43vGLn87NXCNjhSXWo5ccm0hb2psD/U6mbjc
	LmGuNA3JtxS0LzN5fpVi2f4k7t2TL6CC/PbmlEFHsuOIO/yYYDihfdFzi6ef6f6TYslBV
X-Google-Smtp-Source: AGHT+IEHFYBU7iyG+M6qKGBSClzvYTLSChXn9LLuK3fVqiJDFF/YZsx/xqLTYduASLr+YiWHDnjhlQ==
X-Received: by 2002:a17:907:9486:b0:b2d:a873:38d with SMTP id a640c23a62f3a-b50abed1b44mr3579520866b.43.1760600676331;
        Thu, 16 Oct 2025 00:44:36 -0700 (PDT)
Received: from fedora ([185.186.156.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba459ba2sm447667366b.34.2025.10.16.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:44:36 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH 2/3] cockpit: Add runtime dependency on GNU Coreutils
Date: Thu, 16 Oct 2025 09:37:44 +0200
Message-ID: <20251016074104.85537-3-dse@thaumatec.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016074104.85537-1-dse@thaumatec.com>
References: <20251016074104.85537-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120721

The BusyBox version of mv does not have the -Z flag for setting SELinux
security context. This results in failure
when the cockpit-certificate-helper script is executed.

Depend the package on GNU Coreutils to make sure that the proper version
of mv is installed.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
index c9619d835a..522d129502 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
@@ -172,8 +172,8 @@ FILES:${PN} += " \
     ${nonarch_libdir}/firewalld \
 "
 RDEPENDS:${PN} += "${PN}-bridge"
-# Needs bash for /usr/libexec/cockpit-certificate-helper
-RDEPENDS:${PN} += "bash"
+# Needs bash and mv for /usr/libexec/cockpit-certificate-helper
+RDEPENDS:${PN} += "bash coreutils"
 
 do_install:append() {
     pkgdatadir=${datadir}/cockpit

