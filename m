Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PaHVm-00057j-Ev
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 01:45:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p050jaN1005272;
	Wed, 5 Jan 2011 00:45:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04638-06; Wed,  5 Jan 2011 00:45:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p050jUoN005266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 5 Jan 2011 00:45:31 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinpcYFR8JaDHMtUcKW2YoaH6fG_+4An+Aq3mMoA@mail.gmail.com>
References: <1293905677.17519.16909.camel@rex>
	<AANLkTinpcYFR8JaDHMtUcKW2YoaH6fG_+4An+Aq3mMoA@mail.gmail.com>
Date: Wed, 05 Jan 2011 00:45:12 +0000
Message-ID: <1294188312.17519.22193.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake task logging
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
X-List-Received-Date: Wed, 05 Jan 2011 00:45:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-01-05 at 00:40 +0300, Yury Bushmelev wrote:
> 2011/1/1 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > I've been looking at the changes in bitbake master and those in Poky.
> > Both are trying to improve the logging situation but I think we need to
> > discuss/agree what we're trying to achieve.
> 
> [skip]
> 
> > Thoughts/Comments/Suggestions?
> 
> I'm interested in build perfomance monitoring/analyze. It would be
> great to have some tool (may be like bootchart) to be able to look at
> CPU time/RAM/Disk bandwidth/network traffic per task.

You should already be able to do this with the addhandler functionality
in a bbclass file to tap into bitbake's event stream. If you find you
can't, we should enhance things so you can :).

Cheers,

Richard




