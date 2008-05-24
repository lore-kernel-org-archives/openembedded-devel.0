Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jzx7n-0001LP-Jh
	for openembedded-devel@openembedded.org; Sat, 24 May 2008 19:01:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4OGwjGk005956
	for <openembedded-devel@openembedded.org>;
	Sat, 24 May 2008 17:58:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05775-04 for <openembedded-devel@openembedded.org>;
	Sat, 24 May 2008 17:58:40 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4OGwdqe005949
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 24 May 2008 17:58:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805240645n17fb3b70v435a34f491647de4@mail.gmail.com>
References: <c384c5ea0805240645n17fb3b70v435a34f491647de4@mail.gmail.com>
Date: Sat, 24 May 2008 17:58:40 +0100
Message-Id: <1211648320.5066.37.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: concurrency issue at hand?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 24 May 2008 17:01:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2008-05-24 at 15:45 +0200, Leon Woestenberg wrote:
> However, building this on different hosts, seeing different behaviour,
>  and now with concurrency disabled and enabled, I think we have a
> concurrency issue at hand.
> 
> Sometimes restarting the build helps, sometimes not.
> 
> I strongly suspect threaded bitbakes in combination with packaged-staging.
> 
> I just wondered if anyone else is seeing the same?

I think there are some issues with the version of packaged-staging in
OE.dev. I've been testing some fixes for concurrency issues in Poky and
I'll merge these to OE.dev...

Cheers,

Richard



