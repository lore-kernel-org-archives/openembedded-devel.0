Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8201.1795739697717175911
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bPulAn3z;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c71feeeaso3977510eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739697; x=1796344497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTM1hBnFnkTkGW5w2NgiA8/bm/19UxItVLLVL7g4Vjk=;
        b=bPulAn3zr2QI8xWYvDbp1RFjrxLefotDzYGq+oBloJz1jswGPNeSplurxHpcMwUeGh
         eiR8YKpgISRkdk4hEirKVOnfMdfLKFwIDBt3zdJ/xCLZyusyFsL2YiglatilMGAh9tiW
         F+RJkpfapegTszd58n0TKf9SYPs7Hfh4prOZY8KjhRsXU5IjZCqSeBRFfExyLHy2rmZk
         1Z6mDFphglcKDw79HVWTjjJGgOw4OTSBNpiHT0Jt9UftOZLLonVQDftrqZS2lrKN3xx1
         wv26MSdTBc94waV8032jWyQVDl3PgcjmA4J+JPoPFl+hgUsspJNQA8BavpMzxR+i+ZFo
         PZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739697; x=1796344497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTM1hBnFnkTkGW5w2NgiA8/bm/19UxItVLLVL7g4Vjk=;
        b=kftSCWlfeLsIOLQvLYBKbXJCaGbZRXUIaoS8MyypadcZ1JBxSCffxDfWUMA62fKSLR
         TqyDHkEVT67VdKyHdPMbwoffJRiarZiLkhf0ylKgHv62rljYyB/ZNLn3XxMW+E/EcrSw
         DVxj7oc423jMLmLFfkJU5Yut2Z4eEBOSsiE74PilKzyMvbqrMrGeUA0pVXazwy1bFHDl
         wGeHAXTxw80FZB6UdD78Z7Q/1bnyaS5YJ80MRvCw6AMQh9eKYGhg/clTnI4666WGyaPG
         mESXk2VPJTkb9UKaY7hcAMFfPBc5g7I6Q5pJPrfSZd2NJJIWgDapHvZiMKla13FFmsnb
         QvSg==
X-Gm-Message-State: APuU4Z+onwtSHFw0B5zH9wQYrHzaFGdF+d44W00b4geLF4kO7vGRlI1t
	IpeXQI6jlXDIEVI4HYq0CFd3hNxwq7qkFcJc2KS+lVHysvgMWaazikF0mNvJD1fL
X-Gm-Gg: AZFdTZeXWKM367UbcGTFoe8tvnYIDTWxjuGnJt0K/C/Cp1ZYSbqsrRqofuFqj56sIml
	5ieII6W9GRY7OEtKXU8Narw75BklgVWuQBH/VndGhpilvvvidXoZCbI52q9RELLw3NTAYPaVD8I
	v1D/P4xxcCg5voimcoM4uoIPV2XrRscZlebvrWlgnqN812cuW1sArUTR1Dj1YGOm46yNXl9Izr2
	qiYeM8/aZ94kS5g2dkHeo0sEVbzEICRzUPbgFhLgnzbQ1snkl9YMKgDU0rhD4dlfh8YJRrYsSoE
	Ax4MADC06gtzE3HF9uoi/qDv1uhkYLwWb9sstLBAAefWKaS2I0y0jL/9ZmN7bXqAbmurhrBUVVx
	xkfMYIOK5amfDYasBl7TLUK3EhVpx7FW9yWPMujxTfxvEiowgS0KwCVk8n8AB/0g8QxHSjEjjgK
	QlmodbFEp1uR0Z9rCfobQ5QtYVAJSkpEZBf2f9hJvv2HbhEkrxeP3QUpeNSdFqSDToHclEGihef
	3c/fh01kUeWFWoRJM8E5MxEn4xkBCbJC12cSs1qWnaoKCRPVvB3ruB1b2MTQMNazPSTGitz1CSw
	efIuMgB7Gf01C0mpOVGAoMrdmDucQp3YiKcCZ1t4hcU92pUpPD+5ytcnJkwSHYiJ6KvrkFmkB2c
	8LH/bNbPYWnyF6Zz/3vbdyboxhQ+WJ2g1gZaVOkZGfQrGDHNEe6HfN+gkqHGm447cHp/kylp4cE
	t/IdXr4pOzVh4s1kH6jexYn+/1GusBQL7CYTaoM/6jWq0IhmVcyYTYY+THss7UwGuK+7H4fOhqc
	wJ8bQpHnH3xKFv3NetmNvNRLrkvzW4BEDfRPVLf9nSQV+gOpNX8iiZx51D9n4Mr9rbPuabJSoNc
	l1YG
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr22535568eec.4.1795739697049;
        Thu, 26 Nov 2026 16:34:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/69] atkmm: Restrict upstream check to the 2.28 series
Date: Thu, 26 Nov 2026 16:33:42 -0800
Message-ID: <20261127003425.2166632-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133126
Content-Type: text/plain; charset="utf-8"

The directory scan reported 2.36.4 from the atkmm-2.36 API series,
which is packaged separately as atkmm-2.36. Check only the release
directory of the current series.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
index 38d0317549..b9c91b6ce7 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.5.bb
@@ -14,6 +14,9 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "ae449192a582a2582a95e0602b15d792bbd639e836339b81ef916aa87540ac5c"
 
+# 2.36+ (atkmm-2.36 API) is packaged as atkmm-2.36
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/"
+
 EXTRA_OEMESON = "-Dbuild-documentation=false"
 
 FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
