Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1C1F6E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 15:46:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2015 08:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,641,1422950400"; d="scan'208";a="715041542"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2015 08:46:33 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.204]) with mapi id
	14.03.0224.002; Fri, 24 Apr 2015 16:46:32 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend:
	update according to bluez4
Thread-Index: AQHQfqWCP/BT0DGe4UqxpKieVPrVYZ1cTikw
Date: Fri, 24 Apr 2015 15:46:32 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B57E0@irsmsx105.ger.corp.intel.com>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Apr 2015 15:46:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In V3, proper layer.conf for meta-systemd with meta-oe added detection.

-----Original Message-----
From: Iorga, Cristian=20
Sent: Friday, April 24, 2015 6:44 PM
To: openembedded-devel@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: updat=
e according to bluez4

bluez4 recipe has been updated with proper systemd support, so update meta-=
systemd append accordingly.
Also update to the right directory structure.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5 -=
----
 1 file changed, 5 deletions(-)
 rename meta-systemd/{oe-core =3D> meta-oe}/recipes-connectivity/bluez/blue=
z4_4.101.bbappend (51%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.b=
bappend b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbap=
pend
similarity index 51%
rename from meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bb=
append
rename to meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbap=
pend
index da01b05..260c02e 100644
--- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbapp
+++ end
@@ -1,9 +1,4 @@
-inherit systemd
-
-EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
-
 RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
--
2.1.0


