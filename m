Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E35C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 09:22:59 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.21668.1719393773737328384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 02:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uzyzq/hq;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so47952401fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719393771; x=1719998571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUR0TohUBiJ8IOFXE9NWZqEKb83EdzHQzHPM3hND0e4=;
        b=Uzyzq/hqUgrb0C0AqOf+gSMXOxvjFtUZMEqaUUFPCXPQbj5fhvNHNlOTA3Wai48mNs
         eET/gbfAmM127iQWIK559bRw5cvNxR2sldhsaR0otJesWZx7Z27hfZlSizzcc06QKLG/
         k/PhFrmWgwZQnScIM2WpHhQHbXvQA9JHgF+Dtt9yfdnlJMoW5U2uf2WJHfG+bzUuKPix
         tKv+qWNAdbGqLysNlGGGvfnAY8SL2WaKH7QXr/BZlwJ08T5DthmNKh6Rp3WOj0IxtqFm
         eGoGerF4s4M5oXPk1BLYjm7YrwKq1XDa6tQ+zD2CS3GqUe3t8pg6f61zcJkmqsMKIkcz
         jUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393771; x=1719998571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUR0TohUBiJ8IOFXE9NWZqEKb83EdzHQzHPM3hND0e4=;
        b=KC2BImCjzfTqod2hykImUjZvJjYfaYcpFTbPM/CGXAUlatEEqezBVzrEMEriVop1sN
         MsF00/I/V/OYsJ2S+iET5lC82SlM6KgBEpxyQxvcUkOC5WtKNYdMU//Rhx6w3sy+73C8
         P5hRDldukT5cjDs9YhlUAm4LuZ6IRW9bFjZ0AFCes0a9kV5F2nRZ8V1ipmSx2C9wdc8n
         mADmzxgwQx7CSbm1MU6MABjZ3lIcUZJBpGoXSfRW6elfFUdpzj9dyoPRhF6W+jiS7mkA
         gkzBNn7DCP9D1ZUCBrprW0YsJNmUnLzwJrpXzYGQPlAsJacyIjm0tAkBfMN1+ROXfGzI
         MDWQ==
X-Gm-Message-State: AOJu0YxBuJlXqNzkWq0p+5tIme+nR5+G6potcSPFlRhLWMvlkp5CGnaw
	2mu66jrjzQADbyKHE9/fn3Aiuq26Kq5Ti1vyc2DO7mgd+q1CO93WJH3F5WlW
X-Google-Smtp-Source: AGHT+IFOD95E70hEpuHCdi5Z1kJK0UXFn2OScw+kH5bvRk40JHn/UpcByNlLBv4hU3Ra5DxGsvcSfw==
X-Received: by 2002:a2e:97d1:0:b0:2ec:5488:ccaf with SMTP id 38308e7fff4ca-2ec5b2dd95dmr53954531fa.35.1719393771082;
        Wed, 26 Jun 2024 02:22:51 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c838bd9asm18108375e9.47.2024.06.26.02.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:22:50 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] pcp: Fix contains reference to TMPDIR [buildpaths] warnings
Date: Wed, 26 Jun 2024 12:22:44 +0300
Message-Id: <20240626092244.958663-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 09:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111088

WARNING: pcp-6.0.5-r0 do_package_qa: QA Issue: File /etc/pcp.conf in package pcp contains reference to TMPDIR [buildpaths]
WARNING: pcp-6.0.5-r0 do_package_qa: QA Issue: File /usr/include/pcp/builddefs in package pcp-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index 10545b65e..f6f2a6575 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -93,6 +93,10 @@ do_install () {
 	sed -i "s#PCP_SORT_PROG=.*#PCP_SORT_PROG=sort#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_ECHO_PROG=.*#PCP_ECHO_PROG=echo#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_WHICH_PROG=.*#PCP_WHICH_PROG=which#" ${D}/${sysconfdir}/pcp.conf
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}/${sysconfdir}/pcp.conf
+	sed -i -e 's#${RECIPE_SYSROOT}##g' \
+		-e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+		-e 's#${TMPDIR}##g' ${D}${includedir}/pcp/builddefs
 }
 
 PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
-- 
2.25.1


