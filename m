Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MeTnQ-00020S-9w
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 15:04:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5C4C1545A06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 08:47:20 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00784-09 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 21 Aug 2009 08:47:20 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1B723545A03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 08:47:20 -0400 (EDT)
Date: Fri, 21 Aug 2009 08:47:20 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908210825.32355.khimov@altell.ru>
Message-ID: <Pine.LNX.4.64.0908210701430.3621@juice.ott.cti.com>
References: <1241617115-21929-1-git-send-email-msmith@cbnco.com>
	<Pine.LNX.4.64.0908202146030.3621@juice.ott.cti.com>
	<200908210825.32355.khimov@altell.ru>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] kernel.bbclass: stage more include files for x86 in	2.6.27+
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
X-List-Received-Date: Fri, 21 Aug 2009 13:04:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 21 Aug 2009, Roman I Khimov wrote:

>> OK to commit?
>>> -	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
>>> +
>>> +	rm -f ${STAGING_KERNEL_DIR}/include/asm

> Not sure why this is needed

$ASMDIR is a directory name like "asm-x86" meant to be relative to 
"include". It doesn't exist under the work directory, so "rm -f $ASMDIR" 
tries to remove a file that isn't there. Doesn't hurt anything, but I had 
to stare at it for a bit, so I took it out. :)

> though you copy to asm-x86 and mine was to $ASMDIR:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-June/011945.html

Yeah, I think in your patch you did:

cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/

But on another platform, let's say arm, wouldn't that copy 
arch/x86/include/* to include/asm-arm? The x86 files should only go to 
asm-x86.

Mike


