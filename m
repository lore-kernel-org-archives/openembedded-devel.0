Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P76EL-0001Cd-Gc
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:51:23 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 133B011001C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:50:52 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8A73511000E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:50:50 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225007172.adsl.alicedsl.de
	[92.225.7.172]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 14:50:50 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9A6863C105; Sat, 16 Oct 2010 14:50:32 +0200 (CEST)
Date: Sat, 16 Oct 2010 14:50:32 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101016125032.GA32732@rhein.zuhause.netz>
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4CB99A9C.2060507@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4CB99A9C.2060507@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:51:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 16, 2010 at 02:29:16PM +0200, Holger Freyther wrote:
> On 10/16/2010 01:56 PM, Frans Meulenbroeks wrote:
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> > ---
> >  recipes/gnutls/gnutls-2.10.1/libtool-update.patch |10965 ---------------------
> >  recipes/gnutls/gnutls_2.10.1.bb                   |   15 +-
> >  2 files changed, 13 insertions(+), 10967 deletions(-)
> >  delete mode 100644 recipes/gnutls/gnutls-2.10.1/libtool-update.patch
> 
> No,
> 
> I think that appraoch is wrong. autoreconf --install --force should call
> libtoolize which will copy over new files. So we should delete the libtool m4
> files, run libtoolize and hope that it works. Did you try this?

*g* Did you look at the patch? Frans is doing what you suggested.

Bye Henning


