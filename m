Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HEQam-0000pT-2B
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 14:42:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l16DgeVa030144
	for <openembedded-devel@openembedded.org>; Tue, 6 Feb 2007 13:42:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29487-06 for <openembedded-devel@openembedded.org>;
	Tue,  6 Feb 2007 13:42:37 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l16DgZfv030132
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 6 Feb 2007 13:42:35 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45C87517.5040808@dominion.kabel.utwente.nl>
References: <45BB64DC.1080601@dominion.kabel.utwente.nl>
	<45C85593.3060603@dominion.kabel.utwente.nl>
	<74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>
	<45C85F79.7040201@dominion.kabel.utwente.nl>
	<1170763266.5826.31.camel@localhost.localdomain>
	<45C87517.5040808@dominion.kabel.utwente.nl>
Date: Tue, 06 Feb 2007 13:42:35 +0000
Message-Id: <1170769355.5826.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Tue, 06 Feb 2007 13:42:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-06 at 13:31 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> > If we are going down this route, we should probably have applications
> > say which flavour of libx11 they want through some virtual namespaces.
> > virtual/libx11 would mean they'll work with any of the versions.
> 
> It basically boils down to:
> 
> a) I need basic x11 (gtk+, qt, etc)
> b) I need cms (rxvt, icewm) (+32kB iirc)
> c) I need xkb (xserver-xorg, xkb*) (+80kB iirc)
> d) I need obsolete stuff (Xaw) (+2MB iirc)

Are those compressed or uncompressed sizes? For the sake of 100kb
uncompressed, I'm tempted to suggest adding features to the basic x11...

> a -> libx11-minimal.bb
> b -> libx11-cms.bb
> c -> libx11-cms-xkb.bb
> d -> libx11-full.bb
> 
> Is that like you want?

Kind of.

libx11-minimal: RPROVIDES = "virtual/libx11"
libx11-xkb:     RPROVIDES = "virtual/libx11 virtual/libx11-xkb"
libx11-full:    RPROVIDES = "virtual/libx11 virtual/libx11-xkb virtual/libx11-full"
(along with whatever the magic is to say they're equivalent and replace
each other)

Then anything requiring Xaw can RDEPENDS = "virtual/libx11-full" etc.

Richard



