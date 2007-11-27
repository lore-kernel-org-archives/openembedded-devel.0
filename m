Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IwzVS-0008NU-9H
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 13:25:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARCMmit013501
	for <openembedded-devel@openembedded.org>; Tue, 27 Nov 2007 12:22:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13343-03 for <openembedded-devel@openembedded.org>;
	Tue, 27 Nov 2007 12:22:41 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARCMbia013485
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 27 Nov 2007 12:22:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <474AFA66.30509@gmx.net>
References: <474AFA66.30509@gmx.net>
Date: Tue, 27 Nov 2007 12:22:35 +0000
Message-Id: <1196166155.6780.11.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 12:25:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-11-26 at 17:55 +0100, Robert Schuster wrote:
> Hi
> Rodigo and me are suffering from bug 2412[0]. We talked a bit about the
> issue and I provided an idea on how to fix it. Unfortunately I lack the
> python experience to do it. I do not understand how the name conversion
> in debian.bbclass is actually done and where I could add code to replace
> slashes with hyphens.
> 
> Can anyone who has a better understanding of this help us out?
> 
> Regards
> Robert
> 
> [0] - http://bugs.openembedded.org/show_bug.cgi?id=2412

I commented on the bug but I will repeat here for wider exposure.

"The real problem here is that virtual/libx11 should not be appearing in
the package manager namespace. RPROVIDES = "virtual/libx11" is plain
wrong and is the real bug."

I've discussed this on the mailing list in the past, virtual/* shouldn't
ever be ending up in the runtime namespaces :/.

Cheers,

Richard



