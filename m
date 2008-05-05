Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jt409-0004SI-W9
	for openembedded-devel@openembedded.org; Mon, 05 May 2008 18:57:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m45Gv6gN020881
	for <openembedded-devel@openembedded.org>;
	Mon, 5 May 2008 17:57:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20575-08 for <openembedded-devel@openembedded.org>;
	Mon,  5 May 2008 17:56:57 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m45GuquJ020853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 5 May 2008 17:56:52 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1209250940.5086.46.camel@dax.rpnet.com>
References: <1209250940.5086.46.camel@dax.rpnet.com>
Date: Mon, 05 May 2008 17:56:52 +0100
Message-Id: <1210006612.5113.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Proposed rebuild task fix
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 05 May 2008 16:57:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-04-27 at 00:02 +0100, Richard Purdie wrote:
> As mentioned recently the rebuild task has issues. The attached patch is
> the fix I'd like to propose for this. It adds a "setscene" task which
> runs before fetch and does housekeeping style activities like cleaning
> up work areas. I've written it so the existing packaged-staging
> "do_prepackaged_stage" task is also brought under the umbrella of this
> new task. One useful advantage to this is you can then enable/disable
> packaged staging within a given build and it won't rebuild everything
> which is a drawback of the current setup.
> 
> The main drawback to this proposed change is that it will force a full
> rebuild of everything equivalent to a 'wipe tmp/'.

I've just committed this. People should be aware this will cause an
effective rebuild and anyone wishing to avoid that should not upgrade
until its more convenient.

Regards,

Richard



