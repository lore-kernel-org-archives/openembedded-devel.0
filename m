Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 779 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Nov 2019 16:42:24 UTC
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.210])
	by mail.openembedded.org (Postfix) with ESMTP id F26BD7FC06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:42:24 +0000 (UTC)
Received: from [67.219.251.53] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-c.us-west-2.aws.symcld.net id A0/A9-12330-664AEDD5;
	Wed, 27 Nov 2019 16:29:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsXi5LtOQDdtyb1
	Yg85pbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP0cXsBXu5KnYuyWpgnMPZxcjJISSwilFi
	w/14CHsjo0TTW2UQm01AT+Lbl1nMILaIgL7E0tl7wGxhASeJjpWtYDaLgKrE1JYONhCbV8BG4
	ve6c0A2B4eEgLzEnLcaEGFBiZMzn7CA2MxA4eats5khbAmJgy9eMIOUCwmoSDx/YgsSlhBQkL
	j2fjH7BEbeWUi6ZyHpnoWkewEj8ypGi6SizPSMktzEzBxdQwMDXUNDI11DY3Mg20IvsUo3Wa+
	0WLc8tbhE10gvsbxYr7gyNzknRS8vtWQTIzDcUgo6c3Yw7vn6Vu8QoyQHk5Ior5/XvVghvqT8
	lMqMxOKM+KLSnNTiQ4wyHBxKEry1C4FygkWp6akVaZk5wNCHSUtw8CiJ8AYtAkrzFhck5hZnp
	kOkTjHqcjztaFvCLMSSl5+XKiXOexCkSACkKKM0D24ELA4vMcpKCfMyMjAwCPEUpBblZpagyr
	9iFOdgVBLmrQWZwpOZVwK36RXQEUxAR+zrAzuiJBEhJdXA1LJ36eWF6ifvFAjO2S5tzVS7/Fd
	bsKPnojaHYn/zug1b7BsLat2zJv9o4n7BPNvU7MXZooylUyZM+C/AENAjYrk6VPr6Uq0JIgq9
	ee98zRY+2tj4Z927ZXwRT1l8VnnNvVWze0bvIZVox5V8kvc6X+bzR791nX7qdtnmrRbPOWvyK
	1R+PpXjWrPjtfFOg0kBHgd9J00PCzp/3fR3nJH5XjkPu5Nadr/ORf6S3Vn50oPNXWGh7IzKzt
	M+zxsvJ5RfZPw85f7UiRI9c1uvqHTLuU7mWaa51elv3maLd8XCS6ZcSvAI+5nHYb1kM++Ggnk
	XX+XqyUttvVJ66pvLt61q9/evXrHm4V3rA+I70t7k3FViKc5INNRiLipOBADEPUG5PgMAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-11.tower-365.messagelabs.com!1574872165!362212!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29296 invoked from network); 27 Nov 2019 16:29:26 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-11.tower-365.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 27 Nov 2019 16:29:26 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 27 Nov 2019 10:29:24 -0600
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Wed, 27 Nov 2019 17:29:21 +0100
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Nov 2019 17:29:13 +0100
Message-ID: <20191127162913.30498-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [thud][PATCH] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Wed, 27 Nov 2019 16:42:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit c6e963f ("lvm2: Add RDEPEND on lvm2 to lvm2-udevrules") added
a package dependency due to lvm2-udevrules needs dmsetup, however
dmsetup was moved to libdevmapper in commit 269d009 ("lvm2:
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
@@ -50,7 +50,7 @@ FILES_${PN}-scripts = " \
 # Specified explicitly for the udev rules, just in case that it does not get picked
 # up automatically:
 FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
-RDEPENDS_${PN}-udevrules = "${PN}"
+RDEPENDS_${PN}-udevrules = "libdevmapper"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
-- 
2.24.0


