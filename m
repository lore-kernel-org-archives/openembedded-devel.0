Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB2D77A19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p189so15046304pfp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uPRH0PjlDlc2pH7wGaMNRy0eaq6FwOLeV/BJnKihDaM=;
	b=b1iLkwdiwMheBxUGszQ7aKQTZXmJSjSdMh5w+Sg0EVn1y+CMDTJnAL1cyF97Aq18zI
	Ud7oq2LhSEHnwd2HaWGfBaS2yhfRC+MdzVWaVuwVFjEcDz1k3HjeTnj6YeJE2Rx/8TkM
	CeYQQBgGDCmgHihtm1gOi4mW7HiS8oBZX/Y0dQzJdiTqgzDVc5GCmZXN1j1Jp0NXospf
	opj1Bu5JlbXssyzbei1sFKF/z36Wiz3l+FDBuvChVRTEwgR0fSZeU/wZP0R6T7ldkrRY
	A7TOP214jtHfyNz0lQl2UbPkfctdZk+3oJtfACSpt/uXkKHOO7qUYSevOF0zYkg+vrf2
	GC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uPRH0PjlDlc2pH7wGaMNRy0eaq6FwOLeV/BJnKihDaM=;
	b=Guw77K0JRDx+cpVKfFC0KvZvyWD0o1JKTTWX0JQxdQW/8HvJ7jWvzwTV2liBTtxdzR
	nVDVZL6B/c3uB71IsI0d3Y67bX/9N3QSIDlWPM+l3saRqAOfihFJMKTbY46ihZvYs/+f
	CkndSo1dQ5Bt6dyuBHS7iDvPO/Zo5S8ZwWXcPpIA2e1AiO/KyXLz5myw6DJTlF1pk3iF
	w769jAluXcaFFtVY5iJ75pjG6IOjYEax+7stSC+10n2tev3KbtR500Y6ypEKLc9CCzn1
	IONafZcmnKo2ss8i+NVhGWybcM7nrhpVAH7x1wD9x4Vw9gRhrb3NmdVZKuNGFJWS1Z0q
	5bHQ==
X-Gm-Message-State: AFeK/H3qW2yOT+0ZKIKzhtJ194jKhf+nDwpVr3D5sd4F0I8d9vEpL+6i6koHGVhaTWvhsw==
X-Received: by 10.84.232.200 with SMTP id x8mr14906558plm.74.1490077967657;
	Mon, 20 Mar 2017 23:32:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:27 -0700
Message-Id: <20170321063227.11565-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 8/8] lftp: Upgrade to 4.7.7
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:46 -0000

Delete charset.alias if generated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/lftp/{lftp_4.7.5.bb => lftp_4.7.7.bb}    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.5.bb => lftp_4.7.7.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
index 8f88f9b10..b6b65da73 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
-SRC_URI[md5sum] = "868d621838d471ba681ca6004c1f9305"
-SRC_URI[sha256sum] = "90f3cbc827534c3b3a391a2dd8b39cc981ac4991fa24b6f90e2008ccc0a5207d"
+SRC_URI[md5sum] = "3701e7675baa5619c92622eb141c8301"
+SRC_URI[sha256sum] = "fe441f20a9a317cfb99a8b8e628ba0457df472b6d93964d17374d5b5ebdf9280"
 
 inherit autotools gettext pkgconfig
 
@@ -26,5 +26,9 @@ PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
 PACKAGECONFIG[readline] = "--with-readline=${STAGING_INCDIR}/.. --with-readline-inc=${STAGING_INCDIR} --with-readline-lib=-lreadline, --with-readline=no, readline"
 PACKAGECONFIG[expat] = "--with-expat=${STAGING_INCDIR}/.. --with-expat-inc=${STAGING_INCDIR} --with-expat-lib=-lexpat, , expat"
 
+do_install_append() {
+	rm -rf ${D}${libdir}/charset.alias
+}
+
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
 RDEPENDS_${PN} = "perl bash readline"
-- 
2.12.0


