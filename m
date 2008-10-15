Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kq4K4-0001az-Nf
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 13:13:49 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kq4Ez-0007w6-H1
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 12:08:33 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1Kq4Ex-0002o6-Uh
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 12:08:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
References: <200810151022.38477.zecke@selfish.org>
	<c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
Date: Wed, 15 Oct 2008 12:08:31 +0100
Message-Id: <1224068911.30790.35.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Wed, 15 Oct 2008 11:13:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-15 at 12:43 +0200, Leon Woestenberg wrote:
> If we care about dynamic link speed we should maybe revisit the rpath issue.
> 
> I remember seeing strace's where on each .so, 10 attempts were made
> before the right location was attempted.

Yes, certainly.  There's basically no excuse for having bogus RPATHs in
the output executables.

Isn't insane.bbclass meant to be checking for these nowadays?

p.




