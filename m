Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KLwpR-0005pl-Og
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 11:09:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6O98HcJ011674
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 10:08:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11376-07 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 10:08:12 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6O98BKp011667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 10:08:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
References: <200807240048.20980.bluelightning@bluelightning.org>
	<g69aeh$5cu$1@ger.gmane.org>
	<1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
Date: Thu, 24 Jul 2008 10:08:10 +0100
Message-Id: <1216890490.6103.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 09:09:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2008-07-24 at 20:08 +1200, Paul Eggleton wrote:
> Koen Kooi wrote:
> > Never ever rdepend on a kernelmodules, since it might be built in to the
> > kernel in the future (like it was in the past), only use
> >
> > RRECOMMENDS_${PN} = "kernel-module-foo"
> 
> OK, so please excuse my ignorance and I don't have OE in front of me to
> test it, but does that mean that kernel-module-mtdblock will be included
> in images where h2200-bootloader is included? If not, then it needs to be
> done some other way.

Yes, its standard practise to RRECOMMEND kernel modules since if they're
built into the kernel you get build failures otherwise. The RRECOMMEND
is a standard approach and well tested.

Regards,

Richard



