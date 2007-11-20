Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IuWMk-0003sf-Fb
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 17:54:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAKGqH4f029268
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 16:52:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29241-01 for <openembedded-devel@openembedded.org>;
	Tue, 20 Nov 2007 16:52:14 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAKGq9Mf029245
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 16:52:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <db5939b2996965487cda218229f0b0ee@127.0.0.1>
References: <1195552013.6337.18.camel@localhost.localdomain>
	<db5939b2996965487cda218229f0b0ee@127.0.0.1>
Date: Tue, 20 Nov 2007 16:52:07 +0000
Message-Id: <1195577527.6337.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Host dependency vs. -native packages balance
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
X-List-Received-Date: Tue, 20 Nov 2007 16:54:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-20 at 12:18 +0100, Esben Haabendal wrote:
> On Tue, 20 Nov 2007 09:46:53 +0000, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Tue, 2007-11-20 at 07:36 +0100, Esben Haabendal wrote:
> >> Not having looked at the details of this bug, it seems like a good
> >> example of how more host dependency creep into OE.
> >>
> >> I think it raises two questions:
> >>
> >> 1. Where do we want the balance between dependency on host installed
> >> libraries and tools vs. OE provided -native packages?
> >>
> >> 2. How can we better handle or track the actual host dependency of
> >> current OE?
> >>
> >> The current situation is that some (maybe even most) host dependencies
> >> are discussed on the RequiredSoftware  and OEandYourDistro pages. They
> >> are clearly not up-to-date and comments in bugzilla such as the one
> >> below are a bit harder to find.
> > 
> > Dependencies needed from the host system are those listed in
> > ASSUME_PROVIDED. If its not listed in ASSUME_PROVIDED, OE shouldn't need
> > it. If it needs something not listed, that is a bug.
> 
> Why are we then closing bugs with arguments such as "just install XXX on your host"?

They shouldn't be being closed with that IMO...

Cheers,

Richard



