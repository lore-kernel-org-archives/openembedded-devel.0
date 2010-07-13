Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OYhfZ-0002Ro-9g
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 17:45:18 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A06F4110009A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 17:45:12 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9FCAD1100097
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 17:45:11 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225144025.adsl.alicedsl.de
	[92.225.144.25]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 17:45:11 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7B0A03C0E9; Tue, 13 Jul 2010 17:44:59 +0200 (CEST)
Date: Tue, 13 Jul 2010 17:44:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100713154458.GA3559@rhein.zuhause.netz>
References: <1279027764.3935.13.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279027764.3935.13.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: angstrom-2008.1, uclibc, perl 5.8.8: error: #error It appears you have defined _FILE_OFFSET_BITS=64.
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
X-List-Received-Date: Tue, 13 Jul 2010 15:45:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Khem and blindvt introduced a new DISTRO feature largefile which now enables stat64 ander serval other largefile
options. Unfornatly for now only minimal-uclibc-distro is using it. A quick workaround is to add largefile
in the angstroem.inc file.


Bye Henning


