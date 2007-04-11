Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HbYML-0004rU-Sn
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 10:39:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3B8dLlp014292
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:39:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14174-03 for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:39:18 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3B8dGDT014285
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Apr 2007 09:39:16 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0704110132s27b28fcifba5fc2db437e167@mail.gmail.com>
References: <c384c5ea0704110132s27b28fcifba5fc2db437e167@mail.gmail.com>
Date: Wed, 11 Apr 2007 09:39:15 +0100
Message-Id: <1176280755.5843.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: deterministic OE builds - multiple providers
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
X-List-Received-Date: Wed, 11 Apr 2007 08:39:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-11 at 10:32 +0200, Leon Woestenberg wrote:
> in trying to build my OE snapshot with a small extra bitbake
> collection to keep mildly customized .bb files across different Linux
> hosts.
> 
> In tracking down a host dependency I found that in cases where
> multiple providers are present, the behaviour is undeterministic, i.e.
> a provider is picked more or less randomly.
> 
> Can someone confirm this?
> 
> If this is the case, can we make it obiligatory to demand that in this
> case one single provider must be explicitly and unambiguously defined,
> and otherwise fail the build?

Which bitbake version is this with? Later versions should have more
deterministic handling that older versions.

Regards,

Richard



