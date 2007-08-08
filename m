Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IIkYS-0003LW-KC
	for openembedded-devel@openembedded.org; Wed, 08 Aug 2007 14:22:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l78CJmtt003115
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Aug 2007 13:19:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03068-01 for <openembedded-devel@openembedded.org>;
	Wed,  8 Aug 2007 13:19:44 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l78CJd5e003109
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Aug 2007 13:19:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
References: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
Date: Wed, 08 Aug 2007 13:19:39 +0100
Message-Id: <1186575579.6091.43.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Inheriting conditionally
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
X-List-Received-Date: Wed, 08 Aug 2007 12:22:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2007-08-07 at 18:23 -0500, Matt Hoosier wrote:
> I'm search for a syntax that will allow me to inherit from certain
> classes only when using a particular distribution. Is there some good
> way to do this, like maybe:
> 
>   python {
>     if bb.getVar("DISTRO") == "mydistro"
>       # some API call to add inherited class
>   }
> 
> The particular thing I want to accomplish is to use the update-rc.d
> functionality to start a daemon systemwide only when targeting my own
> distro; it's nonstandard and wouldn't be appropriate for most
> distributions.

I can't think of a way to do this 100% neatly, the following is my best
idea:

SYSTEMWIDEDAEMON = "dummy"
SYSTEMWIDEDAEMON_mydistro = "myspecialclass"

inherit ${SYSTEMWIDEDAEMON}

The ugly bit is it needs an empty dummy.bbclass.

A quick test here suggests it might be harmless to use "base" there
since base will always have already been included...

Cheers,

Richard




