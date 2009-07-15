Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MR1dg-0005f6-NS
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 12:23:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 04CAA1417193
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 12:12:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiUsjrB1LgX2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 12:12:13 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id C32BA1416BA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2009 12:12:13 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A5CF836.6000309@cbnco.com>
References: <1247599483.7178.11.camel@utx.utx.cz> <4A5CF836.6000309@cbnco.com>
Date: Wed, 15 Jul 2009 12:09:40 +0200
Message-Id: <1247652580.14441.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] glibc: install correct stubs (fixes midori crash)
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
X-List-Received-Date: Wed, 15 Jul 2009 10:23:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Michael Smith wrote:
> Stanislav Brabec wrote:
>  > Attached patch prevents overwriting of a real stub include file by a
>  > dummy stub file. Patch is tested only with the latest glibc from the
>  > angstrom.
>=20
> Hi Stanislav,
>=20
> Patch 2/3 here fixes it:
>=20
> http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/glibc_tweak=
s/
>=20
> Also cleans some of the other lines that aren't needed.

Your patch is better.

And INC_PR seems to be a good idea for any .inc file. I have been
thinking about a generic feature setting revision to
inc_revision+bb_revision.

=EF=BB=BFWell, I am not a core team member, but you have my ACK. The bug =
is
apparent and debugging of subsequent errors take a lot of time.

Acked-by: Stanislav Brabec <utx@penguin.cz>


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



