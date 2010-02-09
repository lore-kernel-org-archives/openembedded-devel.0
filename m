Received: from fmmailgate02.web.de ([217.72.192.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NelxZ-000830-Qg
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 10:00:44 +0100
Received: from smtp05.web.de (fmsmtp05.dlan.cinetic.de [172.20.4.166])
	by fmmailgate02.web.de (Postfix) with ESMTP id 7050214D5C1A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 09:58:09 +0100 (CET)
Received: from [79.215.2.96] (helo=merkur.sol.de)
	by smtp05.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.110 #314) id 1Nelv7-0004pA-00
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:58:09 +0100
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1Neli6-0002N4-SR
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:44:43 +0100
Date: Tue, 9 Feb 2010 09:44:42 +0100
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209084441.GA9094@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20100208173821.GA24852@ibawizard.net>
	<1265658612-19262-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
In-Reply-To: <1265658612-19262-1-git-send-email-ynezz@true.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: tux-master@web.de
X-Sender: tux-master@web.de
X-Provags-ID: V01U2FsdGVkX1+Jfkt6pz91RzKDrLvX0nZIZbdcWWcD7dkH4cNL
	ecw73+ullEYh0BRsUwusmyPrjeulD90tcFrjyar6MtNC2qJHF7 5WIwF6TPQ=
X-SA-Exim-Connect-IP: 217.72.192.227
X-SA-Exim-Mail-From: tux-master@web.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] mc 4.6.2: fix do_configure error on missing	config.rpath
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
X-List-Received-Date: Tue, 09 Feb 2010 09:00:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2010 at 08:50:12PM +0100, Petr =C5=A0tetiar wrote:
> This patch fixes configure error, complaining about missing config.rpat=
h file
> which gets deleted by autofoo in recipe, so to avoid error bellow we cr=
eate
> empty file, making configure happy.
=20
> configure.ac:104: required file `config/config.rpath' not found
> [...snip...]
> autoreconf: automake failed with exit status: 1
> FATAL: autoreconf execution failed.

> @@ -86,4 +86,6 @@ AUTOFOO=3D"config.guess config.rpath config.sub depco=
mp install-sh missing mkinsta
>           for i in ${AUTOFOO}; do
>             rm config/${i}
>           done
> +         # raises error if it's not found
> +         touch config/config.rpath
>  }

Mhm, and you know that this patch is right? If config.rpath is called it =
is
expected that it sets a few variables such as shlibext (normally to "so")=
,
libext ("a") but this does not happen with an empty config.rpath. This pa=
tch
may indeed fix the current error but what about support for all platforms=
?
I would ship a proper file instead of a faked one and I mentioned that e.=
g.
autopoint creates this file ...

Jens


