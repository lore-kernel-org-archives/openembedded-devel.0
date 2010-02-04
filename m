Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Nd544-0001fQ-SN
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 18:00:28 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Thu, 4 Feb 2010 11:57:36 -0500
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Feb 2010 11:57:36 -0500
Thread-Topic: Still trying to build Java
Thread-Index: AcqluzABpCfMHfejR2m9M83n/ohHNg==
Message-ID: <6C2434209962DC46B88345CA85C334A28596C7FD09@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Still trying to build Java
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
X-List-Received-Date: Thu, 04 Feb 2010 17:00:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello again,

I am still trying to build java and don't seem to be getting anywhere. The =
more
I try, the more confused I get. I think I am not understanding something ab=
out=20
building Java under OE (org.openembedded.dev branch, Angstrom Distro, i686)=
.

I would like to start from the beginning and make sure I am doing this corr=
ectly.

From the OE wiki, I have specified the following preferred providers and ve=
rsions:

	PREFERRED_PROVIDER_virtual/java-initial =3D "jamvm-initial"
	PREFERRED_VERSION_jamvm-initial =3D "1.4.5"
	PREFFERED_VERSION_classpath-initial =3D "0.93"

	PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
	PREFFERED_VERSION_jamvm-native =3D "1.5.3"
	PREFFERED_VERSION_classpath-native =3D "0.98"

	PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
	PREFFERED_VERSION_libecj-bootstrap =3D "3.4"
	PREFERRED_PROVIDER_classpath =3D "classpath"

	PREFERRED_PROVIDER_swt3.4-gtk =3D "swt3.4-gtk"

	PREFFERED_VERSION_jamvm=3D "1.5.2"
	PREFFERED_VERSION_classpath=3D "0.98"

I have been trying to build java by bitbaking "task-java".=20

Is this the best/intended way or is this where I am going wrong?

Thanks again for any assistance.

Mark


