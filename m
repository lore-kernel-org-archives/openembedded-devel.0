Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1OBVX8-0002Ym-Fy
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 18:08:43 +0200
Received: from [10.250.128.198] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 2EEC212EC33B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 11:31:09 -0500 (CDT)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 May 2010 17:04:46 +0100
Message-ID: <1273507486.2994.189.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Supported Python version for OE?
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
X-List-Received-Date: Mon, 10 May 2010 16:08:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

A question, (perhaps for the TSC?):

	"What's the minimum Python version we want to support in OE?"

According to the wiki we support Python 2.4 and above but I wonder if
people have any thoughts with regards to bumping it?

The reason I ask is because I had a user contact me about using Python
2.5 features (str.partition) in relocatable.bbclass, I hadn't even
noticed this and seems like not many others have but it's clearly
affecting at least one person.

I have a pretty trivial (if ugly) patch to work around this, but it
raised an interesting question so I thought I'd ask that before sending
the patch.

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



