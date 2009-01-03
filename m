Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LJ4ak-00088D-QY
	for openembedded-devel@openembedded.org; Sat, 03 Jan 2009 12:22:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n03BH6AY000880
	for <openembedded-devel@openembedded.org>; Sat, 3 Jan 2009 11:17:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00600-05 for <openembedded-devel@openembedded.org>;
	Sat,  3 Jan 2009 11:17:02 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n03BGxld000872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 3 Jan 2009 11:16:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1230851964.5320.59.camel@dax.rpnet.com>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<1230851964.5320.59.camel@dax.rpnet.com>
Date: Sat, 03 Jan 2009 11:17:23 +0000
Message-Id: <1230981444.5337.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Sat, 03 Jan 2009 11:22:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

To further update, I merged what was in OE and my Step A into poky. I
also merged some code rearranging into bitbake. This leaves the
following two commits:

This is the patch to add support to bitbake:

http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=7e4d5d677f996a9ca621f3ab6aa22cc7c3ef80d8

(3 files changed, 64 insertions, 12 deletions)

and this then changes some recipes in Poky to use BBCLASSEXTEND:

http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=7f3769423fa81163be97c744e3ee274a8cf45aa1

Cheers,

Richard



