Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IhWJh-0006xd-TU
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 22:13:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FK78M9003974
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 21:07:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03934-02 for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 21:07:02 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FK6wNK003965
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 21:06:58 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4713AD5F.3040807@student.utwente.nl>
References: <200710151419.07302.openembedded@haerwu.biz>
	<1192464632.25543.58.camel@localhost.localdomain>
	<4713AD5F.3040807@student.utwente.nl>
Date: Mon, 15 Oct 2007 21:06:57 +0100
Message-Id: <1192478818.25543.108.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 20:13:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-15 at 20:11 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > So perhaps we should just standardise the existing xserver behaviour
> > into a dedicated namespace:
> > 
> > DEPENDS = "virtual/xserver"
> > RDEPENDS_xyz = "${VIRTUAL-RUNTIME_xserver}"
> > 
> > and the machine.conf in this case would say
> > 
> > PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
> > VIRTUAL-RUNTIME_xserver = "xserver-kdrive-fbdev"
> 
> We have the ${XSERVER} var for runtime selecting it:

Indeed. So what should we use for update-alternatives,
${UPDATE-ALTERNATIVES} ? My point was that this is going to keep biting
us and a dedicated namespace might make sense?

Cheers,

Richard



