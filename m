Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Jx41r-0005tb-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 19:47:39 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 482DD26E00002B59 for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 20:54:38 +0200
Received: from [192.168.95.168] (unknown [192.168.95.168])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 5344023EBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 19:45:43 +0200 (CEST)
Message-ID: <482DC846.1040301@bolloretelecom.eu>
Date: Fri, 16 May 2008 19:45:42 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.14eol) Gecko/20080509 Thunderbird/1.5.0.14eol
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g0ke5t$s9n$1@ger.gmane.org>
In-Reply-To: <g0ke5t$s9n$1@ger.gmane.org>
X-Enigmail-Version: 0.94.2.0
Subject: Re: disapproval or revision	462968658bdc2a3c48a8d634f9be59d450259f49
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
X-List-Received-Date: Fri, 16 May 2008 17:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Koen,

I guess our messages missed each other..

Koen Kooi wrote:
> Some days ago I fixed openssl-native so it doesn't put target flags
>  into the host build anymore:
>
> openssl-native: stop leaking target compile flags
> (FULL_OPTIMIZATION) into native build, it kills kittens.
>
> r462968658bdc2a3c48a8d634f9be59d450259f49 reverses that fix and
> breaks my build. So it has been disapproved.
>
My commit did *not* reverse your fix, I kept your FULL_OPTIMIZATION =3D
"", so these do not end up in the CFLAG variable. As explained in my
other email, CFLAG mustn't be exported, it breaks things as it
forcibly replace the compilation flags.

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFILchGCL1n3lVB9EYRAmkrAJ0aEZgrcN0AXsgdMZqVBizwzoecjQCgxzlO
x/cYM0HMpWrK1NVaRzSzuoE=3D
=3DJhkw
-----END PGP SIGNATURE-----



