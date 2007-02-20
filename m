Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJVMS-0007nf-6O
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 14:48:52 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1KDmfox028274 for <openembedded-devel@openembedded.org>;
	Tue, 20 Feb 2007 14:48:42 +0100
Message-ID: <45DAFC38.40000@dominion.kabel.utwente.nl>
Date: Tue, 20 Feb 2007 14:48:40 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45D98799.1080309@dominion.kabel.utwente.nl>	<200702191259.25200.openembedded@hrw.one.pl>	<45D9984C.6090705@dominion.kabel.utwente.nl>
	<45DAAEF4.50701@dominion.kabel.utwente.nl>
In-Reply-To: <45DAAEF4.50701@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Tue, 20 Feb 2007 13:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:

> Marcin and I merged a slightly different version of this today.

As some people found out, their upload scripts broke with this change. I'm sorry that
happened, but those scripts are more easily fixed than ipkg-utils :(
Due to bug in ipkg-utils being I haven't been using a straight rsync for a while now, so
for the curious:

rsync -az . user@remote.host:/feed/location/unsorted ; ssh user@remote.host 'cd
feed/location/unsorted ; sh sort.sh'

where sort.sh is http://www.angstrom-distribution.org/unstable/feed/unsorted/sort.sh.txt

And while you're at it, check wether your rsync uses --delete, and if not, check if you
remove Packages* before running ipkg-make-index. If that wasn't the case you have been
unknowingly suffering for a buggy Packages* for a while now. Combined with ipkg .163 on
the device I suspect 'ipkg upgrade' doesn't behave as deterministically as you might think.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2vw3MkyGM64RGpERAv9OAJ4ij31yxqCC8M855mQ8hUvhdj56UQCfVk4z
zfpTSMD0IajJc9VRF2dyuQA=
=rvcF
-----END PGP SIGNATURE-----


