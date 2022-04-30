Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56AAC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.25721.1651346311988248288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RWNVQI+S;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so13195951pjq.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GbY4gWhh1fvvQaw6B2gkyWVdMKFxsX+lkrPyfIZ39oo=;
        b=RWNVQI+S2Yaf7nCS+CrQ+lja65j+27POFyCuMP4w1L1MYfgs9+CjxbvAxCBpb0mY5m
         ujCuz8i+BJrSg+5CvDGKPhYamH6Q+hMrtPHCSQdL0ygqPxxIu42tehVk42cR2FlxxcPT
         OyKVG0h5tyC+WdxwcBRJyHU5nJZCHy48+bBNxXh5cboKzTVHy8xBfTHWF9LGJ9+v6Eif
         YT6UPe92yo1SRvgdrPjJ/nGxGn0AO0wxDGii0utr0jV+hs/37kDFRDYICRFjfHMD9CgE
         Ygh3M39tkuOCWhacuPh/xpI4p0mv6GOdE5yTalm7+kEw+K3DGFJv9SxmecTWFebNrY7T
         8+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GbY4gWhh1fvvQaw6B2gkyWVdMKFxsX+lkrPyfIZ39oo=;
        b=EIYZW1JBE36dSIe89WnbKhsdrHrm0dLEy7mB2Sw/f732fUnDPRYvyXR7LvN3QmEUUn
         8hjVf4Wm2PXn5WCffvUcoF5o+7vxUe69nh55oFu+CWauwN+V8Y9OzQ6P6XQr4/hZieyF
         d7vX4uUgynldQGB02833N37SuMOtofcHYuclvePgstO5KXZuCf9Dt/aoK6aRcbp7UhmZ
         fgzv/sp6R11mtExvHT1uCXfQjFBoOKgtT18E52x7Zs739YUGcgFE/yVzz26l6QtT5MGn
         Wq8cE9EabIIMaoGhFL5Rom0EZAfFBMt8pQl+puvvyoOiGG5LVlg2BV2XItNvi/m5E1Iw
         242Q==
X-Gm-Message-State: AOAM530nmPi5EtYsULkXiWOVH1nXmPehL+lrXhGuB/Qdu1iDcNteTrzS
	IcDI4ptcI4CUhPr3UP4pmzAlyn78PIX1ZA==
X-Google-Smtp-Source: 
 ABdhPJz1YjL2RhI8nRN8Y6cn48TeeZd1pouiUimz2SBxo4vtw+TViugRerh/DsF7DdAp7YS5AucSTQ==
X-Received: by 2002:a17:90b:1e4e:b0:1da:3936:dc2e with SMTP id
 pi14-20020a17090b1e4e00b001da3936dc2emr5335096pjb.20.1651346311137;
        Sat, 30 Apr 2022 12:18:31 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/39] arno-iptables-firewall: Do not use bitbake variable
 inside S
Date: Sat, 30 Apr 2022 12:17:44 -0700
Message-Id: 
 <5d5e26bd227cb7919ba7a501c7a072defc39e1bb.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96871

From: Khem Raj <raj.khem@gmail.com>

Location of file inside sourcedir fixed but bitbake variable
systemd_unitdir varies depending on usrmerge feature
hence can not be used here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b643dcefe8ae4ef0cd3066bd31bae41e322b84c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


