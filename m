Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PSwGT-0004ry-Ek
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 19:39:51 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBFIcAmf016033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 12:38:10 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBFIcAAd008682
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 12:38:10 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBFIcAsU015312
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 12:38:10 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 15 Dec 2010 12:38:10 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Dec 2010 12:38:07 -0600
Thread-Topic: [RFC] move openssl.cnf file into base openssl package
Thread-Index: Acuchzd7eDj9Zk2cRqeyITHzaVRFMA==
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] move openssl.cnf file into base openssl package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Wed, 15 Dec 2010 18:39:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

Currently in openssl.inc the openssl.cnf file is being placed in the openss=
l-misc package.  However, when running the openssl command you will frequen=
tly receive warnings about this configuration file missing.  i.e.:

WARNING: can't open config file: /usr/lib/ssl/openssl.cnf

Also, when running the command "openssl req" to request and generate a cert=
ificate the command will fail without the openssl.cnf file being installed =
on the target system. i.e.

WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
Unable to load config info from /usr/lib/ssl/openssl.cnf

Is there a reason why this file is placed in the misc package since it seem=
s to be either looked for or required by the openssl executable shipped in =
the base openssl package?

From the log I see that the openssl.cnf file was originally added to the li=
bcrypto package since it was accessed directly from libcrypto (commit f95a9=
5435ca79e7b9942b6e321d30e264c728791).  I then see that it was moved the fil=
e to the misc package to make different libcrypto versions parallel install=
able (commit 26b7d6514111d5ac0171c1834fa85d4576d783bf) but no other justifi=
cation as to why the .cnf was placed in the misc instead of base package.

I have a patch to move the openssl.cnf file into the openssl package but I =
wanted to better understand why this file was not already in the openssl pa=
ckage before submitting my patch.=20

Sincerely,
Chase Maupin



