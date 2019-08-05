Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.3])
	by mail.openembedded.org (Postfix) with ESMTP id 81A467F32C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 08:24:21 +0000 (UTC)
Received: from [67.219.250.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.us-west-2.aws.symcld.net id 8C/EE-10817-6B7E74D5;
	Mon, 05 Aug 2019 08:24:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsXi5LtOQHfrc/d
	Yg4U3jCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owNi/+wFNzmrvi77hdjA+MSri5GTg4hgVWM
	Equ+e3UxcgHZqxklulr/skM4Gxgl5iz5xARSxSagJ/HtyyxmEFtEQF9i6ew9YLawgJ/E7g1NQ
	DUcHCwCKhK/toiAhHkFrCWW3e4FK5EQkJfo3LGbBSIuKHFy5hMwmxko3rx1NjOELSFx8MULZp
	AxQkBjnj+xhWhVkLj2fjH7BEa+WUi6ZyHpnoWkewEj8ypG86SizPSMktzEzBxdQwMDXUNDI11
	DYyBtoZdYpZuoV1qsW55aXKJrpJdYXqxXXJmbnJOil5dasokRGIopBU1COxgnznqjd4hRkoNJ
	SZT3/2rXWCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvCHP3GOFBItS01Mr0jJzgHEBk5bg4FES4
	d3yFCjNW1yQmFucmQ6ROsWoy/G0o20JsxBLXn5eqpQ4rzHIDAGQoozSPLgRsBi9xCgrJczLyM
	DAIMRTkFqUm1mCKv+KUZyDUUmYtwlkCk9mXgncpldARzABHbH9pyvIESWJCCmpBqbtkpLPA+Z
	8UtecqKff8o/f4umZZR/Eu3rC4jn8xD4/dT66SdL+2LKGW/4z4/9Z2ga+4Vq8XfVSuq2uhZN4
	luO9TQkmLNcKuas8ZQRvqesvbdedk3Jx/z8Gb462x45sjR13uBu6Cn8x/1fKDy+sPqd/RVL/1
	r/U7RLZebNZJhbKcD/89K3q30T91QahaqdbZOpuq2Remu8rvunAJrXPvzbN+OmskC3S9ylwja
	tg+YyfC7xf5qd6Sj1SvXWfT7dtSadJxIPn69e0Fjtfjbu81LFMcPvEkIJvsybcEoqV5lBc9rT
	oXVHJmiduQsfW/JvNcCWY/cIT5+rwPdcFGpYp/r52xUiR68Da3ak+e24d/aDEUpyRaKjFXFSc
	CADYeFZ2TAMAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-4.tower-325.messagelabs.com!1564993460!246099!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16595 invoked from network); 5 Aug 2019 08:24:21 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-4.tower-325.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 5 Aug 2019 08:24:21 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 03:24:20 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 03:24:19 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Mon, 5 Aug 2019 10:24:17 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Aug 2019 10:24:12 +0200
Message-ID: <20190805082412.5380-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [meta-oe][thud][PATCH v2] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Mon, 05 Aug 2019 08:24:21 -0000
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


