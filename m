Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Oj7x4-00082m-H8 for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 11:50:27 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 11 Aug 2010 11:47:28 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Wed, 11 Aug 2010 11:50:11 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 11 Aug 2010 11:50:10 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 11 Aug 2010 11:50:09 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5F9E@deimsg40.de.net.world>
In-Reply-To: <AANLkTi=dR+jFv9rSRcPJ7R=3WZYR75nF5P9skD4SMUt1@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Why PREFERRED_VERSION setting of <distro>.conf
	overruleslocal.conf setting ?
Thread-Index: Acs5L373fO1a0wm2RNGnpIvEBcGb8QACC9TQ
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org><AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com>
	<AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com>
	<20100811062010.GB32300@jama><0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5F6D@deimsg40.de.net.world>
	<AANLkTi=dR+jFv9rSRcPJ7R=3WZYR75nF5P9skD4SMUt1@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 11 Aug 2010 09:50:10.0072 (UTC)
	FILETIME=[962EB180:01CB393A]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overruleslocal.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 09:50:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> well. if you want so many changes to an existing distro then something
is wrong
> with your distro choice. Few changes can be covered as it should be.

Don't understand me wrong, a little example what I mean:

I want to use some features in busybox the original DISTRO version don't
use (and the pinned package don't provide), other features of the
original setting I don't need or not allowed to use.
Therefore I have to use an overlay containing my needs (just a different
defconfig for the needed version of the package).

Additionally I need a very minimal busybox configuration for a
maintenance system on the same hardware. Therefore I have to use an
additional defconfig placed in a different package or overlay.

Both are very individual settings and are only flavors of the same
version of the busybox package.

One way to cover this needs is using different local.conf files
containing the different packages I want to use.
(setting preferred provider and version). --> needs the leading of
local.conf
May be can be done by the _local override as suggested, I have to try
it.

Other way is to create an individual distro or machine configuration in
my overlay, which drops me from the improvements of the main repository
and I need to cover all sub settings of the source machine or distro
settings in my own target distro or machine settings.=20
This procedure is a waste of work and is error-prone in my opinion.

A good way may be the handling of different flavors of the same package
by supporting sub configurations of the package by creating
individual packages with different configurations. Resulting in e. g.
busybox-<confx>-x.x.x packages I am able to install in an image.
For myself I don't have the knowledge to do such a change in bitbake or
OE.

Regards
Wolfgang Hauser


