Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OJDHa-0003Tu-QU
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:16:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 475016DED19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 18:12:18 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22784-08 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 31 May 2010 18:12:18 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 19C8155C876
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 18:12:18 -0400 (EDT)
Date: Mon, 31 May 2010 18:12:18 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinfdaWq9aYzYEoDAWztRypqhzOlgnEl4CQCnwq4@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1005311808060.27172@juice.ott.cti.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
	<AANLkTinfdaWq9aYzYEoDAWztRypqhzOlgnEl4CQCnwq4@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 22:16:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 31 May 2010, Cliff Brake wrote:

> git submodule mechanism is very exciting in that it gives us a
> standard way to lock down versions of various submodules without
> reverting to manually specifying hash values in recipes, etc.

Before I used OpenEmbedded, I had a custom build system with submodules. 
It was a usability nightmare - there were a lot of cases where the 
submodule tree was pushed but the parent wasn't committed and pushed, or 
vice versa, or somebody reverted to a previous rev of a submodule because 
they didn't "git submodule update" and ran "git commit -a" without 
checking.

For our srctree/gitver projects we almost always want to track the latest 
version, so a shell script that runs "git pull" in every directory works 
much better for us than submodules did.

Mike


