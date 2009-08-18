Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MdRoc-0005vU-3T
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 18:45:43 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-a5-4a8ad6b2810e
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090813155909.GC8906@gmail.com>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
Date: Tue, 18 Aug 2009 12:27:59 -0400
Message-Id: <1250612879.6785.12.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Tue, 18 Aug 2009 16:45:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I was finally able to determine the cause of the problem. Even though I
had wiped my TMPDIR, I had a broken GCC 4.3 sitting in my DEPLOYDIR
which was contaminating the installation. Once removed, I was able to
get the GCC 4.2.3 installation to work.

However, I've run in to a different problem. It seems that Debian
Renaming does not play nicely with the external toolchain. Digging into
the code, it seems that Debian renaming relies on the package being in
the workdir to do its magic, which for any prebuilt SDK packages will
not hold true. Any thoughts on the proper route to fix this aside from
just turning of Debian Renaming?

On Thu, 2009-08-13 at 08:59 -0700, Khem Raj wrote:
> On (13/08/09 11:19), Chris Conroy wrote:
> > I've spent a pretty good chunk of time this past week trying to get a
> > working external toolchain, but I've hit a bit of a wall and can't
> > figure out how to fix this last problem.
> > 
> > I'm trying to build a gcc-cross-sdk with GCC 4.2.3, and for a while I
> > faced a chicken-and-egg problem of finding limits.h where the creation
> > of the cross-sdk would succeed only if the eventual install location
> > (in /usr/local/path/to/toolchain/ existed). By pulling in the
> > sdk-libstdc++-includes.patch from poky, I was able to remove this issue
> > during the creation of gcc-cross-sdk.
> > 
> > Now, chicken and egg fixed (properly?) using the external toolchain
> > results in cross packages failing to find limits.h (specifically, the
> > #include_next<limits.h> in ${prefix}/usr/include/limits.h. It's unclear
> > to me which (if any) limits.h should be installed (and where).
> 
> limits.h should come from glibc. which should include the one provided
> by gcc in include-fixed gcc-cross-sdk should have done that.
> Deleting include_next is not the correct thing to do.
> > 
> > I've run through the gcc-cross-sdk work directory and was unable to find
> > any obvious choices (all of the copies there also asked for an
> > include_next).
> > 
> > If I make the assumption that this is just an erroneous include_next, I
> > can successfully compile and run some packages. However, I cannot build
> > the kernel because it fails on the assembly inside asm_offsets.c. This
> > leads me to believe that removing that include_next was not a valid fix
> > (no surprise there), and perhaps fixing this limits.h issue properly
> > will be the last step in creating a working external toolchain. I don't
> > see any obvious choices within gcc, but perhaps I need to pull from
> > glibc, glibc-initial, or perhaps a particular host file?
> > 
> > Note that this is NOT GCC 4.3.x which moved the fixincludes directory
> > and made some issues with finding limits.h. Most of the references I've
> > found to this bug indicate that people had this working before upgrading
> > to 4.3.x, and therefore I'm a bit surprised to be running into a similar
> > issue with 4.2.x
> > 
> > (For reference, this is with glibc 2.7 and binutils 2.19 for a
> > mipsel-linux target building on an x86_64 host)
> > 
> > --Chris Conroy
> > 
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


