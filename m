Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LIWuL-0005WV-6v
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 00:24:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01NJB29020116
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 23:19:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19930-03 for <openembedded-devel@openembedded.org>;
	Thu,  1 Jan 2009 23:19:07 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01NJ2E3020110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 23:19:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1230827114.5320.42.camel@dax.rpnet.com>
References: <1230827114.5320.42.camel@dax.rpnet.com>
Date: Thu, 01 Jan 2009 23:19:24 +0000
Message-Id: <1230851964.5320.59.camel@dax.rpnet.com>
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
X-List-Received-Date: Thu, 01 Jan 2009 23:24:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-01-01 at 16:25 +0000, Richard Purdie wrote:
> The main problem I currently have before being able to deploy this more
> widely is auto adjustment of DEPENDS. In most cases this consists of
> adding "-native" or "-sdk" to the values already in DEPENDS so we could
> probably add a function to native.bbclass for that. Alternatively or
> additionally, I'm considering having native.bbclass append to OVERRIDES
> so we can override DEPENDS that way instead.

Just to follow up, I added some magic to native.bbclass and sdk.bbclass
which meant things would work for a larger test sample in Poky. This
commit has the details:

http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=8bc63a922d237b0c2797e231d3b5894bf88e0530

Cheers,

Richard



