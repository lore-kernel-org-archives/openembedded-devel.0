Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NUiYR-0002fr-3f
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:21:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 374DB61C9EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 10:19:03 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20963-07 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 12 Jan 2010 10:19:03 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0661F61C9DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 10:19:03 -0500 (EST)
Message-ID: <4B4C92E7.3090107@cbnco.com>
Date: Tue, 12 Jan 2010 10:19:03 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>	<1263288966.457.153.camel@lenovo.internal.reciva.com>	<728686868.1263292036.179341680.5053@mcgi53.rambler.ru>	<727203316.1263292376.164699196.97945@mcgi41.rambler.ru>
	<1263305804.3675.396.camel@mill.internal.reciva.com>
In-Reply-To: <1263305804.3675.396.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 15:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Tue, 2010-01-12 at 13:32 +0300, Perepelica Alexander wrote:

> Ah, I see.  So, you were right: it is in fact a multilibs problem.  What
> has happened here is that gcc is trying to build a 32-bit version of
> libgcc2, but you haven't compiled a 32-bit version of glibc yet.
> 
> There are two possible fixes:
> 
> - write a variant .bb file to build a 32 bit glibc, and arrange for
> gcc-cross to DEPEND on that; or
> 
> - patch t-linux64, and/or the gcc configury, to stop it trying to build
> the 32-bit multilib.

One hack that worked for me is to amend the gcc-cross recipe to include:

# glibc only built the 64-bit stubs, so don't try to build a 32-bit gcc
EXTRA_OECONF_append_x86_64 = " --disable-multilib"

And for gcc-cross-intermediate:

do_compile_prepend() {
         # On x86_64, glibc-initial stages crti.o to
         # x86_64-oe-linux/lib64/crti.o.
         # When gcc-cross-intermediate tries to build libgcc, it looks
         # for x86_64-oe-linux/lib/../lib64/crti.o.
         # Create the "lib" dir so this shenanigan works.
         install -d ${STAGING_DIR_TARGET}/lib
}

Mike


