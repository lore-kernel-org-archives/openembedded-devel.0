Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OWSyr-0004DY-Ia for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 13:39:58 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 07 Jul 2010 13:25:46 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 7 Jul 2010 13:34:47 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 7 Jul 2010 13:34:47 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 7 Jul 2010 13:34:40 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C3E@deimsg40.de.net.world>
In-Reply-To: <1278498389.2345.1744.camel@mill.internal.reciva.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Is there a recipe for building and using busybox with
	libbusybox out there ?
Thread-Index: Acsdvw405y/0goAaSmWFC6SyS4/mfgAB/YHw
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world>
	<1278498389.2345.1744.camel@mill.internal.reciva.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 07 Jul 2010 11:34:47.0235 (UTC)
	FILETIME=[67348130:01CB1DC8]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is there a recipe for building and using busybox with libbusybox out there ?
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
X-List-Received-Date: Wed, 07 Jul 2010 11:39:58 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, what memory footprint do you mean, the image or the ram ?

If I have to run several busybox applets at a time, e.g. sh, inetd, =
ftpd, telnetd, syslogd ... it would probably be better to load the =
shared library once and share it by the applets.

May be I am wrong, but the shared library overhead isn't that big at =
runtime. Especially if several applets are running at the same time.

Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Phil Blundell
Gesendet: Mittwoch, 7. Juli 2010 12:26
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Is there a recipe for building and using busybox with =
libbusybox out there ?

On Wed, 2010-07-07 at 11:45 +0200, Hauser, Wolfgang (external) wrote:
> I want to use busybox with the applet binaries linked against =
libbusybox
> in our system.
> We need a wide range of applets at the same time, so I suppose it will
> save overall needed memory space.

What's the advantage of this?  I would have thought it would give you a
larger memory footprint rather than a smaller one.  I guess I must be
missing something.

> Also I want to prevent the system from updating alternatives while the
> first boot. We have to provide a read only root file system.

Yeah, this is a long-standing piece of OE suckage.  We should fix the
alternative selection to work at image construction time.

p.



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


