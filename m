Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2D67FCB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:59 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q8so6083326pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a81hi4g6pjGbyhZ/cx6LwGevAF1KTrwekTJiuY2QgHw=;
	b=mlLbqWQD15TROI9knD4JjRXAqG2CT+LpMYgvZehISxXq8HjdyanZ/t/ly6T0TeVXMC
	ht/qFKp5joroy8mMb8R5Jmcul3gi7LPGFpCXpO6Icov3UMK+HTvukH/3EHqcEY6chbIA
	eTSGoznYQRpWtcz1FfnKurmmLanU+kL+b3lwZsabjp1MeQvhc99ujUJC+A/mnRTzI4mx
	v0n5+uGvj/U/A/utjXUQo3s2PYuTpYuujPdWHZ4os4Nd0mWSUFtYLx2ZyOptpPHw1l+P
	5dDXKPWTePkrbcAqcLC6C0ywhn6aLMe5BgjDm4H/Qh38FRcbawgHylYrMG1BWDzQ8P+Y
	l+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a81hi4g6pjGbyhZ/cx6LwGevAF1KTrwekTJiuY2QgHw=;
	b=c3NMYhxp861utoMt2i95gX1IT2796qj+VFcfGCSEWo6IczHFRUU+o+KKlYXpDtkfOK
	qfUDZL0xWciS21finSrc4Ar0HCsurPxR39SxbtDOWWgpExst4OT+v9mDekYQqsDMRYTF
	pd+EiI2mfc6IVr2yfNpUgkqRpzngW2JS3h2/5VLZmVA11p4vKJ82tSqPXymV1PVbpeYH
	Ldv6UWnPO86bcHi0VtU8elSoL4Dd5mz2iFt6NZ4fu9+nduygpTWDAb0SEYo38KqASMbp
	jlqIeL2L9lzKZG05CftI246NR2aW+raGcUifCao6hMrbyV0pHC2UUD0eVkhLToZy6TzB
	l2og==
X-Gm-Message-State: APjAAAXWE1Y1IX+JAjMhHP/nPd985C/K6qbMTkqdAYI2v/POYCZwOun9
	CrHJk2XX/A9rNhvk1PAZOIER1XrOyo8=
X-Google-Smtp-Source: APXvYqxpgdlLuf7RRIATG1amDQWdeuX6yyUAORBbyidp4mvXaA55hRDw5yjBGnuEBBAUwDFDPWI44w==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr17609684pgm.312.1576886819777;
	Fri, 20 Dec 2019 16:06:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:28 -0800
Message-Id: <20191221000635.1573390-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 16/23] firewalld: Package firewalld files
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:59 -0000
Content-Transfer-Encoding: 8bit

ERROR: firewalld-0.7.2-r0 do_package: QA Issue: firewalld: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/firewalld
  /usr/lib/firewalld/zones

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/firewalld/firewalld_0.7.2.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
index 7d80a632d1..97c7bd6420 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
@@ -66,6 +66,7 @@ do_install_append() {
 
 FILES_${PN} += "\
     ${PYTHON_SITEPACKAGES_DIR}/firewall \
+    ${nonarch_libdir}/firewalld \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
     ${datadir}/metainfo \
-- 
2.24.1


