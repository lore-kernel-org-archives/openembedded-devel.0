Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IlHAF-0002za-3W
	for openembedded-devel@openembedded.org; Fri, 26 Oct 2007 06:51:19 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9Q4hdUx029610; Fri, 26 Oct 2007 06:43:39 +0200
Message-ID: <47217083.4000103@student.utwente.nl>
Date: Fri, 26 Oct 2007 06:43:47 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IlBjn-00084R-Qk@linuxtogo.org>
In-Reply-To: <E1IlBjn-00084R-Qk@linuxtogo.org>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev packages/webkit: Build and package naming fixes (when using debian renaming)
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
X-List-Received-Date: Fri, 26 Oct 2007 04:51:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

freyther commit schreef:
> packages/webkit: Build and package naming fixes (when using debian renaming)
>     We do not want the package to be named libwebkitgtk-launcher but want to
>     keep the webkit-gtklauncher names. 

Do we? I created and maintain those recipes, and I made the decision to
name it libwebkitgtk-launcher when using debian naming. I would have
used DEBIAN_NOAUTONAME_webkit-gtklauncher otherwise. Which brings me to
my second point:


> +python populate_packages_prepend() {
> +    print "foooo"
> +    print bb.data.getVar("DEBIAN_NAMES", d, True)
> +    if bb.data.getVar("DEBIAN_NAMES", d, True):
> +        base = bb.data.expand("${PN}launcher", d, True)
> +        bb.data.setVar("PKG_%s" % base, base, d)
> +        bb.data.setVar("PKG_%s-dbg" % base, "%s-dbg" % base, d)
> +}

Using python is unneeded and confusing. And as webkit maintainerin OE, I
don't want those in the recipes.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHIXCDMkyGM64RGpERAqZuAKCsK/Dxm1EPgk0qEp+20dixabuHYwCeLTLv
Ztk68CUYd2ByaVgFxEh+67M=
=e/yc
-----END PGP SIGNATURE-----


