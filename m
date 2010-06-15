Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OOaUZ-00045V-Lu
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 20:04:08 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9D78D491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 19:59:41 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Tue, 15 Jun 2010 17:59:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.9) Gecko/20100317 SUSE/3.0.4-1.1.1 Lightning/1.0b1
	Thunderbird/3.0.4
Date: Tue, 15 Jun 2010 19:59:40 +0200
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AECF@exchange.intern.dresearch.de>
In-Reply-To: <4C17A3F3.3000705@soundmetrics.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable
	backgrounding for udhcpc
Thread-Index: AcsMtIeFbFhth3S4RbutaOSiHO/IDg==
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>	<1276584950-22168-1-git-send-email-sledz@dresearch.de>	<4C172F19.30005@dcombus.com>
	<4C17A3F3.3000705@soundmetrics.com>
From: "Sledz, Steffen" <sledz@dresearch.de>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 18:04:08 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am 15.06.2010 18:01, schrieb John Faith:
> I'd like to have 3 possible network modes: dhcp, zeroconf, or static =
IP
> and want to switch between them on-the-fly.  It looks like the =
non-dhcp
> modes can be done using a script or 2 in /etc/udhcpc.d, so it seems
> having udhcpcd running in the background would facilitate this.  Does
> that sound right?

That's not part of this patch. This patch just changes the default
behaviour *if using DHCP*.

Steffen

