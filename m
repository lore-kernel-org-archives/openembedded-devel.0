Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NCW6A-0008PF-U1
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 11:24:50 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NCW4l-0006Ov-KD
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 10:23:19 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NCW4l-0004tz-9F
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 10:23:19 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091123091824.GC436@mx.loc>
References: <1256072198-4449-1-git-send-email-rep.dot.nop@gmail.com>
	<20091123091824.GC436@mx.loc>
Date: Mon, 23 Nov 2009 10:23:15 +0000
Message-Id: <1258971795.23826.225.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: PING Re: [PATCH] improve printing dependent tasks
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
X-List-Received-Date: Mon, 23 Nov 2009 10:24:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 10:18 +0100, Bernhard Reutner-Fischer wrote:
> PING ?
> 
> On Tue, Oct 20, 2009 at 10:56:38PM +0200, Bernhard Reutner-Fischer wrote:
> >Print names instead of Task-IDs (and not mentioning they're task ids).
> >
> >Previously we printed e.g.:
> >Dependency loop #1 found:
> >  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (depends: Set([88, 282, 92, 87]))
> >
> >Now we say
> >Dependency loop #1 found:
> >  Task 89 (/there/src/oe/openembedded/recipes/busybox/busybox-native_1.15.2.bb, do_configure) (dependent Tasks ['busybox-native, do_patch', 'update-rc.d, do_populate_staging', 'busybox-native, do_populate_staging', 'shasum-native.bb, do_populate_staging', 'busybox-native, do_unpack'])

It seems a bit weird to leave "Task 89" printed numerically if you are
going to expand all the others to text.  I'd have thought we would want
them all to be consistent.

That aside, though, this is a bitbake patch and you should probably send
it to the bitbake-dev list rather than openembedded-devel.

p.




