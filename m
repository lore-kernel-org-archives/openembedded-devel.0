Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Njbba-0002Wj-0A
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:58:01 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NjbYw-0002Rz-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 16:55:15 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NjbYv-0004Fi-Gq
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 16:55:13 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100222162424.GA27420@denix.org>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
Date: Mon, 22 Feb 2010 16:55:09 +0000
Message-ID: <1266857709.14566.348.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Feb 2010 16:58:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote:
> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > ---
> >  recipes/git/git.inc |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> > index 644e159..fd7b708 100644
> > --- a/recipes/git/git.inc
> > +++ b/recipes/git/git.inc
> > @@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
> >  SECTION = "console/utils"
> >  LICENSE = "GPL"
> >  
> > -SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
> > +SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"
> 
> Is there a patch to add checksums in corresponding recipes to use the name? Or 
> what is the purpose of adding one?

I guess the idea is to make it possible for new recipes (which use
this .inc file) to include their own checksums.  Seems like a reasonable
enough plan even if the old recipes are not converted.

p.




