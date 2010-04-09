Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1O0J0y-0003b6-DA
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 20:33:13 +0200
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Fri, 9 Apr 2010 14:29:27 -0400
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Apr 2010 14:24:30 -0400
Thread-Topic: Problem creating 'task-' recipe
Thread-Index: AcrYEp7hyCkFAOnNRd6exbkynewdwQ==
Message-ID: <6C2434209962DC46B88345CA85C334A285DCA3A947@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problem creating 'task-' recipe
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
X-List-Received-Date: Fri, 09 Apr 2010 18:33:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to write a 'task-' recipe to pull together the separate recipes=
 of my application. I then use IMAGE_INSTALL +=3D in my image recipe to pul=
l in the task recipe. I based it on the existing task- recipes.

All the recipes run, but the files to placed in the rootfs don't make it th=
ere.

If I use IMAGE_INSTALL +=3D for the individual recipes in my image recipe, =
the files get placed in the rootfs.

Any ideas on where I might be going wrong?

I am using Angstrom as my distro and the OE stable branch.

------ here is my task-aposd.bb file ----------
DESCRIPTION =3D "Task to assemble Syn-tech Systems' APOSD"
PR =3D "r0"

inherit task

RDEPENDS_${PN} =3D " \
    libsynlib \
    libodbtp \
    adc-router \
    mocana-fips \
    dropbear-mocana \
    logproc \
    nullogin \
    tip \
    aposd-misc \
    "
---- end file -----

Thanks,

Mark Butsch


