Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nww8s-0002uZ-Np
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 13:31:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VBSB2D012586
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 12:28:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12548-01 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 12:28:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VBS2r6012580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 12:28:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Mar 2010 12:28:01 +0100
Message-ID: <1270034881.1681.965.camel@rex>
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
Subject: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 11:31:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've just been looking over OE's gcc recipes and they really depress
me :(. People touch them just enough to tweak their specific problem
with no real thought going into the overall architecture and its a
sprawling mess. I tackled some of this a while back. Sadly its just
getting worse again.

I've spent some time looking at them trying to identify what I consider
to be the main sources of ugliness and how we can try and improve the
situation. I think it might help to set a high level goal for the gcc
recipes which would be:

   All configuration for a given gcc version should be contained 
   within the high level version specific .inc file(gcc-X.Y.Z.inc).

We'd therefore be frowning on version specific hacks in say the cross
recipes only.

It would follow that there would be a clear set of include files and a
clear include structure and that almost all of the variant gcc recipes
(gcc-cross-initial, gcc-cross-intermediate, gcc-cross-kernel,
gcc-cross-sdk, gcc) would be boilerplate includes.

Note that information about flags for the cross builds can be included
in the main common version specific include file.

To illustrate the kind of thing I mean, have a look at this commit:

http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=rpurdie/work-in-progress&id=35481122d7e484fb740ad9440fb4c70cb01de48f

The nice thing about this is all of a sudden we have all the flags in
the same place and it becomes obvious if something is wrong. There are a
few things that raise an eyebrow there. It also becomes easier to
abstract some of the gcc-X.Y.Z.inc data into a common include file
(maybe a gcc-4.3.X.inc for example).

Does anyone else fancy helping trying to clean this mess up. I'm happy
to review some cleanup patches?

Cheers,

Richard



