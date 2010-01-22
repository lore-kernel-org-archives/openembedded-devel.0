Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1NYQJh-0007dq-On
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 21:41:20 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Fri, 22 Jan 2010 15:37:17 -0500
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jan 2010 15:37:16 -0500
Thread-Topic: Difficulties building java
Thread-Index: Acqbor/NGqla6ki6QEO4T6qxI4Ua7g==
Message-ID: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Difficulties building java
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
X-List-Received-Date: Fri, 22 Jan 2010 20:41:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to build java under OE and I am having some difficulties. I hav=
e used the wiki page to get me as far as I am, but I am stuck.

I have an x86 64-bit build machine, using the Angstrom distro, my target is=
 generic i686.

From the wiki, I am have the following in my conf/machine file:

-----
PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
PREFFERED_VERSION_cacao-initial =3D "0.98"

PREFERRED_PROVIDER_virtual/java-native =3D "cacao-native"
PREFFERED_VERSION_cacao-native =3D "0.99.3"

#PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
# I switched to openjdk because I encountered errors with ecj-bootstrap
#
PREFFERED_VERSION_libecj-bootstrap =3D "3.4"
PREFERRED_PROVIDER_virtual/javac-native =3D "openjdk-javac-native"

PREFERRED_PROVIDER_classpath =3D "classpath"
PREFFERED_VERSION_classpath-initial =3D "0.93"
PREFFERED_VERSION_classpath-native =3D "0.97.2"

PREFERRED_PROVIDER_swt3.4-gtk =3D "swt3.4-gtk"

PREFFERED_VERSION_cacao=3D "0.99.4"
PREFFERED_VERSION_classpath=3D "0.98"
-----

The error I am stuck at currently is:

ERROR: Build of /home/oe/openembedded/recipes/classpath/classpath_0.98.bb d=
o_configure failed

From the log.do_configure file:

checking if ecj -warn:-deprecation,serial,unusedImport works... yes
checking if java works... configure: error: The Java compiler ecj -warn:-de=
precation,serial,unusedIm
port failed (see config.log, check the CLASSPATH?)
FATAL: oe_runconf failed

Any suggestions would be greatly appreciated.

Mark



