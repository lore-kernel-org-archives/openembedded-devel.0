Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QTcna-0003Sd-Jj
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 18:37:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D7B5B1416BB2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2011 18:37:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WaUwpzbxRP0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2011 18:37:19 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id B822A1416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2011 18:37:19 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307038832.4241.79.camel@mattotaupa>
References: <1306933759.5710.2.camel@mattotaupa>
	<1306940182.23523.23.camel@oct.suse.cz>
	<1307038832.4241.79.camel@mattotaupa>
Date: Mon, 06 Jun 2011 18:33:48 +0200
Message-ID: <1307378028.8178.14.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: Re: gammu: task compile fails with `/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format`
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
X-List-Received-Date: Mon, 06 Jun 2011 16:37:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul Menzel wrote:
> Am Mittwoch, den 01.06.2011, 16:56 +0200 schrieb Stanislav Brabec:
> > Paul Menzel wrote:
> > > Dear Stanislav,
> > > task compile of `gammu` fails with the following error message usin=
g
> > >         /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/us=
r/lib/libcurl.so: could not read symbols: File in wrong format
> >=20
> > Could you try to add curl to DEPENDS and try again (note that you hav=
e
> > to include do_configure call again). Maybe I overseen this dependency=
.
>=20
> Adding `curl` to `DEPENDS` fixes this issue. It is strange that it is
> looking into the stanging area (=C2=BBFile in wrong format=C2=AB).

It is not strange: Target platform instance of curl was not found but
there was a native curl library in the config path. Attempt to link
against it found a file in wrong format (library for another platform).

See the sysroots/i686-linux part of the path.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



