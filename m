Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1IG7sy-0002u9-QY; Wed, 01 Aug 2007 08:40:44 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l716cm1R002268; Wed, 1 Aug 2007 08:38:48 +0200
Message-ID: <46B02A79.3020308@dominion.kabel.utwente.nl>
Date: Wed, 01 Aug 2007 08:38:49 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IG1ZN-0003VH-Ds@linuxtogo.org>
In-Reply-To: <E1IG1ZN-0003VH-Ds@linuxtogo.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Michael Lauer <mickey@vanille-media.de>,
	openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev openmoko-panel-plugins: prepare for SVNREV
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
X-List-Received-Date: Wed, 01 Aug 2007 06:40:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- From oe-devel, a few days ago:

Richard Purdie schreef:
> Hi,
>
> As people know the ability to build the latest head revisions of svn
> (for example) repositories in OE with bitbake has been limited and less
> than ideal.
>

[...]

> Migration Path
> ==============
>
> SRCREV *CANNOT* be used by packages in OE.dev until we bump the version
> requirement to bitbake 1.8.8 assuming that contains these changes. We
> need to decide how much of the above we want to implement before 1.8.8
> and test svn heavily before that release (with people testing SRCREV
> *LOCALLY* if possible). Once the minimum version is 1.8.8 we can look at
> converting the svn packages in OE.dev.

from oe-commits, yesterday:

mickeyl commit schreef:
> openmoko-panel-plugins: prepare for SVNREV

> -PV = "0.0.1+svn${SRCDATE}"
> +PV = "0.1.0+svnr${SRCREV}"

So, which one is right? Are we converting everything to SRCREV now, or should we revert
the openmoko stuff?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsCp5MkyGM64RGpERAoLTAKCZECVt9zDjSrlLXPyWudcy3YOcmwCfew8H
0Sf4yfknLoebkfVtaY/kuPU=
=8f3d
-----END PGP SIGNATURE-----


