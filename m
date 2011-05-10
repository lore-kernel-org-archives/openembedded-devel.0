Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1QJpC7-0002pC-NZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 17:49:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 29AD7BE1174
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 11:47:11 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18823-07 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 10 May 2011 11:47:11 -0400 (EDT)
Received: from juice.ott.cti.com (dmzgw2.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id E4C80BE0DE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 11:47:10 -0400 (EDT)
Date: Tue, 10 May 2011 11:47:10 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <lyiptilga8.fsf@ensc-virt.intern.sigma-chemnitz.de>
Message-ID: <Pine.LNX.4.64.1105101144120.12200@juice.ott.cti.com>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop> <4DC91B33.9080807@nedap.com>
	<1305025696.8000.155.camel@phil-desktop> <4DC91E4E.3070109@nedap.com>
	<4DC9363B.6070909@nedap.com> <1305038299.8000.178.camel@phil-desktop>
	<4DC9541B.6070208@nedap.com>
	<lyiptilga8.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 15:49:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 10 May 2011, Enrico Scholz wrote:

> Jaap de Jong <jaap.dejong@nedap.com> writes:
> 
> > TARGET_ARCH       = "x86_64"
> 
> did this ever work?  OE uses hardcoded 'lib' (instead of 'lib64') at
> various places.

Hi Enrico,

This is my MACHINE config:

TARGET_ARCH = "x86_64"

# We can't reuse the same -native builds as 32-bit machines, because
# ours need to be staged into staging/blah/lib64 instead of lib.
# Set blah to x86_64-buildoe64-linux to keep them separate.
BUILD_VENDOR = "-buildoe64"

base_libdir = "${base_prefix}/lib64"
libdir = "${exec_prefix}/lib64"

# Some packages install files into /lib/packagename, not /lib64/packagename.
FILES_${PN} += "${prefix}/lib/${PN}/*"
FILES_${PN}-dbg += "${prefix}/lib/${PN}/.debug"

# glibc's sysdeps/unix/sysv/linux/configure script only fixes
# libc_cv_slibdir if prefix is "/usr". With prefix of "", we need to fix it
# so libc libs don't get installed into /lib.
export libc_cv_slibdir="/lib64"

--------

I had to amend gcc-cross-intermediate:

do_compile_prepend() {
	# On x86_64, glibc-initial stages crti.o to
	# x86_64-oe-linux/lib64/crti.o.
	# When gcc-cross-intermediate tries to build libgcc, it looks
	# for x86_64-oe-linux/lib/../lib64/crti.o.
	# Create the "lib" dir so this shenanigan works.
	install -d ${STAGING_DIR_TARGET}/lib
}


And gcc-cross:

# glibc only built the 64-bit stubs, so don't try to build a 32-bit gcc
# XXX maybe belongs in oe recipes/gcc/gcc-cross4.inc
EXTRA_OECONF_append_x86_64 = " --disable-multilib"


I think that's it - for the recipes I build, all the other fixes have been 
pushed long ago.

Mike


