Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NzvEV-0005wI-VR
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 19:09:36 +0200
Received: by fxm20 with SMTP id 20so2099456fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pVCnSJbvwsWY1Q4+NShtO6MpdYJc+fmQOb8j1JnsAYA=;
	b=aqL4Ed1xniUUcMb68I6MIIYWl+h5REhACetQq/SNBqpXAlPrUOf98QqsQNVvelyWZt
	UwKjU9oOWXsfLnOI5kanwVBPOp+ADytHx/XKT5LyqxdyezpQnDrhNroChZK975GLno7S
	A46iypKZSFdxw7sJpxlTayUqSFNrPwTb4IA60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dRZH5cGBQ0X1CxGoH3Pl4z3AN+ZNf8+aHUBDqL/QJcUhnsD6euNcxnuJ/S+XOAuJgO
	LXtMvpOnjXLlFlIIApxcTCcAFvzIUIcqWT8q73bdWvtpy++vdGzcJ29dvDNJTywedDbt
	hxUqtpj1GwosmPytWLKXoxKQlWGKioFxMoF/U=
Received: by 10.223.56.14 with SMTP id w14mr452030fag.3.1270746372886;
	Thu, 08 Apr 2010 10:06:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm196585fxm.14.2010.04.08.10.06.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Apr 2010 10:06:12 -0700 (PDT)
Date: Thu, 8 Apr 2010 19:06:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408170617.GF3269@jama>
References: <1270734047-11286-1-git-send-email-Martin.Jansa@gmail.com>
	<u2mb6ebd0a51004080941u2b296467h23c7e017a88b8d08@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <u2mb6ebd0a51004080941u2b296467h23c7e017a88b8d08@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] [PATCH] utils.bbclass: simplify checksum check, prepare for checksums.ini removal
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
X-List-Received-Date: Thu, 08 Apr 2010 17:09:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2010 at 09:41:37AM -0700, Chris Larson wrote:
> On Thu, Apr 8, 2010 at 6:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > * unify OE_STRICT_CHECKSUMS and OE_ALLOW_INSECURE_DOWNLOADS, one option
> >  for insane people should be enough, when the later is enabled, don't
> >  raise Exception even for missing md5sum/oe_sha256sum command or
> >  different checksums
> >
> 
> I find it very useful to distinguish between the missing checksum and
> invalid checksum cases.  The latter should really never be allowed, at all,
> period, imo, but the missing checksum should have an option.  If we aren't
> ready to remove the ability to allow invalid, then we need to be able to
> control the two cases independently, or via two different values in the
> variable that controls the behavior.

OK fair enough, I've expected this.. (that's also why it's RFC :)). Do
you agree that with enabled OE_ALLOW_INSECURE_DOWNLOADS it should
continue even when it's not possible to check checksum (like missing
md5sum/oe_sha256sum command)?.

> * show note, when there are checksums only in checksums.ini (prepare for
> >  script for moving all to recipes)
> >
> 
> This sounds good, though it may be something best relegated to an explicit
> sanity check, depending on how much it clutters the output.  May want to log
> it to a file like tmp/legacy-staging.log, also.
> 
> 
> > * parse checksums.ini only when there is no checksum in recipe (could be
> >  faster, but for more checked items in SRC_URI it is parsed repeatedly)
> >
> 
> "Could be" .. sounds like this isn't ready to go in yet, need to do
> profiling.  Changing something because it "could" be good is best done in
> proof of concept code, not as a part of a single patch like this one.

Both those points are assuming I'll be allowed to push "recipes: move
checksums from checksums.ini to recipes", which is being prepared ATM
with -c fetchall on all recipes. After this patch both bb.note output 
as well as parsing checksums.ini should be needed only in rare cases.

> > * if one checksum doesn't match then count and show both (md5 as well as
> >  sha256) - usefull for copy&paste checksums for new recipe.

Thanks for comments,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


