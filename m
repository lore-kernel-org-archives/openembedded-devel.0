Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NwHKX-0001UZ-Vl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 17:56:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2TFrXlY016683
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 16:53:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16417-05 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 16:53:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2TFrR7e016677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 16:53:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Mar 2010 16:53:24 +0100
Message-ID: <1269878004.1681.331.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Standalone gcc library builds
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
X-List-Received-Date: Mon, 29 Mar 2010 15:56:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

We currently build gcc and all its runtime libraries as part of at least
"gcc-cross", "gcc", "gcc-cross-sdk". Packaging of these libraries varies
between the different recipes and is a pretty scary place for things to
go wrong which I've frequently seen.

I'm working on the idea of having the above packages just generate the
compiler binaries (host tools) and having a "gcc-runtime" package which
builds all the libraries (target libs). I think can make this work
expect for libgcc itself which is proving a real pain (unsurprisingly).

For libgcc, we can save the bits it needs from the gcc build into
staging and then make it build that way, or just build it as a special
case as part of gcc, stash it in staging, then package it as part of
gcc-runtime.

Does anyone have any better ideas of experience of playing with libgcc?

Cheers,

Richard




