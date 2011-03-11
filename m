Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCTe-00041B-Dp
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:14:38 +0100
Received: by yxn22 with SMTP id 22so1415418yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=t6xqxDPsjhXdEuO26799woAPOmcLyGdvLcAW7QoU+Fk=;
	b=JNw3jgrtJ1lnQ+hOBgVK2+2P+jVnW7QiAkM2+P7vJg6IloYRzkgFYtRrhfPrLdUNBO
	wS+kgGrk/f1b4n7nNTqrI9mqhMNYJpXWGqyHxSnlVTzAHSgC6SxtnrEV9WDHb/Ff2Uf0
	4sg05Pnab99yp0lxHVifP/95MC3RNu7rUp53Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=Ql6vMfE/HD7vdzFZFq/Zgg5/52jDfSANhgCK6USx1Dtr0R4JUkoFY518AfXWzOwwaC
	X9Vx2HP3IUNxcxqV0ojBA0fo3L1R+sAXeh957tFqzL1VknWUS+mBlbqhLBykxa6tBxQl
	FQcCOWbyDy5uwRKztNgPwNQQ2Zfrh0PGZgUZQ=
Received: by 10.236.120.45 with SMTP id o33mr3267084yhh.53.1299887684089;
	Fri, 11 Mar 2011 15:54:44 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u45sm3298554yhn.9.2011.03.11.15.54.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 15:54:43 -0800 (PST)
Date: Fri, 11 Mar 2011 15:55:07 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311235507.GC5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <201103101553.27407.pgsellmann@portner-elektronik.at>
	<4D7A86EB.2090504@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4D7A86EB.2090504@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] vsftpd-2.0.5: added dependency for correct build order
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
X-List-Received-Date: Sat, 12 Mar 2011 00:14:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/03/11 14:32), Mike Westerhof wrote:
> On 3/10/2011 8:53 AM, Peter Gsellmann wrote:
> > vsftpd needs the cap_* functions; if the library libcap is not built before vsftpd, an error occurs.
> > 
> > Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
> > ---
> >  recipes/vsftpd/vsftpd_2.0.5.bb |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/vsftpd/vsftpd_2.0.5.bb b/recipes/vsftpd/vsftpd_2.0.5.bb
> > index 518628e..2486744 100644
> > --- a/recipes/vsftpd/vsftpd_2.0.5.bb
> > +++ b/recipes/vsftpd/vsftpd_2.0.5.bb
> > @@ -3,6 +3,8 @@ SECTION = "console/network"
> >  LICENSE = "GPL"
> >  PR = "r2"
> 
> Technically, you'll want to bump the PR as well (although for this
> particular change, it'll actually work without it)
> 

Yes a PR bump is needed here.

> 
> > +DEPENDS = "libcap"
> > +
> >  SRC_URI = "ftp://vsftpd.beasts.org/users/cevans/vsftpd-${PV}.tar.gz \
> >             file://makefile.patch \
> >             file://nopam.patch \
> > @@ -20,7 +22,7 @@ do_configure() {
> >  }
> >  
> >  do_compile() {
> > -        oe_runmake "LIBS=-lcrypt -L${STAGING_LIBDIR}"
> > +        oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap"
> >  }
> >  
> >  do_install() {
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


