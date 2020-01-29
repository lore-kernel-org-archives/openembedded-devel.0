Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by mail.openembedded.org (Postfix) with ESMTP id BE70560558
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:21:07 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id q84so3463710oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHMidpCKduyEuK+dnl0RDj+kPD4CjApINOlmgODk2Dw=;
	b=paSuedyU2raEYF2cv4lsbxp3Pn5S9I1fD+IegxgyzUhf25zvddxmp0zBrzo07woSnA
	YtUwEzTDmu0xa0yu5YOt8M6WN3+U0IqnsxbGXbjj+kZKfwpzY1MEGD4i8iwmeLygMLV5
	T4Pcfh6QNEC/zvmO4XB9DBtwHGa+BtnYOfL5e/TWv10kOF7l/oL5sJgL5uGLznPMHKDs
	n65ZZWA+WxXYdVh9mfNzWRSuboDD5JyFvov0th+0ALJ65KTHF2feIx2ar7IdXMlk8SfP
	pNY9MWTzGylZXUfRrOw3Ou5B4FUeA/kuPmWSprqfgTuyx57dCfTfL3zvlCtOFl9QyR5q
	4q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fHMidpCKduyEuK+dnl0RDj+kPD4CjApINOlmgODk2Dw=;
	b=fC2N4HAgySEGn6+hTyO0wHiNkL/HiY2NoIEZyxihvxgHFLnbIdbuupwGWr41EJ4/hL
	ccDTMYVdU2127qJ1rxaR7vxWUYSowKEAjZAtuC8jmwgEnGruP7yfCVHzCYawXJ/03rLC
	e9B1OBaLwHFb8pnBaX92yrQBWkT400zLmpmoNm4Pe80CN9vJCjPas6aTCYpBN1Z0iaUD
	JpqxVIm0TFMPyiDJG1qLtUYWa5R28pbpV0tqiQ+pMDNCvo1RXhFMMK0B/FDXKR5MDdqF
	iBCDV81+N52gpdELZmYif/SkVUXMWz/NGqhsPpRcryZp1JJsGbv2usl1PES9szBMm2lt
	OMwg==
X-Gm-Message-State: APjAAAWUMVrkuLW9KGUUGxOVea5ZdJf1Gw6zD50ypFXybxPFcpCLDXsR
	mDQfSRm3rnp73VbHy4fltA8lF4vLas8=
X-Google-Smtp-Source: APXvYqxsueRDn1NYsRiGIHD4h4v9yPcFx37Gxl6vB/nBZuOS2RXjlX7R5rIgvF6oIrs9mPOBT2v6hw==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
	b2mr9101034pju.137.1580281982380; 
	Tue, 28 Jan 2020 23:13:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	g9sm1305019pfm.150.2020.01.28.23.13.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 23:13:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 23:13:02 -0800
Message-Id: <20200129071303.3328743-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129071303.3328743-1-raj.khem@gmail.com>
References: <20200129071303.3328743-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] recipes: Inherit missing texinfo for makeinfo program
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
X-List-Received-Date: Thu, 30 Jan 2020 13:22:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb         | 2 +-
 meta-oe/recipes-extended/indent/indent_2.2.12.bb    | 3 +--
 meta-oe/recipes-extended/nana/nana_2.5.bb           | 2 +-
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb | 2 +-
 meta-oe/recipes-support/gpm/gpm_git.bb              | 2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb      | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
index 57e364e1ca..9d373fc989 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "flex-native readline ncurses"
 
-inherit autotools
+inherit autotools texinfo
 
 SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
            file://0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch \
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index f8d63d43ce..0a866574bd 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -9,7 +9,6 @@ Install the indent package if you are developing applications in C and \
 you want a program to format your code."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "virtual/gettext"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
@@ -19,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 CFLAGS_class-native += " -Wno-error=unused-value"
 
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-extended/nana/nana_2.5.bb
index 595852a9f6..4235006984 100644
--- a/meta-oe/recipes-extended/nana/nana_2.5.bb
+++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
@@ -15,7 +15,7 @@ LICENSE = "BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=16aa57f3b7fdda870cee597275bd5d11"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig texinfo
 
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
index a31ad0d676..118e3c50c8 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -11,6 +11,6 @@ SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "ea165d618640dbdecb42ae4491337965"
 SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
 
-inherit autotools
+inherit autotools texinfo
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 7034d33858..3800d147f9 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/telmich/gpm;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd texinfo
 
 INITSCRIPT_NAME = "gpm"
 INITSCRIPT_PARAMS = "defaults"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
index 0903e90d7d..986984d1ff 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig lib_package
+inherit autotools pkgconfig lib_package texinfo
 
 # TLS support requires either openssl or gnutls (if both are enabled openssl will be used).
 PACKAGECONFIG ?= "gnutls"
-- 
2.25.0


