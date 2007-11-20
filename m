Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IuaIL-0006eF-3T
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 22:06:09 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAKL3kZn002506 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 22:03:47 +0100
Message-ID: <47434BB3.2010705@student.utwente.nl>
Date: Tue, 20 Nov 2007 22:03:47 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IuZKt-0006pg-Ms@linuxtogo.org>
In-Reply-To: <E1IuZKt-0006pg-Ms@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev Add cryptsetup: cryptsetup with luks support creates and manages encrypted containers and partitions
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
X-List-Received-Date: Tue, 20 Nov 2007 21:06:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

coredump2 commit schreef:


> +######################################################################################
> +######################################################################################
> +######################################################################################
> +######################################################################################

Please read (and follow) the styleguide and run the recipe through
OE-stylize.py to get an idea how it should look like.



> +pkg_postinst() {
> +	if test "x$D" = "x"
> +	then 
> +		# Work around a problem in module ipk's, where depmod is not always
> +		# run after installing a kernel-module.
> +		test -x /sbin/depmod && /sbin/depmod -a
> +		/bin/true
> +	fi

And don't add such hacks, please remove it.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHQ0uzMkyGM64RGpERAr6iAJ9zEuSosMdbDNhiUYbYx/UA8N+OpwCfXTO9
yt+9HhZoJGQV8fWr57FAmTs=
=JSkU
-----END PGP SIGNATURE-----


