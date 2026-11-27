Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10366.1795753076425250832
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LQ+YLzbl;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so11675521c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753076; x=1796357876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/s+y6l3UMhJWCr3qlLu+gIohoXUv/HDhGdTFUuea+z8=;
        b=LQ+YLzblSffmAAJid49E1OeBmGaAgCHZHuJPpqCDH1mpae+abECDAvn9ZE6aLAPx2I
         NMbDokpSjzEI+Gy3umySmXvWiObCLIZQxZ6msqSrLjvkF0IvpCSR+EzWRKegaucy2Onq
         NA/MACCnZfbE1D7QplB7bobkIGQU1+5bd/hFQShxJXKgM5dy3bfXqtIIMHd3q6O2cIgi
         Zz4Da6GKpWd4q4XDpSbvUn/4ZS4IwN3hDNOUMOsQGrFPg46u31jBqYWoEzYkwYvlzKXX
         dBlCSMqX/iR3RoSRY1txyHgQuvFA/TrA4medTkGltsvWZEHcviV3W1pi5p/gOT9m5qvW
         7DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753076; x=1796357876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/s+y6l3UMhJWCr3qlLu+gIohoXUv/HDhGdTFUuea+z8=;
        b=2xmjRF+XUH8c2tWqDU0sDg2GhxudEJsTuKA3gXzQyUEKqCxBhQLql1/7Kt/yNFMJEd
         FnIBngiFLCF8FgqKurToPKWGnZpmhrJkvcanQSaY/ywrydMJRUCrm2F+8roCkEO8DYjl
         jxpiVhIfR5iY4Hl7RPWXSZJ8B16rczbo5rUN/mMVqXzKA44DAxeHwLJCC+Xk4JCRahjr
         fmOZ9Dm4T0wmupQsoKfybbLbMt5hGG40dcPKlZgNm5FWe01D4yg+iBPTTwZDbzRxY/lt
         KQG6gbQCwElTe+ziB0vCJqZSwII5JZXK9LwW668/c4R/COy1ALYQPBOpXLcW7JL+Bm08
         dXiA==
X-Gm-Message-State: APuU4Z+27F9LZ/dkudwFV1m4pkRuH1sNZgp6ToCDNsAx017laiqql61I
	FOgoFOVojiXrFE2IpxkFw/xdm/JqUcfH066kv6rbE0KnIg5Qvq3R07q9QOyIJlM9
X-Gm-Gg: AZFdTZfLalq0AHolTIkGfE9iJSmrTHRAUpBLDr/1SxYj0sXaZP6KqXcyNnNlx7qvVdJ
	Nxal1tK3QNPcMBNoCi9iVPm5aG5Alk3zppGro8pGGInI2FNUUjavEQkzmc4CGYmigNClISsEdtW
	i1pBatcUoBsDJoI1M3BEaD9oQf6RUFciuzjSICHe+FJ4r4qZ0YNWX6GW6PFhYLVfZ1Y/SRL+l8X
	t+I83yc4YSsqUUaObHK4bQtEPFeAjiMe/UWYyCOk7Oq4pnSO2LK2VAuUpDsZFAJtc7XCc+ekXZ5
	D5r2g+KUPpObP0jn3bY7rUPrM05ounnq19QoyxDCl4XkxUeBSah/iGWbJOmmaCSbhEINTGcx4Hb
	vS3iUrN+J9mW73S0OHtlVGoUULcp2pdKAMSeRdKKspFLNadH6QG5pIlNf6rbDeOl5HaiVYBbEMc
	AhyuUpmIdUV2aKCV5rE7jy6mW+uO90neYKRsh2roB6FBP43LPBOV2YXWYF3wL5Vs0CCPo6b+M/3
	rlF5Luooml1/R1frptiEYuAycC7cyRmJMsYLj1uImnT7X2chlonwnfxL08kOrVy9xr8JFqwDO5i
	Knp9z4d0uI2LGd9n5Q9UVZSv1giCIKAezn6En+p/VyeL0t90GI5YSqB58KvsC885i2QgSiBYmOQ
	dT4gH5TE/0ABJ9JYwEQoa19HEg1djVbNeGIHBBE+SnrboePdfvGxfQIyWHh8B88fIA25eQBfL5M
	96FHtIwkBVAq+ms8b4hndGzSzMOZQsLiZrApkOfHfKujkNKbqTkgh4KqCAv9YODG8ZL/VXgh0ix
	tzK3mW1R+PMLsgHeyTDcI7ed0Np63ETOja/KL8IX0SnaygUhW0X1AuUvZDfD1KqGbk++iwoj/3m
	GI+7
X-Received: by 2002:a05:701a:844d:10b0:1b5:8f84:57c1 with SMTP id a92af1059eb24-1b58f8457f2mr5061567c88.21.1795753075767;
        Thu, 26 Nov 2026 20:17:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 34/35] cim-schema: Mark upstream version as unknown
Date: Thu, 26 Nov 2026 20:17:14 -0800
Message-ID: <20261127041715.1776485-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133286
Content-Type: text/plain; charset="utf-8"

dmtf.org links each schema release as cim_schema_vNNNN (the newest is
2.56.0 at cim_schema_v2560) and the version itself is only in table text,
so the wget check cannot find it and reported UNKNOWN_BROKEN.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/cim-schema/cim-schema.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema.inc b/meta-networking/recipes-support/cim-schema/cim-schema.inc
index b9171e474e..6cd13bcdac 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema.inc
+++ b/meta-networking/recipes-support/cim-schema/cim-schema.inc
@@ -6,4 +6,7 @@ details for integration with other management models. The schema\
 provides the actual model descriptions."
 
 HOMEPAGE = "http://www.dmtf.org/"
+
+# dmtf.org links each schema release only as cim_schema_vNNNN, which the check cannot map to PV
+UPSTREAM_VERSION_UNKNOWN = "1"
 SECTION = "libs"
