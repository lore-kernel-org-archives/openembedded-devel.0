Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MDLOX-0003HW-UZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 18:38:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B7C0F4D42F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 12:29:30 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31052-09 for <openembedded-devel@lists.openembedded.org>; 
	Sun,  7 Jun 2009 12:29:30 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8F64A4D42C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 12:29:30 -0400 (EDT)
Date: Sun, 7 Jun 2009 12:29:30 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090607132212.GA20762@fh-wedel.de>
Message-ID: <Pine.LNX.4.64.0906071216430.27204@juice.ott.cti.com>
References: <20090607132212.GA20762@fh-wedel.de>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: glibc-initial-2.3.2 build failes (wrong patch)
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
X-List-Received-Date: Sun, 07 Jun 2009 16:38:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 7 Jun 2009, Martin Dietze wrote:

>  I just pulled from the git and started a rebuild, found that
> glibc-initial-2.3.2 no longer builds on my system (nylon,
> mtx-1). It looks like the wrong patch is picked for applying:

> I cannot find any reason why arm-memcpy.patch and arm-longlong.patch
> from the glibc-2.4 directory are used while both files are available
> in glibc-2.3.2. Any idea anyone?

Hi Martin,

I think the problem was introduced by 
75bfa83fffb270c871aee698c3899111901c576d. I converted FILESPATH to 
FILESPATHPKG and in the process removed some that looked like they'd be 
covered by the defaults... well, they would have, if glibc-initial.inc 
didn't override to always add "glibc-2.4" to the front :)

I think the solution is to remove the FILESPATHPKG override from 
glibc-initial.inc. After looking through the rest of the files again, it 
looks like the glibc_2.[5-9]*.bb (not -initial) each add glibc-2.4 to the 
search path one way or another, and they are included by -initial, so 
there's no need to do it in the initial.inc. Can you give it a shot and 
see if it fixes the build for 2.3.2?

Mike


