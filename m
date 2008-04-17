Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JmdTH-0005tH-1t
	for openembedded-devel@openembedded.org; Fri, 18 Apr 2008 01:24:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3HNOoU8020444
	for <openembedded-devel@openembedded.org>;
	Fri, 18 Apr 2008 00:24:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20293-03 for <openembedded-devel@openembedded.org>;
	Fri, 18 Apr 2008 00:24:45 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3HNOiqW020438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 18 Apr 2008 00:24:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fu8a9b$ces$1@ger.gmane.org>
References: <20080417175150.GJ31895@buddha.tw.openmoko.com>
	<fu8a9b$ces$1@ger.gmane.org>
Date: Fri, 18 Apr 2008 00:24:46 +0100
Message-Id: <1208474686.4993.182.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RDEPENDS_${PN}-dev = ${PN} badness
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
X-List-Received-Date: Thu, 17 Apr 2008 23:24:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-04-17 at 22:00 +0200, Koen Kooi wrote:
> John Lee wrote:
> > Take gtk-doc-dev for example:
> >
> > The gtk-doc package is empty, so it will not be created.  However, if
> > you install gtk-doc-dev, it RDEPENDS on gtk-doc, which cannot be
> > found.  The install will fail.
> >
> > I think we should use
> >
> > RRECOMMENDS_${PN}-dev = "${PN} (= ${DEBPV})"
> >
> > instead.
> 
> ALLOW_EMPTY_${PN} = "1" would be a better idea, and in line without 
> other depchain workarounds.

If ${PN} is empty and its existence makes no sense I think its
acceptable to do:

RDEPENDS_${PN}-dev = ""
RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${DEBPV})"

in the recipe itself. linux-libc-headers.inc does this for example since
${PN} makes no sense there.

There really aren't that many packages like this although there may be
some that have been dealt with in Poky but not in OE.

Cheers,

Richard



