Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MdMMz-0003K4-Tw
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:56:51 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MdM6G-0007ol-I9
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 11:39:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MdM6C-00031G-Sw
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 11:39:29 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250591585.3555.12.camel@utx.utx.cz>
References: <1250567655-14771-1-git-send-email-msmith@cbnco.com>
	<1250591585.3555.12.camel@utx.utx.cz>
Date: Tue, 18 Aug 2009 11:39:25 +0100
Message-Id: <1250591965.27980.57.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] glibc: fix hardcoded /sbin/ldconfig path
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
X-List-Received-Date: Tue, 18 Aug 2009 10:56:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-18 at 12:33 +0200, Stanislav Brabec wrote:
> Michael Smith wrote:
> 
> > -FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '/sbin/ldconfig', '', d)}"
> > +FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
> 
> Did you test this change carefully? I seen this as well and tried
> ${@base_conditional('USE_LDCONFIG', '1', '${sbindir}/ldconfig', '', d)}
> 
> I don't know why, but it didn't work for me. If ${base_sbindir} works,
> then I agree with your fix.

${sbindir} expands to ${prefix}/sbin, i.e. /usr/sbin in most cases.
That isn't where ldconfig is generally installed so it is probably to be
expected that it didn't do the right thing.

p.




