Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1mNS-0004ud-J0
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 21:34:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 8D2B61416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 21:29:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUR6dAUBq+Wx
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 21:29:36 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 5D7991416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 21:29:35 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256409932.15214.67.camel@lenovo.internal.reciva.com>
References: <1256398757.4681.0@zaurus>
	<1256409932.15214.67.camel@lenovo.internal.reciva.com>
Date: Sat, 24 Oct 2009 21:33:11 +0200
Message-Id: <1256412791.11033.10.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 19:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> but it isn't entirely obvious to me why one would (in general)
> want to install such a library.  Do you know what the actual use-case
> for libstdc++_pic is?  If this is for mklibs-style library reduction
> then it probably belongs in yet another subpackage if anywhere.

I guess that it makes possible to create libraries that=EF=BB=BF are writ=
ten in
C++ but don't depend on libstdc++. It also contains PIC code of
libsupc++.

Reference: /OE/build/static/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-4=
.3.3-r7.1/gcc-4.3.3/libstdc++-v3/src/Makefile.am

_pic.a libraries are typically useful for large convoluted libraries
containing many independent function sets, e. g. mathematical libraries.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



