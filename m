Received: from [66.39.3.90] (helo=wbm12.pair.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1KLvtI-0007tk-UJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 10:09:37 +0200
Received: by wbm12.pair.net (Postfix, from userid 65534)
	id 1DBFE6CC25; Thu, 24 Jul 2008 04:08:23 -0400 (EDT)
Received: from 78.86.188.127 ([78.86.188.127])
	(SquirrelMail authenticated user blueligh@bluelightning.org)
	by webmail12.pair.com with HTTP;
	Thu, 24 Jul 2008 20:08:23 +1200 (NZST)
Message-ID: <1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
In-Reply-To: <g69aeh$5cu$1@ger.gmane.org>
References: <200807240048.20980.bluelightning@bluelightning.org>
	<g69aeh$5cu$1@ger.gmane.org>
Date: Thu, 24 Jul 2008 20:08:23 +1200 (NZST)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.5
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 08:09:37 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Never ever rdepend on a kernelmodules, since it might be built in to th=
e
> kernel in the future (like it was in the past), only use
>
> RRECOMMENDS_${PN} =3D "kernel-module-foo"

OK, so please excuse my ignorance and I don't have OE in front of me to
test it, but does that mean that kernel-module-mtdblock will be included
in images where h2200-bootloader is included? If not, then it needs to be
done some other way.

Cheers,
Paul


