Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C9D7976719
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:10:44 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so66822633pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eeZkBEEy+muvwJMkLgI0FpWJsKXJfcNLQ4/eBs45Du0=;
	b=Gm4RB8TBKiisI2UMBO8jKFz2YVboel6D4UuzZze803iA3dUArYUPNnZG93ByVHbcT6
	7BilxnIFgSdjkwNCu8zNMm1f1h88EvKu78Opr5lZa47y0kIh0HmnHEPpHz3A90Z9omiV
	Atl2nqrkjYzpuQxNS2QyrBqWthxT21Gr0XkoCXJ+jsU8YB9qOh8qwIrHM+XdT9Ez1oPX
	zuczLACUG/dO6u1TGpELXe0EqSDiczQbcVTYkTdNpFD1RpkcPLU5PUR8amlsZfqEydJX
	fmQdsqnl//QR6WNd1jgUw4cD6JnM8kONSiI5/huOx6ghJlyG36RQP/syzdtBXu/DWINA
	PvEA==
X-Gm-Message-State: ALoCoQkAkEjUEqCZ7DLKwJDGeVaQUoim2dBVojbhukPO6ZpKm39BlV7S/CqsRT852RBR79vbo2Xe
X-Received: by 10.68.198.37 with SMTP id iz5mr3478188pbc.129.1439824244637;
	Mon, 17 Aug 2015 08:10:44 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	kp5sm15022374pdb.57.2015.08.17.08.10.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Aug 2015 08:10:44 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2015 20:40:22 +0530
Message-Id: <1439824222-14425-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1439824222-14425-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1439824222-14425-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-networking][PATCH 2/2] lftp: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 15:10:46 -0000

LFTP is a sophisticated file transfer program with command line interface.
It supports FTP, HTTP, FISH, SFTP, HTTPS and FTPS protocols.
Every operation in lftp is reliable, that is any non-fatal error is handled and
the operation is retried automatically. So if downloading breaks, it will be
restarted from the point automatically.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-connectivity/lftp/lftp_4.6.3a.bb       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
new file mode 100644
index 0000000..2d0d4fe
--- /dev/null
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "LFTP is a sophisticated file transfer program with \
+               command line interface. It supports FTP, HTTP, \
+               FISH, SFTP, HTTPS and FTPS protocols"
+HOMEPAGE = "http://lftp.yar.ru/"
+SECTION = "console/network"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "readline"
+
+PR = "r0"
+
+SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "2777dd514d21fe1da764bedd1d0ab36c"
+SRC_URI[sha256sum] = "a8b53e5ca2c1acbecd181c87f21a8673ca9038dc9f2be6ab8c23790bd91fd446"
+
+inherit autotools gettext pkgconfig
+
+EXTRA_OECONF += "--with-modules"
+
+PACKAGECONFIG ??= "libidn openssl zlib gnutls"
+PACKAGECONFIG[libidn] = "--with-libidn, --without-libidn, libidn"
+PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
+PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
+PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
+
+FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
+RDEPENDS_${PN} = "perl bash readline"
-- 
1.8.2.3


