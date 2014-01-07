Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 83BA060CF8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:14:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2014 07:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,619,1384329600"; d="scan'208";a="454885699"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2014 07:14:21 -0800
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 7 Jan 2014 15:13:39 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.114]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.215]) with mapi id
	14.03.0123.003; Tue, 7 Jan 2014 15:13:39 +0000
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCHv3] irssi: add 0.8.16-rc1
Thread-Index: AQHPC7mvpgLXN4pKekG9ulaQOxrxG5p5XHFwgAACA0A=
Date: Tue, 7 Jan 2014 15:13:38 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B339847DF@IRSMSX102.ger.corp.intel.com>
References: <1389107004-6822-1-git-send-email-koen@dominion.thruhere.net> 
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCHv3] irssi: add 0.8.16-rc1
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
X-List-Received-Date: Tue, 07 Jan 2014 15:14:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had a chat with Paul about it the other day and we thought recipes-connec=
tivity/ would probably suit the best. =


Thanks,
Krzysztof Sywula

-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net] =

Sent: Tuesday, January 07, 2014 3:03 PM
To: openembedded-devel@lists.openembedded.org
Cc: Sywula, Krzysztof M; Koen Kooi
Subject: [PATCHv3] irssi: add 0.8.16-rc1

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

irssi is a text mode IRC client.

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

* Fixed PV
* Added SSL support

I'm open for suggestions where to put it, meta-networking might not be the =
best place - koen

 .../recipes-protocols/irssi/irssi_0.8.16-rc1.bb      | 20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc=
1.bb

diff --git a/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb b/=
meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
new file mode 100644
index 0000000..bd3ad85
--- /dev/null
+++ b/meta-networking/recipes-protocols/irssi/irssi_0.8.16-rc1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Irssi is ncurses IRC client"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55fdc1113306167d6ea2561404ce02f=
8"
+
+DEPENDS =3D "glib-2.0 ncurses openssl"
+
+REALPV =3D "0.8.16-rc1"
+PV =3D "0.8.15+${REALPV}"
+
+SRC_URI =3D "http://irssi.org/files/irssi-${REALPV}.tar.gz"
+
+SRC_URI[md5sum] =3D "769fec4df8e633c583c411ccd2cd563a"
+SRC_URI[sha256sum] =3D "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8b=
fa7ee3def92de3"
+
+S =3D "${WORKDIR}/irssi-${REALPV}"
+
+inherit autotools
+
+EXTRA_OECONF =3D "--enable-ssl"
+
-- =

1.8.4.2

-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


