Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUzZG-0000rF-Ey
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 10:31:13 +0100
Received: by fxm4 with SMTP id 4so19751743fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=HAFRe1vl2VKQQrw6CKvAQ5/pvQvTVZxP8BV6R3fIJtU=;
	b=ItHOjQke/u3m0LjVazTbbPCuzQb/U72NShgKSKtxMLXRjiItvv4fk9+JEKO4zqnCG6
	tVX8pxiHRvRd27+JIccvK3weNX0OVMssUOj3J5ca2umeB3GhS67MhA0ipuhlT/4FnUGp
	uGiA8X1n1obiID6TOXZBj00cJnk49xR50Gzyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=rFfYwuW0L+y3Q/3nbL/KSFyktaY7VOHA5bunMIrQAb8Ip0oksyJ9OiCcCaXAvaee48
	kTtzctS5cKzdGugRBTTdg+7jOCyoZBpTVPcsTxPlHNbyadTBQfJ1WSDTLtP3wd1F1zE0
	QS3hTWJIGupxCe4jv8fYXUBGvu/JbRcUT4xOw=
Received: by 10.223.76.69 with SMTP id b5mr12643004fak.20.1263374940507;
	Wed, 13 Jan 2010 01:29:00 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm10631630fxm.4.2010.01.13.01.28.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jan 2010 01:29:00 -0800 (PST)
Date: Wed, 13 Jan 2010 10:28:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100113092855.GA3340@jama>
References: <20100112222121.GD10781@jama>
	<1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
	<1263374297.3228.3.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1263374297.3228.3.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/3] opkg, update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Wed, 13 Jan 2010 09:31:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jan 13, 2010 at 10:18:17AM +0100, Paul Menzel wrote:
> Am Mittwoch, den 13.01.2010, 01:17 +0100 schrieb Martin Jansa:
> > * It's usefull to make it compatible with u-a script in opkg package
> > * Old entries are merged to new directory in quite verbose postinst
> >   script
> > * If entry exists only in old its moved
> 
> it’s

Thanks, will fix that.

> 
> […]
> 
> > diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
> > index 1716034..b317de4 100644
> > --- a/recipes/opkg/opkg.inc
> > +++ b/recipes/opkg/opkg.inc
> > @@ -4,7 +4,7 @@ SECTION = "base"
> >  LICENSE = "GPL"
> >  DEPENDS = "curl gpgme"
> >  PV = "0.1.6+svnr${SRCPV}"
> > -INC_PR = "r18"
> > +INC_PR = "r20"
> I know it would not be a problem, but should not that only be increased
> by one [1]?
> 

OK, will fix that one too, sorry for that.. I had one bump in between
because adding RCONFLICTS_${PN} = "update-alternatives-cworth", but I
dropped this patch later, because it's not such a problem with both u-a
using same dir. And would confuse end-user a bit more with next upgrade.

> […]
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1] http://docs.openembedded.org/usermanual/html/recipes_versioning.html



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


