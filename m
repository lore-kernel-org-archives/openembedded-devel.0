Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lu65X-0004aX-Ex
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 16:27:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 46EB31409717
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 16:25:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zl8Z850sza7a
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 16:25:38 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 1D4BF1416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 16:25:38 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200904151752.13116.khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239800506.21612.79.camel@hammer.suse.cz>
	<1239802376.21612.91.camel@hammer.suse.cz>
	<200904151752.13116.khimov@altell.ru>
Date: Wed, 15 Apr 2009 16:23:54 +0200
Message-Id: <1239805434.21612.128.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 14:27:45 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Roman I Khimov wrote:
> On Wednesday 15 April 2009 17:32:56 Stanislav Brabec wrote:

> > Both 32 bit and 64 bit libfoo will use this helper.
>=20
> Given the nature of libexec dir that might be nice to have, so we would=
n't=20
> override libexecdir but just not package it for 32-bit arch.

Exactly. Cross-arch exec() is possible.

Just for your info. openSUSE makes bi-arch in following way:

- Compile everything for i586 (in i586 build environment)

- Compile everything for x86_64 (in x86_64 build environment)

- Run baselibs utility, on i586 packages and extract libraries and
  possible extra stuff to -32bit packages. Baselibs utility can be
  configured per package.

- Make single repository from the stuff above.

The same works for ppc/ppc64 and s390/s390x.

> Just one thing - couldn't there be any situation where libexec program =
output=20
> would be different for primary and supplementary architectures?

Yes, it can happen, but I am not aware of any real example.

But arch-dependent include files are not rare. Hopefully, most upstream
developers are aware of bi-arch problem and package platform specific
includes to libdir instead of includedir.

Example:
/usr/lib64/glib-2.0/include/glibconfig.h

You need extra rule for packaging of such stuff. Also glibc-dev would
need extra rules.

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



