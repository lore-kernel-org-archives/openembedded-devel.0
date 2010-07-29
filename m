Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OeUtA-0002nS-VV for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 17:19:47 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 29 Jul 2010 17:09:00 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 29 Jul 2010 17:18:48 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 29 Jul 2010 17:18:48 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 29 Jul 2010 17:18:46 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5958@deimsg40.de.net.world>
In-Reply-To: <20100729151333.GA5867@mi.fu-berlin.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] eggdbus-native fails to build, dbus-glib-1.so is missing
Thread-Index: AcsvMQoyXHFyG9ELTBKQxUKoZWj5DAAABUaA
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B58E2@deimsg40.de.net.world>
	<20100729151333.GA5867@mi.fu-berlin.de>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 29 Jul 2010 15:18:48.0289 (UTC)
	FILETIME=[57C91510:01CB2F31]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eggdbus-native fails to build, dbus-glib-1.so is missing
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
X-List-Received-Date: Thu, 29 Jul 2010 15:19:48 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

it is fixed, forgot to git pull in the morning today.

Regards
Wolfgang Hauser
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Henning Heinold
Gesendet: Donnerstag, 29. Juli 2010 17:14
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] eggdbus-native fails to build, dbus-glib-1.so is =
missing

On Thu, Jul 29, 2010 at 12:12:40PM +0200, Hauser, Wolfgang (external) =
wrote:
> Hello,
>=20
> the latest pull of http://git.gitourious.org/angstrom/openembedded.git
> results in a missing dbus-glib-1.so while linking eggdbus.
>=20
> The problem was in dbus-glib.inc, where the glib-dbus-native staging
> package don't include the shared library, the pkg-config.pc is
> available.
>=20
> Seems, that the changes of the staging cause the error, an older =
version
> of OE containing a dbus-glib-native recipe was working well.
>=20
> Regards
> Wolfgang Hauser
>=20

Hm,

I tought I have fixed yesterday.

Bye Henning

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


