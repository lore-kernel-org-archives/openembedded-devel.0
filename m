Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.4])
	by mail.openembedded.org (Postfix) with ESMTP id ADE0D7F2B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 07:02:43 +0000 (UTC)
Received: from [67.219.246.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.us-east-1.aws.symcld.net id A5/1C-10960-410E34D5;
	Fri, 02 Aug 2019 07:02:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsXi5LtOQFf4gXO
	sQe9mbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNL8yT2ggfcFcdO3mdpYFzJ1cXIxSEksIpR
	4uWFY2wQzmpGiaV35jBBOBsYJTpff2XpYuTkYBPQk/j2ZRYziC0ioC+xdPYeMFtYwFvi39XbQ
	DYHB4uAisT1afYgYV4BG4n9t68zgtgSAvISnTt2s0DEBSVOznwCZjMDxZu3zmaGsCUkDr54AT
	ZGCGjM8ye2EK0KEtfeL2afwMg3C0n3LCTds5B0L2BkXsVollSUmZ5RkpuYmaNraGCga2hopAs
	kLSz1Eqt0k/RKi3VTE4tLdA31EsuL9Yorc5NzUvTyUks2MQJDMaWAYe8Oxt2z3ugdYpTkYFIS
	5d1U6RwrxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3x22gnGBRanpqRVpmDjAuYNISHDxKIrzZ9
	4DSvMUFibnFmekQqVOMuhxPO9qWMAux5OXnpUqJ8+qAFAmAFGWU5sGNgMXoJUZZKWFeRgYGBi
	GegtSi3MwSVPlXjOIcjErCvOb3gabwZOaVwG16BXQEE9ARwqxOIEeUJCKkpBqYcidMbI1j9b/
	e4fzn4ylP9Qt/uFwqzqRMl5p+sMT+m06OUnbcLaUDadNeSMf4vbTfu39tpPoF5Yd7nhklviz6
	f3Gef6DHm9Q0Vo6ZyY3vczZd3WO7Me+zdHbLjd8HllmK/3GIiP5n4bp6cZJH1Zq31j/kC0JvN
	bo1vlFbwVLPHl3nsvHNJ+dgbvMXTjLZ32fEyLh7a8zNuNj4c4LW1ALm7eEe2buFFuyZMukTg6
	fsDwG1q7LcFR++3M9tTo70qbq3nd+1ws1w15P9d+qcrFO4133lOLrG4vjc7Yv5At/f5FRzM9G
	+xfdBaEneK5mV137ZHd/6OSJzm2qEfu/+DBmmds5Yl8CnLU46nWJfDskqsRRnJBpqMRcVJwIA
	4nxsX0wDAAA=
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-16.tower-385.messagelabs.com!1564729320!123511!17
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1340 invoked from network); 2 Aug 2019 07:02:42 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-16.tower-385.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 2 Aug 2019 07:02:42 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 2 Aug 2019 02:02:35 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 2 Aug 2019 02:02:36 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Fri, 2 Aug 2019 09:02:32 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 09:02:21 +0200
Message-ID: <20190802070221.15706-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [meta-oe][thud][PATCH] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Fri, 02 Aug 2019 07:02:44 -0000
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
 meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
index 7bd7b09d8..08287e358 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
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


