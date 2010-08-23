Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OnTBe-0002Ae-Ne
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:19:42 +0200
Received: from mail63-am1-R.bigfish.com (10.3.201.248) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	8.1.240.5; Mon, 23 Aug 2010 09:03:50 +0000
Received: from mail63-am1 (localhost.localdomain [127.0.0.1])	by
	mail63-am1-R.bigfish.com (Postfix) with ESMTP id 5F16E97834D	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 09:03:50 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VPS-12(zz14ffO1443Nzz1202hzzz32i2a8h63h)
Received: from mail63-am1 (localhost.localdomain [127.0.0.1]) by mail63-am1
	(MessageSwitch) id 1282554230204740_31803;
	Mon, 23 Aug 2010 09:03:50 +0000 (UTC)
Received: from am1ehsmhs004.bigfish.com (unknown [10.3.201.250])	by
	mail63-am1.bigfish.com (Postfix) with ESMTP id 21D65117004E	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 09:03:50 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	am1ehsmhs004.bigfish.com (10.3.207.104) with Microsoft SMTP Server
	(TLS) id 14.0.482.44; Mon, 23 Aug 2010 09:03:50 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Mon, 23 Aug 2010 14:33:46 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Aug 2010 14:33:45 +0530
Thread-Topic: Issue regarding integrating Qt with OpenGL ES 2.0
Thread-Index: AQHLQqIXbGFws1hrIkKpAaCbZMxpbw==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9457D64ECC@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 213.199.154.208
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Issue regarding integrating Qt with OpenGL ES 2.0
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
X-List-Received-Date: Mon, 23 Aug 2010 09:19:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

    I need to integrate Qt with OpenGl Es 2.0 for mipsel db1300. I am new t=
o OpenGL . I just included qt-embedded-gles in my image avn-gles-image. =

When i run my image  =


bitbake avn-gles-image
NOTE: Handling BitBake files: | (0385/0385) [100 %]
NOTE: Parsing finished. 368 cached, 13 parsed, 4 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'qt4-embedded-gles' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qt4-embedded-gles', 'virtual=
/egl']
ERROR: Required build target 'avn-gles-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['avn-gles-image', 'qt4-embedd=
ed-gles', 'virtual/egl']..

  In the recipes i could not find egl recipe. =


If I write our own recipe for egl , what does the source code should contai=
n ? . Any Similar recipe is present which i can look into and do the same f=
or egl.
I am new to this please guide me how can i start with it.

Thanks in advance

Regards,
Soumya




