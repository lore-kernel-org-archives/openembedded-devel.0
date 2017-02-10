Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB137731A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:03:31 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 11so4515165qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=fwJNo+pLNkn1FM87b0Ld9PY2V+UZ5LBsUgxDXuDgw3w=;
	b=wqt8aOE2HEa+6GLT16Fys8f39i7/MdB+cZ0FDXOvAH9JR5deP870G+Vy3IIc/W/VP4
	5tbCd4Z5BnWpxgvWdKhzx4xgR+LT9EIMYQlDimMz4xhba4DbOib3/jd6HrpaTuP12Ubj
	Gr42Mwu6W6XLGMjfrGJtMtBEm9hGCa6iDlxh5pVPt1XW6UWMR/wJyUXIpRG3jxyrxMD1
	zQmN9WiXfjb7TvAs7wTew6uC5ax9GZ2MO00C9Iucv7RkfffQ/+ortm8MfrlUEqtqO9N8
	KQxit6xyMFspkmDTlYlkT5EOuPv0PUqT8cH5vJ13QB2+wTsJ6VU0f/TurKpIO7f1+2iI
	AmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=fwJNo+pLNkn1FM87b0Ld9PY2V+UZ5LBsUgxDXuDgw3w=;
	b=A4wg6Mx+IVV1URoMUxK1wXCM4yVq+kHvkQzSQ5SLnfir9npSeUwYKvuuMe4hPoiGtE
	KmcCkTQATGRSEgj0QOdZbwHBa78Dp13rrXayNZ9TalW+IFBcw2Y0RjB12OkmMJjLDOuy
	UnKE9zAgfr0mlpaYwD6i2g0m5tiQbNRx6O40+j33NcY23b9vjZ/m5ucCEHUOhwsDzDcV
	n4vQM5T9D/EXfaLV6xVz2rByfMJpjld/Pe8FDN6OH4C1HH9Eqc6S+MXjDAROTckdhk47
	07wkeaIfbwqh25kHYaydwX1zYrBBUAMK0eeVuCndgUbNDvImSmzHtgyjR7/aHGhxGZl9
	Q5oQ==
X-Gm-Message-State: AMke39l7pRZpw3fRJMR0SpgeY1QDEMKV6wdKeu/PD4egXNoNHtB5fjhPSFwhtd5DZDujog==
X-Received: by 10.55.18.85 with SMTP id c82mr8516145qkh.93.1486724611486;
	Fri, 10 Feb 2017 03:03:31 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 11sm1167331qke.38.2017.02.10.03.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 03:03:30 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2017 09:04:07 -0200
Message-Id: <20170210110409.23890-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v4 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Fri, 10 Feb 2017 11:03:34 -0000

The provided compatibility layer with libevent is still basic,
so we need to drop event.h for now to avoid conflicting with libevent.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libev/libev_4.24.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb

diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
new file mode 100644
index 000000000..5e0f3a5ed
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A full-featured and high-performance event loop that is loosely \
+modelled after libevent."
+HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
+LICENSE = "BSD-2-Clause | GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+
+SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
+SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF += "--with-pic"
+
+do_install_append() {
+    # Avoid conflicting with libevent. The provided compatibility layer is
+    # still basic so drop it for now.
+    rm ${D}${includedir}/event.h
+}
-- 
2.11.0


