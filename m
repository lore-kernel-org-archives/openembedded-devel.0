Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1N8blX-0003TC-TE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 16:39:23 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-9b-4afc2bd80fc4
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258038869.4924.67.camel@conroy-linux>
References: <200911120457.39018.holger+oe@freyther.de>
	<6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
	<1258038869.4924.67.camel@conroy-linux>
Date: Thu, 12 Nov 2009 10:29:36 -0500
Message-Id: <1258039776.4924.69.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 15:39:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-12 at 10:14 -0500, Chris Conroy wrote:
> On Thu, 2009-11-12 at 15:04 +1030, Graham Gower wrote:
> > 2009/11/12 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> > >
> > > ./run.do_populate_sdk.27727
> > > Collected errors:
> > >  * Could not obtain administrative lock for offline root (ERR: Bad file
> > > descriptor)  at /data/openembedded/build/arm/cortex-a8/tmp/work/x86_64-armv7a-
> > > sdk-angstrom-linux-gnueabi/meta-toolchain-1.0-r0/sdk/image//usr/lib/opkg/lock
> > 
> > Presumably, the lock file could not be creat()ed. Unfortunately, there
> > is no error checking on that creat() call in opkg and you don't get a
> > useful error message.
> I submitted a patch to opkg back in September to fix this error message
> to be a bit more useful. If you upgrade to opkg >=216 it will save you
> some headaches whenever this error occurs.

Apologies. I should have read your error message more closely since it
looks like you are getting the extra debug information from my patch.
Feel free to make a patch with more debug info for said error or just
let me know what you think would be appropriate and I can submit a new
one.

--Chris

> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


