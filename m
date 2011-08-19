Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <fabian-buettner@gmx.de>) id 1QuWOj-0000sN-FZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 23:14:37 +0200
Received: (qmail invoked by alias); 19 Aug 2011 21:03:16 -0000
Received: from lak-29-31.wohnheime.ruhr-uni-bochum.de (EHLO localhost)
	[134.147.29.31]
	by mail.gmx.net (mp059) with SMTP; 19 Aug 2011 23:03:16 +0200
X-Authenticated: #4787129
X-Provags-ID: V01U2FsdGVkX19x2Fo0g5txQKYv1EbKDLs4FSBpeRgKo13gwLz+OS
	MWGM7rh8HS9pxB
Date: Fri, 19 Aug 2011 23:03:16 +0200
From: fabian =?iso-8859-15?Q?b=FCttner?= <fabian-buettner@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110819210316.GB3730@golden>
References: <20110818131043.GC26690@golden>
	<1313689684.7918.2.camel@eng-phousel-ubuntu>
	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>
	<4E4E62AB.1050603@balister.org> <4E4E7416.1070105@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4E4E7416.1070105@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Y-GMX-Trusted: 0
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Fri, 19 Aug 2011 21:14:37 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 07:32 Fri 19 Aug     , Khem Raj wrote:
> On 8/19/2011 6:18 AM, Philip Balister wrote:
> > On 08/19/2011 02:33 AM, Stefan Herbrechtsmeier wrote:
> >> Am 18.08.2011 19:48, schrieb Peter Housel:
> >>> On Thu, 2011-08-18 at 15:10 +0200, fabian büttner wrote:
> >>>> Hi,
> >>>>
> >>>> I am having troubles compiling the Angstrom SDK.
> >>>>
> >>>> I used the angstrom-setup-scripts to configure OE, sourced the
> >>>> environment settings and built the base-image/console-image with
> >>>> bitbake.
> >>>>
> >>>> While trying to compile the meta-toolchain, just when bitmake finishes
> >>>> downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an error
> >>>> output like this:
> >>>>
> >>>> http://pastie.org/2390409
> >>>>
> >>>> After that, I tried building the meta-toolchain(i did a bitmake clean
> >>>> meta-toolchain) without '-j2' but the error I receive is ultimately
> >>>> the same:
> >>>> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> >>>> * for task-sdk-bare:
> >>>> * libstdc++-dev *
> >>>> * opkg_install_cmd: Cannot install package task-sdk-bare.
> >>>>
> >>>> Unfortunately I am too unexperienced with OE/Angstrom to fix bugs
> >>>> like that.
> >>>> Maybe someone could give me a hint how to get around this show-stopper?
> >>> I can confirm that I've been seeing this as well on recent
> >>> 2011.03-maintenance, but haven't had a chance to troubleshoot the root
> >>> cause yet.
> >>>
> >> It was inbtroduced with commit 105d881227d06f31c180dffb777ee63361b2f2b8
> >> "gcc: Package libstdc++ gdb python helpers into dev package".
> >> If no helpers exist the empty package will not be generated.
> >> I have try to add
> >> ALLOW_EMPTY_libstdc++-dev = "1"
> >> to gcc-package-cross.inc but this breaks meta-toolchain as the files in
> >> ${prefix}/${TARGET_SYS}/usr/include/c++ are missing.
> >>
> >> Only removing libstdc++-dev package from gcc-package-cross.inc fix the
> >> problem.
> >
> > Does anyone know if dv has the same problem? I can't check easily at the
> > moment.
> 
> what happens if you remove  libstdc++-dev libgcc-dev from PACKAGES in 
> recipes/gcc/gcc-package-cross.inc ?
> I will see if I can reproduce it here
> >
> > Philip
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

Hi Khem,

I removed libstdc++-dev and I was able to build meta-toolchain.

regards,
fabian


