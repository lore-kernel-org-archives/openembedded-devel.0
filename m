Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5706B78AD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 09:20:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i139-v6so1499671wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Sl4LOLfjksRwLW+TroT0X43WGTlWWOh8Dx6qY5Nb3Jw=;
	b=C9Fnv6OoMj/Qad8n4Hvm8981gYmFdkXr1zsmozbqu6fvLJYhDydc5kV9aWr5W1EBAL
	nEph8YCv4tbPo2mnt0rIqzYaksVj2853Q3aZe+cSDy0zsMHiS7DHm2ttZko/B44W2it0
	hQ8LbYc8MV4oilTuI2nWUF0mbBGlyy95nylChuocdQ7eyy/NdlV9uk8gO91+5WaLf7jj
	/WvgDQBPTGS/6QNiEQP8Z/DZNK/5Z7itvYJrvhS5C/JtHZmoaXi8JNO4Nxf6cmEvNPV4
	/KxnraStqN1fQYvkeBNwqtaNKnOk0QCtQJbKxqpovTScA7BXNSpF88+RmBOihjednBGY
	Z25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Sl4LOLfjksRwLW+TroT0X43WGTlWWOh8Dx6qY5Nb3Jw=;
	b=OmLs3cIMAAzDQuWYDktUC38wrdpvstprkfz5fhB1k7zWccnrUz1H/9f1j5W68oEqS4
	lcK/EQfxO7wsemlL18YVt8cM0FTb++Q5lgaEfNLu1vGtZC/oUXrrkWFU8k3dRgqQu0Pr
	dNjUjACi1ORGZuWc+3VZ5b0Vdf9OSQpfhis+KaqCRt7jRb3r/7FQ673LB9Fga+7sSdw4
	QTZSNXFtMnD5ELM0Fm/0M1PO5Tc9Uhf2fd9epKokFPYcc6mjpLsh25vddev9+h5c3F79
	7EVsvwI6ezcz7RQ0UjVzC+qX/4Ms1EHHODx+PY3UshgbM1ae04h2EdnDPxw3wJCRdGRu
	4iBQ==
X-Gm-Message-State: APt69E1Me7Tx72XqTxogHRWiwjkwBfCFyNa+T0mnJnoL2Op8Z02mhGxI
	Sf/V/RFahyCzjcwyiE0epMdQBcjD
X-Google-Smtp-Source: AAOMgpdXeGc0LkdAnbcnv6PjeC7wQodBLh62KC4V4LSWqEW6HPxrvR3IlNDTqh1KVBBYB/SEfCgeoA==
X-Received: by 2002:a1c:d543:: with SMTP id
	m64-v6mr9700379wmg.12.1530609625685; 
	Tue, 03 Jul 2018 02:20:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm1041872wmd.38.2018.07.03.02.20.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 02:20:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jul 2018 10:20:17 +0100
Message-Id: <20180703092018.5018-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703092018.5018-1-ross.burton@intel.com>
References: <20180703092018.5018-1-ross.burton@intel.com>
Subject: [PATCH 3/4] php: actually enable openssl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 09:20:25 -0000

The PHP recipe depends on OpenSSL but support is disabled unless you pass
--with-openssl.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index f262d60d15..258b20e68c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -57,7 +57,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
                 ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
-                ${COMMON_EXTRA_OECONF} \
+                ${COMMON_EXTRA_OECONF} --with-openssl \
 "
 
 CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
-- 
2.11.0


