Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1OkNlE-0000nK-N8
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 22:55:26 +0200
Received: by bwz12 with SMTP id 12so1041327bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=N1nbfF8i/sGG1NlnVErP/XY9FhYvikSSqhQqs44k2dk=;
	b=IhFV+oaNGL/wYvpbJa7mWPN8/XsqXW2lp0TwKxegbgzV9YQeNSj9MAvPO/NcSqShw1
	OvlvsPtHTATUmkf2zfYtw8LlQGeoECWYgmcxhrWfSlYtlPUf9fdliH/Plu41/owgSx+8
	2l6t2Rs1Q5dumh+cDS6+eCojDei+338Fa9HE8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:bcc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=gXWhCjLUJmDYKCBUWKmhxeyDm3XX0Kl7RnkJiE7E566DSEjuY51u1/eedMaaiYyJS5
	yULQc4ZhUx1pw8pLc61549WgddHlTrx2iwJ/pD5Q6Xdv5ynrsWzsxYvexk+c2gxHFe59
	N1PlyQFc+DjpSxS4sj8G7XKCm0GkO4xpH/SNc=
Received: by 10.204.79.223 with SMTP id q31mr1964554bkk.92.1281819300680;
	Sat, 14 Aug 2010 13:55:00 -0700 (PDT)
Received: from merkur.sol.de (h-162-190.stunet.tu-freiberg.de [139.20.162.190])
	by mx.google.com with ESMTPS id g12sm1950166bkb.2.2010.08.14.13.54.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 14 Aug 2010 13:54:58 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>)
	id 1OjgKA-00025X-UR; Fri, 13 Aug 2010 00:32:35 +0200
Date: Fri, 13 Aug 2010 00:32:34 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Bcc: Jens Seidel <jensseidel@users.sf.net>
Message-ID: <20100812223234.GA7917@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autotools issues (MKINSTALLDIRS, -s_
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
X-List-Received-Date: Sat, 14 Aug 2010 20:55:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 08, 2010 at 05:53:42PM +0200, Frans Meulenbroeks wrote:
> I'm not too good in autotools. While makeing the git recipe for urjtag
> I bumped into the following two issues:
> 
> First of all it seems autoreconf needs the -s flag. This tells to use
> symlinks. Guess things are done out of order or so.
> I've fixed this by adding EXTRA_AUTORECONF = "-s" to my recipes. That
> makes configure happy, but it does not really feel as a good solution.

Don't know about this.

> The second issue is that install fails.
> Apparently MKINSTALLDIRS does not have the proper value (it should be
> tools/mkinstalldirs, but it is an empty string).
> I've tried some things, peeked at some other patches for MKINSTALLDIRS
> but didn't really get to a satisfactory solution
 
> Any wizard here who can give me some guidance?

I noticed in the past also trouble with MKINSTALLDIRS and I think older
gettext versions are buggy and affect this. I workaround it with

AM_GNU_GETTEXT([external])
# version 0.11 doesn't support make distcheck, see
# http://lists.debian.org/debian-i18n/2009/09/msg00176.html
# versions 0.12-0.14.6 require a mkinstalldirs hack for make distcheck
# (at least for automake version 1.11)
MKINSTALLDIRS=\$\(top_srcdir\)/autotools/mkinstalldirs
AC_SUBST(MKINSTALLDIRS)
AM_GNU_GETTEXT_VERSION(0.12)

in my configure.ac. Try increasing the version of the required gettext version
in the last line to verify that you have the same problem.

If you don't use gettext than I cannot help you ...

Jens


