Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jc8Wk-00059C-6a
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 01:21:06 +0100
Received: from [212.23.103.15] (helo=[10.129.62.112])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jc8Wj-0006vD-LF
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 01:21:02 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Mar 2008 01:20:47 +0100
User-Agent: KMail/1.9.9
References: <878x0emgub.fsf@frontier.dottedmag.net>
	<47E1A6CB.4010708@balister.org>
In-Reply-To: <47E1A6CB.4010708@balister.org>
MIME-Version: 1.0
Message-Id: <200803200120.47119.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.15
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,RCVD_IN_BL_SPAMCOP_NET,
	RDNS_NONE autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Default SRCREV value
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
X-List-Received-Date: Thu, 20 Mar 2008 00:21:12 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 20 March 2008 00:50:35 Philip Balister wrote:

> Setting SRCREV to 1 is not a good solution, but it is better than all
> the alternatives. Personally, I wish bitbake would print a HUGE message
> when it tries to fetch a SRCREV of 1 telling people to update a
> preferred version file or add AUTOREV to a local conf file.

Or as Mikhail suggested:
${@bb.fatal("You want to specify a sane srvrev")}

The only down-side I can think of, now parsing will fail for a recipe you do 
not even care for in your distribution, with having a default value 1 you 
just parse fine.


z.


