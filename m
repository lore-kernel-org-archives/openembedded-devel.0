Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IOWfT-00057Y-0T
	for openembedded-devel@openembedded.org; Fri, 24 Aug 2007 12:45:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7OAiFkS000650
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Aug 2007 11:44:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32719-08 for <openembedded-devel@openembedded.org>;
	Fri, 24 Aug 2007 11:44:11 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7OAi7LO000643
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Aug 2007 11:44:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <b7022e40708232121w53c4ec04g7df06dd2bf1e0dd5@mail.gmail.com>
References: <b7022e40708232121w53c4ec04g7df06dd2bf1e0dd5@mail.gmail.com>
Date: Fri, 24 Aug 2007 11:44:06 +0100
Message-Id: <1187952247.6241.25.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: noob trying to build for i686 (PIII)
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
X-List-Received-Date: Fri, 24 Aug 2007 10:45:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-08-24 at 00:21 -0400, Ron Senykoff wrote:
> Hi I'm new to openembedded, not linux so much though.
> 
> OK so I try to build nano, with 'bitbake nano'
> Here's the output: http://paste.uni.cc/16996
> And here's my local.conf: http://paste.uni.cc/16995
> 
> I hosted these to save space.
> 
> Any ideas? I'm going for a simple build for a PIII box that I need
> alsa support as I'll be using it in the trunk of my car to process
> audio in/out (a.k.a. www.duffroomcorrection.com)

Delete these lines from local.conf, they're invalid:

PREFERRED_PROVIDERS += " virtual/db-native"
PREFERRED_PROVIDERS += " virtual/db"

Regards,

Richard



