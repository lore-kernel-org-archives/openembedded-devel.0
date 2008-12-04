Received: from [68.230.241.49] (helo=fed1rmmtai111.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L8AHd-0002z1-0f
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 10:14:05 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081204080241.TYXD12838.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 4 Dec 2008 03:02:41 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id mw2g1a0021E665w04w2gyq; Thu, 04 Dec 2008 03:02:40 -0500
X-Authority-Analysis: v=1.0 c=1 a=kL8tvkp5LsMA:10 a=QAlb5sXvoO4A:10
	a=b2ZvGRdsAAAA:8 a=fxJcL_dCAAAA:8 a=DFgnRrnfyngirpp6qvgA:9
	a=rNqy1A60qw44IkZ8Bxxm7GRtXdwA:4 a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Thu, 4 Dec 2008 01:02:49 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20081204080249.GR16628@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: gdb-cross-sdk hacking around gcc-4.3 warnings?
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
X-List-Received-Date: Thu, 04 Dec 2008 09:14:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, I see that in
http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=6348b3baf7a61fc07626a3ecb29b539d438cfb4f
we dropped -Werror from gdb-cross-sdk.  Was this for gcc-4.3 support?
If so, could we replace that by importing
http://patches.ubuntu.com/g/gdb/extracted/gcc-4.3-build-error.patch
instead?  I'll do the work, just don't want to step on anyones toes if
there was a different reason behind the change, thanks!

-- 
Tom Rini


