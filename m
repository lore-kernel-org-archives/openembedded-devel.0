Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 717727FC7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:49:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j12so8595143plt.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dC4TYWx6M8/nxdRa1gbZh+ccoyYZ88PItguXxTLlVSA=;
	b=UkqC51g3121UUp/3hgx8AZZU9zAyv6k5e8IrTii5aTiHbDO2PB3xc79m3iZ5LIOaOm
	QbTAbQFdiuO+o+RIbXRLCgGfbe+W67tJ4UDDi64nWB9ugyjinEQ36qqJRAPPr7yF5SMc
	jpjaFmGmgeZA4gdpXT5N0z3kypiz0kAHP3QCoFx6T8iC4KpDm2T9posU3ab8tZLtBkNt
	ilKXKx2bwIRmMGF8k8kqRyTzsIgr65GyBr5Q9GGADMA/YPHKEXLw8B6UNwybdTKAm6IM
	v4WPvWM/mmc9eVwUW6x91TIPNI2Qv9ZV8LNSGFnWb5MMO00prUwM5N1WOmtt5LcquRIz
	4Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dC4TYWx6M8/nxdRa1gbZh+ccoyYZ88PItguXxTLlVSA=;
	b=c37TCe+/vzkQo5Dd1aBiCc6aBOZeGXVJ9/Pm4a9Q5fubc2X4J/mLinmHVsq37Rut1g
	kpbtK4yplFj6EKKbCqAot8PuKJ07zQLUejw7R6fSrMj/nfhUnihmuyXFftH1NwtGjh5k
	0wWxp1G1Fqo0Dbwa3QRnz5y1pgVsVdLQ15ujSmT1oGwtL/Q+a+LpY+iF/RW3YWcO+gys
	kiA+jtsTRDo2esiMFo9bzHbQCknMu+aQ90PcVxC6Yi+Yj+NuQn5RlKkq7WnCsvVW2tIm
	Vb737ebxVNdp0WCGhDhsX8aoSfS9bxNSh5fYNzEnCWQXFNUr8TayT/hLebiiqqljXYb5
	Xzew==
X-Gm-Message-State: APjAAAXvQzHe7F4HzDOE7jOzdF5OVPpSaKAnJv51hul4rizLN3V9rUkj
	mH7q5AMSmN8YFczaaNWFu/acvlFxFhU=
X-Google-Smtp-Source: APXvYqyxB6QuCFR5u0TWr4EZd/SOZLdidnZZc4ewHtqqM44N/OdWXEcNuCaEWX2FzpTAFE4w6rkItA==
X-Received: by 2002:a17:90a:d352:: with SMTP id
	i18mr1127296pjx.42.1574797751040; 
	Tue, 26 Nov 2019 11:49:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	b17sm13971474pfr.17.2019.11.26.11.49.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 11:49:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:48:57 -0800
Message-Id: <20191126194858.2002923-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126194858.2002923-1-raj.khem@gmail.com>
References: <20191126194858.2002923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] pidgin: Use python3
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
X-List-Received-Date: Tue, 26 Nov 2019 19:49:10 -0000
Content-Transfer-Encoding: 8bit

Fixes python-sipe build failures e.g.
../../../pidgin-sipe-1.25.0/src/purple/purple-dbus.h:33:10: fatal error: dbus-server.h: No such file or directory
| #include "dbus-server.h"
|          ^~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
index b094ba25e4..b4944258fa 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "python virtual/libintl intltool-native libxml2 gconf glib-2.0-native"
+DEPENDS = "python3 virtual/libintl intltool-native libxml2 gconf glib-2.0-native"
 
-inherit autotools gettext pkgconfig gconf perlnative
+inherit autotools gettext pkgconfig gconf perlnative python3native
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
-- 
2.24.0


