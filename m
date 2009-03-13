Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LiEqb-0005vG-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 22:23:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 85AE71416BC6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 22:23:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-ir3c0edHAG
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 22:23:10 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 50B181416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 22:23:10 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090311030509.GA10085@denix.org>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
	<20090311030509.GA10085@denix.org>
Date: Fri, 13 Mar 2009 22:22:54 +0100
Message-Id: <1236979374.4355.11.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Fri, 13 Mar 2009 21:23:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko wrote in Tue 03/10 2009 at 23:05 -0400:

> I'll save you some trouble - been building i686-generic on I32 x86 for =
months=20
> w/o a problem. Angstrom distro with a small overlay - configuration is =
pretty=20
> basic.
>=20
> i686-linux holds my native packages
> i686-angstrom-linux holds my target/cross packages, including gcc-cross
> i686-generic-angstrom-linux holds machine-specific target packages

Maybe better solution would be as small change to staging hierarchy:
=EF=BB=BF
Suppose that build platform is i686-linux and target platform is
i686-linux as well.
=EF=BB=BF=EF=BB=BF=EF=BB=BF
- target system staging files have prefix /usr and are sysrooted:
  now:      tmp/staging/i686-linux
=EF=BB=BF=EF=BB=BF  proposed: tmp/staging/i686-linux

- native toolchain files have prefix /OE/tmp/staging/i686-linux as native=
 location
=EF=BB=BF  now:      tmp/staging/i686-linux
  proposed: tmp/staging/i686-linux-native

This will prevent path clash if =EF=BB=BFbuild and target triplets are ex=
actly
the same. =3D> It will allow simple native build using OE toolchain.

Side effect: It will invalidate existing buildroots.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



