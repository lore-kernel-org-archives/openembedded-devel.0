Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 824 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jul 2019 07:12:09 UTC
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.210])
	by mail.openembedded.org (Postfix) with ESMTP id 2D59C6C3B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:12:08 +0000 (UTC)
Received: from [67.219.251.53] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-c.us-west-2.aws.symcld.net id BC/64-21153-2199E3D5;
	Mon, 29 Jul 2019 06:58:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsXi5LtOQFdopl2
	swdIvnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buY4tZC/5zVyxd1M3SwHiCq4uRi0NIYBWj
	xLwni9ghnI2MEm/unWTrYuTkYBPQk/j2ZRYziC0ioC+xdPYeMFtYwEXizMPFYDaLgKrEjoOLm
	UBsXgFriT93jrCA2BIC8hKdO3azQMQFJU7OfAJmMwPFm7fOZoawJSQOvngBZHMALVaReP7EFq
	JVQeLa+8XsExh5ZyHpnoWkexaS7gWMzKsYzZOKMtMzSnITM3N0DQ0MdA0NjXQNjc11zSz1Eqt
	0k/VKi3XLU4tLdI30EsuL9Yorc5NzUvTyUks2MQKDLqWg03UH4/5Zb/QOMUpyMCmJ8m7+bxMr
	xJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3xnS7WCHBotT01Iq0zBxgBMCkJTh4lER4nUDSvMUFi
	bnFmekQqVOMrhxv1i5ZxMzxFkyu3Q4i2+7dBZLtIFKIJS8/L1VKnJdnBlCzAEhzRmke3GhY9F
	5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrBjKFJzOvBO6CV0DHMQEdt4cf7LiSRISUVAO
	TaaTs0VXTTW80dstsauGpl+kwfrOMaZftvs/al6b3xX9dv60q14ZTV/+y1ca5ZzR274pew90+
	kePDzXfzzKbu16pu7qx86Ru7UuDtfDPL6DatI85fTeTS7cvy5C22VNg8vb2OaTuTMOeZPQsE1
	A4Wx/5gs0wSKTYIXxhm1iK7gFtQdj/DyvOnr/7/7HrpR2pjVf7puADb5V05ITzvnr751PIxP6
	TY9Zwp0+o1HFw5Sqfs1/F9/t7h/jTSv7H5lWfCFMYNAtPsH9xe3Wq6+m3NeWet3C1iX+bvi0y
	d8PJbSoFP+jrmOXYC5lcv58y8s2lhY+WHWMutDUebP5XNjM7MetvHoCFffzL02LmXaUVKLMUZ
	iYZazEXFiQAr26pKWQMAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-26.tower-365.messagelabs.com!1564383505!3741!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9798 invoked from network); 29 Jul 2019 06:58:26 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-26.tower-365.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 29 Jul 2019 06:58:26 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 29 Jul 2019 01:58:24 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Mon, 29 Jul 2019 08:58:22 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jul 2019 08:58:16 +0200
Message-ID: <20190729065816.3790-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Mon, 29 Jul 2019 07:12:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit c6e963f9e078b728911afed38d31ed234a384154 ("lvm2: Add RDEPEND
on lvm2 to lvm2-udevrules") added a package dependency due to
lvm2-udevrules needs dmsetup, however dmsetup was moved to libdevmapper
in commit 269d009a81d4 ("lvm2: libdevicemapper package needs udev
rules and dmsetup"), so this dependency should be only for libdevmapper
instead of the full package.

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


