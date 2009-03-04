Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lem2H-0000f6-Pl
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 09:01:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 48D05140933D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 08:58:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4rVevNX9att
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 08:58:20 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 1AC541409329
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 08:58:20 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49ADB183.5070709@balister.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>
	<1236119119.10602.62.camel@andromeda> <49ADB183.5070709@balister.org>
Date: Wed, 04 Mar 2009 08:56:51 +0100
Message-Id: <1236153411.4345.21.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump	automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 08:01:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Philip Balister wrote in Tue 03/03 2009 at 17:38 -0500:

> We need to have a serious discussion about deleting recipes. I know the=
=20
> deletion of python 2.5 will force me to address the 2.5->2.6 upgrade in=
=20
> gnuradio before the upstream developers are ready.

packages/networkmanager/netm-cli_0.2.bb use syntax like:
DEPENDS =3D "python (<2.6)"

> We need a way to remove recipes, but doing it as part of adding a new=20
> recipe is causing problems for OE users.

Maybe we need an automatic check tool. =EF=BB=BFSomething like
check-if-I-can-delete-this-bb and check-if-I-can-delete-this-inc or
wipe-out-obsolete-recipes.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



