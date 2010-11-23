Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1PKwuM-0007iV-Pa
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 18:43:59 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 1CF22275CE9E; Tue, 23 Nov 2010 18:42:48 +0100 (CET)
Received: from [192.168.178.21] (brmn-4dbcc381.pool.mediaWays.net
	[77.188.195.129])
	by gravedo.de (Postfix) with ESMTPSA id 73995275CE22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 18:42:47 +0100 (CET)
Message-ID: <4CEBFD16.1040609@gravedo.de>
Date: Tue, 23 Nov 2010 18:42:46 +0100
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13pre) Gecko/20101113 Lightning/1.0b2 Shredder/3.1.7pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RELEASE-2010.12] Fix bug in lvm2 recipes
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
X-List-Received-Date: Tue, 23 Nov 2010 17:43:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Heyho,

some minutes ago I fixed a bug in the lvm2 recipes which produces 
packages which are not usable as they depend on device-mapper but 
includes device-mapper itself. So I remove the dependency from lvm2 to 
device-mapper which fixes the problem (upstream lvm2 includes 
device-mapper since some releases).

The git rev is 	94706f3c2b4866775332c529d50500a2e43a55d9.

Should I cherry-pick it in the release branch to fix the problem there too?

regards,
morphis


