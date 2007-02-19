Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJ7el-00087w-4E
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 13:30:13 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1JCU5Lr002936 for <openembedded-devel@openembedded.org>;
	Mon, 19 Feb 2007 13:30:06 +0100
Message-ID: <45D9984C.6090705@dominion.kabel.utwente.nl>
Date: Mon, 19 Feb 2007 13:30:04 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45D98799.1080309@dominion.kabel.utwente.nl>
	<200702191259.25200.openembedded@hrw.one.pl>
In-Reply-To: <200702191259.25200.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l1JCU5Lr002936
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
X-List-Received-Date: Mon, 19 Feb 2007 12:30:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia poniedzia=C5=82ek, 19 lutego 2007, Koen Kooi napisa=C5=82:
>=20
>> When using multimachine and ipkg deploy/ipk gets awfully crowded after
>> a while. I want to propose sorting it by subarch. Attached is a patch
>> that adds support for that to rootfs_ipk.bbclass.
>>
>> What do you think about that?
>=20
> I like this idea. ipkg-make-index is slow enough already.
>=20
> Attached fixed, tested version of your rootfs_ipk.bbclass change. Also=20
> added patch to package_ipk.bbclass which will store package in proper=20
> dir.

Nice

> -	echo "src oe file:${DEPLOY_DIR_IPK}" > ${T}/ipkg.conf

This breaks backward compat, could you add that back in?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2ZhMMkyGM64RGpERAtwOAJ0d4gxAt3a/XFjsJP+5xFvsapJdswCePBQN
QCZEkVp954PrWVq1QERxVtQ=3D
=3DQtcf
-----END PGP SIGNATURE-----


