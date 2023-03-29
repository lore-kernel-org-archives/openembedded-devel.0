Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C9DC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 11:28:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.21996.1680089286313545721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 04:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ld0mDhEM;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id w9so61847544edc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1680089284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28J/6SzoO9FPclSsUf7Gdd2g9S6D35qFlmCmFSnYBYM=;
        b=ld0mDhEM4Brld5/kGbVGYo81Bfgmd9LFtKyqKCgoBZyabOzL0WhEjBzgDU7Im9/svn
         hvhM3AlKLATmUujh8R1soXbnH+idtLYQLVkVXvCiuo+GGTQ0GdH2fFB7lv6Ol1j5y4Xo
         X9MrW3geXZ41JQHfDRJErMrdVP1KTPrVz9YEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28J/6SzoO9FPclSsUf7Gdd2g9S6D35qFlmCmFSnYBYM=;
        b=Ib38eV3a8ii5VTsVBUDxdJDMD7AM5Lv4+eB2F+P5cWgrbWMk4XOBdvKpn77kQvPAUR
         v09GWpSvQpCI0v2+1glAYh6QPeHIDcS7qqBqL/2wqFBQ+KWFBIhgZ8/a/RYcXdnFK99p
         Clf0Bv/SKxUMwPkFMpXkpgeYURmny4Bj/XPlsQdHNBIhw5shtin1VFm04Mj7m/exFIV4
         wiNGQvc0E+Wk/3f9aQ0pQpVb52/cdm9MyGxrrc7BqyTk6G5KLKxYEafUWh8DXYLVlPoD
         pJ0Naiqn9GTPQevsdqh0HX6dfGHKjxIR/LoILHwn1d4j3BOwNpFYc/VB1lfEaC1vcLUI
         Ym5w==
X-Gm-Message-State: AAQBX9ff5Dv7RiV/RKiuPFbbJaZL/aZsQemox1L4pf784mZfBFdSLIrJ
	t/AF+e8I3llD2eKcLK6K81AYdIuVlc9gewFVh1s=
X-Google-Smtp-Source: AKy350YPtt/GuugA/VMxrmnI6XI9dreLLTl8OyBh71VPxEP0n5QUma8lvrw/0NqNbDFgw8A64W5LmA==
X-Received: by 2002:a17:906:738a:b0:933:4ca3:9678 with SMTP id f10-20020a170906738a00b009334ca39678mr17006124ejl.24.1680089284342;
        Wed, 29 Mar 2023 04:28:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709061c5000b00939ad35d521sm11680695ejg.77.2023.03.29.04.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 04:28:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] pcsc-tools: Add runtime dependencies
Date: Wed, 29 Mar 2023 14:28:00 +0300
Message-Id: <20230329112800.495483-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329112800.495483-1-leon.anavi@konsulko.com>
References: <20230329112800.495483-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 11:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101817

Add runtime dependencies for pcsc_scan and scriptor. Script
ATR_analysis is written in Perl and it is used to parse the smart
card ATR. This script is called by default by pcsc_scan.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
index 26faade5d..b71fb0427 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
@@ -13,4 +13,12 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "pcsc-lite"
 
+RDEPENDS:${PN} += " \
+	${@bb.utils.contains('DISTRO_FEATURES','systemd','pcsc-lite-systemd', 'pcsc-lite', d)} \
+	perl \
+	perl-module-getopt-std \
+	perl-module-file-stat \
+	libpcsc-perl \
+"
+
 FILES:${PN} += "${datadir}/pcsc/smartcard_list.txt"
-- 
2.30.2


