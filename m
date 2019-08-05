Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.210])
	by mail.openembedded.org (Postfix) with ESMTP id D31C97F34A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 08:45:09 +0000 (UTC)
Received: from [67.219.251.53] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-c.us-west-2.aws.symcld.net id BE/F0-16224-69CE74D5;
	Mon, 05 Aug 2019 08:45:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsXi5LtOQHfaG/d
	YgwtTeSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owNi/+wFNzmrvi77hdjA+MSri5GLg4hgZWM
	EisOfWCCcDYwSkxe8wbI4eRgE9CT+PZlFjOILSKgL7F09h4wW1jAQ+Lz692MIDaLgIrEpL1PW
	EBsXgFriYYjLWC9EgLyEp07doPFOQUCJQ5u/Q9WLyQQIDHh215WiHpBiZMzIXqZgeqbt85mhr
	AlJA6+eAFkcwDVq0g8f2ILMVJB4tr7xewTGPlnIemehaR7FpLuBYzMqxjNk4oy0zNKchMzc3Q
	NDQx0DQ2NdA2NzXQtzfUSq3ST9UqLdctTi0t0jfQSy4v1iitzk3NS9PJSSzYxAoM0paAjcQfj
	uVlv9A4xSnIwKYny/l/tGivEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrfjtXuskGBRanpqRVpmD
	jBiYNISHDxKIry6wKgR4i0uSMwtzkyHSJ1i1OV42tG2hFmIJS8/L1VKnDcTZIYASFFGaR7cCF
	j0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsQZApPZl4J3KZXQEcwAR2x/acryBEliQg
	pqQYmVoO5Lsb7TvO3ZoQnJD0R2nbi0/+PtzLZk14d/RO8cr6MzzXHio2rW54sYt1gtrRQtXDn
	Ra9dW3aVxj/74Kz4a3vQ2w9CMirHy3wUZyZpmDsIL9vr4L++Y4GLTVU4h+CVxKvTF3xY5O6cz
	eMrU8+v9+F9veq9eYUe6udunn+l/eTjSqY5toWntWf0L7jsEKd/TMnJ92LW1nSWXlPuZ88mHz
	ZXyH88b93fCdyNPAeLjt75sodB0s1YoLc7/OQsKQ91E0tDbY4Lvmv4HdKi/8+5puz/M/XY0cU
	p1ZaOKQ3MBZdXnLwazMbyyEigbev/69orbNc7LBXaX/loRozk3UN5yq18F+RYhYWCDDZ7Sucr
	sRRnJBpqMRcVJwIAzpnPc1kDAAA=
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-13.tower-365.messagelabs.com!1564994708!254029!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18269 invoked from network); 5 Aug 2019 08:45:10 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-13.tower-365.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 5 Aug 2019 08:45:10 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 03:45:08 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Mon, 5 Aug 2019 10:45:06 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Aug 2019 10:45:01 +0200
Message-ID: <20190805084501.5531-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <CAMKF1srxWyPH_m7FxCCVTCMiszFymwfbcEukMxSJxu3RGkVqHg@mail.gmail.com>
References: <CAMKF1srxWyPH_m7FxCCVTCMiszFymwfbcEukMxSJxu3RGkVqHg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [meta-oe][PATCH v2] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Mon, 05 Aug 2019 08:45:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit c6e963f9e ("lvm2: Add RDEPEND on lvm2 to lvm2-udevrules") added
a package dependency due to lvm2-udevrules needs dmsetup, however
dmsetup was moved to libdevmapper in commit 269d009a81d4 ("lvm2:
libdevicemapper package needs udev rules and dmsetup"), so this
dependency should be only for libdevmapper instead of the full package.

With the current implementation, a package that has a dependency with
lvm2-udev rules will include also many unnecessary packages like lvm2,
lvm2-scripts, etc. and their dependencies.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index e2ce95c81..4ae0a62ab 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -48,11 +48,11 @@ FILES_${PN}-scripts = " \
     ${sbindir}/lvmdump \
 "
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
-RDEPENDS_${PN}-udevrules = "${PN}"
+RDEPENDS_${PN}-udevrules = "libdevmapper"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
-- 
2.22.0


