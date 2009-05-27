Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M98SA-0003V5-6k
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 04:01:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 899294C1D83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2009 21:53:04 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16430-04 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 26 May 2009 21:53:04 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 46F6E4BF29F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2009 21:53:04 -0400 (EDT)
Date: Tue, 26 May 2009 21:53:04 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243353706.9080.367.camel@mill.internal.reciva.com>
Message-ID: <Pine.LNX.4.64.0905262144170.6446@juice.ott.cti.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<Pine.LNX.4.64.0905252339270.6446@juice.ott.cti.com>
	<1243353706.9080.367.camel@mill.internal.reciva.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] busybox: allow building when prefix is "", not "/usr".
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
X-List-Received-Date: Wed, 27 May 2009 02:01:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 26 May 2009, Phil Blundell wrote:

> Good spotting.  There seems to be more wrong with this code than that,
> though: the comment above says "Move everything to /busybox...", but the
> code (both before and after your change) seems to copy rather than
> moving which would appear to defeat the point of this whole block of
> code.  We had a discussion about this on IRC a few weeks ago but I don't
> think there was any real conclusion to that.

Oh yeah... heh... I guess that copy kind of defeats the purpose. The 
package ends up containing all the symlinks instead of letting 
update-alternatives take care of it in postinst.

I changed the "cp" back to "mv" and the package looks a bit lighter on 
symlinks, and the final rootfs is the same. I'd still want to play a bit 
with upgrades though, and that may be a while. If it looks OK, I'll send 
it up as a separate patch later.

This is where it changed from mv to cp:

commit f7f1ac27e90f042fa1c4322b193b5b6a27cd4c07
Author: Koen Kooi <koen@openembedded.org>
Date:   Sat Aug 26 14:02:37 2006 +0000

    busybox 1.2.1: replace mv with a non-gnu-ish cp


Mike


