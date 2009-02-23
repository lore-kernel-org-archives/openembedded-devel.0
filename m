Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mlauer@vanille-media.de>) id 1LbfIl-0007cc-AC
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 19:13:11 +0100
Received: from [192.168.1.105] (e180177239.adsl.alicedsl.de [85.180.177.239])
	by drlauer-research.com (Postfix) with ESMTP id 2E4FF5849E7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2009 19:34:14 +0100 (CET)
From: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
Organization: Vanille-Media
Date: Mon, 23 Feb 2009 19:10:16 +0100
Message-Id: <1235412616.27962.20.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: mickey/sane-updates-and-defaults
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
X-List-Received-Date: Mon, 23 Feb 2009 18:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I tried to build the minimal distro again after quite a while. I noticed
we have a bunch of inconsistent default versions in our metadata, which
we should fix asap. To layout one of several examples: hal 0.5.11 is the
default which depends on a libvolumeid version which has
DEFAULT_PREFERENCE =3D -1.

=C3=85ngstr=C3=B6m users will probably not notice this, since they overri=
de a
large bunch of settings, however I think it's very important to get our
default set of versions right as well.

To check our current state wrt. upstream sources I also removed my
source dir and disabled all mirrors -- which resulted in a bunch of
changed SRC_URIs and udpated versions as well.

Since this touches some core files, I'd like you to take a look before I
push.

Cheers,

--=20
:M:



