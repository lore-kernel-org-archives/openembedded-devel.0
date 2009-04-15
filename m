Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lu7eL-0003Dl-3O
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 18:07:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 9D7C51409731
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 18:05:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcRuQLyFL7Sx
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 18:05:39 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 7D7C71416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 18:05:39 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200904151855.34947.khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<200904151752.13116.khimov@altell.ru>
	<1239805434.21612.128.camel@hammer.suse.cz>
	<200904151855.34947.khimov@altell.ru>
Date: Wed, 15 Apr 2009 18:03:54 +0200
Message-Id: <1239811434.21612.153.camel@hammer.suse.cz>
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
X-List-Received-Date: Wed, 15 Apr 2009 16:07:48 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Roman I Khimov wrote:

> Which would require some management for multiple build trees

It is not a problem, just build in another directory and your OE build
trees will be completely independent. You should be even share the same
tree environment with different config files. The only situation when OE
will fail would be (host_triplet =3D=3D build_triplet), because staging a=
nd
build root will go into the same directory. It needs fix in OE.

> and then some=20
> cross-build-trees dependency things.

Do you really need it? The whole openSUSE project is a bi-arch, but it
can live without cross-build trees. Baselibs utility operates on final
binary packages. Only compiler for build system compiler you may want to
provide 32-bit target support.

> Certainly possible, but not sure any=20
> easier. Or am I missing something?

If you are trying to build x86_64 compiler for i586 target on an
arbitrary host, then you may recycle generic support for canadian
toolchain, that was added few months ago (well I did not tried it yet).

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



