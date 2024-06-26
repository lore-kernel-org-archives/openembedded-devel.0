Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24445C30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:12:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.22627.1719396763906072778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQgOD6I7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-424798859dfso52944605e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719396761; x=1720001561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1y0q2Ktxw0anJBt959ZgdEwexAjduUh7FV0ywEKvxcA=;
        b=TQgOD6I7N/36uVf0i/NvnCG0F4q1qQG5flas9+V05Cn3QyIhmbtno0S6W64ysz9mKE
         BcWRcmZIx+GGt5M6uY6UdKm3q+nCHN0dy7TKW8alsuUYDJdMXd6bms11k5M60GCy9DmH
         LkI+h6UTCXd0fTuC1bz+qkkII70uz+s5S0gmud0wHQ0dAI3M4PkYRNNljcaRx2XjP0gH
         MwJIWsakN/QtYsx5TMc2Op/6WVEMGn+524xS3gO3ODdIXCdITcmcuVDZhxcvutCLUaMd
         v5I5RV4O2F9HSa9RstgwAUmSSlN09/lnu7Ov8M+o38SinfJJwc2cMraOFzVXSDnyQsEp
         0qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396761; x=1720001561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y0q2Ktxw0anJBt959ZgdEwexAjduUh7FV0ywEKvxcA=;
        b=X5jkJxLcOq7cuiKztvt585Gw0Kv0iblhabsBzKOGVNZvMDw8bm7Y1KCa5ap+z7omzX
         +pFL5AuseplNCNw+S9ujieg0CJI1Zt9oWPk3vnivMD2JREIG1L36vSWl4RGk38FbJpts
         2GNyVoTSeH2y1J5ZaOPS+mILG6EHJT7gIoYDyf7t7JB51xNziunb7PxdqjHZ9z7V52mH
         RZ9v40rBSL+sxON4ZKuobAfjlE6sM4OTAWoCbZ2FAGmB/y73RgJwI36NREDWnFw7fq4q
         M86yGP0Ku/CjHvnoy9UqgTSAO6mphy8byKlA3bjV8CLL4qsoxFJEhlio9swgi8biIGOF
         1Gew==
X-Gm-Message-State: AOJu0YwCZAMz/CyuoPSfDg4kN2esZYzBBUngfdWJ809Ve2x6IaTDNVH1
	vUQOYn+/kMEZ/fzTMjy1Gmm9W8RITSSjhHkFZruoP7/zwffAkXXtyohZIQ3H
X-Google-Smtp-Source: AGHT+IEbB0R62VXNAcwgubZVH7isNG7a/kPrSDYGNVlSSu4olqwMOeRQqIUQ1E9AiiUAxJy1YOU/tw==
X-Received: by 2002:a05:600c:1ca2:b0:424:8e12:9ef3 with SMTP id 5b1f17b1804b1-4248e129f6fmr70417865e9.0.1719396761147;
        Wed, 26 Jun 2024 03:12:41 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c824ef0esm19400685e9.13.2024.06.26.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:12:39 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] boinc-client: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 26 Jun 2024 13:12:34 +0300
Message-Id: <20240626101234.1207315-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 10:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111089

WARNING: boinc-client-7.20.5-r0 do_package_qa: QA Issue: File /usr/include/boinc/svn_version.h in package boinc-client-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 4e35283dd..cfd134dd4 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -77,6 +77,10 @@ do_install:prepend() {
 	mkdir -p ${D}${sysconfdir}/default
 }
 
+do_install:append() {
+	sed -i -e 's#${S}##g' ${D}${includedir}/boinc/svn_version.h
+}
+
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"
 
 FILES:${PN} += "${libdir}/systemd"
-- 
2.25.1


