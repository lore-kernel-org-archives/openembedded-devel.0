Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MUT2e-0005eU-0p
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 00:15:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DB4B74D7DE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 18:00:39 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25337-05 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Jul 2009 18:00:39 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8A667457C67
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 18:00:39 -0400 (EDT)
Message-ID: <4A6A2F07.6010709@cbnco.com>
Date: Fri, 24 Jul 2009 18:00:39 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1248201134.26475.15.camel@dax.rpnet.com>	<200907232141.13597.khimov@altell.ru>	<1248386615.14790.43.camel@dax.rpnet.com>	<200907240900.52746.khimov@altell.ru>	<1248454154.20755.13.camel@dax.rpnet.com>
	<4A69F174.3020006@cbnco.com>
	<1248469882.20755.21.camel@dax.rpnet.com>
In-Reply-To: <1248469882.20755.21.camel@dax.rpnet.com>
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
X-List-Received-Date: Fri, 24 Jul 2009 22:15:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2009-07-24 at 13:37 -0400, Michael Smith wrote:

>> Now if only "Resolving any missing task queue dependencies" were a 
>> little faster :) That part's running about 40 seconds for me on a large 
>> image.
> 
> As it happens, try the patch from
> http://cgit.openembedded.net/cgit.cgi/bitbake/commit/?id=72bf7476b2492b6524cb8ff87ee5f4e86b28d975
> 
> It should apply to bitbake 1.8 just as well as trunk as those files are
> the same.

Yes, it sure does... for a small image, the time was cut from 23 seconds 
to under 1 second. Thanks!

Mike


