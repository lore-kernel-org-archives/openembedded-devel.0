Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 754BC7D034
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 13:03:32 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 10so7467875lfr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GAFHOTPJuuBbDl2Dtc1mnMor8dMXvbFhxrG7jwlX8e0=;
	b=yBOL7lzJhoFEULIJeY2kJIuIpiAImMauZwCz3xcTY3FOXAuW043VQXpJ+p/iJHcXAs
	Snx8QYRxLXy60YsdQndpJty8z4htftSI9GXBpt0PgkBoBAzgUd5hvBSJZFj2N8Gc8o7y
	PqsF6qhIFPN9RZxCgN1paAk4Mt2B6WIpF8onOoe2izYgH29uRNd882R7jQFdTRMrl0zg
	v+5Jrjiw8JITIqe4/7obE7FFPtPmk1fDGkaMHKd48VDpF+SjZPI25GjHMkOQ9gJYyz20
	33fv4ewPMc0wUcDtw5S9pyRwzfL+P+LCCFMShSOUmMzg3qfaUYFV/imafAQ9C145edoT
	hmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GAFHOTPJuuBbDl2Dtc1mnMor8dMXvbFhxrG7jwlX8e0=;
	b=fJfpwFV6YWM2Mp76hjiQzdF4JMyP2d9LAqKO+aM/IbzWW0GD52AuFvzsogs+q316Az
	60KxNU1y3u8I7db6L6Nt0LduI7+jdVNZPu65oxEUp56PO5xihfcRDlegfhWZvYMwgRPT
	RAp9GURStMhRsPe8Dt9PaWBR3N1904gf4lHtLA4pbg+esleyb4QMXvzs2UHFZP5YsDfK
	HQdwxSMTVH4vK6m48XgpIzOIXr2SQA/7Ish9n7dMcsdSmbfjA0VPkKNb9xrvd6AcFirF
	OhRUznyMDLrkpd72hoyAh+dEPOurUy4+o5bJU8HsTJkoHbEP7ggD58tbGeHq51+HyjJt
	U9xw==
X-Gm-Message-State: APjAAAX9tBkfFuetfQQp0H+wkTVJq+MUT/6mOVf1nbL3q7E3anhzitBu
	gqfLHdhsyK/9b65xnj2PSOliIbBR3Gs=
X-Google-Smtp-Source: APXvYqy9DgnP/+M3PkTDbozgxqdcgZHe4weAmSbxJfbCEacpOIBWHQQGCYklM6ffp6l50NLRLbOslw==
X-Received: by 2002:ac2:59db:: with SMTP id x27mr6596615lfn.108.1554642212567; 
	Sun, 07 Apr 2019 06:03:32 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	c15sm5574236lfi.14.2019.04.07.06.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 06:03:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 15:03:29 +0200
Message-Id: <20190407130329.30732-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] phytool: update to v2
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
X-List-Received-Date: Sun, 07 Apr 2019 13:03:32 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-support/phytool/phytool.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
index 4ed3ed1e4..29499d6d7 100644
--- a/meta-networking/recipes-support/phytool/phytool.bb
+++ b/meta-networking/recipes-support/phytool/phytool.bb
@@ -2,8 +2,8 @@ SUMMARY = "PHY interface tool for Linux"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-PV = "1.0.1+git${SRCPV}"
-SRCREV = "3149bfdb4f513e2f0da0a7d0bc5d0873578696f2"
+PV = "2+git${SRCPV}"
+SRCREV = "8882328c08ba2efb13c049812098f1d0cb8adf0c"
 SRC_URI = "git://github.com/wkz/phytool.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


