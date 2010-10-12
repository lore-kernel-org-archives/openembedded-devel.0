Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P5jFO-0000Qv-96
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 20:06:50 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 17404491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 20:06:21 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Tue, 12 Oct 2010 18:06:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.12) Gecko/20100914 SUSE/3.0.8 Lightning/1.0b1
	Thunderbird/3.0.8
Date: Tue, 12 Oct 2010 20:06:19 +0200
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AF40@exchange.intern.dresearch.de>
In-Reply-To: <i8vclt$9te$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] testing branch 2010-10-08
Thread-Index: ActqOCyNA3JyGIunSoSDc1qq1ECb9g==
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>	<DB561678F08F554EB0D9F21B70E268A505AF27@exchange.intern.dresearch.de>	<DB561678F08F554EB0D9F21B70E268A505AF2A@exchange.intern.dresearch.de>
	<i8vclt$9te$1@dough.gmane.org>
From: "Sledz, Steffen" <sledz@dresearch.de>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Tue, 12 Oct 2010 18:07:09 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message

Am 11.10.2010 18:06, schrieb Koen Kooi:
> On 11-10-10 17:34, Sledz, Steffen wrote:
>> On 10/11/2010 09:34 AM, Sledz, Steffen wrote:
>>> do_configure still fails for epiphany-2.30.2-r3 (see
>>> <http://tinderbox.openembedded.net/packages/835265/>) with:
>>>
>>> "checking location of system Certificate Authority list...
>>> configure: error: could not find. Use --with-ca-file=3Dpath
>>> to set, or --without-ca-file to disable"
>>>
>>> I thought the additional ca-certifactes dependency (see thread
>>> =
<http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=3D=
37585>)
>>> fixes this, but it does not seem so. :(
>>>
>>> I'd a look into my openSUSE-system and there epiphany uses
>>> a file /var/lib/ca-certificates/ca-bundle.pem (linked to
>>> /etc/ssl/ca-bundle.pem) installed by the ca-certificates package.
>>>
>>> The OE ca-certificates package does not install such a bundle.
>>> So may be that's the real problem.
>=20
>> A look into the ca-certificates recipe shows this:
>=20
>>   pkg_postinst_${PN} () {
>>           /usr/sbin/update-ca-certificates
>>   }
>=20
>> I think this is to late if another package needs the result from
>> this call in its configuration stage.
>=20
> That's missing a $D check as well, since in that form it can't be run
> off-line

Can please someone else have a look at this? I'm not familiar with this =
stuff (and BTW i'm not the maintainer of epiphany and/or gnome).

Steffen


