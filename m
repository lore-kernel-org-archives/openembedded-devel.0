Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxMH1-0004zD-HH
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:25:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31FMIct022599
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 16:22:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22092-10 for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 16:22:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31FMBwG022593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 16:22:12 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 01 Apr 2010 16:22:10 +0100
Message-ID: <1270135330.4993.116.camel@rex>
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
Subject: Re: sane-srcrevs.inc: moving all svn SRCREVs to recipes
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
X-List-Received-Date: Thu, 01 Apr 2010 15:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 17:11 +0200, Martin Jansa wrote:
> as already said here, global files are common place for conflicts and SRCREV
> belongs to recipe metadata.
> 
> This 2 patches are moving all SRCREVs for svn recipes, with some cleanup in few
> places, like renamed package to show it's from svn, or unified PV to contain
> +svnr${SRCPV}.
> 
> Please ACK or NACK soon as this gets conflicts soon. If there is no NACK in 20 
> hours I would like to push it. Thanks
> 
> Regards,
> 
> BTW: git SRCREVs weren't moved to recipes only because I'm maintaining SRCPV 
> branch and I don't want even more conflicts, I'll move the rest as soon as SRCPV
> is allowed in oe.dev branch for git recipes (please....).

Someone asked me at some point why we had revisions in a common file
rather than in the recipes. I've now remembered why this was necessary.
The reason was that you could not set a PREFERRED_VERSION of a recipe
using a SRCREV unless the SRCREV was in the configuration space rather
than in the recipe context.

Now we have the '%' character in PREFERRED_VERSION strings this becomes
much less of an issue.

Please beware of moving anything used in a PREFERRED_VERSION string
though.

Cheers,

Richard



