Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B89672FE3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:06:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so22258147wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eKlewiEmyo3BGXctqFnchQuCMdIAJU1/MNUQEVAN8UE=;
	b=DwOXJltgvIeIgHqyjvb6/0sK9xUJl9/ghRgT8XJq70wrLm57LmPa+AruHtYuI2zPas
	ZZQlVUr4BbrBdylEtXocPGV/TnK+AiYXp1LtaaLqUO9j5jjJJEYmyLcILAjHO4oyZ0Mv
	fZ0GfMpSzZ2GvToD3B8immRfxPaszA2XCGiVFtsJAJUROr9gLmz5aDvHh4SE0kgoztbm
	Wpz/6WCz3cHP410d8q+qM5BiKd+hyE/U/BI9f7L51XlKdXAjnoNonecT6lvj5ptEn+hG
	JKFIm3mgvMoYRKL0aPF5CAxJv+3CTQ9oFl8l7XfCprpxdD1+WpkYMQ2L7fua888Hg9m3
	B5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eKlewiEmyo3BGXctqFnchQuCMdIAJU1/MNUQEVAN8UE=;
	b=Aasrnds/tj0wGMVLD4aaIR/IdJuF1qqX8Vkc2y4Wwdb51909KPOTvzg7vyxVrkRNxx
	MZ2p8dYuVNFN6GK6ong9WDbJPSnD6JSwZOYxp2b/uoIZhhRlRx/OqwcraknrqHWVijfj
	6GBCaHT1RFar4r5vwL7kC+bE1DcZvCRPwipBjlZd8WcXHvP1lPaFdYH7wtgCi0kWaJCp
	gd701cUoI5UO3/cmO8/+QyCF9UnpQCspDtzvL5jFoSCxDsPQ/QGUv6Hcoz3UwKxUizp/
	Tl5D9FLm5F+hhTc48bn4D3mPXn3dvYhDVhwVgzxjRqh66ucM6sRrvs6MJZbW8AP1fLT9
	ZTBQ==
X-Gm-Message-State: AMke39ltToXwqINi2LY1s4F0r9sMKLwYA+YS7IMFUHKfZF75r2gWL8Yr4vV/vvUZ/9JDlA==
X-Received: by 10.28.199.206 with SMTP id x197mr26313077wmf.5.1487718381638;
	Tue, 21 Feb 2017 15:06:21 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1201E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a120:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	d29sm19284499wmi.19.2017.02.21.15.06.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 15:06:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 00:05:37 +0100
Message-Id: <20170221230538.21902-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170221230538.21902-1-schnitzeltony@googlemail.com>
References: <20170221230538.21902-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libsdl2-mixer: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 23:06:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
index 3080d59..8276b44 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e5
 
 S = "${WORKDIR}/SDL2_mixer-${PV}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
@@ -25,5 +25,3 @@ do_configure_prepend () {
         rm -f acinclude/$i
     done
 }
-
-PNBLACKLIST[libsdl2-mixer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130659/"
-- 
2.9.3


