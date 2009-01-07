Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LKcWS-0004Zr-2U
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 18:48:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n07HgjcE012295
	for <openembedded-devel@openembedded.org>; Wed, 7 Jan 2009 17:42:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11982-05 for <openembedded-devel@openembedded.org>;
	Wed,  7 Jan 2009 17:42:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n07HgbKf012288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 7 Jan 2009 17:42:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1fea892d0901070846h7e3dc5cn4263adbac0252596@mail.gmail.com>
References: <1fea892d0901070846h7e3dc5cn4263adbac0252596@mail.gmail.com>
Date: Wed, 07 Jan 2009 17:43:13 +0000
Message-Id: <1231350193.5331.37.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Double defines FILESPATH
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
X-List-Received-Date: Wed, 07 Jan 2009 17:48:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-01-07 at 21:46 +0500, Anatoly Shipitsin wrote:
> Why FILESPATH defines twice? I'm find define in classes/base.bbclass and
> conf/bitbake.conf.

This is actually on my list of things to clean up in OE, I already did
in Poky. The one to remove is the one in bitbake.conf as the
base.bbclass one always replaces it.

Cheers,

Richard



