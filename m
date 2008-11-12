Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L0AIB-0007pu-UO
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 08:37:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 74CF71405337
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2008 08:33:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GA-J6euCY287
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2008 08:33:57 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 3DF841422AA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2008 08:33:56 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226442540.29923.0.camel@aquilonia>
References: <1226433327.4417.10.camel@utx.utx.cz>
	<1226442540.29923.0.camel@aquilonia>
Date: Wed, 12 Nov 2008 08:35:37 +0100
Message-Id: <1226475337.4118.32.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: openmoko OE devs: update claws-mail and libetpan?
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
X-List-Received-Date: Wed, 12 Nov 2008 07:37:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Graeme Gregory wrote:
> On Tue, 2008-11-11 at 20:55 +0100, Stanislav Brabec wrote:
>=20
> > 3) Add new versions to preferred-om-2008-versions.inc
> >=20
> As claws maintainer and OM person please do this version.

Well, I naively expected that the latest version will work better.

Actually, even 3.3.0 was working well in OE in August and now it
crashes. =EF=BB=BFEven build from August crashes in the new system even i=
f it is
using old libraries:
LD_LIBRARY_PATH=3D/home/backup5/usr/lib strace /home/backup5/usr/bin/claw=
s-mail

Now 3.3.0=EF=BB=BF as well as 3.6.1 (+new libetpan) crashes in some local=
es. And
it seems, that both now display accented characters in subject
incorrectly. 3.6.1 lost part of translations somehow.
It indicates a change in libraries.

What I just found in my debugging:
- LC_COLLATE=3DC claws-mail works
=EF=BB=BF- LC_COLLATE=3Dcs_CZ.UTF-8 claws-mail crashes

When I remove ~/.claws-mail/toolbar*.xml, then it starts. Once. Then it
crashes again.

Looking at the source code, it crashes in toolbar_create due to
mis-filled cur: GSList of ToolbarItem. Instead of
((ToolbarItem*)cur->data)->file populated by the icon name
and =EF=BB=BF((ToolbarItem*)cur->data)->text populated by translated labe=
l of
the icon, it populates ((ToolbarItem*)cur->data)->file by translated
label of the icon and ->text remains NULL. When it tries to find stock
icon, it is out of the luck (Claws-Mail-CRITICAL **:
stock_pixmap_widget: assertion `icon >=3D 0 && icon < N_STOCK_PIXMAPS'
failed) and finally it crashes on g_object_ref(NULL).

And why it depends on LC_COLLATE? I have no idea.
But the source code gives me a hint: They use g_utf8_collate() just to
compare two strings for equality. g_utf8_collate() uses complicated
strcoll (=EF=BB=BFstrcmp can compare two strings about 100 times faster).

I will try 3.6.1 on the x86_64 trying to reuse ~/.claws-mail files
created in Angstrom.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



