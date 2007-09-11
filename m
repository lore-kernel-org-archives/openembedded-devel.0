Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IV5xl-0001i1-FN
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2007 15:39:33 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 06DB728C013; Tue, 11 Sep 2007 15:32:52 +0200 (CEST)
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
	address *      [85.180.172.89 listed in dnsbl.sorbs.net]
	*  3.9 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
	*      [85.180.172.89 listed in zen.spamhaus.org]
	*  1.9 RCVD_IN_NJABL_DUL RBL: NJABL: dialup sender did non-local SMTP
	*      [85.180.172.89 listed in combined.njabl.org]
	*  0.0 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
	*      [85.180.172.89 listed in zen.spamhaus.org]
	*  2.6 REPTO_OVERQUOTE_THEBAT The Bat! doesn't do quoting like this
	* -2.1 AWL AWL: From: address is in the auto white-list
Received: from PROMETHEUS (e180172089.adsl.alicedsl.de [85.180.172.89])
	by srv043.dedi23.de (Postfix) with ESMTP id E270528C012
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 15:32:48 +0200 (CEST)
Date: Tue, 11 Sep 2007 15:36:25 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <877302070.20070911153625@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1189505203.6163.13.camel@localhost.localdomain>
References: <1325905859.20070910230801@vanille-media.de>
	<1189505203.6163.13.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: yaffs2 image generation support
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
X-List-Received-Date: Tue, 11 Sep 2007 13:39:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2007-09-10 at 23:08 +0200, Dr. Michael Lauer wrote:
>> Team OpenMoko needs yaffs2 image generation support in OpenEmbedded.
>> Are there any patches out there, any experiences yet? If so, please
>> speak up so we don't have to duplicated work  

> In case you're wondering about me, I don't have any yaffs2 patches ;-).

Ah, bummer ;) I'm going to do them then.

> I'd have thought jffs2 would be the preferred option due to the
> compression support which yaffs2 lacks?

Only up to a certain flash size. Starting with, say, 256, yaffs2 shows
its advantages. People inside some hardware unit are working on device
that comes w/ 1G of flash and they report yaffs2 outperforming jffs2.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



