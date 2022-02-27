Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1804C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.7224.1645948734046691580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H+kUDkCa;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w37so8757962pga.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jzm+/3nfLuUJ3ncyMI/Ui4cLVwrD6LQ3RhdD+gBp5pM=;
        b=H+kUDkCarUwUM3FA2tNpkGVYQFGOvG0AZoaIepSsD8Qr/EygheGvg4faGM2dBNg3h8
         3WKnBjXwTqy5sPrcQvF9bVl1V7Ld6j9KlcjeSr0Z48FzwtS6q9yahHFfqQJNeDNLOxHK
         kwJAy8XC2m9KaMfTx+LgoWDKiwAcNjiigJr3a8SuE2AujFXIsoPCuT/ZobaxpW9JPxFi
         Rp0/yDtkVbq6guMwgjq6wJ0lGQjoC44uet52b7pJ42PDI+SWRMvWky6OwKI46+cvmNJ1
         segCQvOOwobAwTw9O7PWpMdKB6aJqXDMdzIYkt6PFnq4psW+p18CFscr1K0KZsHyjxbm
         TDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jzm+/3nfLuUJ3ncyMI/Ui4cLVwrD6LQ3RhdD+gBp5pM=;
        b=S2vX3TAJprE47+jIsBDkqVaSTGfO4rKuZfoCBlT/LDLz3Sn3udW9bzy94p7/us1TQF
         VKp3bg33Vt3U4veLa5gMH0DYCYPdavTLvKqdl2uLPcYLuQmrAxApZA/8QhcQXUp/xa3I
         gRaulCHHM44TeoPNVaKWx3ELPO8ByvrrmXn+FdW3BJsJRm0wRTHYi9IOsCr24HTKndT9
         WGpqD9hJNHBaL3wgLvJpMrHiIpPLzzBvBkHGAsvRiwzPap3vfO7wFXpT+lqoKeui9sdc
         LNHg+a/qWC0Ve4SsbCHUIVE69LL49OY0/NLG9vC8BLFyIoWpYLE+z4alwPLHOVJr7tDk
         iZ/w==
X-Gm-Message-State: AOAM532IQKcrRozXLnrmhSAVDegROk5Mi3+/PSDIx4qpDGfcuY9gpXp7
	WwThPUuuvtpAHp/EuDeyQXWoAJ04cGH4OQ==
X-Google-Smtp-Source: 
 ABdhPJzso3XllQg5/MNc1W3HAV2PGwbuza6LY853D0BmjHg8dJKhyOH4EEvCfTJLuyGSDC4Fz6NQJw==
X-Received: by 2002:a63:e545:0:b0:373:4c14:160e with SMTP id
 z5-20020a63e545000000b003734c14160emr12745911pgj.298.1645948733342;
        Sat, 26 Feb 2022 23:58:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] sanlock: Fix build with wheels on
Date: Sat, 26 Feb 2022 23:58:46 -0800
Message-Id: <20220227075848.610467-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227075848.610467-1-raj.khem@gmail.com>
References: <20220227075848.610467-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95557

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
index 3c08c4e003..4bfd67e27b 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -26,6 +26,9 @@ DEPENDS = "libaio util-linux"
 inherit setuptools3 useradd
 
 SETUPTOOLS_SETUP_PATH = "${S}/python"
+PIP_INSTALL_DIST_PATH = "${B}/python/dist"
+PIP_INSTALL_PACKAGE = "sanlock_python"
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.8.4-*.whl"
 
 do_compile:prepend () {
     oe_runmake -C ${S}/wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
-- 
2.35.1


