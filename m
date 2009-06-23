Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MIxHN-0000Ko-9t
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 06:06:42 +0200
Received: (qmail 22132 invoked from network); 23 Jun 2009 03:55:39 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 22 Jun 2009 20:55:39 -0700
Date: Mon, 22 Jun 2009 20:55:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20090623035538.GC23935@smtp.west.cox.net>
References: <20090505164137.GJ7973@smtp.west.cox.net>
	<200906121255.32105.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <200906121255.32105.raj.khem@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fix staging of binutils static libraries
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
X-List-Received-Date: Tue, 23 Jun 2009 04:06:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2009 at 12:55:27PM -0700, Khem Raj wrote:
> On Tuesday 05 May 2009 09:41:38 am Tom Rini wrote:
> > binutils-cross: Stage libbfd/opcodes/iberty correctly, bump PR
> > 
> > Changes the staging path for libbfd and libopcodes to ${CROSS_DIR}/lib.
> > Disables staging native libiberty.a to ${STAGING_DIR_TARGET} as this doesn't
> > make sense to do.  Cleans up empty directories.
> > 
> > Signed-off-by: Nikita Shulga <nshulga@embeddedalley.com>
> > Signed-off-by: Tom Rini <trini@embeddedalley.com>
[snip]
> seems ok. I hope you have tested it on 64 bit hosts as well.

OK, found a problem.  gcc-configure-cross.inc's do_stage will go and
delete the libiberty.a we put here, after overwriting it with
libiberty.a from gcc.  There's a comment about wanting libiberty.a from
binutils.  Anyone recall why?

-- 
Tom Rini


