Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GaJdO-0006f6-Rx
	for openembedded-devel@openembedded.org; Thu, 19 Oct 2006 00:11:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9IM4YqR028485;
	Wed, 18 Oct 2006 23:04:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28231-06; Wed, 18 Oct 2006 23:04:32 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9IM4WQA028476
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 18 Oct 2006 23:04:32 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: "Michael 'Mickey' Lauer" <mickey@tm.informatik.uni-frankfurt.de>
In-Reply-To: <1160999847.1649.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
References: <1160999847.1649.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
Date: Wed, 18 Oct 2006 23:04:34 +0100
Message-Id: <1161209075.5556.253.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] bitbake version comparison broken?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 22:11:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-10-16 at 13:57 +0200, Michael 'Mickey' Lauer wrote:
> Using bitbake trunk I just saw the following:
> 
> NOTE: gtk+ (2.10.3-r0) already staged but upgrading to 2.8.9-r4 to
> satisfy gtk+
> 
> Can we fix that?

For the archives we discussed this on irc and the problem is
gtk_2.10.3.bb sets DEFAULT_PREFERENCE = "-1". This means 2.8.9 is the
preferred version when no preference is set and it would overwrite the
previously built version.

Its a classic example of a message in bitbake that needs at the very
least rewording.

Richard



