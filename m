Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F46C60214
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:33:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so10386593wru.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 05:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ziUrtga06EoH6vaDozBh8GAgRptRROZX4xG2lxfDW4o=;
	b=gHiyf0FpeYdq0OaUgCjUG8KNv2xdYyp91d9KqsbDerPFa6RT0sOevnjP4yuci/AZlB
	f1HO2yCRAxp+T9dzk+pmDTeGwhV7MYSHMtt/mjpegVVg8hIFaf4xBZsDCO0lF0SpxnPr
	r9ee674v/tKTJtJcH7cJ86zVP3veJhNOSIFCuOw6lmrdoR/wR22TZhfd8lIGLSxLJat6
	jN7QeZCqAkKo4102K4+XOVDzlWLkGCWF87/QG2RNk+MvTjReq2lt3NK1MQxUi+dHcRfq
	ycseau0z1j7OeLInsq/MjGTBG0VcDBVgSoK5QqsK4YpEVOBxu/+1vbo4YLHAwHqMRSSq
	pG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ziUrtga06EoH6vaDozBh8GAgRptRROZX4xG2lxfDW4o=;
	b=uWPY5uLPmYIaBRrY/O0KMfBONFfH6otN5FVD6FPxn0gXshhQ81h8trs/gHviqd7ivW
	bCPalnmhb+66T4M740+11t7Tvz1eGXjlxqTqKiWH74s0Nqu/MGMjbT27R8RZxSS34RzK
	kihOhJuSvJsmZTCCT8dh9GII0bzXWTL3h8f8Hq5dktRoJt5Bae7XPctIM2nYxYMfVmKf
	kJly8jpaxg+r3FbrSPwE+fSzzuRZz6T84oo3geov3VfWX1hzZN9A9aJ+MwGC03rWoR0i
	S8Zu9kG8k8KwLbASv7pZIfojy+JFENS0MkoVGRtOfbt71c/zXizo1Edm0VVxgWR94vFP
	NvPw==
X-Gm-Message-State: APjAAAUzwv5LErURTHazXOLPZv98JshFFUQ6EJC5k6E2nkfdfFY7RB9x
	282ycuf7AY42TFheI4fp7YlVdw3D+A4=
X-Google-Smtp-Source: APXvYqzhaQuv2xKagor0RINI89eMU1XSNGBOHVb1xvs6h/+y+cOhjYxbdI696cv0gSe+sJWEXrclig==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr63825100wrm.278.1582551233520;
	Mon, 24 Feb 2020 05:33:53 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0C8C561445DB707649E5F9.dip0.t-ipconnect.de.
	[2003:f0:7f0c:8c56:1445:db70:7649:e5f9])
	by smtp.gmail.com with ESMTPSA id
	q12sm3308572wrg.71.2020.02.24.05.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 05:33:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 14:33:42 +0100
Message-Id: <20200224133344.15280-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] fluidsynth: upgrade 2.1.0 -> 2.1.1
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
X-List-Received-Date: Mon, 24 Feb 2020 13:33:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcement:

* a regression introduced in 2.1.0 caused the jack audio driver to not correct a sample-rate mismatch (#607)
* pkg-config is now being to used to find readline (#606, thanks to @ffontaine)
* fix various typos in the documentation (#600, thanks to @luzpaz)
* fix a memory leak in the file renderer
* fix leaking memory when sequencer clients were not explicitly unregistered (#610)
* fix a heap-based use-after-free in jack driver (#613)
* fix the linker possibly not finding libinstpatch (#617, thanks to @realnc)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 9ce65064d..4fb622c46 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "37c9ae2bf431a764032f023b3b2c0c0b86b7c272"
+SRCREV = "3b851da6f721fcf15ec0b935eba72707bdb53d7b"
 S = "${WORKDIR}/git"
-PV = "2.1.0"
+PV = "2.1.1"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.0


