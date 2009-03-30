Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LoERY-0007Hf-QZ; Mon, 30 Mar 2009 12:10:13 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LoEPS-0005uh-7B; Mon, 30 Mar 2009 11:08:03 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1LoEPR-0005lv-7z; Mon, 30 Mar 2009 11:08:01 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200903301118.38613.hs4233@mail.mn-solutions.de>
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301053.34937.hs4233@mail.mn-solutions.de>
	<gqq1us$1hk$1@ger.gmane.org>
	<200903301118.38613.hs4233@mail.mn-solutions.de>
Date: Mon, 30 Mar 2009 11:08:01 +0100
Message-Id: <1238407681.16991.114.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 10:10:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-03-30 at 10:18 +0100, Holger Schurig wrote:
> Is this a problem?  After all, busybox can drop priviledges:

Indeed it can, and for some distros that might well be a fine solution.
However, for other distros the prospect of a setuid-root busybox is an
unwelcome one, typically for some combination of the following reasons:

- making busybox be setuid means that you need to trust all the applets
to drop privileges that they don't need;

- there's no way of telling, from inspection of the binary, which
applets will run as setuid and which won't, nor of changing the setuid
attribute on individual applets without recompiling;

- security auditing is difficult, since the large amount of code-sharing
in busybox makes it hard to determine which functions can potentially be
called from a setuid context;

- the relatively high rate of code churn, combined with the large amount
of code re-use and the fact that there's no inbuilt guard against
accidentally mixing privilege domains, means that any audit would be
likely to need repeating frequently.

> If you are really paranoid and don't want to do this, build two 
> busybox binaries with different applets in them

That does help with the first two points above, but not with the latter
two.  And, if you're going to build a separate binary for the login
utilities, you might just as well have gone on using tinylogin in the
first place.

p.




