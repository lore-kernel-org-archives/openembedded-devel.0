Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1Phlc6-0000zt-Gp
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:19:26 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAMOGPk1bdWOb/2dsb2JhbAClYr0NhU8Ekgs
X-IronPort-AV: E=Sophos;i="4.60,374,1291590000"; d="scan'208";a="718561549"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Jan 2011 17:18:41 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlbM-0005PO-CB; Tue, 25 Jan 2011 17:18:40 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlbM-0004cO-7Y; Tue, 25 Jan 2011 17:18:40 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhlbL-00045R-Sm; Tue, 25 Jan 2011 17:18:39 +0100
Date: Tue, 25 Jan 2011 17:18:39 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20110125161839.GC24126@lit.local.igalia.com>
References: <1295970665-14658-1-git-send-email-vjaquez@igalia.com>
	<44B46FD7-B8AF-4FD7-9964-A6FDE847BE46@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <44B46FD7-B8AF-4FD7-9964-A6FDE847BE46@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python-scons_1.3.0: add missing dependencies
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
X-List-Received-Date: Tue, 25 Jan 2011 16:19:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 25, 2011 at 04:59:25PM +0100, Koen Kooi wrote:
> Some small nitpicks, see below
> 
> Op 25 jan 2011, om 16:51 heeft Víctor Manuel Jáquez Leal het volgende geschreven:
> 
> > In order to launch scons in a board it depends on a couple python packages
> > which were not managed by the recipe.
> > 

[snip]

> 
> We generally put variables in the order OE uses them, so RDEPENDS should go
> next to do_package/FILES/etc. Historically it was on top, but that stopped
> making sense after switching to RDEPENDS_${PN}

Done.

> 
> > LICENSE = "GPL"
> 
> Could you fix that while you're at it? It would be  nice to know if it's
> GPLv2 or GPLv2+.

Verified. It is MIT not GPL!

> 
> Other than that, the patch looks OK to me[1].
> 
> regards,
> 
> Koen
> 
> [1] Sconstructs still make my eyes bleed, but that's not the point

I do not like it either at all, but v8 uses it.

vmjl


