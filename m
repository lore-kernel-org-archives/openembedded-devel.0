Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOzAe-0006VO-5C
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 17:39:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l27GdJAi031934
	for <openembedded-devel@openembedded.org>; Wed, 7 Mar 2007 16:39:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30903-09 for <openembedded-devel@openembedded.org>;
	Wed,  7 Mar 2007 16:39:17 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l27GdEpA031923
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 7 Mar 2007 16:39:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <151838550.20070307173136@gmail.com>
References: <151838550.20070307173136@gmail.com>
Date: Wed, 07 Mar 2007 16:39:14 +0000
Message-Id: <1173285554.5826.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Handling machines of the same architecture by different	screen resolutions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2007 16:39:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-03-07 at 17:31 +0200, Paul Sokolovsky wrote:
> Hello openembedded-devel,
> 
>   Continuing discussion of how to handle such important machine
> property like screen size/resolution, here's the issue: there're
> cases, when same "machine" in OE terms actually has submodels which
> differ in screen resolution. One example is recently added aximx50
> machine. That machine covers Axim X50, Axim X50V, Axim X51, Axim X51V
> PDA models. "V" models have VGA screen, others - QVGA. They are served
> by the same kernel port, though defconfigs for "V" models differ, as
> there's no runtime detection.
> 
>   And, again, screen sizes differ, so "V" machines should be
> bigscreen, while "V-less" - smallscreen. Does this warrant adding
> another machine to OE to cover "V" models? (It would be obviously
> done via refactoring common parts to machine/include/ ).

In my view yes, since they need different kernels.

If they used a common kernel, it would be a choice for the machine
maintainer where both large and small icons would be needed in the
image, selected at runtime in the common image case. A separate machine
is probably easier.

Cheers,

Richard






