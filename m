Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P5CuG-0007dy-Pd
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:34:49 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A5638491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 09:34:25 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Mon, 11 Oct 2010 07:34:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.11) Gecko/20100714 SUSE/3.0.6 Lightning/1.0b1
	Thunderbird/3.0.6
Date: Mon, 11 Oct 2010 09:34:24 +0200
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AF27@exchange.intern.dresearch.de>
In-Reply-To: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] testing branch 2010-10-08
Thread-Index: ActpFrq4RNqKJ8PDT9WY9OAQCevDCw==
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Oct 2010 07:34:49 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message

do_configure still fails for epiphany-2.30.2-r3 (see
<http://tinderbox.openembedded.net/packages/835265/>) with:

"checking location of system Certificate Authority list...
configure: error: could not find. Use --with-ca-file=3Dpath
to set, or --without-ca-file to disable"

I thought the additional ca-certifactes dependency (see thread
<http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=3D=
37585>)
fixes this, but it does not seem so. :(

I'd a look into my openSUSE-system and there epiphany uses
a file /var/lib/ca-certificates/ca-bundle.pem (linked to
/etc/ssl/ca-bundle.pem) installed by the ca-certificates package.

The OE ca-certificates package does not install such a bundle.
So may be that's the real problem.

Steffen


