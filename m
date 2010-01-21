Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NY5C4-0003SW-Dg
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:08:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id ED68A1400755
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:08:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXVIOh61Cbs1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:08:11 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A8774140973B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:08:11 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100121194812.GD3208@jama>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org>  <20100121194812.GD3208@jama>
Date: Thu, 21 Jan 2010 23:06:45 +0100
Message-Id: <1264111605.7697.39.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 22:08:03 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:

> Would be OK to create also branch for stuff I'm going to push upstream
> soon? with developer name prefix like WIP branches ie
> martin_jansa/for-oe-upstream ?

Yes, WIP free-for-all branches would be a good idea. Something like this
exists in openSUSE Build Service and it is used by many users for their
experiments.

As OE uses git, maybe by purpose hierarchy could be better than by user,
for example:
wip/org.openembedded.dev.no_static_libraries

Every branch should contain README with this information:
Who created it
Why it was created
Why it is not in mainline
What needs to be done to merge it with mainline.
When the branch becomes obsolete.

I guess that many patches are lost just because the original author lost
effort to finish the work and make the patch good for mainline.

With such public wip branches, anybody can take the work, improve it or
finish it.



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



