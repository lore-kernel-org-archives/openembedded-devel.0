Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD7E60761
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 17:41:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 10so977089ual.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=cuJuDkwcOTVhUJ7QnOWbhk0pdA9XpeSZQYzL1VhOZ2c=;
	b=qgOD+1iMkfugW10t/ws32YWdzqes6nXPoE/2LKdeYcx2mu4iJeDv21qjAuGFcMY0C/
	FcifUHVH/Ab/yqRUMJlsaHeuC9q1WdMQt3U3Zaz23kkAxV7UkUQ+YTfQQKozgKcUt/ns
	otdrX9r4zHpRuiGVC5AsdXlpN6ja2dSYAULnxB8qgENOUm070QluoP97PKL8YVdSJAQH
	j43HHZNeKMUsA2ruOkrQ40KaKOW/X8e0E9cWLoXb1kuWW/DNuuuVRpFb7iyjozcBvP9I
	MBm4xw+R5wos+gRjUx9RRMGSTeVZ/cF6VNW53QF0VOpZ0tLJHWP/6jeRik/WzCCRPdNf
	1yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=cuJuDkwcOTVhUJ7QnOWbhk0pdA9XpeSZQYzL1VhOZ2c=;
	b=QHEoKMv/URNMiOum7M/IoEvxcN8f1Ccdve+zqgy8iOBF2/ipMA3dzD9ANfVuM6tkAm
	Rts2PYmmo3di37PCjpSW5G6XoV90GRTdFC5cDrRlgAh5uI3rzEPHUtH76wqdmpq2L+rr
	mnNEqq2m/h9P0xJOu2w9Swwn5RXQKSlzEZ0VbVBySyW1bbG2wnvosQSEvlavlEbQXgv6
	3vUF2D38zp2giQZOV8aT52MB8cbTTNImrDGoyCt4e3jgmUqzthZdqnrPZnHazoawpJPf
	kp7hv0NTCC9DibQYGYu2s+GQGTXuJ+d9XCXh8374QShwV95XbzePcAq0zkCNXoUDRkTr
	ys5A==
X-Gm-Message-State: AA6/9Rk9ya4PREfj0vIFwUR+zARTo6DrIUVXCqX1vanJa2YgiDgu2B0QX5C5adxlvbC8YQ==
X-Received: by 10.159.40.71 with SMTP id c65mr11665716uac.46.1475775669904;
	Thu, 06 Oct 2016 10:41:09 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 76sm865321uad.21.2016.10.06.10.41.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 10:41:08 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2016 14:40:38 -0300
Message-Id: <1475775639-31507-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-multimedia][PATCH 1/2] caps: Add recipe for version 0.9.24
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
X-List-Received-Date: Thu, 06 Oct 2016 17:41:09 -0000

CAPS is a collection of audio plugins comprising basic virtual guitar
amplification and a small range of classic effects, signal processors
and generators of mostly elementary and occasionally exotic nature.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../caps/Avoid-ambiguity-in-div-invocation.patch   | 32 ++++++++++++++++++++++
 .../recipes-multimedia/caps/caps_0.9.24.bb         | 28 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb

diff --git a/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch b/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
new file mode 100644
index 0000000..1a050af
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
@@ -0,0 +1,32 @@
+From 1ea09653692efdd6443fb6770e8523bf6c9e49b9 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 6 Oct 2016 11:54:07 -0300
+Subject: Avoid ambiguity in div invocation
+Organization: O.S. Systems Software LTDA.
+
+Patch from:
+https://anonscm.debian.org/cgit/pkg-multimedia/caps.git/commit/?id=9a99c225fb813ae69f146e3d90f7b47bdbd97708
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ AutoFilter.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/AutoFilter.cc b/AutoFilter.cc
+index fc087d0..bd6b12f 100644
+--- a/AutoFilter.cc
++++ b/AutoFilter.cc
+@@ -69,7 +69,7 @@ AutoFilter::activate()
+ void
+ AutoFilter::cycle (uint frames)
+ {
+-	div_t qr = div (frames, blocksize);
++	div_t qr = div ((int)frames, (int)blocksize);
+ 	int blocks = qr.quot;
+ 	if (qr.rem) ++blocks;
+ 	double over_blocks = 1./blocks;
+-- 
+2.1.4
+
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
new file mode 100644
index 0000000..3e409e6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "The CAPS Audio Plugin Suite - LADSPA plugin suite"
+HOMEPAGE = "http://quitte.de/dsp/caps.html"
+LICENSE = "GPL-3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = " \
+    http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
+    file://Avoid-ambiguity-in-div-invocation.patch \
+"
+
+SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"
+SRC_URI[sha256sum] = "f746feba57af316b159f0169de5d78b4fd1064c2c0c8017cb5856b2f22e83f20"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+EXTRA_OEMAKE = " \
+    CC='${CXX}' \
+    CFLAGS='${CFLAGS} -ffast-math -funroll-loops -fPIC -DPIC' \
+"
+do_compile() {
+    oe_runmake all
+}
+
+do_install() {
+    install -Dm 0644 caps.so ${D}${libdir}/ladspa/caps.so
+}
+
+FILES_${PN} = "${libdir}/ladspa/"
-- 
2.1.4


