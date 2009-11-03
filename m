Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N5Jyr-0000rl-6q
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 15:03:33 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N5JxU-0006DD-4R
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 14:02:04 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1N5JxR-0003Gz-IY
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 14:02:01 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911031451.06266.holger+oe@freyther.de>
References: <1254096967.4ac00047b8abb@imp.free.fr>
	<200911031451.06266.holger+oe@freyther.de>
Date: Tue, 03 Nov 2009 14:01:58 +0000
Message-Id: <1257256918.10421.111.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xmonobut
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
X-List-Received-Date: Tue, 03 Nov 2009 14:03:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-03 at 14:51 +0100, Holger Hans Peter Freyther wrote:
> On Monday 28 September 2009 02:16:07 Alain2210 wrote:
> > Hello,
> > 
> > xmonobut segfault. I need this patch to get it works again.
> 
> > -  unsigned char map[6];
> > +  unsigned char map[31];
> ...
> > +      buts = XGetPointerMapping(dpy, map, 32);
> ,,.
> > +      while((rst = XSetPointerMapping(dpy, map, 32)) == MappingBusy);
> 
> 31. vs 32... please send an updated patch

Looking at this patch again, I think it is just broken and (even aside
from the 31/32 thing) should not be applied.

I guess the cause of the original segfault was that "buts" is set to a
value greater than six and hence the XSetPointerMapping() call runs off
the end of the array.  However, the solution presented in the patch,
i.e. just ignoring the return value from XGetPointerMapping()
altogether, doesn't seem too good either since this will cause
XSetPointerMapping() to read uninitialised garbage from the balance of
the array.

A minimal fix for the original crash would probably be to insert
something like:

if (buts > sizeof(map))
  buts = sizeof(map);

after the XGetPointerMapping() call.  A slightly better fix would
perhaps be to make an initial call to XGetPointerMapping() with nmap=0
to find out how many buttons are present, then to dynamically allocate
an array of the right size and read the mapping into it.

p.




