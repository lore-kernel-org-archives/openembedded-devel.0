Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Pcb1c-00040h-UI
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 11:00:25 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAGe5K01bdWOb/2dsb2JhbAClKbs9hUwEkDg
X-IronPort-AV: E=Sophos;i="4.60,306,1291590000"; d="scan'208";a="716694869"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 11 Jan 2011 10:59:31 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pcb0l-0007Cc-MZ
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:59:31 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1Pcb0l-0006VP-IB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 10:59:31 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Pcb0l-00027u-BN
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 10:59:31 +0100
Date: Tue, 11 Jan 2011 10:59:30 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20110111095930.GA25123@lit.local.igalia.com>
References: <1294668735-25620-1-git-send-email-vjaquez@igalia.com>
	<2C4CA055-732C-4192-8E13-C85372B9950E@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <2C4CA055-732C-4192-8E13-C85372B9950E@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2] scons: add EXTRA_OESCONS
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
X-List-Received-Date: Tue, 11 Jan 2011 10:00:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 10, 2011 at 03:28:29PM +0100, Koen Kooi wrote:
> 
> Op 10 jan 2011, om 15:12 heeft Víctor Manuel Jáquez Leal het volgende geschreven:
> 
> > It's similar to EXTRA_OEMAKE, which appends arguments to the scons
> > command
> > 
> > v2:
> > * initialise the EXTRA_OECONS if it is not defined
> > 
> > Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
> 
> Acked-by: Koen Kooi <koen@openembedded.org>

Do I need another ack in order to push this patch?

vmjl

> 
> 
> > ---
> > classes/scons.bbclass |    4 +++-
> > 1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/classes/scons.bbclass b/classes/scons.bbclass
> > index 2a935e4..c19f8d4 100644
> > --- a/classes/scons.bbclass
> > +++ b/classes/scons.bbclass
> > @@ -1,5 +1,7 @@
> > DEPENDS += "python-scons-native"
> > 
> > +EXTRA_OESCONS ?= ""
> > +
> > export TARGET_LINK_HASH_STYLE
> > 
> > scons_do_compile() {
> > @@ -11,7 +13,7 @@ scons_do_compile() {
> >         fi
> >     fi
> > 
> > -    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} || \
> > +    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
> >     oefatal "scons build execution failed."
> > }
> > 
> > -- 
> > 1.7.2.3
> > 
> 
> 


