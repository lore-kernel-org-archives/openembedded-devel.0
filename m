Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QLtKV-0000Hi-16
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 10:39:07 +0200
Received: from [2001:638:602:1183:f075:aaf1:e3b6:b14f] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QLtHj-0003DK-57 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Mon, 16 May 2011 10:36:16 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QLtHh-0006DS-IX; Mon, 16 May 2011 10:36:13 +0200
Date: Mon, 16 May 2011 10:36:13 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110516083613.GD17194@excalibur.local>
References: <E1QLsrb-0003on-41@melo.openembedded.org>
	<20110516081406.GA24971@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20110516081406.GA24971@mi.fu-berlin.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Stefan Schmidt : llvm2.7_2.7: Add patch for build	errors on newer gcc / glibc combinations
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
X-List-Received-Date: Mon, 16 May 2011 08:39:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-05-16 at 10:14, Henning Heinold wrote:
> On Mon, May 16, 2011 at 08:09:15AM +0000, git version control wrote:
> > +Index: llvm-2.7/include/llvm/ADT/SmallVector.h
> > +===================================================================
> > +--- llvm-2.7.orig/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:09.000000000 +0200
> > ++++ llvm-2.7/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:25.000000000 +0200
> > +@@ -19,6 +19,7 @@
> > + #include <cassert>
> > + #include <cstring>
> > + #include <memory>
> > ++#include <stddef.h>
> > + 
> 
> Please use #include <cstddef> we are in c++ code here.

Thats why I send the patch to ml before to gather some review. :)

Will update the patch and test with your suggestion.

regards
Stefan Schmidt


