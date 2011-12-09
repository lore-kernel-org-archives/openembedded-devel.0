Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1RZ1kd-0002pR-Ma
	for openembedded-devel@openembedded.org; Fri, 09 Dec 2011 15:48:39 +0100
Received: from jcn (87.6.149.179) by smtp206.alice.it (8.6.023.02)
	(authenticated as fospite@alice.it)
	id 4ECA607902EEE9B8 for openembedded-devel@openembedded.org;
	Fri, 9 Dec 2011 15:35:56 +0100
Date: Fri, 9 Dec 2011 15:35:49 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@openembedded.org
Message-Id: <20111209153549.b1b8cc650d47813a694e9fc7@studenti.unina.it>
X-Mailer: Sylpheed 3.2.0beta4 (GTK+ 2.24.8; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Subject: Using 'mr' to manage an oe-core build environment (configuration and layers)
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
X-List-Received-Date: Fri, 09 Dec 2011 14:48:39 -0000
X-Groupsio-MsgNum: 36005
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__9_Dec_2011_15_35_49_+0100_3cLMKO7z26eH.5b_"

--Signature=_Fri__9_Dec_2011_15_35_49_+0100_3cLMKO7z26eH.5b_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I was looking into 'mr'[1] for another project and I thought about
trying it for an oe-core workflow.

The idea is to manage layers and configurations to set up a certain
build environment with as few files as possible and with a way to easily
recreate that environment, I've heard about alternative ways of doing
that using 'repo' from android or git submodules, or some OE specific
scripts, but I don't really know the details of those and I am not able
to compare them with my approach, so I thought I'd just share it here
and let you tell me.

Here is some brief documentation:
http://ao2.it/tmp/oe-ezx-build/README.asciidoc

You can recreate the build environment with just this command:
  mr bootstrap http://ao2.it/tmp/oe-ezx-build/.mrconfig oe-ezx-build

This will bring in the configuration for the build environment (kept
under revision control as well as the .mrconfig itself), and will
checkout all the needed layers.

You can start building right away with:
  cd oe-ezx-build
  . ./oe-core/oe-init-build-env
  bitbake meta-toolchain

You can do some work in the various component of the environment and
check the status with:
  mr status

BTW the output of this last command makes me wonder if oe-core should
put bitbake/ in .gitignore

Adding layers is not immediate yet because this is a rare event in my
use case.

Final note, the repository under http://ao2.it/tmp/ is temporary and
will most likely go away sometimes in the future. :)

Thanks,
   Antonio

[1] http://kitenet.net/~joey/code/mr/

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Fri__9_Dec_2011_15_35_49_+0100_3cLMKO7z26eH.5b_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7iHMUACgkQ5xr2akVTsAE2EACfaNfleM8puXbUFuN6PIQF9qFG
BhgAnRDzsJkh3pJziihlYhlss+Sdiod9
=TQEr
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Dec_2011_15_35_49_+0100_3cLMKO7z26eH.5b_--
