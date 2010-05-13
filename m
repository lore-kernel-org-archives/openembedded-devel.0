Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OCTtQ-0001OG-EJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:35:52 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 10:31:48 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 May 2010 10:31:48 +0200
Received: from jcn ([87.1.17.227]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 13 May 2010 10:31:46 +0200
Date: Thu, 13 May 2010 10:31:39 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100513103139.07200c76.ospite@studenti.unina.it>
In-Reply-To: <AANLkTimJm8aWxNlkEK0eYJhbjtGwt6ZHWtKhdJ_mipbF@mail.gmail.com>
References: <hs0mk7$rst$2@dough.gmane.org>
	<1273330086.23460.11.camel@desktop.maison.net>
	<w2v19c1b8a91005081025l9688a5b8wc6eff5bc15496513@mail.gmail.com>
	<AANLkTimJm8aWxNlkEK0eYJhbjtGwt6ZHWtKhdJ_mipbF@mail.gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 13 May 2010 08:31:46.0925 (UTC)
	FILETIME=[B9B5E9D0:01CAF276]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain doesn't build due to gdb-cross-sdk
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
X-List-Received-Date: Thu, 13 May 2010 08:35:56 -0000
X-Groupsio-MsgNum: 19224
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__13_May_2010_10_31_40_+0200_ZHFkuWxfCKqz.zVh"

--Signature=_Thu__13_May_2010_10_31_40_+0200_ZHFkuWxfCKqz.zVh
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 11 May 2010 23:39:29 +1000
Angus Lees <alees@google.com> wrote:

> It looks like the do_stage() removal was good, but the "inherit cross"
> refactor broke task-sdk-host and all the SDKs that depend on it.  I sugge=
st
> reverting most of 4cf6a6bf83ccb13e7238927d72e77c4612fe6543 (but I'm hardly
> an expert).
>=20
>  - Gus
>

Ping.

meta-toolchain still does not build in org.oe.dev, but Angus' workaround
worked for me too, thanks.

Regards,
   Antonio

> On Sun, May 9, 2010 at 03:25, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On Sat, May 8, 2010 at 7:48 AM, Thomas Jourdan <thomas.jourdan@yaeld.fr>
> > wrote:
> > > Hi
> > >
> > > The problems seems to come from the conversion to new staging mode in
> > > GDB.
> >
> > right
> >
> > Now, gdb-cross-sdk inherits from sdk and cross whereas before it
> > > only inherited from cross.
> > >
> > > Reverting Khem Raj GDB patches fixes the build for me (meta-toolchain
> > > works again).
> >
> > thats because gdb 7.1 is then not using new staging and hence it builds
> > again.
> >
> > >
> > > Regards,
> > > Thomas
> > >
> > > Le vendredi 07 mai 2010 =E0 11:30 +0200, Koen Kooi a =E9crit :
> > >> -----BEGIN PGP SIGNED MESSAGE-----
> > >> Hash: SHA1
> > >>
> > >> Hi,
> > >>
> > >> Currently meta-toolchain is unbuildable:
> > >>
> > >> Missing or unbuildable dependency chain was: ['gdb-cross-sdk']
> > >> NOTE: Runtime target 'task-sdk-host' is unbuildable, removing...
> > >> Missing or unbuildable dependency chain was: ['task-sdk-host',
> > >> 'gdb-cross-sdk']
> > >> ERROR: Required build target 'meta-toolchain' has no buildable
> > providers.
> > >> Missing or unbuildable dependency chain was: ['meta-toolchain',
> > >> 'task-sdk-host', 'gdb-cross-sdk']
> > >> Command execution failed: Traceback (most recent call last):
> > >>   File "/OE/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
> > >>     commandmethod(self.cmds_async, self, options)
> > >>   File "/OE/bitbake/lib/bb/command.py", line 174, in buildTargets
> > >>     command.cooker.buildTargets(pkgs_to_build, task)
> > >>   File "/OE/bitbake/lib/bb/cooker.py", line 757, in buildTargets
> > >>     taskdata.add_unresolved(localdata, self.status)
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 562, in add_unresolved
> > >>     self.remove_runtarget(self.getrun_id(target))
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarg=
et
> > >>     self.fail_fnid(fnid, missing_list)
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 495, in fail_fnid
> > >>     self.remove_runtarget(target, missing_list)
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 535, in remove_runtarg=
et
> > >>     self.fail_fnid(fnid, missing_list)
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 490, in fail_fnid
> > >>     self.remove_buildtarget(target, missing_list)
> > >>   File "/OE/bitbake/lib/bb/taskdata.py", line 519, in remove_buildta=
rget
> > >>     raise bb.providers.NoProvider
> > >> NoProvider
> > >>
> > >> The weird thing is that 'bitbake gdb-cross-sdk' *DOES* work. Any ide=
as?
> > >>
> > >>
> > >> regards,
> > >>
> > >> Koen


--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__13_May_2010_10_31_40_+0200_ZHFkuWxfCKqz.zVh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvruOwACgkQ5xr2akVTsAHexQCgsDhhlRHhuU8UfkrehIP2K/qc
wtEAn3gk69yyIX+Ue1g/n6c/skT+9y0y
=3GW9
-----END PGP SIGNATURE-----

--Signature=_Thu__13_May_2010_10_31_40_+0200_ZHFkuWxfCKqz.zVh--
