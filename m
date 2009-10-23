Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N1FjW-0001e1-9S
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 10:42:54 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N1FiN-0003GH-4a
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:41:41 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N1FiK-0003Ae-8C
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:41:36 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
References: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
Date: Fri, 23 Oct 2009 09:41:32 +0100
Message-Id: <1256287292.4529.122.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] package complete ${datadir} ${libdir} by default
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
X-List-Received-Date: Fri, 23 Oct 2009 08:42:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-10-22 at 21:08 +0200, Leon Woestenberg wrote:
> Hello,
> 
> Why does FILES_${PN} have ${PN} after ${datadir} and ${libdir}?
> 
> I would propose to just package ${datadir} and ${libdir} as-is.
> Or am I overlooking something?

This would require a bit of juggling of the order that the subpackages
appear in PACKAGES, so that the right files continue to land in the
-dev/-locale/-doc subpackages, but apart from that it sounds like a
fairly sound plan to me.

As a less intrusive (though also less elegant) alternative, you could
introduce a new variable ${BINPN} or something, which defaults to the
same as ${PN} but is overrideable as necessary, and then define FILES_
${PN} in terms of that one.  That would deal with the case where you
have multiple variations on the same package, all with slightly
different ${PN}s.

p.




