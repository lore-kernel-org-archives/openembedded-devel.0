Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LoFRd-00064k-G0; Mon, 30 Mar 2009 13:14:21 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LoFPa-00077n-Rc; Mon, 30 Mar 2009 12:12:14 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1LoFPa-0006CG-Mn; Mon, 30 Mar 2009 12:12:14 +0100
From: Phil Blundell <pb@reciva.com>
To: Holger Schurig <hs4233@mail.mn-solutions.de>
In-Reply-To: <200903301254.51359.hs4233@mail.mn-solutions.de>
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301118.38613.hs4233@mail.mn-solutions.de>
	<1238407681.16991.114.camel@mill.internal.reciva.com>
	<200903301254.51359.hs4233@mail.mn-solutions.de>
Date: Mon, 30 Mar 2009 12:12:14 +0100
Message-Id: <1238411534.16991.120.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 30 Mar 2009 11:14:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-03-30 at 11:54 +0100, Holger Schurig wrote:
> > - security auditing is difficult, since the large amount of
> > code-sharing in busybox makes it hard to determine which
> > functions can potentially be called from a setuid context;
> 
> Can I assume from this that you didn't actually look at busybox's 
> source-code?

No, I think you misunderstood what I meant.

The difficulty isn't in determining which applets will run as setuid; as
you say, that's straightforward to determine from the source code
(although not from the binary).  

The issue is that, since all the applets are linked together into one
monolithic binary, and hence have the ability in theory to call any
function in that binary, it is difficult to tell by looking at the
source code which functions might potentially be called (directly or
indirectly) by one of the setuid applets and hence would need to be
included in an audit for privilege-escalation vulnerabilities.

> Except that TinyLogin is end-of-life and won't get bugfixes from 
> upstream.

Yes, that's obviously the tradeoff.  Tinylogin is simple enough, though,
that fixing bugs locally would be easy enough if that became necessary.

p.




