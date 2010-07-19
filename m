Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OallW-0005oC-IW for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 10:32:00 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 19 Jul 2010 10:22:41 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 19 Jul 2010 10:31:40 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 19 Jul 2010 10:31:39 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 19 Jul 2010 10:31:21 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B52D1@deimsg40.de.net.world>
In-Reply-To: <4C4354EF.1080004@vollmann.ch>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [Bitbake-dev]  A new bitbake extension: .bbappend files
Thread-Index: Acsmrxs3N9gGEQ7ZRa+YkvNJaZOJ0AAbMZfg
References: <1279290319.10837.1747.camel@rex>
	<4C42D208.2000909@vollmann.ch><AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com><4C43255B.3000601@vollmann.ch><AANLkTilan1WpQ8ygbi4Dg3HLgRwyggP66X_-xlT1VB5r@mail.gmail.com>
	<4C4354EF.1080004@vollmann.ch>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 19 Jul 2010 08:31:39.0346 (UTC)
	FILETIME=[CEDEB320:01CB271C]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Mon, 19 Jul 2010 08:32:00 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>I'd be very interested to find a way so that a 'require gcc.inc' in
>myproject/recipes/gcc_4.4.4.bb would find
oe-stable/recipes/gcc/gcc.inc.
>So far I failed.

Try to add the relative path of the .inc to your require statement:
'require recipes/gcc/gcc.inc'
(see also the arago overlays as example) my overlays are working in this
way.
The problem was, all require statements should be done in this way, so
the building of overlays would be much easier.

Wolfgang


