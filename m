Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OocSR-0001ZQ-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 15:25:32 +0200
Received: from mail58-db3-R.bigfish.com (10.3.81.244) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	8.1.436.0; Thu, 26 Aug 2010 13:24:57 +0000
Received: from mail58-db3 (localhost.localdomain [127.0.0.1])	by
	mail58-db3-R.bigfish.com (Postfix) with ESMTP id 580EB13E8494	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 13:24:57 +0000 (UTC)
X-SpamScore: -4
X-BigFish: VPS-4(z41ddkz9371Pzz1202hzz8275dhz32i2a8h43h61h)
Received: from mail58-db3 (localhost.localdomain [127.0.0.1]) by mail58-db3
	(MessageSwitch) id 1282829094919814_21986;
	Thu, 26 Aug 2010 13:24:54 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.242])	by
	mail58-db3.bigfish.com (Postfix) with ESMTP id B4973760051	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 13:24:54 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	DB3EHSMHS009.bigfish.com (10.3.87.109) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 26 Aug 2010 13:24:53 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Thu, 26 Aug 2010 18:54:52 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Aug 2010 18:54:51 +0530
Thread-Topic: [oe] stripping qt4-embedded
Thread-Index: ActFFNCO8zeapt6RQ02OjBAOXQhyigADDe0Y
Message-ID: <76E258664B189C4CBEF125491CA11ECC9457D64EDA@KCINPUNHJCMS01.kpit.com>
References: <20100826111849.bf99cfff@mail.altenpts.nl>
In-Reply-To: <20100826111849.bf99cfff@mail.altenpts.nl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 213.199.154.144
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: stripping qt4-embedded
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
X-List-Received-Date: Thu, 26 Aug 2010 13:25:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
  Change the QT_CONFIG_FLAGS to -nomake examples -nomake demos in the recip=
e.

Hope it helps :)
________________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Bas van den Berg [bberg@mail.=
altenpts.nl]
Sent: Thursday, August 26, 2010 4:48 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] stripping qt4-embedded

Hi,

when building qt4-embedded, you get a lot of stuff by default:
        qt4-embedded-examples
        qt4-embedded-demos
       libqtwebkite4
          libqt... (many)

I tried changing the recipe to get rid of these, but to no effect. The reci=
pes for
qt4 seems to be the most complex of all recipes ;], so no wonder..
Would the EXCLUDE like in the toolchain recipes work for qt4-embedded?
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




