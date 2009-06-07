Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1MDMk0-0001rc-IV
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 20:05:08 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id BF21B547D3; Sun,  7 Jun 2009 19:55:42 +0200 (CEST)
Date: Sun, 7 Jun 2009 19:55:42 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090607175542.GA26712@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Sun, 07 Jun 2009 18:05:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 just as my build broke again wiht this issue:
glibc-package.bbclass defines PACKAGES which always contains
glibc-dbg, however the build is without debug symbols for build
time reasons. I guess eventually we'd like to configure from
somewhere whether or not we want debug code and the glibc-dbg
package.

Do we have any "official" mechanism we can use to accomplish
this? Since this is something which *always* breaks builds I'd
think we should do something about this sooner rather than
later.

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Interested in sophisticated fun? You, hubby, girl friends. The more the 
merrier. Get in touch with Kirby, through WASTE only, Box 7391, L.A.


