Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IvTj8-0007MO-66
	for openembedded-devel@openembedded.org; Fri, 23 Nov 2007 09:17:30 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAN8F1Zn019202 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 09:15:01 +0100
Message-ID: <47468C05.3090600@student.utwente.nl>
Date: Fri, 23 Nov 2007 09:15:01 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IvR63-00056z-6R@linuxtogo.org>
In-Reply-To: <E1IvR63-00056z-6R@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev gcc-(cross)_4.1.2: enable gfortran and gfortran packaging
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
X-List-Received-Date: Fri, 23 Nov 2007 08:17:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

xjqian commit schreef:
> gcc-(cross)_4.1.2: enable gfortran and gfortran packaging

>  	# Symlinks so we can use these trivially on the target
>  	ln -sf ${TARGET_SYS}-g77 g77
> +	ln -sf ${TARGET_SYS}-gfortran gfortran
>  	ln -sf ${TARGET_SYS}-g++ g++
>  	ln -sf ${TARGET_SYS}-gcc gcc
>  	ln -sf g77 f77
> +	ln -sf gfortran f95
>  	ln -sf g++ c++
>  	ln -sf gcc cc
>  	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${base_libdir}/cpp

Could you add ' || true ' after those link statements so that people can
disable fortran if they want?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHRowFMkyGM64RGpERAiptAJ9ufZC4BZ9cO0g/Zj0o02zJ58/MSQCfb9g9
ELzF5TslmIcdDP/skppT0sQ=
=soTy
-----END PGP SIGNATURE-----


