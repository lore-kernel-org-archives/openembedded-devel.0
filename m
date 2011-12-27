Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <moosab@ti.com>) id 1RfXCc-0005rm-4W
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 14:36:26 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBRDP2nY024313
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 07:25:02 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBRDP2Sn021810
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 07:25:02 -0600 (CST)
Received: from DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 27 Dec 2011 07:25:02 -0600
From: "Baransi, Moosa" <moosab@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: rt-tests recipe
Thread-Index: AczEmu8d5U/tMIyJRWqUGS4g4vhXPg==
Date: Tue, 27 Dec 2011 13:25:01 +0000
Message-ID: <308727D9E105A34D845E688AECAF6F470A718A9A@DLEE74.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.103.61]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: rt-tests recipe
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
X-List-Received-Date: Tue, 27 Dec 2011 13:36:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am using the arago-devel with branch "next".

When building the rt-tests recipe, I get an error that the package cannot b=
e found.
Searching the web shows that the git was move from git.kernel.org to github=
. I changed the recipe (rt-tests_git.bb) accordingly:


-SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/tglx/rt-tests;p=
rotocol=3Dgit"

+SRC_URI =3D "git://github.com/clrkwllms/rt-tests.git;protocol=3Dgit"

When doing so, the package is found and the recipe compiles OK.

Are you aware of such an issue?

Thanks,
Moosa

