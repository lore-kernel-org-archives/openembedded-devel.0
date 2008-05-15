Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JwgYi-0005Sk-VT
	for openembedded-devel@openembedded.org; Thu, 15 May 2008 18:44:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4FGgJ0D009636
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 17:42:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09527-04 for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 17:42:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4FGg7bA009606
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 17:42:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
Date: Thu, 15 May 2008 17:42:06 +0100
Message-Id: <1210869726.7097.93.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Stop on multiple providers but none explicitly	specified
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
X-List-Received-Date: Thu, 15 May 2008 16:44:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-05-14 at 23:36 +0200, Leon Woestenberg wrote:
> Hello all,
> 
> in trying to explain a new user why his build fails, it was the
> classic situation of multiple providers available but non specified:
> 
> NOTE: multiple providers are available for virtual/libc
> (external-toolchain, uclibc);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/libc
> 
> Now, as far as I know, this makes the build non-deterministic, because
> bitbake "just" chooses one.
> 
> Why do we want this behaviour? I cannot see any benefit in this situation.
> 
> We should at least prefer one over the other, or just bail out in my opinion.

Bitbake will pick one, the options in brackets are in the order bitbake
will choose them. We sort them alphabetically iirc since that is more
deterministic than depending on parsing order which was the previous
approach.

Cheers,

Richard



