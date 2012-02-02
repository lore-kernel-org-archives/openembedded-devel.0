Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Rsy7U-0003mT-S6
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 15:58:40 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BFA2122325A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 15:50:46 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 06D8022325A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 15:50:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225004220.adsl.alicedsl.de
	[92.225.4.220]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 15:50:45 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 42F183C4B3; Thu,  2 Feb 2012 15:50:40 +0100 (CET)
Date: Thu, 2 Feb 2012 15:50:40 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120202145037.GA5364@rhein.zuhause.netz>
References: <CAObi9r-f6NA+ARrNqn_GGdr3eL43-B-ZszYS1y1tA12KiHURxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAObi9r-f6NA+ARrNqn_GGdr3eL43-B-ZszYS1y1tA12KiHURxQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: preventing stripping binaries
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
X-List-Received-Date: Thu, 02 Feb 2012 14:58:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2012 at 03:46:19PM +0200, mgundes wrote:
>      Hi everyone,
> 
>      I use oe-classic. I have two distro type (debug and release) and I
> want to use same path for my application in release and debug distro
> type. I wonder if I can tell OE not to strip binaries for specified package
> in FILES_${PN}? Or can I change installation directory name instead of
> ".debug" when I use debug package FILES_${PN}-dbg?
> 
>      Thanks for your help, regards.
> 
> -- 
> MahmutG

He,

thats what the -dbg packages are for, providing the necessary debug symbols.
You do not need that two distros.

Bye Henning


