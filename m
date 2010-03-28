Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyUH-0006CJ-3O for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:49:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyRB-0002P7-KK for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:46:21 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:46:21 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:46:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Mar 2010 21:46:06 +0200
Message-ID: <hooblv$s4s$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] site files for cmake
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
X-List-Received-Date: Sun, 28 Mar 2010 19:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

After fighting with cmake the weekend (and getting rid of legacy-staging
in console-image while watching cmake fail), I discovered that cmake
supports cross-compiling since 2.6.0 and allows us to provide a site
file using -C. I hacked support for that into cmake.bbclass:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=ba23d4de95a33db5feccd19359bd9b907c2d90bd

I would like to propose to extend that by copying extending
siteinfo.bbclass with knowledge about cmake site files. It would do
roughy the following:

1) Build a list of appropriate filenames
2) if they exist concatenate them into ${WORKDIR}/site-file.cmake

The sucky part is that you can't use the cmake cache file to populate
the site files like we can with autotools :(

Cmake emits CMakeCache.txt with entries like:

//Result from TRY_RUN
HAVE_POLL_FINE:STRING=0

//Output from TRY_RUN
HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT:STRING=1

But the site file needs to look like this:

SET( HAVE_POSIX_STRERROR_R
     "1"
     CACHE STRING "Result from TRY_RUN" FORCE)

SET( HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT
     "1"
     CACHE STRING "Output from TRY_RUN" FORCE)

So to generate missing entries one needs to:

1) Try building app using OE
2) Append TryRunResults.cmake to site-file.cmake
3) Try building app on target
4) Edit the new entries in site-file.cmake using CMakeCache.txt from the
target

if error, goto 1)

5) seperate out new entries into the proper site file (e.g. common,
glibs, arm, etc)

For more info see http://www.itk.org/Wiki/CMake_Cross_Compiling

Oh, and cmake can't crosscompile itself out of the box, it tries to run
generated binaries.

Could cmake gurus comment on all this? Or better, write a tool that
converts a cmakelist.txt to configure.ac, since I know how to fix
autotools :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLr7H+MkyGM64RGpERAlzWAJ0QUjX4fHJjeVt/iXDEfUA97eTIFQCgpyjq
SiXrmypfUtbWhmCZU4W8jz8=
=OGtp
-----END PGP SIGNATURE-----



