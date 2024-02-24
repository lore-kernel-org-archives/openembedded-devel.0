Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1ABC5478C
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 01:34:19 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.11440.1708738455919921060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 17:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXSP2UVM;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e458a77be3so538949a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 17:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708738455; x=1709343255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCEUv5GhWwonMYwmlDETbnUVGe5ns2AfuqPpVIafj+w=;
        b=mXSP2UVM/bRGFjCCfwoz09wO2+ATkX11BdSKRUdjC6gtw8GizaydHahDp0q54pMHqB
         KZCmQ34N4VKP46B84Ioxhikza6EDsH/Dn/Ryow9+LrB9vIf0V08BDmGuombUZ7hJK2K3
         4PxRXAsHV7u0bYwHo8O+3VARByhj3HNUU68XaUxe6ntwuFZ+PBY8rETLoPFao/OuwTBl
         ihGX7ASU22f9GWUTIHSJQdM6ANiqU9oAxRKognQM7h1aTTMJLVcTuacoJXGAZffzBn5a
         KknLnTfkg/b743fsjuj/udjih/3RcGtJd8vYzaYz1J5AVyivi7Be51YBDwiIN3u1ZHNo
         s8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708738455; x=1709343255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCEUv5GhWwonMYwmlDETbnUVGe5ns2AfuqPpVIafj+w=;
        b=QpEBiT7erUxyR5o0CZQDA6Jfu4zkYbE1y5X30yA5gY8xPbQAWjIuf1OmiQxBIH5lGG
         SqQfTsDWQKqAS9hpzqtwkEoB3lJhk4g7Cv7m9CgqOWIdbgc+yBPBtukRn8GmafGjzrah
         w6p8aSSgFkuY0Nox2HBlJ7UV5Y87pDJwmSvG5ZBca49bPGs2K3GbNp5sI3nSJ8HNQVnk
         +piQ2CqSpPv+FCOn++QnhWsA3Jyac1Q5XUf2FCYLl4JzHZYJG+WmRNQG2+5Po3n4f6s2
         omjcByETiiyLI8DZd23VXgQonKAjKj6zDbf3KqnzG175eV5cu1by8rN459WesGdH+W5M
         VYtw==
X-Gm-Message-State: AOJu0YyDZn0JR9gj45hmBOuO8hNsIQwoMJw/8S2kZWFRkrZ4ZftOV56r
	23B03hutKSXjKvjqUeBcCAu3mdS83KQJOqww+WDDwf/w0ZzhpelmKixQ5oYNuPM=
X-Google-Smtp-Source: AGHT+IFj74Mfow9SC9SnImkxxdeGA0lQfowuLayLBQ4lBpjxuIaG1KR3bP+gBZJNSBpoVQRjeRG3pw==
X-Received: by 2002:a05:6830:39d8:b0:6e4:8205:d73e with SMTP id bt24-20020a05683039d800b006e48205d73emr1602259otb.10.1708738454831;
        Fri, 23 Feb 2024 17:34:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1220])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006e47af4d743sm108969pfb.158.2024.02.23.17.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 17:34:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] squid: Add missing bash dependency for ptest package
Date: Fri, 23 Feb 2024 17:34:12 -0800
Message-ID: <20240224013412.402229-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 01:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109022

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-networking.inc         | 2 +-
 meta-networking/recipes-daemons/squid/squid_6.7.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 05c4e474ab..574e3a0aa1 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -16,6 +16,7 @@ PTESTS_FAST_META_NETWORKING = "\
     lldpd \
     mbedtls \
     openhpi \
+    squid \
     tcpdump \
 "
 
@@ -33,5 +34,4 @@ PTESTS_PROBLEMS_META_NETWORKING = "\
     nftables \
     openl2tp \
     python3-scapy \
-    squid \
 "
diff --git a/meta-networking/recipes-daemons/squid/squid_6.7.bb b/meta-networking/recipes-daemons/squid/squid_6.7.bb
index 519ece80f1..a4932cd36c 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.7.bb
@@ -143,4 +143,4 @@ FILES:${PN}-conf += "${sysconfdir}/squid"
 FILES:${PN}-networkmanager = "${libdir}/NetworkManager/dispatcher.d"
 
 RDEPENDS:${PN} += "perl ${PN}-conf"
-RDEPENDS:${PN}-ptest += "perl make"
+RDEPENDS:${PN}-ptest += "perl make bash"
-- 
2.44.0


