Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OCUM9-0004aL-U1
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 11:05:28 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DFEFD11000DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 11:01:30 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8576B11000A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 11:01:30 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052067087.adsl.alicedsl.de
	[78.52.67.87]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 11:01:30 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E70D23C0F5; Thu, 13 May 2010 11:01:24 +0200 (CEST)
Date: Thu, 13 May 2010 11:01:24 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513090124.GA20094@rhein.zuhause.netz>
References: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Thu, 13 May 2010 09:05:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

this looks like a classic failure of the m4 macros,
which try to locate the eina-dev stuff and take your
hosts one instead of the oe provided. I double checked
the dependency in the recipe and it has eina in there.

Bye Henning


