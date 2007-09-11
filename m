Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVD39-0003yr-DK
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 23:13:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BLAUGx028064
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:10:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27924-04 for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:10:27 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8BLANx2028058
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 22:10:23 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46E6EC08.209@student.utwente.nl>
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
	<46E6EC08.209@student.utwente.nl>
Date: Tue, 11 Sep 2007 22:10:23 +0100
Message-Id: <1189545023.6163.57.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: USE flags - why they won't work for OE
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
X-List-Received-Date: Tue, 11 Sep 2007 21:13:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-09-11 at 21:27 +0200, Koen Kooi wrote:
> Leon Woestenberg schreef:
> > Hello all,
> > 
> 
> > Maybe a minimal set of USE flags instead of creating -lite or -minimal
> > .bb is an option?
> > Or, using an include file that defines configuration variables
> > (HAVE_GTK, HAVE_X)?
> 
> Any form of USE flags is *bad* and *unacceptable*. I'll leave it to the other core people
> to throw around terms like 'deterministic' and 'package space' :)

Agreed. I will try and keep this brief whilst putting something in the
archives once and for all.

If we implement USE flags people can no longer know what options
"matchbox-wm" (or whatever other package) was compiled with. Reproducing
builds then becomes a nightmare and differences would not be obvious. It
also has potential to break dependencies since something depending on
matchbox-wm might need certain configure options and it has no way to
specify this in the package dependencies. 

We'd also get people complaining that they enabled gtk, built a
gpe-image in an existing build directory and why did it screw up badly
with half the components compiled without gtk? USE flags would be
something totally outside the existing dependency and timestamp/rebuild
tracking which is already complex enough.

Given this, the agreed approach in the past has been to create things
like "bluez-utils-nodbus". Its obvious whats missing from that package
and it works in feeds and dependencies.

Marcin's proposal of "bluez-utils-lite" is therefore in keeping with
this idea and he's demonstrated a clear cut need for it (massively
reduced build time for small images).

I'd also point out that OE has managed extremely well up to this point
without USE flags. I agree there are some corner cases where they're
help in theory but we can solve these problems in other ways.

Suggestions for better ways to handle this are extremely welcome but
"USE flags" as I understand the idea would turn into a nightmare and any
proposal needs to work for OE, not shoehorn in something from elsewhere
which doesn't fit.

Cheers,

Richard




