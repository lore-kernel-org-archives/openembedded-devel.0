Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P6NCQ-0002ws-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 14:46:28 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 802C71D36170; Thu, 14 Oct 2010 14:45:48 +0200 (CEST)
Date: Thu, 14 Oct 2010 14:45:48 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101014124548.GJ28423@ibawizard.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] ts72xx, ts73xx, ts74xx? How to handle properly similar	machines
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
X-List-Received-Date: Thu, 14 Oct 2010 12:46:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been asked if I could add support for the ts7400 board/machine in the OE.
It's not a big deal, it's just an addition of one patch to the kernel recipe.

While I'll be into it, I was thinking about adding the base for the possible
future addition of ts7300[2] boards also. Althought I own only ts7800 and
ts7250, the ts7200[4], ts7300 and ts7400 families looks like they have a lot
of common and it would be possible to have for example one kernel for all of
them.

The question is, how to handle this correctly in OE? On the IRC, I was pointed
to the SOC_FAMILY[3], but it says "The use of SOC_FAMILY as an override is
currently a distribution or local setting", what does it mean?

Would it be possible to create, say ts7234.inc file with shared stuff for all
the boards, and separate ts7{2,3,4}xx.conf files with the features for each
series, say ts73xx would contain FPGA/video related stuff etc, so the machine
specific overrides would be needed. 

Any thoughts? Thanks.

1. http://www.embeddedarm.com/products/board-detail.php?product=TS-7400
2. http://www.embeddedarm.com/products/arm-sbc.php#ts-7300-fpga-series
3. http://docs.openembedded.org/usermanual/html/commonuse_new_machine.html
4. http://www.embeddedarm.com/products/arm-sbc.php#ts-7200-200mhz-series

-- ynezz


