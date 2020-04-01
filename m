Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.4540.1585712052167407338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 20:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=bLkpaRgW;
 spf=pass (domain: broadcom.com, ip: 209.85.221.67, mailfrom: scott.branden@broadcom.com)
Received: by mail-wr1-f67.google.com with SMTP id a25so28878425wrd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 20:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lJxOtDXo+iY52jd0TiCiwgSfeNX5810/dcOAp/i2xvM=;
        b=bLkpaRgWdpZU5tQLP/8nXedJ+8Sf1nH4Zgw+x7yo5+P6OVfAyUsIOtMoMVpkArkkH1
         dyLKdpnqvEMKyig8g6rddz9JwbDFO59POX6Rg58PiUIBC3o2i3XuUT6RnM77JUBzkjdA
         IV4MEwFQiQdNdahtOs+XmMmNtobjXgE0c01cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lJxOtDXo+iY52jd0TiCiwgSfeNX5810/dcOAp/i2xvM=;
        b=BgY5T0D/Msa6O/+/6aWEF/7z+0GXUEofi9464IDModnkyJ7RzOeCcZ15PlsSp8jqz+
         Y68tENRPmd5/CB+eWfMg6R8EVf1paImJC3pEUivyek7NsHv7v36qKxTWXblGIvBeZ9cE
         7NbrUgL5Cte8AiSMjawZHbIqeWEYiTKT4dAlvFePJiJlwL5E6SGxe9CrQFTwhGbXOCuw
         /s32JssBBwknUmgZpVYXxblzf4W9MKQ0oiQvpaEiAwsTDy4t0/oMY5HCKJzYG3fiduMS
         jv8CpF/TbIyXzobOYTDu00ZOnTghTaHwacb09Lu7WRVZQCYs4Ju+t/WV1sMQfgyTS26p
         3ChA==
X-Gm-Message-State: ANhLgQ1yGeECOauq0UK/3abs55qhF4ASeaJHsJbTQlesuWG0LDJEMkyg
	GHBzJ7vJZqCqRsqjAoY0ptNbCnWWDbs2RmLf1jLmyTe3WhZoDs0lgk/tSpBefmxFV94CI9vIQvx
	efteog30tAONn/dqxmWh7ZnnyKtHcMijfPYiZypprKwuXTNNTebrm70WW5mx/M59qADZzadUwHg
	hLiSACXswm7d4DlwAImDFgOMeY9A==
X-Google-Smtp-Source: ADFU+vuVamSHBGCDwWvemxpo7KHnB7IXm45EwfEy6PwxfoIksE0fLxltNk6R23oZRt1ZoQ9x3EGVhA==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr22697862wrs.13.1585712050110;
        Tue, 31 Mar 2020 20:34:10 -0700 (PDT)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id q13sm1103761wrg.21.2020.03.31.20.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 20:34:09 -0700 (PDT)
From: "Scott Branden" <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Scott Branden <scott.branden@broadcom.com>
Subject: [meta-oe][PATCH] kernel-selftest: add firmware tests
Date: Tue, 31 Mar 2020 20:33:52 -0700
Message-Id: <20200401033352.19306-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1

Add firmware tests to kernel-selftest.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 299c1f28e..172767b9a 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
-PACKAGECONFIG ??= "bpf vm"
+PACKAGECONFIG ??= "bpf firmware vm"
 PACKAGECONFIG_remove_x86 = "bpf"
 PACKAGECONFIG_remove_arm = "bpf"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
@@ -27,6 +27,7 @@ PACKAGECONFIG_remove_arm = "bpf"
 PACKAGECONFIG_remove_qemumips = "bpf"
 
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
+PACKAGECONFIG[firmware] = ",,libcap, bash"
 PACKAGECONFIG[vm] = ",,libcap,libgcc bash"
 
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
@@ -36,7 +37,7 @@ inherit linux-kernel-base kernel-arch ptest
 S = "${WORKDIR}/${BP}"
 
 TEST_LIST = "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'bpf vm', d)} \
+    ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
     rtc \
 "
 
-- 
2.17.1

