Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O6ATr-0005fG-QB
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 00:39:16 +0200
Received: from [192.168.1.2] (e180149118.adsl.alicedsl.de [85.180.149.118])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 820A1584A04
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 00:40:09 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hr25nh$nft$1@dough.gmane.org>
References: <hr25nh$nft$1@dough.gmane.org>
Organization: Vanille-Media
Date: Mon, 26 Apr 2010 00:35:50 +0200
Message-ID: <1272234950.19634.30.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: a38e7ff2810e55455c7ff7b01d4882344b420e18 breaks build and packaged-staging, among other things
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
X-List-Received-Date: Sun, 25 Apr 2010 22:39:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 25.04.2010, 21:38 +0200 schrieb Koen Kooi:
> bitbake something-depending-on-vala-stuf
> 
> is now broken because bitbake will run
> something-depending-on-vala-stuf.do_configure and compile after
> vala-stuff.do_populate_staging and the vapi files will NOT be there.

Can you give a concrete example that breaks? I'm using quite a
substantial amount of Vala e.g. in task-fso2-compliance and it builds
from scratch without any problems.

> The other problem is that the packaged-staging packages won't contain
> the vapi files, so rebuilding staging it broken as well.

Ok, since the patch was made to get rid of all the 'legacy staging'
warnings, would do_install_append() instead of do_stage_vapi() fix that?

-- 
:M:



