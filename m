Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3343FC54EE9
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 02:13:30 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.3270.1663899205957148546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 19:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MP8gtoGH;
 spf=pass (domain: mvista.com, ip: 209.85.215.169,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id u69so10959258pgd.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 19:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=oynXfAZnA+0lXV+gql6zCyxnN6Tu8zCAt3cDLVL2WKg=;
        b=MP8gtoGHu/F9sM/NGusgS7k0raiUfiCQufl7ZrFMl/nHNQ9/YH7H8yFfH0fTioK+6w
         xK4A3ETDfaBgHZ6FxDn3ziKxl4lgU2lYoUwX1oKxMPYipNY0gTV+R14r1C+B/mmuTO0X
         vYROJ+NsiT69Iz4bcn0y1TYZhDNZTSrDadOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=oynXfAZnA+0lXV+gql6zCyxnN6Tu8zCAt3cDLVL2WKg=;
        b=bu939WksI4Uo0TmkkurJbpwqtxvSjlWcuodbqtJl7A3fEvc4GQUR6+fI6jyieZ1/DN
         Tpl326wXnX7gKUidzJOJko3SXIyt+T9vpoayVle3O+ul3hfGkq1uAgfeO+VatgNmvjHL
         hSLoEA3DY4qpGGyrnEbNjloxvSgMIIFWtcUD99HldEzlaN3/ZcLp7FbUYKNgXpi88Wha
         sMga/dM/TvQatoLY7U8iFdwJ20SoNaJsap4tlQABhCtCj6zrM9tUWOFWgKKcy5QhaCLr
         +ewbQ9OM2GTRNTIm7rqmvxcuxfl1xlukaiQ7AUfaItUOM3EyiQMFpmMqW7LYwDG6fiSH
         d/KA==
X-Gm-Message-State: ACrzQf0MLs8xEuoJvXkrGjyIjivliFHtVe7II+h0EENgc3a1Nc4G73zT
	tGx61h0PkeQVChGJ5XJiPMvYtMz1jEGPTQ==
X-Google-Smtp-Source: 
 AMsMyM7QX7aBuCuUsnCH5zGTjVcu0QknjttlHoqtQ4aVjzbDfZnROdmyCkfyQlU83nRzosZXZZYcBg==
X-Received: by 2002:a05:6a00:2387:b0:550:bd29:7d7 with SMTP id
 f7-20020a056a00238700b00550bd2907d7mr6558412pfc.17.1663899204900;
        Thu, 22 Sep 2022 19:13:24 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 k10-20020a170902c40a00b001782aee4881sm4869818plk.153.2022.09.22.19.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 19:13:24 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Thu, 22 Sep 2022 22:13:22 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] audit: Install audit.h from audit
 package.
Date: Thu, 22 Sep 2022 22:13:17 -0400
Message-Id: <20220923021317.1987661-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 02:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98934

Source: MontaVista Software, LLC
MR: 121884
Type: Defect Fix
Disposition: Submitted to meta-oe
ChangeID: 2708329947da5ec2f96a8478771f56cfce95f616
Description:

The last upgrade to audit, changed libaudit.h to use "audit.h", which
makes the build work for this package, but breaks any other package
trying to use libaudit.h, like libsemanage.

build/tmp/work/aarch64-montavista-linux/libsemanage/3.3-r0/recipe-sysroot/usr/include/libaudit.h:30:10: fatal error: audit.h: No such file or directory
   30 | #include "audit.h"
      |          ^~~~~~~~~
compilation terminated.

Install audit.h so other applications can use it.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-security/audit/audit_3.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
index 3dbfc9e60..6195b6749 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
@@ -110,4 +110,5 @@ do_install:append() {
 
 	# Create /var/spool/audit directory for audisp-remote
 	install -m 0700 -d ${D}${localstatedir}/spool/audit
+	install -m 644 ${S}/lib/audit.h ${D}${includedir}/audit.h
 }
-- 
2.35.4


