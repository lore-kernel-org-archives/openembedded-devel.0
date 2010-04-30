Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1O7qQn-0002G1-Ox
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 15:39:02 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D5755491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 15:35:20 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 30 Apr 2010 15:36:05 +0200
Message-ID: <4BDADC9F.9000406@dresearch.de>
Date: Fri, 30 Apr 2010 15:35:27 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 30 Apr 2010 13:36:05.0480 (UTC)
	FILETIME=[15498E80:01CAE86A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: special post build step for u-boot?
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
X-List-Received-Date: Fri, 30 Apr 2010 13:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We need to add a special post build step to u-boot for our machine.

This step consists of a concatenation of the built u-boot binary to
another (fix) binary and after this running a tool on the resulting
file.

The fix prefix file and the tool are built using another autotools
based (native-)recipe and are installed to the related datadir
resp. bindir.

My idea is to extended the u-boot recipe something like this:

DEPENDS_hipox += " specialtool-native "

do_deploy_append_hipox () {
	cat FOO/usr/share/specialtool/prefixfile ${DEPLOY_DIR_IMAGE}/BAR > ${DEPLOY_DIR_IMAGE}/BAR.wrapped
	specialtool ${DEPLOY_DIR_IMAGE}/BAR.wrapped
}

Is this the right way to do this?

If yes, what is the correct replacement for FOO and BAR?

Steffen



