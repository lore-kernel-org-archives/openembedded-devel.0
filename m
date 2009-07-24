Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MUOwN-0007Ll-MW
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jul 2009 19:52:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C367651A7EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 13:37:56 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20076-01 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Jul 2009 13:37:56 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9F18C4F526C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 13:37:56 -0400 (EDT)
Message-ID: <4A69F174.3020006@cbnco.com>
Date: Fri, 24 Jul 2009 13:37:56 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1248201134.26475.15.camel@dax.rpnet.com>	<200907232141.13597.khimov@altell.ru>	<1248386615.14790.43.camel@dax.rpnet.com>	<200907240900.52746.khimov@altell.ru>
	<1248454154.20755.13.camel@dax.rpnet.com>
In-Reply-To: <1248454154.20755.13.camel@dax.rpnet.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Fri, 24 Jul 2009 17:52:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> Is there any other feedback on the bitbake patch?

For me, it makes preparing the runqueue at least twice as fast (from ~2 
to ~1 second for a small console image, ~14 to ~6 for something with X11).

My task dependencies look identical before and after the patch, except 
for the new harmless <image>.do_rootfs -> 
<image>.do_package_write_deb,do_populate_staging that you wrote about at 
the start of the thread.

Now if only "Resolving any missing task queue dependencies" were a 
little faster :) That part's running about 40 seconds for me on a large 
image.

Mike


