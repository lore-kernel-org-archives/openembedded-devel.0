Received: from [82.208.44.173] (helo=ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@ibawizard.net>) id 1JX1X4-0006V6-TL
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 22:52:20 +0100
Received: by ibawizard.net (Postfix, from userid 1009)
	id EA27612CFF4; Wed,  5 Mar 2008 22:51:10 +0100 (CET)
Date: Wed, 5 Mar 2008 22:51:10 +0100
From: Petr Stetiar <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20080305215110.GB30267@ibawizard.net>
Mime-Version: 1.0
User-Agent: Mutt/1.5.9i
X-SA-Exim-Connect-IP: 82.208.44.173
X-SA-Exim-Mail-From: ynezz@ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Broken linux_2.6.24
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
X-List-Received-Date: Wed, 05 Mar 2008 21:52:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

commit with revision e59bb6421b1fc172baaf3ce9670eead297e0ad5d probably done by
Koen broke linux_2.6.24 package. It adds four patches to global SRC_URI, which
are missing in repository.

Pls can somebody explain me, why are those patches needed for all platforms? I
think, that these patches are machine specific and shouldn't be aplied to all
by default, right?

-- ynezz


