Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HK0An-000704-3l
	for openembedded-devel@openembedded.org; Wed, 21 Feb 2007 23:42:53 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1LMgoLr018694 for <openembedded-devel@openembedded.org>;
	Wed, 21 Feb 2007 23:42:50 +0100
Message-ID: <45DCCAEB.9010603@dominion.kabel.utwente.nl>
Date: Wed, 21 Feb 2007 23:42:51 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45DCC76A.7000002@dominion.kabel.utwente.nl>
In-Reply-To: <45DCC76A.7000002@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: QA issues with pkgconfig files
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
X-List-Received-Date: Wed, 21 Feb 2007 22:42:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:

> Possible solutions:
> 
> 1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
>    +easy fix
>    -requires to re-run do_pupulate_staging for all packages
> 2) symlink one dir to the other
>    +fixes hardcoded paths
>    -requires manual intervention to fixup files present and/or complete rebuild
> 3) have pkgconfig.bbclass delete one dir each run
>    -requires every packages that has .pc files to inherit pkgconfig
>    -ugly
>    -error-prone
> 
> Do you have any other solutions, and if not, which solution do you prefer?

4) have pkgconfig.bbclass sed _every_ .pc file in staging each run.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3MrrMkyGM64RGpERAhy+AKCZIduV69i0NBVTtPgSRejWPxuuOwCdGMfN
5ZLOhkb6HKJEs+jzJ6o1nNI=
=w7yI
-----END PGP SIGNATURE-----


