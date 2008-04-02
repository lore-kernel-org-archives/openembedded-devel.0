Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JgyE7-0006C6-H4
	for openembedded-devel@openembedded.org; Wed, 02 Apr 2008 10:21:47 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id EAA466280F5
	for <openembedded-devel@openembedded.org>;
	Wed,  2 Apr 2008 10:21:46 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <1206696274.5029.14.camel@dax.rpnet.com>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
Date: Wed, 02 Apr 2008 10:23:45 +0200
Message-Id: <1207124626.4010.96.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Wed, 02 Apr 2008 08:21:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> > After the fix, maybe binconfig files could be moved to the
> > standard staging directory (it must be in build path then).
> > 
> > Could anybody with deeper insight confirm it or do this change?
> 
> We still need that mangling unfortunately. The problem is that package b
> should not be injecting the results from binconfig directly into a .pc
> file, it should be using things like -L${libdir}/foo, not
> -L/some/hardcoded/path.
> 
> I'll have a look at that package and see if I can fix it.

OK. I did a per-package patch for libgnomecups and wv.

libgnomecups was confused by binconfig mangling.

wv was confused by a non-standard use of .pc files (use of @FOO_CFLAGS@
instead of Requires: foo).

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



