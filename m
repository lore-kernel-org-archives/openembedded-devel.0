Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8EQ3-00059T-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 15:43:38 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nABEFkB1005829 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:15:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JW2-kFMDfzvm
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:15:46 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nABEFdEI005812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 14:15:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911111251.40375.holger+oe@freyther.de>
References: <200911110922.49285.holger+oe@freyther.de>
	<200911111106.45146.holger+oe@freyther.de>
	<200911111251.40375.holger+oe@freyther.de>
Date: Wed, 11 Nov 2009 14:15:20 +0000
Message-Id: <1257948920.29038.384.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: pkgconfig-sdk breakage
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
X-List-Received-Date: Wed, 11 Nov 2009 14:43:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 12:51 +0100, Holger Hans Peter Freyther wrote:
> On Wednesday 11 November 2009 11:06:45 Holger Hans Peter Freyther wrote:
> > On Wednesday 11 November 2009 09:22:49 Holger Hans Peter Freyther wrote:
> > > Hi,
> > >
> > > my current meta-toolchain builds breaks on some python code
> > > executed while building pkg-config-sdk. Any ideas?
> 
> The pkgconfig-sdk_0.23.bb file is doing a do_stage_prepend which seems
> to break things... due the removal of base_do_stage and the removal from 
> EXPORT_FUNCTIONS...
> 
> any idea?

This was discussed on IRC. Some checks were added to base.bbclass to
detect recipes with this problem and all in tree ones have now been
fixed to behave as they did before.

Cheers,

Richard



