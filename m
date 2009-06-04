Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1MC4xg-00066j-FQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 06:53:56 +0200
Received: from tamarin.localnet (123-192-147-94.dynamic.kbronet.com.tw
	[123.192.147.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3B2A11B10C1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 04:45:58 +0000 (UTC)
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Jun 2009 06:44:46 +0200
User-Agent: KMail/1.11.90 (Linux/2.6.30-rc7; KDE/4.2.85; i686; ; )
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
In-Reply-To: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
MIME-Version: 1.0
Message-Id: <200906040644.46800.zecke@selfish.org>
Subject: Re: How to fix OE missing checksum error for some rt2570-k2wrlz recipe
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
X-List-Received-Date: Thu, 04 Jun 2009 04:53:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 04 June 2009 06:36:35 Elvis Dowson wrote:
> Hi,
> 	I am getting a missing checksum error.
>
> NOTE: Running task 358 of 558 (ID: 2, /tool/overo-oe/user.collection/
> recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb, do_fetch)
> NOTE: Missing checksum
> ERROR: rt2570-k2wrlz-1.6.4:
> http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2
> has no entry in conf/checksums.ini, not checking URI
> ERROR: Error in executing: /tool/overo-oe/user.collection/recipes/
> rt2x00/rt2570-k2wrlz_1.6

In your build directory you have tmp/checksums.ini, you can copy the entry for 
rt... to conf/checksums.ini in the OE metadata... and obviously send a patch 
if that makes sense.

z.


