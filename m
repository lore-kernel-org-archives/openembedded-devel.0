Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LnFG4-0004H6-I0
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 17:50:16 +0100
Received: (qmail 24535 invoked by uid 813007); 27 Mar 2009 16:48:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Mar 2009 16:48:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2009 17:48:19 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc8-00241-g65c2449; KDE/4.2.1; x86_64; ;
	)
References: <200903242144.29168.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903242144.29168.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200903271748.24641.marcin@juszkiewicz.com.pl>
Subject: Re: IRC discussion about stable branch - 25.03.2009 12:00 GMT
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
X-List-Received-Date: Fri, 27 Mar 2009 16:50:16 -0000
X-Groupsio-MsgNum: 8766
Content-Type: multipart/signed; boundary="nextPart1382137.AtvUZt3sma";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1382137.AtvUZt3sma
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Hi

Below is summary of our meeting. I know that this is far from being=20
perfect but it should show our thoughts.


Definition: OpenEmbedded stable branch is metadata. What users do with
metadata is their choice. We will work on making it buildable.

=2D----------------------------------------------------------------------

1. Dealing with changes

=46irst version of commit policy defines types of changes, review
process and testing.

Each change require review on mailing list and at least one Ack from
other developer (which can be one of stable maintainers or developers
which use stable branch). Preferred situation is when both developers
do not work for same company.

Types of changes:

a) change touches core system (which is anything in tested images or
   classes/)
b) change touches only machine which you maintain
c) change touches only your distro and and it builds
d) any new stuff which not touch tested stuff

Changes of first type will require 2 Acks and one of them must be
given by one of stable branch maintainers.

Last type changes are new distros, machines, recipes/classes etc.

=46ormat of patches: "git format-patch" ones. If patchset is bigger then
few patches it would be nice to also give address of git repository
which can be pulled to get those changes.

=2D----------------------------------------------------------------------

2. Testing of changes

Each change should be tested before getting accepted in repository. We
will use buildbot software for full (each time from scratch) and
incremental builds. This should give us repeatable builds without any
user assistance.

It is important to note that we will test for building. Testing on
target devices is left for users which can (and should) report bugs if
something is not working. More about reporting bugs later in that
text.

We also will not support whole metadata. There are recipes which are
broken in misc ways and not buildable machines. We will provide list
of supported machines, distributions and images. Those will be tested
for building by buildbots and developers.

Where and how to list what is supported? We got to few options:

=2D variable in supported machine.conf/distro.conf/recipe
=2D SUPPORTED file
=2D website

We also need to support building on some list of host systems:

=2D Debian stable and testing
=2D Ubuntu 8.04 and newer
=2D Fedora
=2D RHEL/Centos

All depends on availability of testers and requirements of users. This=20
list is
not complete - if required new entries can be added.

There was suggestion about creating 'test scripts' which can be used
by users to do builds and automatically report success/failure.
Something like current tinderbox.openembedded.net service do but with
archive and some kind of processing to add results into list of
working systems.

We would need stable source mirror. Currently =C5ngstr=F6m one looks like
best choice - it is driven by our developers and is hosted on
LinuxToGo/OpenEmbedded servers.

=2D----------------------------------------------------------------------

3. Rejecting changes

We will reject changes which will break test builds. If someone will
report break of working system due to recent change we can also
consider reverting change.

=2D----------------------------------------------------------------------

4. Handling bugs and user support

Handling bugs is a big issue. I think that we will use Bugzilla for it
as it good even if not every developer reads it daily.

We should not generate automatic bug reports during builds. What if
someone unplugs our build machine from half of internet? will be
massreport fetching problems?

The important thing is who is user of stable branch. By users we mean
developers which build stable. End users which use results of builds
should report bugs to their distro developers (and it is ok to be
stable branch maintainer and distro developer at same time).

Life of bug can looks like this:
1.  distro developer do build
1.1.  put results in distribution repositories
2.  end user install updates
3.  finds bug
3a. user reports bug in bugzilla
4.  distro developer checks bug
4.1.    do fix
4.1.1.  fix is sent to stable for review
4.2.    can not fix
4.2.1.  bug is sent to stable

Mailinglist - we will use OE-devel as it is primary one. Distros which
use stable branch can use own ones for handling users.

=2D----------------------------------------------------------------------

5. list of stable branch maintainers

We will need at least 2-4 maintainers. During OpenZaurus times we did
most of development is such team so I think that this is total
minimum.

We need to list who maintains which machines/distros/recipes. So if
at91sam9263ek fails for Joe then he will ask me why it did that and
ask for fix.


List of developers which wants to be maintainers for stable branch:

=2D Marcin 'hrw' Juszkiewicz  - own company and Bug Labs Inc.
=2D Philip 'Crofton' Balister
=2D Marco 'mckoan' Cavallini  - Koan Software

=2D----------------------------------------------------------------------

6. Creation of stable branch

Stable branch will be created and published at the end of March 2009.

Branch will also contain last release of BitBake tool.

As branch name we chosen "stable/2009" and we plan to tag it monthly
with "year.month" as tags. Also monthly tarballs of metadata are
planned.

Expected life of branch: 1 year and it has to stay on server later.
No one will stop developers from working on stable/2009 branch when
"stable/2010" will get created. This also can show "stable/2009" with
2012.03 release (some companies require 10 years of lifetime).

Tarball releases: montly with build status attached (which distros,
machines were build tested).

=2D----------------------------------------------------------------------

Thats all - please share your thoughts and ideas. We are open for
developers who wants to maintain own machines, distros, recipes.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1382137.AtvUZt3sma
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknNA1QACgkQeQ6MlGH/2qtl/wCeJV//tn4U1+KQZ2cyBv8DW2Wz
3vkAn2cinfkFs9v+wYKdTTOUqlULxSca
=cqms
-----END PGP SIGNATURE-----

--nextPart1382137.AtvUZt3sma--
