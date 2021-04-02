Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.10588.1617328730214989473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ql9ak69W;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id v10so2710171pfn.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1f5U/xKQVwjAdVV+41sRfeoPhHofLADLlAqQiLgYUWQ=;
        b=ql9ak69WKp9IFPuxWVYvw/EJ20+rUWgDkAbipIa/mSKHhn6aGUysr8VtKU53OAdrEZ
         fOKWwiFxVAHP7BjI9fplW4sm5k7kPA7lmTXa0eR0waoJkTFzgAYfWSOWGTI2zJVsUKl8
         u9zEmmoXsEEAbuYysRNuHNhwZgB4OUTfulcoqDKMoJEB1Hol8re+ERuhHov5w/hY+YkL
         8zWpk0LVzooPemTfPc0KiGoU+SXWw7fo9h7Vtdxmy99qHTCcOcwM7kvYzZ3msgI2+eZb
         iAh/xvjHs0tZN1DY/4ygZ6f66yBejfhphZUxZN9HhfwVwvld9qKnxWvcYPtqGZAvIQKJ
         2a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1f5U/xKQVwjAdVV+41sRfeoPhHofLADLlAqQiLgYUWQ=;
        b=YGscVkc15KVZz6HfDzHIO0DCdmlaYyyWImoJrehcEvQ6IN/j9eFPOeSd+N10WV3UIw
         uN+z4nWhaZC4CEPVn3cG42cSutTqX0d4yD47jPye3KFSOPkJB0nar48t6RY3Ysn19IUv
         To6RiAVoKzatghOL+b/+mPKx746SItC8CR2cRh/6/xGFWnNcqF0PrbMglNIicK2qMUQl
         qgUi63Ks37ckujOSILLrqrkYyonMBHNKN0ZO499SAAHJEtbeaFyepp7snkGigg3qXhWs
         ZfX+EJ7mv6+mUWfLOSs9pjr7LBrDwK+g2yIKF52UWUYL+mg9zjfpYbuUPcMyMCl+W89m
         ZTcQ==
X-Gm-Message-State: AOAM532RKLPk3RvdXhq3DluQYx4euTxs7JzK44hkHnQvwoX6ReMZgkyK
	UUHgYXdneJgAujB7KbpPZNpRDGtcvKw=
X-Google-Smtp-Source: ABdhPJxOg3TzqXtzKFEyFLMkOut6YczqtOnd7hMRf+H4yc6AfJzu7TyTZLvgQ3U9InHW00rtGi4qmg==
X-Received: by 2002:a62:1dcc:0:b029:209:7eef:b14e with SMTP id d195-20020a621dcc0000b02902097eefb14emr10183277pfd.3.1617328729649;
        Thu, 01 Apr 2021 18:58:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 03/14] quagga: Update SRC_URI
Date: Thu,  1 Apr 2021 18:58:31 -0700
Message-Id: <f03e3e31be83281e0b1d47a8aa30da1cc94a5544.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI as the previous is unaccessible to fix the below
warning:
WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;, attemptin MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a1e3dd6a31ed57fd280d486be8aa1be555010994)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 6df72427b1d..3b7a425bbae 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN} += "iproute2"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
+SRC_URI = "https://github.com/Quagga/quagga/releases/download/quagga-${PV}/quagga-${PV}.tar.gz \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
-- 
2.17.1

