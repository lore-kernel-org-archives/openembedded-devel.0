Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Okxjq-0002KC-7q for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 13:20:24 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 16 Aug 2010 13:08:47 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 16 Aug 2010 13:20:03 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 16 Aug 2010 13:20:03 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 16 Aug 2010 13:20:01 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B6174@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: image.bbclass (rootfs_ipk.bbclass) should run package pre- and
	postinstall routines in package dependency order
Thread-Index: Acs9NPd/45ROzqv4R4K6YRB7gM07Tg==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 16 Aug 2010 11:20:03.0331 (UTC)
	FILETIME=[F8E17530:01CB3D34]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: image.bbclass (rootfs_ipk.bbclass) should run package pre- and postinstall routines in package dependency order
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
X-List-Received-Date: Mon, 16 Aug 2010 11:20:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I need to reconfigure some packages in my image, therefore I added some
additional packages for configuring.
I assumed, the packages are installed and configured in proper order
while creating an image by bitbake.

But at the time, the package pre- and postinstalls are executed in
alphabetic order
by searching the path ../usr/lib/opkg/info/ for *.preinst/*.postinst
while creating an image.

This cause problems because the install scripts of my configure packages
need some data from the
package(s) they depend on.

If I install the packages on the target, all is done well.

It may be better to resolve the dependency chain and use this list to
run the
pre- and postinstall routines of the packages in order of dependency.

It may be possible to create this dependency list by using opkg
whatdepends -A
<package>, or to use the bitbake internal order information of the
packages.

This should be a proposal for changing the behavior, I am not able to do
such a change, I don't have the necessary knowledge in bitbake at the
time.

Or is there an other solution, except pinning the needed order by naming
of the packages in the right alphabetic order.

Wolfgang Hauser


