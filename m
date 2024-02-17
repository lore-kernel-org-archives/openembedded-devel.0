Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CB6C48BC3
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 23:54:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9192.1708214086809458978
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 15:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=SEYkQpCe;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33adec41b55so1529202f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 15:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708214084; x=1708818884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmLHrJWhN1eKtaFy6MMC7N3pDSsnFvL0BPF5RGceb/c=;
        b=SEYkQpCe7M/Haax6vDj/SUl/OLEEEtCkbZyzvpC0uUN49fnGT0FT+A8fzFtm2Cqzzf
         JOoB+93dr/XXl/R1Uw0hukghQXfqSK3Vd/un9OTpQ/xOzXlYE7zhSHD/7boq419xnyfH
         n7H1lqF87Ss1WxGeLCLmMoZ9gTi8qGiUMaontlwCmQcCvpLsjB+jvy17ryDGlVzjeXUa
         0v2mT2LjeTyetjvSxkLLm4f+1ykmqej9SedF5fuOCVy3tVB4B9qbiXzSGxs8QgsZV0CV
         tFkxUw/3Hu/eOPiWMN/8wtnZ0JH1UVOS72CUIyj+M1fSu3CPNOzr9VMYqc1XXupnOn3X
         bEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708214084; x=1708818884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmLHrJWhN1eKtaFy6MMC7N3pDSsnFvL0BPF5RGceb/c=;
        b=lK4YR8FaU2d5k/sSFTVV752vaMOSOsT7SyakTQTIJz4MUWHfk2xJdqCCLhd2jXZe8/
         0wW38QbweHeRk2DYNQs8cMTTZQO6h8YAZDk5prfrFNLJPgIwHLWNq18bqE1bn7R08iua
         MNiCNl3NB8B8uLRV2mAqUKudSI+6l6+b2+DktbsJ1Usr9ELXTiSGOqD2ddbWCgLktABc
         MtwTMriocHjS+L7kGsWgPZ8wqkASevHBmL/JQRs0vC6ohvqO7l71zB0aljM2Dis3Zfmm
         Kax+lpDcQp09D1FheEtjkkUDYG1wz3AaCeGkLraQyjWfU3Vy+vpKu82gFo1jqrQtJsfH
         1fAg==
X-Gm-Message-State: AOJu0YzpItp9KpG//RyFud0tUipKlnCbphmV5OY4CKvtcaW/bumK4j2d
	rkzngiWWuVpPdJ+4tIn+pxhebUkBrL2/42h40is2cz/3lFsRYddRUX39g65Yw5bZlClEfNsBqrk
	9KIQ=
X-Google-Smtp-Source: AGHT+IH3RELLfdXgd58zxrWfGMjRjGeBEWCdn+MyS22q9mOKcDcbcgdFg06SLj56mSsgYAHbnmf1Kw==
X-Received: by 2002:a5d:453c:0:b0:33c:df19:b4bf with SMTP id j28-20020a5d453c000000b0033cdf19b4bfmr5525955wra.21.1708214084368;
        Sat, 17 Feb 2024 15:54:44 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb058e286b009d8a6db98b186dac.ipv6.abo.wanadoo.fr. [2a01:cb05:8e28:6b00:9d8a:6db9:8b18:6dac])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c378100b004125f34fd7csm1817628wmr.31.2024.02.17.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 15:54:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/2] influxdb: Fix /etc files owner
Date: Sun, 18 Feb 2024 00:54:23 +0100
Message-Id: <20240217235424.1091544-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240217235424.1091544-1-yoann.congal@smile.fr>
References: <20240217235424.1091544-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 23:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108836

"chown root.influxdb" is a typo of "chown root:influxdb"

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 7f8110e4c..0770e4beb 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -45,7 +45,7 @@ do_install:prepend() {
 do_install:append() {
     install -d ${D}${sysconfdir}/influxdb
     install -m 0644 ${WORKDIR}/influxdb.conf ${D}${sysconfdir}/influxdb
-    chown -R root.influxdb ${D}${sysconfdir}/influxdb
+    chown -R root:influxdb ${D}${sysconfdir}/influxdb
 
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/influxdb ${D}${sysconfdir}/init.d/influxdb
-- 
2.39.2


