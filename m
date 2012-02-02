Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rsu9T-0005Uz-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 11:44:27 +0100
Received: from mail411.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id F1110DC3A47
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 09:08:18 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Feb 2012 10:06:21 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(82.240.38.71) by ns0.ovh.net with SMTP; 2 Feb 2012 10:06:20 +0200
Date: Thu, 2 Feb 2012 09:06:19 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20120202090619.721d082b@eb-e6520>
In-Reply-To: <CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 4898790495585611081
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 10
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeegtddrfeegucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheplhhinhhugihtohhgohdrohhrghdpmhgvnhhtsgihrdgtohhmnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 10
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeegtddrfeegucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheplhhinhhugihtohhgohdrohhrghdpmhgvnhhtsgihrdgtohhmnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Thu, 02 Feb 2012 10:44:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Thu, 2 Feb 2012 08:45:13 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Wed, Jan 4, 2012 at 9:05 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > Hi Khem,
> >
> > Le Tue, 3 Jan 2012 21:18:49 -0800,
> > Khem Raj <raj.khem@gmail.com> a =E9crit :
> >> On (23/12/11 08:12), Eric B=E9nard wrote:
> >> > * python support is needed for providing finer scripting control
> >> > in gdb, and for remote controling gdb for example from qtcreator
> >> > * gdb/configure tries to autodetect python using python executable
> >> > with --includes --ldflags --exec-prefix to get the right flags
> >> > As it's difficult to achieve in OE's context, we generate a
> >> > script which will return the right values and make gdb's build
> >> > system happy. This idea was taken from the following article :
> >> > http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and=
-relocation.html
> >> > * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2=
.4.0
> >>
> >> I think this change should go into oe-core. Can you please redo it
> >> w.r.t. oe-core
> >>
> > I agree with you, I initally submited it for oe-core and was asked
> > to put it into meta-oe by Jessica :
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01=
4828.html
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01=
4833.html
> >
> > Eric
>=20
> Hi Eric,
>=20
> with this patch I see gdb-cross-canadian_7.3.1.bb failing with:
> | checking whether to use python...
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
> | checking for python2.7... no
> | configure: error: no usable python found at
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
>=20
> and
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
> is really script from this patch
>=20
> Any hint how to fix this?
>=20
can you check the content of :
${WORKDIR}/python
and if
${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix=
}/include/python${PYTHON_BASEVERSION}/
and
${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/pyt=
hon${PYTHON_BASEVERSION}/config/config =20
exist ?

Eric


