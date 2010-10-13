Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P67xd-0002mI-7J
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 22:30:08 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9DKTZgH026436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 15:29:36 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9DKTZYE026427
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 15:29:35 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9DKTZhQ007041
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 15:29:35 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 13 Oct 2010 15:29:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Oct 2010 15:29:34 -0500
Thread-Topic: Question about OVERRIDES precedence
Thread-Index: ActrFVkZ5nxNjrzxTo+3TgYZMLo0kA==
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Question about OVERRIDES precedence
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Oct 2010 20:30:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

I have been looking into the OVERRIDES setting and it appears to me that th=
e OVERRIDES are being handled in least specific to most specific order.  Me=
aning that if I have an override for a particular machine set that it has a=
 lower priority than the override for a distro.

My OVERRIDES variable is actually set to evaluate:
# OVERRIDES=3Dlocal:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-=
${BUILD_OS}:fail-fast:pn-${PN}:${FEED_ARCH}:${SOC_FAMILY}:libc-glibc${OVERR=
IDE_THUMB}${OVERRIDE_INTERWORK}

Which translates in my build to:
OVERRIDES=3D"local:am37x-evm:angstrom:linux-gnueabi:arm:build-linux:fail-fa=
st:pn-task-arago-toolchain-tisdk-multimedia-host:armv7a:omap3:libc-glibc:th=
umb-interwork"

I would expect that if I set an override for am37x-evm that this MACHINE sp=
ecific override should trump the DISTRO specific override or the SOC_FAMILY=
 override.

Likewise I would expect that the local override would have the highest prec=
edence because I am trying to override something specifically for my local =
copy and that the "thumb-interwork" override would have the lowest preceden=
ce.

Is my expectation incorrect? =20

If so then can we just reverse the list of overrides in the update_data met=
hod of <bitbake>/lib/bb/data.py, around line 500 in my version.  My bitbake=
 is on version 1.10.  In the master this would be in the finalize function =
of the DataSmart class.

Thanks in advance for you input. =20

Sincerely,
Chase Maupin
Software Applications
Catalog DSP Products
e-mail: chase.maupin@ti.com
phone: (281) 274-3285

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/



