Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1P6Osf-0008Km-13 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:34:05 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 14 Oct 2010 16:25:40 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Thu, 14 Oct 2010 16:33:25 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 14 Oct 2010 16:33:25 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 14 Oct 2010 16:33:24 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501B11B1A@deimsg40.de.net.world>
In-Reply-To: <AANLkTi=hDDtueQerTUy9FTcpoCbJ9AYozok=-XBkWe7R@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] S98configure role
Thread-Index: ActrqHQPw8oOP021TgK1VAbcPx/DYgAACs9A
References: <26434292.80091287048749327.JavaMail.defaultUser@defaultHost>
	<AANLkTi=hDDtueQerTUy9FTcpoCbJ9AYozok=-XBkWe7R@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 14 Oct 2010 14:33:25.0381 (UTC)
	FILETIME=[C29D0B50:01CB6BAC]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: S98configure role
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
X-List-Received-Date: Thu, 14 Oct 2010 14:34:05 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

for me the S98configure is a NO GO !
I have to provide read only images that have to be used w/o any first =
boot configurations.

For me there is no necessary to final install a image at first boot.

Normally all configurations are able to be done at image creation time =
by some scripting.=20
For example, adding a user can be done by scripting, and not necessarily =
have to be done by adduser/addgroup.

Its up to the recipes to create packages which are installable offline =
totally and completely.

Handling of individual settings like serial numbers, keys ... for me =
should not be a matter of first boot.
It may be a matter of flashing(environment partition) or special =
configuration partitions.

There may be some cases, a first boot installation is necessary, but for =
me it is better to have an unmodified/unmodifieable image on the target.

Regards
Wolfgang

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Chris Larson
Gesendet: Donnerstag, 14. Oktober 2010 16:02
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] S98configure role

On Thu, Oct 14, 2010 at 2:32 AM, l.bolognini@tiscali.it <
l.bolognini@tiscali.it> wrote:

> I'm wondering what is the role of this script, placed in /etc/rcS.d.
>
> What I guess is that, for some reasons, some packages get installed =
but
> not configured (then unpacked) since their postinstall script returns
> non zero value.
>

Yes, this is correct.  Some postinsts do things which can be done at =
image
creation time on the build machine, but not all.  Those which must *run* =
the
binaries in the filesystem, for example, cannot be run at build time, so
must be run at first boot time on the target.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


