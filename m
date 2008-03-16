Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JahG6-0003By-FU
	for openembedded-devel@openembedded.org; Sun, 16 Mar 2008 02:02:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2G0xUfU032162
	for <openembedded-devel@openembedded.org>; Sun, 16 Mar 2008 00:59:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31861-09 for <openembedded-devel@openembedded.org>;
	Sun, 16 Mar 2008 00:59:26 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2G0xMtG032154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 16 Mar 2008 00:59:22 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 16 Mar 2008 00:59:24 +0000
Message-Id: <1205629164.4551.20.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc recipes cleanup
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
X-List-Received-Date: Sun, 16 Mar 2008 01:02:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I've threatened for a long time to clean up the mess the gcc recipes
were in. Over the course of several commits I've tried to do this,
moving code to common .inc files where possible and making it clear
which files affect which types of gcc build (target, cross, sdk,
cross-initial, kernel, native).

Whilst I hope I've not broken anything, the changes are pretty drastic
so please test out your favourite machines/distros/combinations and
report any problems.

I did notice various things which simply couldn't have worked and now
everything is standardised, I'm optimistic that fixes to the toolchain
should be easier to make. Strange side effects from target into cross
and other nasty effects of the old recipes should be much harder to
create now too. meta-toolchain should benefit from the standardised sdk
recipes.

Cheers,

Richard




