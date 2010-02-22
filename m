Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nje85-0005TX-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 20:39:45 +0100
Received: by fxm20 with SMTP id 20so2676121fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=hIPI4FKgrfquxk8nTOBj+n8ZTkrAyB24WojJMkV5Sys=;
	b=oQe07xpCB9RzNCy/BWml2b1s71RBp9VW4195+P9YISU89hPZ6wSAdKtApE2/B+hxO7
	/hgyfiFDiYQBdV5SdSP1JwZJnbl5v3ie9Q5gCJPPmZu2KbT05DXf360qF9R3gaU2HchB
	8lD7DtNQxuqACCYS946fn4ZbRN0M57ObPAuHY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=NcnMhamdZaIwmUgcVUrSLmUaGM6AeknE/kKaKK9EpDgGtKnO6Yat1L6vBUy/mkGIOg
	EdPMDXaj1SQpSij/FCvwF2jhcyi0Ef6v6B6J2uyc7+u5H6jgBjz0qXOcp3SD6DXyuRlh
	FbZo1hQA6VZczK/lBDNHPsqOlNlJo4dJBdYEU=
Received: by 10.223.7.4 with SMTP id b4mr3348436fab.102.1266867417582;
	Mon, 22 Feb 2010 11:36:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id e17sm5752562fke.27.2010.02.22.11.36.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 11:36:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NjeAJ-0002Hk-PX; Mon, 22 Feb 2010 20:41:59 +0100
Date: Mon, 22 Feb 2010 20:41:59 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100222194159.GZ30265@mx.loc>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
	<20100222181754.GB24049@jama>
MIME-Version: 1.0
In-Reply-To: <20100222181754.GB24049@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
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
X-List-Received-Date: Mon, 22 Feb 2010 19:39:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 22, 2010 at 07:17:54PM +0100, Martin Jansa wrote:
>On Mon, Feb 22, 2010 at 10:06:00AM -0700, Chris Larson wrote:
>> On Mon, Feb 22, 2010 at 9:55 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
>> >> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-Fischer wrote:
>> >> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> >> > ---
>> >> >  recipes/git/git.inc |    2 +-
>> >> >  1 files changed, 1 insertions(+), 1 deletions(-)
>> >> >
>> >> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
>> >> > index 644e159..fd7b708 100644
>> >> > --- a/recipes/git/git.inc
>> >> > +++ b/recipes/git/git.inc
>> >> > @@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
>> >> >  SECTION = "console/utils"
>> >> >  LICENSE = "GPL"
>> >> >
>> >> > -SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
>> >> > +SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=git"
>> >>
>> >> Is there a patch to add checksums in corresponding recipes to use the name? Or
>> >> what is the purpose of adding one?
>> >
>> > I guess the idea is to make it possible for new recipes (which use
>> > this .inc file) to include their own checksums.  Seems like a reasonable
>> > enough plan even if the old recipes are not converted.
>> 
>> Has anyone thought about programmatically injecting a name to the
>> first tarball/zip in the SRC_URI if no sources have that name yet?  It
>> seems like adding a name to the primary tarball is becoming common
>> boilerplate, and the common case is for that to be the first source.

For recipes that have only one fetched source, could we perhaps default
to plain SRC_URI[md5sum], without a name. If a second fetched source is
added, this would transparently break (i.e. require adding two names).
>
>Also would be great to have unified names where possible.

For recipes that have two or more fetched sources, i personally would
use PN but, as you say, that has the disadvantage that you have to
potentially lookup the package name in an .inc. Not my call though.

>It would make adding new recipes a bit easier (no need to
>check/copy&paster name used in .inc and also base.bbclass could easily
>generate those checksum sections with right name easier.
>
>I'm using "archive" as few others also used.

and some use tarball, some pn ....


