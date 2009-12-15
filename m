Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NKYc5-00020F-0N
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 15:43:00 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 67B741B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 14:36:48 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2009 15:41:06 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <BAY127-W961F7102CDD7316B954DBD8880@phx.gbl>
In-Reply-To: <BAY127-W961F7102CDD7316B954DBD8880@phx.gbl>
MIME-Version: 1.0
Message-Id: <200912151541.06802.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in building "Helloworld-image"
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
X-List-Received-Date: Tue, 15 Dec 2009 14:43:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 15 December 2009 15:10:06 saleh usman wrote:
> NOTE: Running task 19 of 736 (ID: 110,
> /oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb, do_setscene)
> NOTE: Running task 20 of 736 (ID: 111,
> /oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb, do_fetch)
> ERROR: Error, lockfile path does not exist!: ${oe}/sources
> NOTE: Task failed: Unknown fetch Error: 1
> ERROR: TaskFailed event exception, aborting


Please search the output for ERROR. There should be something you have put 
into your local.conf...

z.

PS: Exactly, it was DLDIR = "${oe}/sources"
PPS: You use a variable that is not defined so the unexpanded version is used


