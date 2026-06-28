Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE49C44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14737.1782634332624406499
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qpW4z/Rf;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619347eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634332; x=1783239132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1QK2AdvnOhFxXUSaRaDoJOP/91GDDe82N1/IS6qAeI=;
        b=qpW4z/Rfr04x+MrtdJbZ4FZb5cholr7e8cTbbAjRCN3RdFTTYqrfWIfCCPOhiTyUNq
         1vp+iHWHMsXhuYGM+OyKAPz6xEI4yYg/F0SewiOwdNvs3/g8RCy9gkca8WVemRHrpRPK
         1qG6k3EXuuiZFsemaOVRxzX6dUKChL1wuJr0bc182bxWOyxW8M5cV81yVMfvXbP1Afyh
         LDNHWHr1QrvOfCOEtHm9LUlrKPLSKKtKwgcsE6eSJhJ6iwGSKLOXfsP1ZH2oVHWqVw0+
         kv9Hwak1zL9gTJFtHkS/50dEdJZZEmispbVH7uDUkU+mfrI1EQ9MQvocKm3wkXVJZAS6
         VrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634332; x=1783239132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1QK2AdvnOhFxXUSaRaDoJOP/91GDDe82N1/IS6qAeI=;
        b=mLrWoL8zV7WduoisH6/xxcgYyl4b9EWvLnNf/18G/XsffMV5NcA/kDkp99AlTKLk8r
         PON2q0dxHQtWTWnU5xEkcacj9offSu1XOev4UwOZ4Ecf/PWs7+sQN2DDnPBpe0ySdc/0
         Vnj9tGyCe+Dcs1li2Bpg8r6TrmVEqtovN9UEZ2cxbqX2NshUlBRch13QHy9Kd0P7rgC8
         6PlPTywxsWpRbVArS1bO9sNCXubSb0R00zLvRjrxyITkmK3cLlmfFka7WTNcG7gh6Etl
         ImYpoKcsJHBpzrvQUFZChJQhGDxw+06YheCHV/9SQVisOEre73VpFAKEIsaJGsLm01UB
         667g==
X-Gm-Message-State: AOJu0YySPOiIMhCEVcISDSbuleIV9oC9PnE82UnnSm2f58AjjMekxYUi
	gPaS6LgCIs30oGb8w+GcgH1+GZbfdyaVHVleIKs+9bpoS92G+I6RPktHuyKMaBH9RaMSpw==
X-Gm-Gg: AfdE7cnk0Ry1P37ejkcboqZWsydo5Xe0pSlsaQo44fp6tbyunRaqoTacr3frn9XQnyb
	zuf33vxw7vZvgWtlCxR/ZWbkN9md8byClCblix+khjzSkzD6QhG9g0F+9n3lHqIo3D74+ZuOzfw
	dL72rvG1tVTGs/h//ZOy0SK5pMdGuDsLg+JViRdoSiz3BMfIbMQ9f7Hp++0scEmalDEkdvmK4bn
	uxhGI77/pZ+K/5K7d4PUL/TFcFVpoFdANYBPi/Zd1coNJhw0M0jYnH1fC1VdUr03PHXv6c8iF6x
	YAotrZsK6UstDAjJIwLjoUl5uehDQujMqoioYKmxEhRPAErGVRUE4vj2nDesZMQ7Bj8enW4o+lF
	NjGwcA1F9dMBj7vb/Jszp4jfKpPrXbFrKACHe+4tQPHlKU6H2X9/yxgxLaM5sjYqq7SJEGd2b1X
	yLJD4DYKUFCkQAcAzniMhg1M36dOQuKp1Dun+KpHYtYD85taH8IKecDwC75Nq/3vT40W73RVOYl
	eaVbxxLtYpKD4E5u/t17FHbrvka5/7uJobal4lke/juIeKnyXFOjJl4NlfvWnNhwk9h/08Ze8bc
	QiKI2FDVMqDpb2DnIMTDWkJNlS/LGA==
X-Received: by 2002:a05:7300:2321:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30c84b84f6dmr12331062eec.11.1782634331921;
        Sun, 28 Jun 2026 01:12:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 051/128] logwatch: upgrade 7.13 -> 7.14
Date: Sun, 28 Jun 2026 01:10:02 -0700
Message-ID: <20260628081122.178348-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127861

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../logwatch/{logwatch_7.13.bb => logwatch_7.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.13.bb => logwatch_7.14.bb} (97%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.13.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
similarity index 97%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.13.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
index 13897590be..e40db809e6 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.13.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "0c9a10c2d8e5bc0cb10e16dc86c83be60d71d8a52b97bca785c64a30ed642839"
+SRC_URI[sha256sum] = "2fc66eca83419053991484b7d6e778f46b03704ce778893473d7a9cb7dd915f9"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts/services

