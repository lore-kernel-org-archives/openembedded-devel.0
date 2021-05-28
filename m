Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
 by mx.groups.io with SMTP id smtpd.web09.6572.1622198587259588609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 03:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@guy-morand.ch header.s=20191114 header.b=Jet5+ez/;
 spf=pass (domain: guy-morand.ch, ip: 45.157.188.9, mailfrom: guy@guy-morand.ch)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Fs1Vd0jp0zMpp4d;
	Fri, 28 May 2021 12:43:05 +0200 (CEST)
Received: from morandg-desktop.localdomain (unknown [185.72.66.106])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Fs1Vc61fkzlh8T2;
	Fri, 28 May 2021 12:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=guy-morand.ch;
	s=20191114; t=1622198585;
	bh=RZVCuJf/G9caZQMHkJKmBPChdIRPS/qv8ndrtoGUqqM=;
	h=From:To:Cc:Subject:Date:From;
	b=Jet5+ez/dfTHmUVJ9kTxUYWTuIRzdt1fim9/l5Or7og8BJr4ZoSXimIfiq0AT3yMH
	 j0orU+P31OAdCpQxDapD0wNHwqvdh5ohSTVyJXJ8yd3K2Ib5QGdFMV+IZOwlRg3eiR
	 oerI3g1TRqxmcAjIOBv0LnOWc67iQZEmC8aLyfS8=
From: "Guy Morand" <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Cc: Guy Morand <guy@guy-morand.ch>
Subject: [meta-oe][PATCH] qperf: add qperf recipe
Date: Fri, 28 May 2021 12:42:59 +0200
Message-Id: <20210528104259.21756-1-guy@guy-morand.ch>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Guy Morand <guy@guy-morand.ch>
---
 .../recipes-benchmark/qperf/qperf_0.4.11.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb

diff --git a/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb b/meta-oe/re=
cipes-benchmark/qperf/qperf_0.4.11.bb
new file mode 100644
index 000000000..f21af4b80
--- /dev/null
+++ b/meta-oe/recipes-benchmark/qperf/qperf_0.4.11.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Measure socket and RDMA performance"
+DESCRIPTION =3D "qperf measures bandwidth and latency between two nodes.=
"
+HOMEPAGE =3D "https://github.com/linux-rdma/qperf"
+AUTHOR =3D "Johann George"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+inherit autotools-brokensep
+
+SRCREV =3D "c706363815a38ff2c5cbc07b73e2cfaaa59bae0f"
+SRC_URI =3D "git://github.com/linux-rdma/qperf.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+do_configure() {
+  ./cleanup
+  ./autogen.sh
+  oe_runconf
+}
--=20
2.31.1

