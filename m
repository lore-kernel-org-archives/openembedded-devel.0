Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BEBC4707F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.13895.1650769808245399468
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HMsbeFWP;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id q12so10550431pgj.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aQPJO5XYE+Hvea+RD9RjmLZRhHoyVvKlrCe5EhDTwKI=;
        b=HMsbeFWPg17zM0E7KRt04J11JrzffqAD37FuwKc2N8Iut2RHBvpFbGS8FBlNz4aane
         DYNrFJR+x6AVY1RRg4weplQSpdMN8Zg27daJJ7+FQiMF+iJQElvcp098EbHdnQTZseDE
         owAU50O/ZwpoWt75fCiW/WMYpMdCHxWSpVeUKlZYLl6UD/zldRGShgYD1EUAIokW0pKD
         UJtQyN22tPJ8weFLyKAlTXOzjRa0feRd1GhWs3Pcf6cJjJoOJM6F9xIUyRqZ6H5UU1ly
         1BffjAVigYl4YiG2NLuUkHfjf5H5HMtXg4t1iAf+hPRM1MojyVcCZllIRU3ErHFe13tI
         II8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQPJO5XYE+Hvea+RD9RjmLZRhHoyVvKlrCe5EhDTwKI=;
        b=UiWltsbsBQK2zgWAheGR+JLKG0p0Hm4h9kdLzImsZrXnyyiHbyR73MpPOXovVLn02J
         f+VcxRV9mZadhniuDLktNkSUOvaQv2xBO/pBuAEMvUVD6oYKpZhWTvdeFKQ7ox9U0QZy
         cxIXeijEFpRHVKTgpsL3IlckYayiyYKtUkb4p0CytvH2Qj36oZb9lVqLJySHZOAe9RVc
         BJpA7GfhCNgV6UQ7FYc5fIhcSFAKEpLop2G+ngaecze6mskXracokWKrwE6NawBxTxYq
         Awj1MXgCx0XWZfC5SDYzJSy90fck8ZaAwf24X6oNpPV9iakxteN0a+OcBykzIFBuMr/4
         uUYQ==
X-Gm-Message-State: AOAM5335vj0P2gZfWg5wXxJUxu50kEy3FMofK724CEJlSnpY7p3Wuj5n
	Ia1Eggj58Ud/8rQR+2gt8qy2Frr9Bj94+w==
X-Google-Smtp-Source: 
 ABdhPJxrlA0C3aD4sVx/jBPuQz2AOY6rMadvd5LkHmDwBu+rbNgRP6jbVv87DZULQVYClwXrpe+8JQ==
X-Received: by 2002:a63:5c60:0:b0:3a2:2f11:93fb with SMTP id
 n32-20020a635c60000000b003a22f1193fbmr9740159pgm.230.1650769807482;
        Sat, 23 Apr 2022 20:10:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/12] arno-iptables-firewall: Do not use
 bitbake variable inside S
Date: Sat, 23 Apr 2022 20:09:54 -0700
Message-Id: <20220424031004.3209576-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96739

Location of file inside sourcedir fixed but bitbake variable
systemd_unitdir varies depending on usrmerge feature
hence can not be used here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
index bba11a8c64..e124fd2906 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb
@@ -20,7 +20,7 @@ do_install() {
 	install -m 0755 ${S}/bin/arno-fwfilter ${D}${bindir}
 	cp -r ${S}/share/arno-iptables-firewall/* ${D}${datadir}/arno-iptables-firewall
 	cp -r ${S}/etc/arno-iptables-firewall/* ${D}${sysconfdir}/arno-iptables-firewall
-	install -m 0644 ${S}/${systemd_unitdir}/system/arno-iptables-firewall.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${S}/lib/systemd/system/arno-iptables-firewall.service ${D}${systemd_unitdir}/system
 	sed -i -e 's%/usr/local/sbin%${bindir}%g' ${D}${systemd_unitdir}/system/arno-iptables-firewall.service
 	sed -i -e 's%/usr/local/sbin%${sbindir}%g' ${D}${bindir}/arno-iptables-firewall
 	sed -i -e 's%/usr/local%${exec_prefix}%g' ${D}${sysconfdir}/arno-iptables-firewall/firewall.conf
-- 
2.36.0


