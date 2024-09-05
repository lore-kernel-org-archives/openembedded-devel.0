Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F084ACD5BC5
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:52:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.8502.1725540751717560414
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FL5BR0HI;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-428e0d18666so5838995e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725540750; x=1726145550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXaqx1C1tHc3TPyZp5l2vwfoXHvfpyl0LAvmO/OV5x4=;
        b=FL5BR0HIaaV6jjJGHIMvyUTo8805sz4ZL0qUFQgXhXjeQO2GGMHWPczVpK7HnnewnI
         zLHzgsQClwyWXEVSIefiIl6pi+Ae718hl71k1SwHWak7jeh+cilxdUOYBGimzSCRfe9r
         Klg7wL1+3jlaVoxGytiZYW8Vl9xfHWAuMu07k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540750; x=1726145550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXaqx1C1tHc3TPyZp5l2vwfoXHvfpyl0LAvmO/OV5x4=;
        b=RWu8knCvsC5nRwAxMWT/HiPU1SSyTlAAXGU9conx8s8Vz0ehoHYIcC3+kx14VDKHZk
         G4qML2dlUeK2RfayMmVuoBF/3g4/zhkIkpdlfNktSJocQ3RJYUaSkL5XZDQ8PWOhfFc1
         bepeItZr2m4iLl3racd+ZLoqJQedB5LEGTAbOuYVkTN9EecE2poti9xz4DGa43K9ARNe
         azDaeBSKJ8gmSOjF52MkDqwZZcqeVEmZih+jAWsUqx+TnjvhZyt7VE1ceW9VvY6kV0R+
         G1TTwyAKv7W+GOgh+n16LLduyp/L8ipSjnXz8XsdyB76TKTTCPRCF7zmhrLTr3fzrzmA
         FuGA==
X-Gm-Message-State: AOJu0YzaglbBlF7iO8a4yQuE0w/xwfYXT+B+TiqemnIEniKWUxZ/kouF
	sxceni7X6gNCGSu0Fsg1/3VNtUe8hsNpNXz2kv/K3OhRozZH6aK8vB4Tn7xyALibrbXLGIQskt/
	2MBbT/g==
X-Google-Smtp-Source: AGHT+IGze/Y749XGDZufGkkEFLq+BHWiLUuf9T4LsnTyTCSObV/PRj/Zwudm/BM40M/vNupCktTz1w==
X-Received: by 2002:a05:600c:5494:b0:426:5dd0:a1e4 with SMTP id 5b1f17b1804b1-42bbb20568fmr144494775e9.8.1725540749525;
        Thu, 05 Sep 2024 05:52:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df100csm231692265e9.20.2024.09.05.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:52:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v3 2/2] polkit: fix build on sysvinit
Date: Thu,  5 Sep 2024 14:52:21 +0200
Message-Id: <20240905125221.2758495-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905125221.2758495-1-yoann.congal@smile.fr>
References: <20240905125221.2758495-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 12:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112106

From: Yoann Congal <yoann.congal@smile.fr>

Polkit unconditionally installs a systemd service, remove it in
do_install() on SysVinit systems to avoid "installed but not packaged
file" error.

Fixes this error:
ERROR: polkit-125-r0 do_package: QA Issue: polkit: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/polkit.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
polkit: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: polkit-125-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v3: no change
---
 meta-oe/recipes-extended/polkit/polkit_125.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index 2405ed6034..a67aaf908f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -55,6 +55,12 @@ do_install:append() {
 		chmod 700 ${D}/${sysconfdir}/polkit-1/rules.d
 		chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
 	fi
+
+	# Polkit unconditionally installs a systemd service, remove it on SysVinit
+	# systems to avoid "installed but not packaged file" error.
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		rm -r ${D}${libdir}/systemd
+	fi
 }
 
 FILES:${PN} += " \

