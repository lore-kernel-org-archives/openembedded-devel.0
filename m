Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KbDHK-0004t5-Fn
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 13:45:34 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KbDFE-00054O-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 12:43:24 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KbDFE-0003dw-47
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 12:43:24 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200809031554.52267.zecke@selfish.org>
References: <200809031554.52267.zecke@selfish.org>
Date: Thu, 04 Sep 2008 12:43:23 +0100
Message-Id: <1220528603.10295.236.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Thu, 04 Sep 2008 11:45:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-09-03 at 15:54 +0200, Holger Freyther wrote:
> we have a couple of issues with hash based SCMs (like git) and how we handle 
> them.

It's kind of tempting to say that you should just lean on your upstream
to make proper releases and use them, rather than trying to pull some
random bag of bits out of the SCM repository.  However, I guess this was
not the sort of advice you were looking for. :-}

Perhaps more constructively, my preference would be to use "git log" or
some such to extract the datestamp of the revision in question, and then
glue it into PV to make a version string that was sortable and hence
upgradeable.  So, if you had git revision
5a5346dfbec459c10d9e61e16e125b83975a1ef1 or whatever, you'd end up with
PV = "1.0.0+git20080904T123500
+5a5346dfbec459c10d9e61e16e125b83975a1ef1".  Obviously you still have
the possibility of losing if you want to upgrade from one revision to
another one committed in the same second, but I imagine this does not
arise often in practice.

If you don't like that idea then I would suggest the simpler approach of
a manually-maintained version number that you simply prepend to the SCM
revision identifier.  When you change from one SCM revision to another,
you would be responsible for incrementing this number.  This doesn't
seem like an unreasonable thing to require when using a SCM that doesn't
provide its own global versioning, and it's probably the only way of
making multiple branches work out right.

p.



