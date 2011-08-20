Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <fabian-buettner@gmx.de>) id 1QuiLL-00069P-D4
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 11:59:55 +0200
Received: (qmail invoked by alias); 20 Aug 2011 09:55:13 -0000
Received: from lak-67-86.wohnheime.ruhr-uni-bochum.de (EHLO localhost)
	[134.147.67.86]
	by mail.gmx.net (mp017) with SMTP; 20 Aug 2011 11:55:13 +0200
X-Authenticated: #4787129
X-Provags-ID: V01U2FsdGVkX1+IRQ9wFJOIndLUZawTkie81aXDqY7vyRn2+60tCR
	bF1XG+uyPLHsvp
Date: Sat, 20 Aug 2011 11:55:13 +0200
From: fabian =?iso-8859-15?Q?b=FCttner?= <fabian-buettner@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110820095513.GA3409@golden>
References: <20110818131043.GC26690@golden>
	<1313689684.7918.2.camel@eng-phousel-ubuntu>
	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>
	<4E4E62AB.1050603@balister.org> <4E4E7416.1070105@gmail.com>
	<20110819210316.GB3730@golden>
	<CAMKF1squXK1aVRy7pHtL_X9niEn6_pJiuTMao8Dd_32o042YEA@mail.gmail.com>
	<20110819223546.GA10255@golden>
	<1313796846.3651.13.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1313796846.3651.13.camel@mattotaupa>
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
X-List-Received-Date: Sat, 20 Aug 2011 09:59:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 01:34 Sat 20 Aug     , Paul Menzel wrote:
> Am Samstag, den 20.08.2011, 00:35 +0200 schrieb fabian büttner:
> > On 15:05 Fri 19 Aug     , Khem Raj wrote:
> > > On Fri, Aug 19, 2011 at 2:03 PM, fabian büttner <fabian-buettner@gmx.de> wrote:
> 
> […]
> 
> > > > I removed libstdc++-dev and I was able to build meta-toolchain.
> > > 
> > > OK now can you send me list of files you have in
> > > packages-split dir in gcc-cross build tree do
> > > 
> > > $ find
> > > 
> > > and send the output please
> > 
> > Could you be more specific, I am new here.
> 
> Adding a please would be nice next time.
> 
> > Where do I find the packages-split dir?
> 
> In your build directory [1]. For example for `libroxml`.
> 
>         $ ls angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0-r0/
>         image           package         staging-pkg      temp
>         libroxml-2.1.0  packages-split  sysroot-destdir
> 
> If you have `INHERIT += "rm_work"` in you `local.conf` those directories
> are removed after a successful build. So you should comment that line
> out.
> 
> 
> Thanks and good luck,
> 
> Paul
> 
> 
> [1] http://gumstix.org/software-development/open-embedded/161-openembedded-directory-layout.html

Hi Paul,

Thank you for your answer.
Like you suggested I commented the INHERIT line in my config and did a 
bitbake -c clean gcc-cross. After that i tried building the
meta-toolchain again, which failed, with the following error:
[...]
| cp: cannot stat
`/home/fab/git/angstrom-setup-scripts/build/tmp-angstrom_2010_x/pkgdata/armv7a-angstrom-linux-gnueabi/runtime/libstdc++-dev':
No such file or directory
NOTE: package meta-toolchain-1.0-r0: task do_populate_sdk: Failed
ERROR: Function 'do_populate_sdk' failed (see
/home/fab/git/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/meta-toolchain-1.0-r0/temp/log.do_populate_sdk.23348
for further information)
ERROR: Task 14
(/home/fab/git/angstrom-setup-scripts/sources/openembedded/recipes/meta/meta-toolchain.bb,
do_populate_sdk) failed with exit code '1'
ERROR:
'/home/fab/git/angstrom-setup-scripts/sources/openembedded/recipes/meta/meta-toolchain.bb'
failed

The requested file list in packages-split
work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.5-r37.1+svnr170443/packages-split:
./libssp
./libssp/usr
./libssp/usr/lib
./libssp/usr/lib/libssp.so.0.0.0
./libssp/usr/lib/libssp.so.0
./libstdc++.shlibdeps
./libssp.shlibdeps
./libgcc-dev
./libgcc-dev/usr
./libgcc-dev/usr/lib
./libgcc-dev/usr/lib/libgcc_s.so
./libg2c
./libgfortran
./libstdc++
./libstdc++/usr
./libstdc++/usr/lib
./libstdc++/usr/lib/libstdc++.so.6.0.14
./libstdc++/usr/lib/libstdc++.so.6
./libgcc
./libgcc/lib
./libgcc/lib/libgcc_s.so.1
./libgcc.shlibdeps

regards,
fabian


