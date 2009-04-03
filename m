Received: from [204.187.63.106] (helo=mail.evertz.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rlott@evertz.com>) id 1Lpkvd-0000uZ-7m
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 17:03:36 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 3 Apr 2009 11:00:59 -0400
Message-ID: <069B6B31F6201B4389D7EEB9AD827BCA05006047@otis.burlington.evertz.tv>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [STABLE] Where is the python-zopeinterface recipe?
Thread-Index: Acm0bP89mI9OmCq6TP+6+/u/+ejz9w==
From: "Rodney Lott" <rlott@evertz.com>
To: "OE-Development Mailing List \(E-mail\)"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 204.187.63.106
X-SA-Exim-Mail-From: rlott@evertz.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Fri, 03 Apr 2009 15:03:36 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

I am currently using the origins/stable/2009 branch and was trying to =
add the python-twisted recipe to my image and I got the following =
dependency issues:

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "stable/2009"
METADATA_REVISION =3D "e93bd21c7a03b0e78a3097a8f924308841970429"
TARGET_ARCH       =3D "i486"
TARGET_OS         =3D "linux"
MACHINE           =3D "x86"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D ".dev-snapshot-20090403"

NOTE: Resolving any missing task queue dependencies
ERROR: =
'['/home/rlott/openembedded.git/recipes/python/python-twisted_8.2.0.bb']'=
 RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity =
'python-zopeinterface' but it wasn't found in any PACKAGE or RPROVIDES =
variables
NOTE: Runtime target 'python-zopeinterface' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-zopeinterface']
NOTE: Runtime target 'python-twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted', =
'python-zopeinterface']
ERROR: Required build target 'cp2210e-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['cp2210e-image', =
'python-twisted', 'python-zopeinterface']

In the python-twisted_8.2.0.bb recipe, it references the =
python-zopeinterface recipe as a dependency.  I couldn't find such a =
recipe in the recipes/python subdirectory of the git branch.  So, is =
this recipe merely a bookmark or is it going to be available, pending =
approval?

Regards.

Rodney

