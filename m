Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NG4K7-0004bk-Jk
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 06:33:54 +0100
Received: from tamarin.localnet (unknown [122.181.150.106])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4CFA81B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 05:44:49 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Dec 2009 06:31:57 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912021919.06663.marcin@juszkiewicz.com.pl>
In-Reply-To: <200912021919.06663.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200912030631.57262.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Thu, 03 Dec 2009 05:33:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 02 December 2009 19:19:05 Marcin Juszkiewicz wrote:

> $ svn co -r 7916
>  svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common@79
> 16 svn: URL
>  'svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common'
>  doesn't exist
> 
> But:
> 
> $ svn co -r 7916
>  svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common
> 
> works fine.

that sucks... we are doomed now. If the above directory is deleted in trunk 
the -r option will not work to download a old rev...


z.


