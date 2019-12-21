Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id DCB257FC75
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:59 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id d5so4794197pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3HIMtOf2BBUwcae2JtSuVUP5C5VeVc5nVHuHcN83Mc0=;
	b=q1xWTX1EYsixmdII+zQRJX/wgRMerynzv6xgPjXJh5dTti+sv3RlZjG84x+e9riIx5
	BmE52NtlU3wW2io5byYmjzScgX3AH7iiQwsJ47/yVlQtzgb29i8mIbffliHQ34HK6v54
	8SNQIz8Hn17mjl69KbghvCYxBEFpJt057/tZ5KojmQLCMb+zPy2gPbwK/J1j3O7GjaU/
	z/4YWwqluvGkYv1QVjuPZa+J34vC0lYNoBmVmS0NNisvNQov0JqTE+Tvw7OQrtjm4ciL
	wQBMZKCFDePLQpnURoLKRVRuJSwUYXAEYximebCQ6ugOhiJEWmkpCSHOII2kMEMHN8im
	2ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3HIMtOf2BBUwcae2JtSuVUP5C5VeVc5nVHuHcN83Mc0=;
	b=K2YjrMPdi+Xhh5/jLbh03h9ZpvElE/30tRZSvFiVBm38FX2gF7y2CsOV5LH7kYtjlI
	fqZE0DNFxkxihulb1THjNWHlE4UD8TZFh7MZ145SJojawXKOalJX+TYJHnrtycvM7P4B
	p2m0wrrlqIUlH0m9JAQ6vY9hJPdgk8HXLBbmaZPA9txlztCyMZHP0KgBAV33hHkaBd7D
	MLZ5+KwTflvP/pebcDCQr2qa0Kysa7ZxoE1CT1Sh6p2eg23k3iNIApZO4jKRUI6hcGbF
	EPjNRCsYH33uwRlQ5Bv2DF1wqH+h05Lxfd2UyuahCC9v1dS/NoaYIhgmsWJA43hG2F/h
	VjoA==
X-Gm-Message-State: APjAAAW74a92dTDe0o2y2GJ0lQbZ4Bny5iXuzPoDDndeRwcVryYHJuZ8
	Vo9rXI26/+FhCepD3XC7iBCS39TCjU4=
X-Google-Smtp-Source: APXvYqw76J2dX3xBYAmyW7qiOOx7QvBli6gOQ0r/UMlYbTCaNPHNbioe8CWSPX9qP8HdHrr+L+4Ryw==
X-Received: by 2002:a17:90a:d986:: with SMTP id
	d6mr19299891pjv.78.1576886820555; 
	Fri, 20 Dec 2019 16:07:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:29 -0800
Message-Id: <20191221000635.1573390-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 17/23] iwd: Package module conf files via nonarch_libdir
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
X-List-Received-Date: Sat, 21 Dec 2019 00:07:00 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: iwd-1.0-r0 do_package: QA Issue: iwd: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/modules-load.d
  /usr/lib/modules-load.d/pkcs8.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
index d11e0d4ae3..cc34ca2215 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
@@ -28,7 +28,7 @@ do_install_append() {
     install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
 }
 
-FILES_${PN} += "${datadir}/dbus-1 ${libdir}/modules-load.d ${systemd_unitdir}/network/"
+FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d ${systemd_unitdir}/network/"
 
 SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
 
-- 
2.24.1


