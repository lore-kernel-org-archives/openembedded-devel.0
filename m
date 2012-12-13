Received: from 9.mo4.mail-out.ovh.net ([46.105.40.176]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TjHLD-0006Vh-DF
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:33:19 +0100
Received: from mail423.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 6BEDB104E263
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 15:08:15 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Dec 2012 16:00:44 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Dec 2012 16:00:44 +0200
Date: Thu, 13 Dec 2012 14:59:44 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121213145944.4d30ad48@eb-e6520>
In-Reply-To: <CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
References: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
	<CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 16108249968271076681
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrtdeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: current bbappend issues
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
X-List-Received-Date: Thu, 13 Dec 2012 22:33:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu, 13 Dec 2012 13:43:47 +0000,
"Burton, Ross" <ross.burton@intel.com> a =E9crit :

> On 13 December 2012 13:17, Cliff Brake <cliff.brake@gmail.com> wrote:
> > ERROR: No recipes available for:
> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes=
-qt/qt4/qt4-embedded_4.8.3.bbappend
> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-systemd/oe=
-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
> >   /scratch/oe/oe-build-core-3/sources/meta-ti/recipes-graphics/mesa/mes=
a-dri_8.0.4.bbappend
> >   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes=
-qt/qt4/qt4-x11-free_4.8.3.bbappend
> > ERROR: Command execution failed: Exited with 1
>=20
> You can fix that locally by reverting the revert of the qt4 fixes...
> (cherry-pick 421a73c9c3bea13e029cd0505711ef02753949bb).
>=20
> Agreed - meta-oe master needs more maintainers so that it keeps
> current with oe-core master.
>=20
I can help in addition to danny's maintenance for simple patches like
this.

Eric


