Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1INqC3-0008GG-Cp
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2007 15:24:20 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4382028C013; Wed, 22 Aug 2007 15:20:21 +0200 (CEST)
X-Spam-Flag: YES
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RCVD_IN_XBL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
X-Spam-Report: * -2.6 BAYES_00 BODY: Bayesian spam probability is 0 to 1%
	*      [score: 0.0000]
	* 2.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
	address *      [85.180.170.96 listed in dnsbl.sorbs.net]
	*  3.9 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
	*      [85.180.170.96 listed in zen.spamhaus.org]
	*  1.9 RCVD_IN_NJABL_DUL RBL: NJABL: dialup sender did non-local SMTP
	*      [85.180.170.96 listed in combined.njabl.org]
	*  0.0 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
	*      [85.180.170.96 listed in zen.spamhaus.org]
	*  2.6 REPTO_OVERQUOTE_THEBAT The Bat! doesn't do quoting like this
	* -2.1 AWL AWL: From: address is in the auto white-list
Received: from PROMETHEUS (e180170096.adsl.alicedsl.de [85.180.170.96])
	by srv043.dedi23.de (Postfix) with ESMTP id 6893328C012;
	Wed, 22 Aug 2007 15:20:20 +0200 (CEST)
Date: Wed, 22 Aug 2007 15:23:13 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <9010469286.20070822152313@vanille-media.de>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200703231200.31520.openembedded@hrw.one.pl>
References: <200703231200.31520.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Python extensions
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
X-List-Received-Date: Wed, 22 Aug 2007 13:24:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

(Sorry for the long delay... :)

Marcin Juszkiewicz wrote on 23th of March:
> When we build Python extension (for example python-pygtk2) configure
> script builds one test program to check does it has Python headers.

So this is a problem with python packages using autotools only, right?
(I remember I patched distutils to take care about that).

> I got fix for it of course. M4 scripts of each used Python extensions use
> macro AM_CHECK_PYTHON_HEADERS which I edited to add one option to 
> configure: --with-python-includes which should be pointed to 
> ${STAGING_INCDIR}/../ to get it working.

So just adding to EXTRA_OECONF will do?

> I will sync some of Python extensions with this fix from Poky into 
> OpenEmbedded in next days (python-pygtk2 already pushed).

Since we don't have that many extensions using autotools, we can fix
this easily.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



