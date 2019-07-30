Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFFBF7F329
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 18:55:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p13so66887833wru.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xv0HZK3PQP0Nn8MFApIpqaVBXsIGINegy255iBCC5aA=;
	b=RCawr3Fmru59EfWiSrlqVIpsyKhR07yfP5lVlTPY+s2wwTHp+/9gndpdRyLElH64kD
	FWPHhp1IJOHngxKNdhqvCtzrNqRAE0MLfQ62DTRvxbmRC+Kfo8dSJ0ZLzMyEAGemqBLx
	adikpqiaPJ0//iTBLE+YIJG/WN6bzRyHydTJXyvIWBXSLrs8m9uw5xY684WTSAZPoh6Q
	cMWGG9+7ENIm/tZ9YfMvpYgiRPrkY6lbVFdeK/MYEt83DseT2v6fkn7CBEEXgYbyB0/G
	QMPjPMaSuzDSOMo81XZSbYfiR4aAusm/0lKpa+mN6+LLHcgQPqx0gC3LUcnES91XvMV/
	P/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xv0HZK3PQP0Nn8MFApIpqaVBXsIGINegy255iBCC5aA=;
	b=dnMAYc5c+uK6l8307m4YDyONFk4PKPtiDqn+GSDH1aT/lCSWnZHVzIFLg9CSzi4FO2
	5LlzsqzxcaJtJLo7hqY5/R+qCAlSVJQWH2vvpM5bqvHf02yBODeQ82ESoZgZSfjsdcRt
	YqZ7sxziT/iZfr2dl31on6KsGY1kcUP/7gAv/biUIi5szj6den6e6YOSC3v/ZFd+Eguj
	c7N4dprDOc4fiPH7LImQoRRWSwAUX/NIIs1DUDj/JKbKz2Hlri/h72vIAzH0rmmVSBko
	dth/bNZowQZS8HB8sWiOzQlA2tg5N2ERcA0ybFEgt3PR19DaZznvkyXJ9Odx10sMDEWb
	15+Q==
X-Gm-Message-State: APjAAAVpEUucDo6wenPXuluATobhlzCnHq8yIjoDqxp7+l+2VZAWBL12
	5u6fdwTxrUT4auiLLFT+2rG8b5ZBJZU=
X-Google-Smtp-Source: APXvYqyxIQSL6yp98ZUwnaLJUk5ugeC3feuIVCM5m2qEUgqU/9nGw4KRdMFB/3/vQoKbuyEbXnhIhQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr58556978wro.190.1564512948069;
	Tue, 30 Jul 2019 11:55:48 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	i12sm78363910wrx.61.2019.07.30.11.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jul 2019 11:55:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2019 18:55:45 +0000
Message-Id: <20190730185545.20310-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libdbi-perl: prevent native libdbi-perl depending on target perl
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
X-List-Received-Date: Tue, 30 Jul 2019 18:55:48 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets="libdbi-perl-native" --analyze
  ...
  ERROR: libdbi-perl-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemuarm
  Hash for dependent task perl-sanity/perl_5.28.2.bb.do_populate_sysroot changed from 00c0f30e40a144255fc3054e9a71ce73170a89832318774bd2a8fc5e8dcd20ad to e22ff8375c4ee6bda646dae8a1d6b1ddeb6d373678fc036fdc406e91a026b497

* it was already merged in:
  http://git.openembedded.org/meta-openembedded/commit/?id=d98e62e64219b365063fdb299d35f2af999d8f6e
  and then silently reverted in:
  http://git.openembedded.org/meta-openembedded/commit/?id=784285981b1ce9825575981f2b60e2b286251283
  see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/200676.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
index 77991bd158..91f94a1aa0 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
@@ -27,7 +27,7 @@ do_install_prepend() {
 	rm -rf ${B}/t/z*.t
 }
 
-RDEPENDS_${PN} = " \
+RDEPENDS_${PN}_class-target = " \
     perl-module-carp \
     perl-module-exporter \
     perl-module-exporter-heavy \
-- 
2.17.1


