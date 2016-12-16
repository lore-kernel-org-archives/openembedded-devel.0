Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA59A60938
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 03:59:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so3739540pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nBmepktUUKxl7wWN9K5uhkBjQcPmdca0q4UIzOOWmLY=;
	b=ILcARKwkVsxEwcZPX2lHD6pWGQWUmnEn7M9vStKMwrs+G81anXJw2hbm0sX0pv89XH
	YZNXe4t1c9IpqGpKcxNgbXWfjGaKxivURztOIXoVAZQzQ8ZJwHUIFPrepB1HnrZjiosp
	qfz4edPsmhawZObq6ek8dvUwEBB1TLYoPyYhvsQXP13vKdnRfGwUPh/OCkV5m0kOywK7
	eAktqzqBKQoEMwSDWs5hls193d/FRokatLLH7gf8zIDFyMhVoab16xpkt9ZopYjXKC2q
	enqTE3Y912sfevASItonjjcvGidH7JBFL4rQrGCOOnew972FA+t+o2lLaqvqjk7u0Kle
	ph/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nBmepktUUKxl7wWN9K5uhkBjQcPmdca0q4UIzOOWmLY=;
	b=Rqg9RGJb4d9QGKmNMEKY46+Nsit6oCekndBU4whn3r0F3t8T+xz/o0GiDa5dSJj8wk
	pI9c99jw8PsT94BQI+xJqtMDRxY+ysAFYeryUyHxN0acVsRqBBmXWEDibqmlZJd1zaBN
	KAFf0WlQ9fDJLJKG/qV2K3KTSncDrkJ5sWCT7FHz7BK4ArWezwIhC5VaMoWNalmUyPQ0
	+lLu63/kgHkPaj8aqYVeT/ke9+acW0D6zpHwNcU4EfdaIzPMOtFFMnlYgvXnK0jqNW+I
	mXDTFC2zWb9xnOrOyY5sGMuqOt4MK4h5X+Mw8A2Et537NK0K6t4PY7EDIpoxhvpWc9gC
	wG4Q==
X-Gm-Message-State: AKaTC03XjqPD68JTbsH/lQWr/gDMy+zxzE/Ejrx0dUmlZbihTyguyUMNA1ulMgfX8jFlFw==
X-Received: by 10.84.209.143 with SMTP id y15mr2237896plh.96.1481860798149;
	Thu, 15 Dec 2016 19:59:58 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z9sm7629146pfd.29.2016.12.15.19.59.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 19:59:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 19:59:46 -0800
Message-Id: <20161216035947.18909-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161216035947.18909-1-raj.khem@gmail.com>
References: <20161216035947.18909-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] usrsctp: Add recipe
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
X-List-Received-Date: Fri, 16 Dec 2016 03:59:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/usrsctp/usrsctp_git.bb       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
new file mode 100644
index 0000000..291eaa9
--- /dev/null
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "This is a userland SCTP stack supporting FreeBSD, Linux, Mac OS X and Windows."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ffcf846341f3856d79a483eafa18e2a5"
+
+SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master"
+SRCREV = "dbfc1b8c4cf1a46a4d8987ba542d5ff06bdaf14c"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS += "openssl"
+
+CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
+LDFLAGS += "-lssl -lcrypto"
+
+PACKAGECONFIG ?= "disablewarnings"
+PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
+
+EXTRA_OECONF += "--disable-inet \
+                 --disable-inet6 \
+                 --disable-shared \
+                 --disable-debug \
+               "
-- 
2.10.2


