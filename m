Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OQwzN-0005Yu-Mx
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 08:29:42 +0200
Received: from mail75-va3-R.bigfish.com (10.7.14.246) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	8.1.340.0; Tue, 22 Jun 2010 06:09:58 +0000
Received: from mail75-va3 (localhost.localdomain [127.0.0.1])	by
	mail75-va3-R.bigfish.com (Postfix) with ESMTP id 4B29B1900101	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 06:09:58 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VPS-12(zz14ffO1443Nzz1202hzzz32i2a8h43h66h)
Received: from mail75-va3 (localhost.localdomain [127.0.0.1]) by mail75-va3
	(MessageSwitch) id 12771869983000_3832;
	Tue, 22 Jun 2010 06:09:58 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.237])	by
	mail75-va3.bigfish.com (Postfix) with ESMTP id EE72017D8051	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 06:09:57 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	VA3EHSMHS006.bigfish.com (10.7.99.16) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Tue, 22 Jun 2010 06:09:51 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Tue, 22 Jun 2010 11:39:48 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Jun 2010 11:35:48 +0530
Thread-Topic: Qt-4.7.0.beta1 Missing or unbuildable dependency chain was:
	['qt4-embedded-mkspecs']
Thread-Index: AQHLEdD2i9G+PtrxAE+jzpr2XgbGqw==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CFB6@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 216.32.180.13
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Qt-4.7.0.beta1 Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
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
X-List-Received-Date: Tue, 22 Jun 2010 06:29:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

      I am trying to build Qt Embedded SDK for Qt-4.7.0.beta1.. when i run
bitbake meta-toolchain-avn-qte i got the following error


NOTE: Handling BitBake files: - (0169/0169) [100 %]
NOTE: Parsing finished. 163 cached, 5 parsed, 1 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/likewise-open/KPIT/soumyar/openembedded/recipes/tasks/task-=
avn-qte-toolchain-target.bb']' RDEPENDS/RRECOMMENDS or otherwise requires t=
he runtime entity 'qt4-embedded-mkspecs' but it wasn't found in any PACKAGE=
 or RPROVIDES variables
NOTE: Runtime target 'qt4-embedded-mkspecs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qt4-embedded-mkspecs']
NOTE: Runtime target 'task-avn-qte-toolchain-target' is unbuildable, removi=
ng...
Missing or unbuildable dependency chain was: ['task-avn-qte-toolchain-targe=
t', 'qt4-embedded-mkspecs']
ERROR: Required build target 'meta-toolchain-avn-qte' has no buildable prov=
iders.
Missing or unbuildable dependency chain was: ['meta-toolchain-avn-qte', 'ta=
sk-avn-qte-toolchain-target', 'qt4-embedded-mkspecs']

     It is asking for runtime dependencies  'qt4-embedded-mkspecs' how do I=
 get these packages???

Thanks in advance:-)


Regards,
Soumya

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Cummins Infosystems Ltd. It is intended only =
for the person to whom it is addressed. If you are not the intended recipie=
nt, you are not authorized to read, print, retain copy, disseminate, distri=
bute, or use this message or any part thereof. If you receive this message =
in error, please notify the sender immediately and delete all copies of thi=
s message. KPIT Cummins Infosystems Ltd. does not accept any liability for =
virus infected mails.




