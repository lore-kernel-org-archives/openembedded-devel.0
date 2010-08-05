Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OgyLf-0005zP-VO
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 13:11:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75BAks4001453;
	Thu, 5 Aug 2010 12:10:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30875-04; Thu,  5 Aug 2010 12:10:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75BAcfm001433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Aug 2010 12:10:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Thu, 05 Aug 2010 12:10:23 +0100
Message-ID: <1281006623.16235.277.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Add bb.data.flagAppend
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
X-List-Received-Date: Thu, 05 Aug 2010 11:11:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been wondering what we could do to get rid of clutter in some of
our class files. One thing we see a lot of is getting a flag, appending
to it and saving it again. In normal syntax, =+ works great for this but
that doesn't help in anonymous python. We see lots of things like:

deps = (bb.data.getVarFlag('do_package_write_ipk', 'depends', d) or "").split()
deps.append('opkg-utils-native:do_populate_sysroot')
deps.append('virtual/fakeroot-native:do_populate_sysroot')
bb.data.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps), d)

where as it would be nice just to be able to write:

bb.data.varFlagAppend('do_package_write_ipk', 'depends', "opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot", d)

or

deps = "opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot"
bb.data.varFlagAppend('do_package_write_ipk', 'depends', deps, d)

if long lines make you uneasy.

Does anyone else feel such a function would be of use? It would assume
space delimitation as the "=+" and "+=" operators work. 

Cheers,

Richard



