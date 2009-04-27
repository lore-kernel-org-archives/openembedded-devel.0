Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRlH-0002Iu-TP
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:24:48 +0200
Received: (qmail 6906 invoked from network); 27 Apr 2009 14:19:44 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 07:19:44 -0700
Date: Mon, 27 Apr 2009 07:19:43 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090427141943.GG18788@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 27 Apr 2009 14:24:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  I've created a new branch, trini/add-libc-overrides which does
the following:
- Make every distro declare PREFERRED_LIBC, either outright or
  overridable.
- For Angstrom/foonas have DISTROVAR ?= ${PREFERRED_LIBC},
  PREFERRED_LIBC ?= default
- Add conf/distro/include/{eglibc,glibc,uclibc}.inc that have:
  - Add 'glibc' to OVERRIDES for eglibc/glibc and 'uclibc' for
    uclibc.inc
  - Default providers.
  NOTE: ${TARGET_PREFIX} includes ${TARGET_VENDOR} so ...
- Switch all distros to have:
  require conf/distro/include/${PREFERED_LIBC}.inc
  - Clean up distro-specific includes, and sane-toolchain.inc a little
    bit by removing all of the PREFERRED_PROVIDER stuff it no longer
    needs.
- For glibc*.bb older than 2.5, add in some missing RPROVIDES.

That last change was required so that a number of distros would parse
without trying to build say both glibc_2.3.3 and glibc_2.9 (for
virtual-libc-dev) when I ran bitbake -g meta-toolchain minimal-image.

The next step, once something like this goes in, would be to change all
of the overrides that test for uclibc (or glibc) from
linux/linux-gnueabi vs linux-uclibc/linux-uclibcgnueabi to just
linux_glibc vs linux_uclibc.

That branch has been tested with bitbake -g meta-toolchain minimal image
for every distro for nslu2be nslu2le and beagleboard (arm/armeb/newer
arm) before and after, and the only differences are the stuff that now
parses thanks to the glibc changes.  I've got a loop going now with
qemux86 db1200 and mpc8313e-rdb but don't expect any problems.  I'll be
following up with the patches shortly.

-- 
Tom Rini


