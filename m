Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B47ECCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.6657.1760474358208249727
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFB2h0M3;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so5210367b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474357; x=1761079157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnwVPK14oAQCEpec945M7Ysk3LGPIWUBblNncQjm5P4=;
        b=lFB2h0M3v5WL6fYcSkK6ZXdCr2g8NWOYburyrTVOPRodHVQBgT+crGaFS/z7AASFcD
         EyeXXA2+YcN/r3dAZIb/zm38XxRRoqdYs7UltY7fkkHfqzX/pRggNGuZQ5Q3sWnYgrwJ
         uNHuW59Zahby4vFQxnq6X8ZVrolp5PXrJ1g9qOwM0etZjQCK+JZRC5NeyiIhaTY3spPl
         z6AhupD3rwFvoWq4rc+vKiLGh7qeOlLEj6tGvzFEjiElreA2/f0SCe+Di0kmFPmkBOZI
         wPxjHbT7qu7WSrOQO1sjd36j7BVijM2iNoZG1AUtQzrhDSoOCatraL9NFJMnO3ZcLevN
         NACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474357; x=1761079157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnwVPK14oAQCEpec945M7Ysk3LGPIWUBblNncQjm5P4=;
        b=gkkFHkrkdw5p8JpGbuy+tnA7xueE9BhrI31VfULJslDeTgbPSe07owKMAt6Dyz4nxY
         dkA1OxpoRUE1kkfMStB7IGt09oiuzUm4Cg06Je+qiTe97H8M+Eh3+0omxSfgia07Ae/d
         BHiv1iy1Dc542jAMkwtYJzdSIT/rBXzzkpoWqlpn9BaasVrNpG1AFaOGL2oeunXy0/s9
         XANHgPC/tPOBPB26VUlrPHKRWMarlTzVTLMs0LvVSSkGjZQ8Hs45dfoAG7ljG2q/B3rH
         qL9KfHry3EeOoToUeS7DvqxYLCYfdR/b3gx/XItkdYvBjatJoFa1w2NMKOgx1TFoQgD6
         w2Wg==
X-Gm-Message-State: AOJu0YxQ2qesgSIQgs0XXSgdaWJnoY5r9uKnFseb5dgoeg2gEGvDiNbv
	FVqiDEXd7zBkPJgcgpQbl1BxllBHqKEqKxljgeTHvw00Gb730Fol5Kld2pWh8g==
X-Gm-Gg: ASbGncuTYyoP6VNPzbDn9wmqyre5vKYwmvj9bGQq5I5r2PIFi0EEKOvcCQMX3oHTlBx
	tIOhVKGkCSSaX+/BBDT3iokFz5CP84cyv9E0rL3P5+4XQr+DfnrmNFg1+Njx4HaWJO3msQBNGEz
	+CMn4g7tiZBX0zr9shIvTlxH414mnhrGhPwl7+vC3KuJkVDw7ZD99oYRkHxtE9IQ8rqXBg+H6ct
	6CWqgRJBWCUW6b/PQgtNYUlPFrUFR9oL3s2PhKJii8gaDV9GiCLUS9Zkam81EECPe+VcRU75siS
	XY4LLOKmMLOARYekifafhpLAxFsMAaUTXQPFNJgpr8GMlqMtFoj+QngbjCEvrWKlqS1BWN9D5oO
	bJhY//a6fKO861vbEM2w+zoqwK10ynV9Qc9tCBzU+PnrhWDtr88FBHMU=
X-Google-Smtp-Source: AGHT+IEOpxAIgPaMVFY2UdATTsHwthluGy6v8UaIwbpPPVMBUuk9bAZJ4PfjnyYiCFgbr7SAfB9Uyw==
X-Received: by 2002:a05:6a00:1491:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-79387c18f99mr25110344b3a.23.1760474357365;
        Tue, 14 Oct 2025 13:39:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/6] corosync: upgrade 3.1.6 -> 3.1.9
Date: Wed, 15 Oct 2025 09:38:58 +1300
Message-ID: <20251014203901.1479326-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
References: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120628

From: Peter Marko <peter.marko@siemens.com>

dbus dir was changed from sysconfdir to datadir

drop unused configure code

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 950c603f21d14b07874f7bfdfb71eae86f6de3c7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb}  | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb} (90%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
similarity index 90%
rename from meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
index eb70bbe923..b4e0f1c7db 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
@@ -10,11 +10,11 @@ inherit autotools pkgconfig systemd github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
           "
-SRC_URI[sha256sum] = "ca6ed32b4d7f33ed614afce8760fe58d0de92c68b575d4969ebacd892f3d1e27"
+SRC_URI[sha256sum] = "203354bbddee1a97b3c50a076eae89c635f406dd674ccaefc94bb9092acd9535"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9c2cca5d3448c43e52a399ad611658a"
 
 DEPENDS = "groff-native nss libqb kronosnet"
 
@@ -34,11 +34,6 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_un
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash ap_cv_cc_pie=no"
 EXTRA_OEMAKE = "tmpfilesdir_DATA="
 
-#do_configure:prepend() {
-#    ( cd ${S}
-#    ${S}/autogen.sh )
-#}
-
 do_install:append() {
     install -D -m 0644 ${WORKDIR}/corosync.conf ${D}${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
@@ -59,5 +54,6 @@ do_install:append() {
 
 RDEPENDS:${PN} += "bash ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 
+FILES:${PN} += "${datadir}/dbus-1"
 FILES:${PN}-dbg += "${libexecdir}/lcrso/.debug"
 FILES:${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"

