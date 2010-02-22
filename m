Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NjctT-0002D7-KS
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 19:20:34 +0100
Received: by fxm20 with SMTP id 20so2597440fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=TBtfVP7lsOjMCoV3V+RmuZl08b0ONsWbB3YChqDthbw=;
	b=XFMk8rWuya5i9TVWrhJCMNwSVtgzEOqIRfqvg6hrApXLI0IT/6TBZL2SdJDdgDO+H3
	xaey/b73CoFIHFRRcOmpG8LRYN2wuYhy5jrpB1xWS0d800r9TdgnG+Cao4N5Ekn7RJWO
	nTDlrq3vu5HG18stP87noyEz4krfJlDUNVLfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=VhqbvuQESpNKd9tty5F9PNO2aaSsjnwzTSkRBXIGfCISkhJNibWw7iPoGAP7uUIQ5X
	k3MgvyoqGMY42rAd4gJs5ELHkF4cxo6Sk+ifYX4hKBeRn1+IB0ZZh8dBgoHJcOxVpQ4E
	Xmao3U6dIqrYI7fBOm8tCsQU3iLvkw7i/ZpIc=
Received: by 10.223.95.69 with SMTP id c5mr5620756fan.44.1266862667755;
	Mon, 22 Feb 2010 10:17:47 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b17sm5675519fka.43.2010.02.22.10.17.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 10:17:46 -0800 (PST)
Date: Mon, 22 Feb 2010 19:17:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100222181754.GB24049@jama>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
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
X-List-Received-Date: Mon, 22 Feb 2010 18:20:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 22, 2010 at 10:06:00AM -0700, Chris Larson wrote:
> On Mon, Feb 22, 2010 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
> >> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote:
> >> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> >> > ---
> >> >  recipes/git/git.inc |    2 +-
> >> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >> >
> >> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> >> > index 644e159..fd7b708 100644
> >> > --- a/recipes/git/git.inc
> >> > +++ b/recipes/git/git.inc
> >> > @@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
> >> >  SECTION = "console/utils"
> >> >  LICENSE = "GPL"
> >> >
> >> > -SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
> >> > +SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"
> >>
> >> Is there a patch to add checksums in corresponding recipes to use the name? Or
> >> what is the purpose of adding one?
> >
> > I guess the idea is to make it possible for new recipes (which use
> > this .inc file) to include their own checksums.  Seems like a reasonable
> > enough plan even if the old recipes are not converted.
> 
> Has anyone thought about programmatically injecting a name to the
> first tarball/zip in the SRC_URI if no sources have that name yet?  It
> seems like adding a name to the primary tarball is becoming common
> boilerplate, and the common case is for that to be the first source.

Also would be great to have unified names where possible.

It would make adding new recipes a bit easier (no need to
check/copy&paster name used in .inc and also base.bbclass could easily
generate those checksum sections with right name easier.

I'm using "archive" as few others also used.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


