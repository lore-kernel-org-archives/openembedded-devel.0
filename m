Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IJrDV-0000vN-JQ
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 15:41:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BDcR30004968
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 14:38:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04649-06 for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 14:38:12 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BDc5cK004944
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 14:38:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46BDB40D.4000301@dominion.kabel.utwente.nl>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
	<1186761021.6405.45.camel@localhost.localdomain>
	<74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
	<1186836221.5859.32.camel@localhost.localdomain>
	<46BDB40D.4000301@dominion.kabel.utwente.nl>
Date: Sat, 11 Aug 2007 14:38:05 +0100
Message-Id: <1186839485.5859.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sat, 11 Aug 2007 13:41:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-08-11 at 15:05 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > On Sat, 2007-08-11 at 12:20 +0200, pHilipp Zabel wrote:
> >> I guess it should to something like
> >> PACKAGES = "${PN} ${PN}-dbg ${PN}-dev" or not touch packages at all,
> >> if the code also works for -doc and -locale and enable that code,
> >> however it is done.
> > 
> > PACKAGES shouldn't need touching. Empty -doc and -locale packages won't
> > get created.
> 
> Even with ALLOW_EMPTY="1"?

Hmm. I guess adding ALLOW_EMPTY_foo = "1" for each task is boring so we
could be doing:

ALLOW_EMPTY_${PN}-doc = "0"
ALLOW_EMPTY_${PN}-locale = "0"

Is that preferable to overriding PACKAGES?

Richard



