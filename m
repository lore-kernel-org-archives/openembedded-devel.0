Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NU3ZV-0002Ho-2x
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 20:35:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id A1F681422AC1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 20:35:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAh9NXWVdEcF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 20:35:22 +0100 (CET)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 635C41422AAE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 20:35:22 +0100 (CET)
Date: Sun, 10 Jan 2010 20:33:25 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hid4ng$12q$1@ger.gmane.org> (from k.kooi@student.utwente.nl on
	Sun Jan 10 19:02:25 2010)
X-Mailer: Balsa 2.4.2
Message-Id: <1263152005.2342.0@zaurus>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] disable static libraries in Angstrom
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
X-List-Received-Date: Sun, 10 Jan 2010 19:35:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jan 10, 2010 19:02:25 Koen Kooi wrote:
> On 10-01-10 18:10, Stanislav Brabec wrote:
> > Attached patch disables build of major part of static libraries in
> the
> > Angstrom distribution.
>=20
> NAK

> Static libs are packaged in seperate packages, so they only 'waste'
> space on the feed server.

OK, in this case, patch 1/2 can exist standalone and people can set
their local.conf as they want. Comment can be changed appropriately.
Even the part in bitbake.conf may be removed (yes+yes is the default)
and configuration may be completely moved to the local.conf.sample.

The primary goal of this patch is a decreasing of feed size and
compilation time, which is useful especially for custom builds.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



