Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JZ3Qu-0006mO-4e
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:18:18 +0100
Received: from firewall.tw.openmoko.org ([124.219.5.210] helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JZ3P0-0008M3-Pf
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:16:19 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 13:16:15 +0100
User-Agent: KMail/1.9.9
References: <200803051942.12586.mickey@vanille-media.de>
	<200803110959.59702.zecke@selfish.org>
	<1205233707.4521.40.camel@dax.rpnet.com>
In-Reply-To: <1205233707.4521.40.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803111316.15837.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysroot vs. finding header files
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
X-List-Received-Date: Tue, 11 Mar 2008 12:18:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 11 March 2008 12:08:27 Richard Purdie wrote:

> Needing to know the absolute path to the header is not as common a
> requirement as you'd expect. There are ways and means but pulling it
> from pkg-config the way that package did isn't a good one.

Hehe, John just stumbled across another case in python-gtk. And cmake loves 
absolute paths for certain things but it has sysroot support. Anyway we will 
fix this one by one and there is no easy way to find out who is doing such 
things. Nothing that could have been differently. :)

z.


