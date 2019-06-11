Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 85D567E651
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f9so13819960wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+bNkW4ypkV0AFYJH1IR54qAorWg6XXxE6y/M292P4nA=;
	b=nerO9egO+2HU+NBVDQi5yzEIlwmvGinHiyeVIfB4QKL27xM4M6X2fhJ+WxvNYwPKFg
	hMDlalJDdn9oH0jMlsOjojA8qGTvLyYxOLpBQi9k4gq9XUQ8TTh0RfYfv729XKT0jsJX
	YrOEaTbPTzJyiEJdTm+lvhKijn7i0W+6mbtd288C5ampH/HAi2dkQt4cvKqFV+eUOe79
	cExCdTm+Vm5YKF/ydSV0Lpvp3Dg0iRwD5n/+UnfaNZcVA1f6jJCU7KkHSHwFy8WdS0fZ
	AWEWrGOJexkpBrcNfqgPOuYvQCtcJ/RJgcJTjm9boovgs5HgCmD33UDx7j+f1SNK9EWf
	pK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+bNkW4ypkV0AFYJH1IR54qAorWg6XXxE6y/M292P4nA=;
	b=S0W8i1f73PsMmSI/QL1HyvAhO87+OM8rNgmBXiujcIBGerdOuBnuO+PGHphvr+A4nq
	2zPSE6t9Zp7BHZT/qqmy6Glw7Hff1R2yO39rJV7YnqWkcgmdkjDumSdOA2UW/yb6cnUP
	0B9fT/tqw649WAu1VdUYJFLr7UyolRz+82PhKBRGbNGgSGHuoiEuvp9lxnl78yMoKK9p
	gmZccue6pyOhZntjdCsuMm/+nEXFcyzRMLqu2nvmwDo/oDwttMjYg1CiM6weMLQvLqKf
	0vhcLuxqXEi0KpJgBWbkSq588Hb7y3umAiX9iQk8PadKoaelxohke0lVI6bhZtOPx9YP
	Nhsg==
X-Gm-Message-State: APjAAAXDng4E2+o4nqv9p1hCebcEkyrplFeelY/EEtf3HHM72Q+ONkur
	0OQgvnXK0igwJaNX9DdrxLUZGM84
X-Google-Smtp-Source: APXvYqydZ34oAx/TxSVnaf7M5t/mnOk19HYUzsslMzyz/EJbl3SGSg6uo60UFTWlEtVNrUn5fUHuZg==
X-Received: by 2002:a5d:52cc:: with SMTP id r12mr11522512wrv.132.1560272107922;
	Tue, 11 Jun 2019 09:55:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f10sm23635911wrg.24.2019.06.11.09.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:54:54 +0000
Message-Id: <20190611165504.23049-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH 01/11] gtkwave: add distro_features_check
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:08 -0000

* fixes:
ERROR: Nothing PROVIDES 'gtk+' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'gtk+']

and

ERROR: Nothing PROVIDES 'tk' (but /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
tk was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gtkwave', 'tk']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
index 60df6f773b..b9aae0f6c8 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
 DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
 RDEPENDS_${PN} = "tk-lib"
 
+# depends on gtk+ which has this restriction
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
 EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
 
 FILES_${PN} = "${bindir} ${datadir}"
-- 
2.17.1


