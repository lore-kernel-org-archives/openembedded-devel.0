Received: from [204.187.63.106] (helo=mail.evertz.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rlott@evertz.com>) id 1LpnAY-0005Fn-SY
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 19:31:15 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 3 Apr 2009 13:22:30 -0400
Message-ID: <069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
In-Reply-To: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [STABLE] Where is the python-zopeinterface recipe?
Thread-Index: Acm0fhcg3oIN9umlRpeqHnrsJobVRAAAjSZg
From: "Rodney Lott" <rlott@evertz.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 204.187.63.106
X-SA-Exim-Mail-From: rlott@evertz.com
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Fri, 03 Apr 2009 17:33:58 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yeah, that's where the zope-interfaces recipe is.  I am looking for the =
python-zopeinterface.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org]On Behalf Of
Frans Meulenbroeks
Sent: Friday, April 03, 2009 12:56 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [STABLE] Where is the python-zopeinterface recipe?


$ cd recipes; find | grep zope
/zope/zope-interfaces_3.3.0.bb
...

It used to be part of the zope recipe.

2009/4/3 Rodney Lott <rlott@evertz.com>:
> Hello.
>
> I am currently using the origins/stable/2009 branch and was trying to =
add the python-twisted recipe to my image and I got the following =
dependency issues:
>
> OE Build Configuration:
> BB_VERSION =A0 =A0 =A0 =A0=3D "1.8.13"
> METADATA_BRANCH =A0 =3D "stable/2009"
> METADATA_REVISION =3D "e93bd21c7a03b0e78a3097a8f924308841970429"
> TARGET_ARCH =A0 =A0 =A0 =3D "i486"
> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux"
> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "x86"
> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "minimal"
> DISTRO_VERSION =A0 =A0=3D ".dev-snapshot-20090403"
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: =
'['/home/rlott/openembedded.git/recipes/python/python-twisted_8.2.0.bb']'=
 RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity =
'python-zopeinterface' but it wasn't found in any PACKAGE or RPROVIDES =
variables
> NOTE: Runtime target 'python-zopeinterface' is unbuildable, =
removing...
> Missing or unbuildable dependency chain was: ['python-zopeinterface']
> NOTE: Runtime target 'python-twisted' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python-twisted', =
'python-zopeinterface']
> ERROR: Required build target 'cp2210e-image' has no buildable =
providers.
> Missing or unbuildable dependency chain was: ['cp2210e-image', =
'python-twisted', 'python-zopeinterface']
>
> In the python-twisted_8.2.0.bb recipe, it references the =
python-zopeinterface recipe as a dependency. =A0I couldn't find such a =
recipe in the recipes/python subdirectory of the git branch. =A0So, is =
this recipe merely a bookmark or is it going to be available, pending =
approval?
>
> Regards.
>
> Rodney
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


