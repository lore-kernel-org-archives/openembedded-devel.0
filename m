Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HbETj-0001Ue-Kf
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 13:25:39 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 1675828C012; Tue, 10 Apr 2007 13:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180191083.adsl.alicedsl.de [85.180.191.83])
	by srv043.dedi23.de (Postfix) with ESMTP id A5F5428C011
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 13:18:16 +0200 (CEST)
Date: Tue, 10 Apr 2007 13:25:39 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1771542973.20070410132539@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168683040.20070405173920@gmail.com>
References: <1168683040.20070405173920@gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] Cleaning up service handling in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 11:25:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Thanks for raising this issue, Paul.

The state of the service handling in OE has buggered me since long,
not just because of the (very valid) points you mentioned, but also
because of their relationship to sysvinit -- the initscripts are just
too specialized in my opinion.

One example: I can see OpenMoko moving to another sysinit scheme,
most likely upstart. Now how are we (OE) supposed to support that
while keeping sysinit support updated at the same time.

We should do it like we support different packaging systems and image
types -- let me propose going to a more high level description for service
handling and having a bbclass (INHERIT += sysvinit or INHERIT +=
upstart) parsing this description and emitting
the actual init scripts.

What do you think?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



