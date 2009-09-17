Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MoFgf-0007NP-5E
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 14:02:12 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MoFg9-0003QV-KV
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 13:01:37 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MoFg9-0005cS-BZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 13:01:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090917054034.GB5465@denix.org>
References: <20090917054034.GB5465@denix.org>
Date: Thu, 17 Sep 2009 13:01:33 +0100
Message-Id: <1253188893.12689.556.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] -dbg for static libraries?
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
X-List-Received-Date: Thu, 17 Sep 2009 12:02:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-09-17 at 01:40 -0400, Denys Dmytriyenko wrote:
> Would it make sense to package stripped version of a static lib into -dev and 
> the full version into corresponding -dbg?

I'm not sure that you'd want the debugging .a file in -dbg itself, since
the -dbg packages are for installation on the target device and the .a
libraries would be useless there. 

Punting the debug versions of the .a libraries into a new package
(-static-dbg or some such) wouldn't be a bad idea.  Or, for SDK
purposes, you could even consider ditching the .a libraries altogether
for packages that have a .so since virtually nobody is going to be doing
static linking in this day and age.

p.




