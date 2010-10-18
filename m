Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P7oEQ-0000Oe-8I
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 13:50:22 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id CA6E31D3616D; Mon, 18 Oct 2010 13:49:43 +0200 (CEST)
Date: Mon, 18 Oct 2010 13:49:43 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101018114943.GP28423@ibawizard.net>
References: <20101014124548.GJ28423@ibawizard.net>
	<i9705t$i6g$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i9705t$i6g$1@dough.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] ts72xx, ts73xx, ts74xx? How to handle properly	similar machines
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
X-List-Received-Date: Mon, 18 Oct 2010 11:50:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Koen Kooi <k.kooi@student.utwente.nl> [2010-10-14 15:22:05]:

> It means you need to use angstrom or set is as override in local.conf

Ok, but would this work for example (it's not real life example)?

local.conf - SOC_FAMILY="ts7400"
machine/ts7xxx.inc - common stuff for all the boards
machine/ts72xx.conf - include ts7xxx.inc and add board specific stuff
machine/ts7250.conf - include ts72xx.conf and add board specific stuff
machine/ts7260.conf - include ts72xx.conf and CF support
machine/ts73xx.conf - include ts7xxx.inc and board specific stuff (FPGA + video)
machine/ts74xx.conf - include ts7xxx.inc and add SD card support

can I than use this as some kind of overrides? Say I'll need to have different
options in some of the packages and I would need to use something like this:

PACKAGE_ARCH += "${SOC_FAMILY}"
SRC_URI_append_ts7xxx += "file://common.patch"
SRC_URI_append_ts7260 += "file://compact-flash.patch"
SRC_URI_append_ts74xx += "file://sd-card.patch"
SRC_URI_append_ts73xx += "file://fpga.patch"

Because as I've seen the usage of the SOC_FAMILY in the recipes I don't think
it would be possible. Thanks for the answer, or more specific example.

-- ynezz


