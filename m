Received: from [203.10.110.92] (helo=mail.netspace.net.au)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@tucuxi.org>) id 1HBjbl-0001xf-21
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jan 2007 04:24:33 +0100
Received: from frontalis.tucuxi.org (220-253-146-206.VIC.netspace.net.au
	[220.253.146.206])
	by mail.netspace.net.au (Postfix) with ESMTP id 031411701F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2007 14:24:31 +1100 (EST)
Received: from localhost ([127.0.0.1])
	by frontalis.tucuxi.org with esmtpa (Exim 4.63)
	(envelope-from <oe@tucuxi.org>) id 1HBjbi-0002mG-88
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jan 2007 14:24:30 +1100
Message-ID: <45BEBA6E.7050408@tucuxi.org>
Date: Tue, 30 Jan 2007 14:24:30 +1100
From: Ben Stewart <oe@tucuxi.org>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070126091637.dsyf5wsolc0w4kcs@webmail.jerryweb.org>
In-Reply-To: <20070126091637.dsyf5wsolc0w4kcs@webmail.jerryweb.org>
X-Enigmail-Version: 0.94.2.0
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: oe@tucuxi.org
X-SA-Exim-Scanned: No (on frontalis.tucuxi.org);
	SAEximRunCond expanded to false
Subject: Re: [website] Problem with filebrowser and "+" sign
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2007 03:24:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeremy,

Jeremy Lain=E9 wrote:
> It looks as though there is a problem with the web interface to the
> MTN repository, I am unable to browse the following directory:

It appears that whereever you got the link to the gtk+ package did not
correctly escape the + as required by the HTTP specification, and the
file browser does not support the character even if encoded.

A note to the developer of the file browser - it appears the OE.org
filebrowser uses PHP (from the response headers), and the appropriate
encoding can be accomplished by using the function urlencode(), and the
output thereof should be encoded with htmlentities() before being dumped
to the browser.

Additionally, decoding the PATH_INFO to determine which directory to
show in the file browser can be accomplished by using urldecode(). Feel
free to drop me an email if there are any queries.

The 'proper' address for the directory in question would be as follows,
as the + character in the URL denotes a space (character 0x20)

http://www.openembedded.org/filebrowser/org.openembedded.dev/packages/gtk=
%2b

Regards

Ben Stewart
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFvrptUXHDLmlSHegRAvrgAJ9TlwznnzOyGme8jnmmLZqJacvq5gCdEm8u
Sbf1e/K65eh5i+EVzcXBnMg=3D
=3DSmhk
-----END PGP SIGNATURE-----


