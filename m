Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RiPMW-000376-Jl
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 12:50:32 +0100
Received: from mail402.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 8D77A100C7A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2012 09:06:30 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Jan 2012 10:05:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(82.240.38.71) by ns0.ovh.net with SMTP; 4 Jan 2012 10:05:23 +0200
Date: Wed, 4 Jan 2012 09:05:23 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20120104090523.066ae2d7@eb-e6520>
In-Reply-To: <20120104051849.GG31275@sakrah.homelinux.org>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.7.10 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 595319577668791784
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -90
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefkedrvdejucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdluddtmdenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtudenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheplhhinhhugihtohhgohdrohhrghdpmhgvnhhtsgihrdgtohhmne
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -87
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeefjedruddvucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludefmdenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtudenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheplhhinhhugihtohhgohdrohhrghdpmhgvnhhtsgihrdgtohhmne
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 04 Jan 2012 11:50:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Tue, 3 Jan 2012 21:18:49 -0800,
Khem Raj <raj.khem@gmail.com> a =E9crit :
> On (23/12/11 08:12), Eric B=E9nard wrote:
> > * python support is needed for providing finer scripting control
> > in gdb, and for remote controling gdb for example from qtcreator
> > * gdb/configure tries to autodetect python using python executable
> > with --includes --ldflags --exec-prefix to get the right flags
> > As it's difficult to achieve in OE's context, we generate a
> > script which will return the right values and make gdb's build
> > system happy. This idea was taken from the following article :
> > http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-re=
location.html
> > * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2.4.0
>=20
> I think this change should go into oe-core. Can you please redo it
> w.r.t. oe-core=20
>=20
I agree with you, I initally submited it for oe-core and was asked
to put it into meta-oe by Jessica :
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014828=
.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014833=
.html

Eric


