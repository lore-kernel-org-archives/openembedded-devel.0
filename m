Return-Path: <tomas@novotny.cz>
Received: from kazi.fit.vutbr.cz (kazi.fit.vutbr.cz [147.229.8.12])
	by mail.openembedded.org (Postfix) with ESMTP id 2573E6E4B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 21:15:11 +0000 (UTC)
Received: from fuji.localdomain (ip-213-220-224-145.net.upcbroadband.cz
	[213.220.224.145]) (authenticated bits=0)
	by kazi.fit.vutbr.cz (8.14.7/8.14.6) with ESMTP id s2DLF46R001650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 13 Mar 2014 22:15:05 +0100 (CET)
Date: Thu, 13 Mar 2014 22:15:04 +0100
From: Tomas Novotny <tomas@novotny.cz>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20140313221504.60994024@fuji.localdomain>
In-Reply-To: <lfrvgd$3bd$1@ger.gmane.org>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
	<lfrvgd$3bd$1@ger.gmane.org>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.74 on 147.229.8.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Correct versioning of unversioned source in git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 21:15:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Mar 2014 10:59:38 +0100, Koen Kooi <koen@dominion.thruhere.net>
wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Tomas Novotny schreef op 13-03-14 10:08:
> > Hi all,
> > 
> > there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
> > fetches sources from unversioned git which contains definitions of some
> > boards (in fact it is something like a store). I'm not sure with correct
> > versioning in OE. Is that: PV = "1.0+git${SRCPV}" SRCREV =
> > "<some_gitrev_I_want>" correct? Will be change of SRCREV (only) catched
> > by build system (I'm curious how OE handles age of the rev in git)? Or do
> > I need to raise PV to 1.1 and so on with every change to SRCREV?
> 
> The answer changes if you have more than one buildhost. If you have only one
> buildhost and don't care about other people rebuilding the exact same
> versions, 1.0+git${SRCPV} will work.
> 
> If you have more than one buildhost and/or care about other people
> rebuilding the exact same, you'll need to increase PR (or PV) everytime
> SRCREV changes. That will still cause some discrepancies if someone rebuilds
> after >1 SRCREV change, but upgrade paths should work when increasing PV
> (not with PR!).

Thanks for the explanation, I will use the latter option.

Tomas

