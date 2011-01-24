Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhRIn-0000Lj-4S
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 19:38:09 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEANZVPU1bdWOb/2dsb2JhbAClW7tzhVAE
X-IronPort-AV: E=Sophos;i="4.60,371,1291590000"; d="scan'208";a="323214963"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 19:37:25 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhRI5-00011v-7U; Mon, 24 Jan 2011 19:37:25 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhRI5-0007aj-3Z; Mon, 24 Jan 2011 19:37:25 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhRI4-0003s4-FE; Mon, 24 Jan 2011 19:37:24 +0100
Date: Mon, 24 Jan 2011 19:37:24 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: Steve Sakoman <steve@sakoman.com>
Message-ID: <20110124183724.GC30662@lit.local.igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
	<97b6dd6720dcdcdbd27616740b3707bc108a4927.1295880053.git.vjaquez@igalia.com>
	<1295882416.1999.8.camel@quadra>
	<20110124171851.GB30662@lit.local.igalia.com>
	<1295890383.1999.11.camel@quadra>
MIME-Version: 1.0
In-Reply-To: <1295890383.1999.11.camel@quadra>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot-sakoman: fix break caused by the new binutils
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
X-List-Received-Date: Mon, 24 Jan 2011 18:38:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 24, 2011 at 09:33:03AM -0800, Steve Sakoman wrote:
> On Mon, 2011-01-24 at 18:18 +0100, Víctor M. Jáquez L. wrote:
> > On Mon, Jan 24, 2011 at 07:20:16AM -0800, Steve Sakoman wrote:
> > > On Mon, 2011-01-24 at 15:48 +0100, Víctor Manuel Jáquez Leal wrote:
> > > > New assemblers need -march=armv7-a+sec on command line or .arch_extension sec
> > > > inline to enable use of the smc instruction.
> > > > 
> > > > This patch adds as-instr to check the latter to conditionally enable the
> > > > former in AFLAGS for files that use smc.
> > > 
> > > Since this is a generic u-boot issue, it would be best to submit the
> > > Makefile patch to the u-boot mailing list.
> > > 
> > 
> > These patches depend on these ones:
> > 
> > http://www.sakoman.com/cgi-bin/gitweb.cgi?p=u-boot.git;a=commitdiff;h=2a9a9da5530f5bc9cb09ffa2fe8e32494d1a8b0f
> > 
> > and 
> > 
> > http://www.sakoman.com/cgi-bin/gitweb.cgi?p=u-boot.git;a=commitdiff;h=268fff79ea11b2bb6f174c3c97c104768b5cd7e3
> > 
> > but neither are in the denx's git repository, neither in its patchwork.
> > 
> > So, I'm not sure what should I do. Any advise?
> 
> Yeah, Aneesh is still revising those patches to respond to list
> feedback.
> 
> You could submit your patch in a RFC form with a note that it depends on
> the cache maintenance patches that Aneesh is revising.
> 
> That way you can get some comments on the basic idea while waiting for
> Aneesh's patches to be accepted.  At that point you could submit a final
> patch for approval.

Done. Thanks a lot! :)

vmjl

> 
> Steve
> 
> 
> 
> 


