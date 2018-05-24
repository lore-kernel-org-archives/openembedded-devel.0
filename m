Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 49D2F74C0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:28 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 70-v6so3656654ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Cjf6x62e2xpL95h4FPv3eHfJfD4obORt/TQPVtOG9kE=;
	b=bchcXL0WPIgKfoO0qUkv1v2h0MxF0YiO40TjIwYKjD0a/f7TO7ynQkXAkMfWdsUCSJ
	7oAhqFFl8oWOUTveMKTtn2UsIFgT+mBKeYzDVB8CYXGeZZD2cZXpSPmwwXzWv6Xe+OLT
	2OpZcfSCtvEL9EWkUGtuC4e2fWrkLBWS5+CIyZpbs9DHkuviCL0jblGXbiRNn3Smp9Ws
	nJ5TpwdstJ2qEXWQL9N5P8ehHGjG9U8WPfP1KXGEAG3zbWkyGxC0sf+nzbNEjJlX+esk
	+galRui/o/WvqScyTHUWj8M6WoZYYCh3O37ijdSK9ZISq5slbZBKvpUBgZ2AuiWnddVA
	idOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Cjf6x62e2xpL95h4FPv3eHfJfD4obORt/TQPVtOG9kE=;
	b=HIKjmvsLwlgyOz0fwIXHxSQDeLomp8ou7uFwJ1swwzNBaVfOAVJqXnRDkM6AdClDVq
	kj0SZNwqinKBpf8Nd1oUurAXObfwMc6dS+zVomKmafQpp9ZITrvCerV5HyqybJ5ATiCO
	UPsi8Yt+3caynT2pD2zAi9XZaPrDXQhaLYP0DK6KwVNlw/on/sSAiTLJUU2IN/0y5NlK
	WNmumnWTrGAmRD156hEXmjiRiP+z2vngoIUtHmrU8jRoCw4n3Ctmq9xTWT3Ur4GUkE66
	jmc1PiTG6NEkAa+M8Ob8vq99Utu5i1jzRJ1HTfZ3kSXwxxSPOKqVUYahi/5Gi1Bo+smX
	3qoA==
X-Gm-Message-State: ALKqPwdzn9nCMC7yq2GL3wTTA8j5F4A2+imqN1hykZEun3/f/ThVJXhE
	jyDl4iP2DQLZgZIG23zgVrux/i09
X-Google-Smtp-Source: AB8JxZpcv15NMMwXIUjpODmD7CdnyA0oqEwm80Yf7a8R3GYHcKB0lWhGfUKeS5/xvdhiIdlV5dMhqw==
X-Received: by 2002:a24:94c9:: with SMTP id
	j192-v6mr10390758ite.153.1527186449795; 
	Thu, 24 May 2018 11:27:29 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:59 -0400
Message-Id: <20180524182659.19986-12-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 11/11] openobex: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:29 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index dcc2edf76e..3fb8cb1901 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -2,29 +2,26 @@ DESCRIPTION = "The Openobex project is an open source implementation of the \
 Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
-DEPENDS = "virtual/libusb0"
-DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
-
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
+DEPENDS = "virtual/libusb0"
+DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
 "
-
 SRC_URI[md5sum] = "f6e0b6cb7dcfd731460a7e9a91429a3a"
 SRC_URI[sha256sum] = "158860aaea52f0fce0c8e4b64550daaae06df2689e05834697b7e8c7d73dd4fc"
 
-inherit cmake pkgconfig
-
 S = "${WORKDIR}/${BP}-Source"
 
+inherit cmake pkgconfig
+
 EXTRA_OECONF = " -DCMAKE_SKIP_RPATH=ON "
 EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
 
-#--enable-apps --enable-syslog
-
 ASNEEDED = ""
 
 do_install_append () {
-- 
2.17.0.582.gccdcbd54c


