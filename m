Received: from smtpauth13.prod.mesa1.secureserver.net ([64.202.165.37])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NVdIL-0002ZQ-Ru
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 04:56:25 +0100
Received: (qmail 5120 invoked from network); 15 Jan 2010 03:47:29 -0000
Received: from unknown (209.242.7.187)
	by smtpauth13.prod.mesa1.secureserver.net (64.202.165.37) with ESMTP;
	15 Jan 2010 03:47:28 -0000
Message-ID: <4B4FE54D.3070402@mwester.net>
Date: Thu, 14 Jan 2010 21:47:25 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <>
	<1263455739-13595-1-git-send-email-camelguo@gmail.com>	<201001141014.53764.marcin@juszkiewicz.com.pl>	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
X-SA-Exim-Connect-IP: 64.202.165.37
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 03:56:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Guo Hongruan wrote:
> After applying my patch, all everything built based on uclibc will be
> placed in some directories different with glibc,eglibc. The stamps will
> be placed in ${TMPDIR}/stamps/${LIBC}, the package data will be placed
> in ${TMPDIR}/pkgdata/${LIBC} and so on. So you can see, when I tried to
> build lots of projects (with different libc), their data will never
> bother each other. In you way, we must select different TMPDIR for
> different libc, that are very convenient for incremental building by QA.

But most -- in fact all except perhaps yourself and a few of the OE core
team don't build with different LIBCs in the same TMPDIR.  So all that
your patch does for the overwhelming number of users of OE is add
additional directory levels to an already complicated directory
structure, and provides them with absolutely no benefit whatsoever.

At the very least, you really should provide a means to selectively
enable this -- although I still don't see why it makes sense to support
multiple LIBCs in the same TMPDIR.

-Mike (mwester)


