Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P4XVs-00037L-Or
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:23:06 +0200
Received: by bwz7 with SMTP id 7so1174514bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cFOZoj8J6Zoe2FyqA1Yk40yVESLJdz2q2OF4BLt5Eu4=;
	b=qUzBVLQsL9fuM6xU519/qfNJ7n9rYtBempMURRlmePo3+MNL6Q1dXjrnmIxqVLD2yp
	uj3fEXABIx42RIovpHEpcl2biMkU/A6i+iuRDbNF8sDJfyOmuQOJRGHId6wBw9kcfz1L
	T7qGGgVEoV9snLWVP6VZSNzyDPxQT2VU9nvq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MgQ2CdpPN9/SLa8PYreE+FUSyYHBM3OVMZTYkyVJ7KF1btPETFHHe/5FmFh4Ie4K3c
	WThcM4bxwFhqccYasGBaadLEX6ZAPLwXUdhbsNbYgZVeqKFhjxGspWHf48ry57HG25lp
	GdEti3Ca57r2HNH9rrxMnYGlhryTI5jywPWDM=
Received: by 10.204.63.211 with SMTP id c19mr3100555bki.133.1286623348998;
	Sat, 09 Oct 2010 04:22:28 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm1598474bks.8.2010.10.09.04.22.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 04:22:28 -0700 (PDT)
Date: Sat, 9 Oct 2010 13:23:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101009112300.GO3163@jama>
References: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: inc file discussion
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
X-List-Received-Date: Sat, 09 Oct 2010 11:23:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 09, 2010 at 11:37:49AM +0200, Frans Meulenbroeks wrote:
> Dear all,
> 
> I see a lot of diversity in .inc files, and I was wondering whether we
> should not try to come up with some guidelines about their purpose,
> what should go in it, what not etc etc.
> 
> Some observations and questions:
> 
> Some of the inc files use INC_PR whereas others do not.
> 
> Some people seem to use .inc file as a way to save bytes in the
> archive and really put everything in it (including things like
> DESCRIPTION, LICENSE etc etc).
> While I agree that DESCRIPTION will probably not change between
> versions and LICENSE is also unlikely to change, it might be more user
> friendly to put them in the .bb file
> (so when you open the .bb file you immediate see the basic information
> of a package)
> It does not really make things more work when upgrading to a new
> version since I assume most people do like me and either do a git mv
> or a cp from an older version (which retains the info).

Well it's easier to improve DESCRIPTION when it's in .inc file. And when
you want description of some package you can open .inc file instead .bb
because you usually want DESCRIPTION of program as such, not for
particular version.

I'm one of those who saves bytes by putting everything shared by all
.bbs to .inc :).

> What I also noticed is .inc files saying things like:
> DEFAULT_PREFERENCE = "-1"
> Do we want this in an inc file? I'd say an inc file is shared between
> all versions; Personally I would prefer setting the -1 in the .bb
> file, not in the .inc

The list you've attached has lots of PN-PV.inc files where it's IMHO OK
to puth DEFAULT_PREFERENCE because usually you really want to set it for
all recipes of that version.

I agree that it's strange in .inc file used in ALL versions of some
package.

> And then there is DEPENDS in .inc files. I think there is some
> potential cause of getting unneeded DEPENDS
> Picture the following scenario: a new version needs an additional
> package, it gets added to the DEPENDS of the .inc file and suddenly
> older versions also get this DEPENDS (maybe unneeded).

This case is just wrong and fault of whoever added it to .inc DEPENDS.
If only new version needs it then you should put DEPENDS += only to
recipe needing it.

But I don't see why not keep "common" DEPENDS in .inc.

> I hope you get the idea.
> And of course I know that .inc files are useful (e.g when it comes to
> sharing python scripts etc). Then again, I feel sometimes we do too
> much in them.
> 
> How do others feel about this?

I feel it the other way, I like .bb where is only require for .inc 
and checksums.

Then it's clear that all versions are built the same only with newer
sources.

I agree that it's sometimes a bit confusing when different versions
override different parts of .inc and only reliable way to see effective
recipe is to run 'bitbake -e -b recipe.bb'

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


