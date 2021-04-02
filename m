Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.10590.1617328734052546895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HCsH//F+;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id h25so2738689pgm.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=W3mcUHp1sREStpUNzqiKM/YAi7e4zHB2Kd+w6jYSLXs=;
        b=HCsH//F+WAmp/UeFQRv3F4hl++2CtzV8dkpBMJGmzFXEwvW9TLrL+yIw01DjzNs66+
         4h2HvbOV/PouL/drGSrgjNo//u8XN32pirnVLcmYINkoUlB7W/NPiYYdeDNf0EVIvVnD
         Hv7iDPJWHi5RYG2AlKFxJSdEzkbcDFw6f8MIOvHomvw+Zj2kLc3LIFxVQdMmYr5zn6rp
         suMSV2AWu1PxQhEO+6BLSiEGjRUeflAsm6dFfPw8ijyrdXZNlUpmjKdDFm/gMhanv5Dr
         ihY4kmJFtRnIwd+fwBcyCZPMdicw8+e5cVbXjVHxeaMzOT6cr9NNg59U4tUpA3GTYc5E
         bxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=W3mcUHp1sREStpUNzqiKM/YAi7e4zHB2Kd+w6jYSLXs=;
        b=nZ56WC7J6wY6MUP70JovoaGqEhygUl8ymlaiD3s/CSFzqaMX2u/eG2vBSBktp3X4BK
         396gruSPZ+Sg5WU1R3VnnSNdAVHjwNCwJoTIgXmORt2Fhl0YgujiRKZz3ub9rh0nXSvy
         R1FEpNKcxDEE2z9Qxa3OOneHN8+8J5CwsbXOnSkZ6PyZ6TOCXAAJ9HAvUJ92jTSSy6Ak
         jlbTcKu2tSi8mEuiZEn7y6hHLcYgTmOijx8nEALy7qX5487mS+VnbUQA2fsfh5ReT3oN
         jDqmHWGDIB1v9Ml8dA8F/SCcPccjkhi5mxPOfEscwbIUbMH6vM/wXj+7p7iguT4fO4zF
         8y0g==
X-Gm-Message-State: AOAM531XzRa1zqi1xbAcf1mJ6EUbQ1xH4SUv++yyMm1mvDdW/2/iewYL
	sbDZ7zird6bIwH9RuFthGv4MM26E5SI=
X-Google-Smtp-Source: ABdhPJw1ZlzY0bjqU4+WMP9bm3Sk0Ck/xWMuVxwilbwTXDT+sXmBCs06o1SQrhEUzhvoAai2cPZJWA==
X-Received: by 2002:a63:338e:: with SMTP id z136mr10023241pgz.115.1617328733359;
        Thu, 01 Apr 2021 18:58:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 07/14] netkit-telnet: Update SRC_URI
Date: Thu,  1 Apr 2021 18:58:35 -0700
Message-Id: <04e4adcae0fbd4f62a9884585de5dd8f787704c4.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: netkit-telnet-0.17-r0 do_fetch: Failed to fetch URL http://ftp.linux.org.uk/pub/linux/Networking/netkit/netkit-telnet-0.17.tar.gz, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f555f9d34f93118bb4dbe1ae45ba0657c585ee4f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 08dd532b62d..c05d0fd6c6a 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://telnet/telnet.cc;beginline=2;endline=3;md5=780868e7b566313e70cb701560ca95ef"
 
-SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz \
            file://To-aviod-buffer-overflow-in-telnet.patch \
            file://Warning-fix-in-the-step-of-install.patch \
            file://telnet-xinetd \
-- 
2.17.1

