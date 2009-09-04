Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MjVnK-0006Zi-P8
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 12:13:29 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MjVUr-0006D6-Kh
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 10:54:21 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MjVUq-0006d1-EK
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 10:54:20 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AA0D896.3030607@dresearch.de>
References: <4AA0D896.3030607@dresearch.de>
Date: Fri, 04 Sep 2009 10:54:16 +0100
Message-Id: <1252058056.27780.486.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: dropbear-0.51-r3 allow-nopw.patch: No such file or directory
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
X-List-Received-Date: Fri, 04 Sep 2009 10:13:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-09-04 at 11:06 +0200, Steffen Sledz wrote:
> It seems that commit c26fc5db90702b035bd545cff3ee7575a0f9b70f was incomplete.

Not so much incomplete as just misconceived: allow-nopw.patch is meant
to be applied in do_configure_prepend (under control of ${DISTRO_TYPE}),
not by do_patch.  

Changing that patch to apply unconditionally in do_patch is a rather
drastic policy change since it will enable passwordless logins for
non-debug distros (and, as it turns out, break compilation for debug
distros although that is something of a side issue).  This should
definitely not have been committed without discussion here.

p.




