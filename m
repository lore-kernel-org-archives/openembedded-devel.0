Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 24E4671A3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 13:02:56 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o68so1818054qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 06:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=suq42rjNRtCl5ARRE1D+NRd+N6Z+icxweja2pd1MF4E=;
	b=gHVCP1QmUEkWeC8Mg0wfMqUOqM/yLKefkzHwKhMf5IjdH6bK27wLbRhnZeflw1ScJq
	sGCOlNustjgTaXS6rTLQ1chbcrNtEWMhKB2RaV1pMdm7gBrUbRVggXb3HZ3QvpmVcTFo
	pxkFDW5z/UaHXlGcwIpCDRF4bwdScVV64wrNZTn3Ia9QEXBrJ2S411QJ9+EGeVx24Dn7
	vyoNW0QiqnjyreKiC83/PoPOswq5AhmzlEcGBy/oGP57lfkQn2fg4V9aoCGJTAsJ0ihQ
	VH4wiLaVTUZvgm274skUX/+TnSAP8Ikyt2ZWFU4SUApEnplBxZ/1c5WSacg9mEazMwz1
	l84A==
X-Gm-Message-State: ABUngvfWlgOPRZm+2UXkjLlOZKM7CrsRvJzF4QDomANw+V+ZGgN8r/n6QLqD4aOtiyZS0Q==
X-Received: by 10.55.33.21 with SMTP id h21mr12764922qkh.217.1477659777608;
	Fri, 28 Oct 2016 06:02:57 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id k44sm6202835qtk.3.2016.10.28.06.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 06:02:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 09:02:45 -0400
Message-Id: <1477659765-26272-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libmicrohttpd: update to version 0.9.52
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
X-List-Received-Date: Fri, 28 Oct 2016 13:02:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libmicrohttpd_0.9.50.bb => libmicrohttpd_0.9.52.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.50.bb => libmicrohttpd_0.9.52.bb} (81%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
similarity index 81%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
index 421b78e..2a006b5 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.52.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "4a3f793d59f663a2b0fc62d44668fb66"
-SRC_URI[sha256sum] = "d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7"
+SRC_URI[md5sum] = "767111e817e2497ff92f943c5653497a"
+SRC_URI[sha256sum] = "54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig gettext
 
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
 
-- 
2.7.4


