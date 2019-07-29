Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.214])
	by mail.openembedded.org (Postfix) with ESMTP id EB6DE7EED3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:12:50 +0000 (UTC)
Received: from [67.219.250.197] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.us-west-2.aws.symcld.net id 9F/D1-12929-47C9E3D5;
	Mon, 29 Jul 2019 07:12:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsXi5LtOQLd4jl2
	swdJmA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP3scWsBf+5K5Yu6mZpYDzB1cXIxSEksIpR
	4uXHt6wQzkZGidvzF7N1MXJysAnoSXz7MosZxBYR0JdYOnsPmC0s4CJx5uFiMJtFQFXi/8WLT
	CA2r4C1xIq7J8BsCQF5ic4du1kg4oISJ2c+AbOZgeLNW2czQ9gSEgdfvACyOYAWq0g8f2IL0a
	ogce39YvYJjLyzkHTPQtI9C0n3AkbmVYwWSUWZ6RkluYmZObqGBga6hoZGuobGxkC2iV5ilW6
	SXmmxbnlqcYmukV5iebFecWVuck6KXl5qySZGYNilFLRm7GCcNOuN3iFGSQ4mJVHezf9tYoX4
	kvJTKjMSizPii0pzUosPMcpwcChJ8CrNsosVEixKTU+tSMvMAcYATFqCg0dJhFdsNlCat7ggM
	bc4Mx0idYrRlePN2iWLmDnegsm120Fk2727QLIdRAqx5OXnpUqJ884FmS0A0pxRmgc3Gha/lx
	hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8y4BmcKTmVcCd8EroOOYgI7bww92XEkiQkqqgcn
	0ffXT0wI6P5JCIo014xm4ZHxzz+l81rVs/pLw+8OdqqnFO1/mL07uUk89Kd02x/Pq8sWXCyRu
	FH6cOLkw+HzOnfRDv3NimuPfrnv/UM45YG+e9YG+zpoChbSFbvctppqYippGenyfpl68ZUPhg
	UX79EuduLY0qDG5inNmp+yxbfqi0Drlvq1osxhbUPS1rb5pjx83yM95yN7SHTh1N9+OLdOu7O
	mR5pjrdVztlcm2r09zVGWYf8lOWX9re4L8qRJVpgkZbCv1j+s8UOv/H/jJuPG97dEnkl87LKf
	zS6pMePlPKr26yuL4NxZmsVWngt0yl/efFnFWSzjF+p75U3lJkOu0lwvd5CPULgWtVWIpzkg0
	1GIuKk4EACDIYl1aAwAA
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-13.tower-345.messagelabs.com!1564384370!2630!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6144 invoked from network); 29 Jul 2019 07:12:51 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-13.tower-345.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 29 Jul 2019 07:12:51 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 29 Jul 2019 02:12:50 -0500
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.468.0; Mon, 29 Jul 2019 09:12:47 +0200
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jul 2019 09:12:42 +0200
Message-ID: <20190729071242.4110-1-arturo.buzarra@digi.com>
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
X-List-Received-Date: Mon, 29 Jul 2019 07:12:51 -0000
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


