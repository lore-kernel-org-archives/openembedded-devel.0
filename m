Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09879C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:14 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35355.1790506272341144137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PTF/3pvH;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f204f6so1015015b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506272; x=1791111072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UO8DR9NVjiebS4kQssfCR3QgvEwEP4iDLV/XgTHe90=;
        b=PTF/3pvHnnlGEA0jy6qdIx7d5i8Q6kDb9dzTnbC/tdTS+BfHumpAcK+F1Pbzc/CZDT
         z13cDsNBIA5TfT2HqYpA8SfnxYkoo6w7fps6YLgFa1Oz81r0M8dObYJNJGpVhx5bOPs0
         2+6zz6oZILKcZ8I432r95SR4rkaPzU1o1x/NLW0o7XuXs8xZxeK+EHBBgiYXppzD+NCG
         z7JsfraRUnD14GN+G9qtN83w4T2cjyYWEj0o9uRvOad/UpB1QGeugeL/4DwViFKH5A3i
         YIzEPXECQWZ1EBEneiLUGB4rnHkTdyXg1Qkf1ZTW5nscYsEkiMC3Z9dR1+qk+orJ/6kO
         p6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506272; x=1791111072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UO8DR9NVjiebS4kQssfCR3QgvEwEP4iDLV/XgTHe90=;
        b=0nhCJWe5e7ibx7bE7Ae1/a72uyiToIZ+bjjDsJVU8jd+oRjHlMOz2RbXGx42nNArmJ
         7+7Yhqn8yBGKhwJS0MON/xm93s3B7dUXiPXuQh6nMUVzsvC7eJNgnEe8xIEnqlIo+7+o
         B/ByPegZNVBN+I0ykC66j4tGvi4VQZ9GHNqapehtxf30uh5u/HE+mldjb/rRM7IZ/S2Q
         Uf8wyX6fz3BgK8yYZDmqm8GyYD0OwrwkvNvJG38vDH8g3VGHVYLmPE0hbhFTY0sxWPVg
         2DfSKbm4hXWrJ56TDf30mcKp/cK39l3k8ytvGD+99p4CK1ctET0xFWbWOznAVZArsndc
         HN8w==
X-Gm-Message-State: AFuF++kappZsWsVxBzt0A13c/hkKsyF5lSTBa6VLiv2bggl7ECjxrrNi
	zLOEijzT3f1SP6k5lQqwz1XPusRu4Zk7LJHBvo/FjazzMC6h/fPP0wmwBj9Rug==
X-Gm-Gg: AYBFou2xdsPSVtTOdFG35TA5q0wcBEyowuw170PAeS/N84w0U6xcPN7mxit/xV+JGB5
	U1JW+6lAxyyQXCesmuY8rZK5fC7IsFU3ChU+WwMPndmyW+yWU4r1kPs7GrGAnyBEvFP/9z+Z24T
	3nXrUv1VZJrHLCupNG4w/hYGygH4XdmLSA6DwM+rJ0mKei4BI39VIaKzOwBmP/qbOZKSrwAaS5O
	sB673OEoNsjTXVWJ/TT99GTmgoz9FX7++pmEi+XtXZU/sEmAi13uy90UmlIa6MmWwdaxNknFRss
	LN/BcXbDeTX30ShIdPMiFTtpCHLoebUHm23rH1qyBzB8/KzIkhUIDRNeOkDQVSDe8B6my8Z/Yng
	UuEGoij7Ch18635SaE91wHPHCjw46nK4/632F8yT4Q8d6qv+KH8tLdM+3UTz8/O1JGjoMQH6A5A
	99iiL9p6mzyC9TjVVjh6tAH2XuMENowfUhuTzTU/T69fcu18LOUKFB3eNxPgnhR2NjEvQPu1RtG
	9vI305r7zKNXqKrlPCo8zU=
X-Received: by 2002:a05:6a00:4c09:b0:878:34b8:231f with SMTP id d2e1a72fcca58-87e9b69fa2fmr8042337b3a.39.1790506271634;
        Sun, 27 Sep 2026 03:51:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 23/35] zabbix: upgrade 7.4.14 -> 7.4.15
Date: Sun, 27 Sep 2026 23:49:50 +1300
Message-ID: <20260927105002.1832451-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130357

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/zabbix/zabbix/blob/7.4.15/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../zabbix/{zabbix_7.4.14.bb => zabbix_7.4.15.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.4.14.bb => zabbix_7.4.15.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb
index d40b04792b..a112fc6319 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.15.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.4/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "efde5f6f19896f0200bb5245e3866035667271c7b1e84626d26095f24a6fbb42"
+SRC_URI[sha256sum] = "5e1d9b3747ebf9b81d5d62d8ce00ef9b3f7f4c081394ad11a2dd18897a24f394"
 
 inherit autotools-brokensep pkgconfig systemd useradd
 

