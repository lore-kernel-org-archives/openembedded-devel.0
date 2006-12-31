Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H11wA-0002dm-6o
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 15:45:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVEiUTI029816
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 14:44:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29289-07 for <openembedded-devel@openembedded.org>;
	Sun, 31 Dec 2006 14:44:25 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVEiL6J029797
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 14:44:21 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45a44e480612302025n36a2057fs9b70e8f6cdebf054@mail.gmail.com>
References: <45a44e480612302025n36a2057fs9b70e8f6cdebf054@mail.gmail.com>
Date: Sun, 31 Dec 2006 14:44:21 +0000
Message-Id: <1167576261.5592.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Feedback for patch adding softsqueeze recipe
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
X-List-Received-Date: Sun, 31 Dec 2006 14:45:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2006-12-30 at 23:25 -0500, Jaya Kumar wrote:
> I had submited a patch adding a recipe for softsqueeze. This is under bug 1717.
> http://bugs.openembedded.org/show_bug.cgi?id=1717
> 
> I would welcome your advice and feedback if it is ok before I try
> doing other stuff.

Hmm. You didn't pick a very easy package to build ;-). Firstly, this .bb
file doesn't build softsqueeze, it builds squeezeslave which is
something different. I was wondering since softsqueeze is a java app... 

Style wise I did wonder why you used "DEPENDS +=" ? Its not wrong as
such but not the usual style. I also didn't like the sed magic for
makefile.linux. I've changed that to use a patch because its easier to
see whats going on and if upstream changes, you will be more likely to
see the change when the patch fails to apply. Also, when you do this,
you find you patched $(LDFLAGS) into "make clean" and some other places
it isn't needed ;-).

I totally agree with using OE's own flac, vorbis and ogg libs. I'd go
further and add portaudio to OE as a separate package too. I'd also like
to see libslimproto packaged as a separate package and dynamically
linked to.

I'll add a version that implements some of the above to OE.dev shortly
(access to the server appears to be broken atm). Perhaps you could look
at sorting out a proper portaudio package?

I tried running the package on ARM and found a bug that stopped the
program running. I've not tested much more that this as I don't have
working sound on the device atm.

Its nice to see someone looking at using the Slim Devices software in
OE. I did some hacking on SlimServer and wrote the protocol information
softsqueeze was based on a few years ago :)

Richard		



