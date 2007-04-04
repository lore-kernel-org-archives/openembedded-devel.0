Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HZ1iM-0002E7-Dh
	for openembedded-devel@openembedded.org; Wed, 04 Apr 2007 11:23:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l349Nbmm020591
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Apr 2007 10:23:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20042-05 for <openembedded-devel@openembedded.org>;
	Wed,  4 Apr 2007 10:23:35 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l349NUld020580
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Apr 2007 10:23:30 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4612E50B.90909@gmx.de>
References: <E1HYepp-00068Z-NQ@linuxtogo.org> <4612854C.5050904@gmx.de>
	<46128B3C.6090108@dominion.kabel.utwente.nl>  <4612E50B.90909@gmx.de>
Date: Wed, 04 Apr 2007 10:23:30 +0100
Message-Id: <1175678610.5834.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev linux-libc-headers: add	2.6.20	from Poky
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
X-List-Received-Date: Wed, 04 Apr 2007 09:23:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-04 at 01:36 +0200, Thomas Kunze wrote:
> >> Wouldn't it be better do do something like 
> >> http://bugs.openembedded.org/attachment.cgi?id=1172?
> >>     
> >
> > No, since I want 2.6.20, not 2.6.18
> But woudn't it be better to patch the kernel Kconfig files to provide 
> additional header files when invoking "make headers_install". The 
> attached patch does that for 2.6.18. But it should also work with newer 
> kernels. That way other architectures can also distribute the same 
> header files without storing them in OE.

I think the standard kernel header causes the build to break if I
remember rightly from my tests :-(. 

Ultimately, that needs fixing but I suspect the kernel people will say
its an external issue.

Regards,

Richard



