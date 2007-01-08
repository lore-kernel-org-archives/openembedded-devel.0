Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1H3okz-0006ey-IX
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 08:17:21 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id ACBF928C012; Mon,  8 Jan 2007 08:11:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180169094.adsl.alicedsl.de [85.180.169.94])
	by srv043.dedi23.de (Postfix) with ESMTP id D80B728C011;
	Mon,  8 Jan 2007 08:11:44 +0100 (CET)
Date: Mon, 8 Jan 2007 08:15:40 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <682962313.20070108081540@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1168195833.5610.46.camel@localhost.localdomain>
References: <1168195833.5610.46.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake task dependency stamp handling
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
X-List-Received-Date: Mon, 08 Jan 2007 07:17:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> I had some interesting thoughts regarding tasks and their timestamps.
> Bitbake's current method of dealing with timestamps walks the task
> digraph structure which only knows about a single .bb file. The result
> is if you change an earlier task, say do_patch, later tasks like
> do_compile would rerun. If you rebuild gtk, the rest of your system
> linking to gtk doesn't rebuild though.

> If we move away from the digraph which isn't really needed anymore,
> taskData has the complete dependency tree available to it and the option
> of rebuilding the whole system if you recompile gtk becomes possible.

Excellent!

> At face value this sounds really useful. I'd guess that almost every OE
> developer would find it insanely annoying in practise though?

Not at all. I prefer waiting a bit more than having link or structure
mismatched due to changes in headers and libraries.

If it doesn't involve leaving too much code in, then I'd love to see a
way to turn it off to the old behaviour though.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



