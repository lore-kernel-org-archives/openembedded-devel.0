Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LzCTd-00029Y-Nf
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 18:17:42 +0200
Received: (qmail 9947 invoked from network); 29 Apr 2009 16:12:24 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 29 Apr 2009 09:12:24 -0700
Date: Wed, 29 Apr 2009 09:12:24 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090429161224.GB18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090427141943.GG18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Wed, 29 Apr 2009 16:17:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 07:19:43AM -0700, Tom Rini wrote:

> Hey all.  I've created a new branch, trini/add-libc-overrides which does
> the following:
> - Make every distro declare PREFERRED_LIBC, either outright or
>   overridable.
> - For Angstrom/foonas have DISTROVAR ?= ${PREFERRED_LIBC},
>   PREFERRED_LIBC ?= default
> - Add conf/distro/include/{eglibc,glibc,uclibc}.inc that have:
>   - Add 'glibc' to OVERRIDES for eglibc/glibc and 'uclibc' for
>     uclibc.inc
>   - Default providers.
>   NOTE: ${TARGET_PREFIX} includes ${TARGET_VENDOR} so ...
> - Switch all distros to have:
>   require conf/distro/include/${PREFERED_LIBC}.inc
>   - Clean up distro-specific includes, and sane-toolchain.inc a little
>     bit by removing all of the PREFERRED_PROVIDER stuff it no longer
>     needs.
> - For glibc*.bb older than 2.5, add in some missing RPROVIDES.

I've pushed a trini/add-libc-overrides-2 branch with the following
changes:
- Change PREFERRED_LIBC to LIBC
- Fold fixing up minimal/minimal-uclibc into the commit that brings in
  the libc inc file.
- Re-order commits so that everything is functional from commit to
  commit.

I'm now looking for ack's to pull this branch into .dev

-- 
Tom Rini


