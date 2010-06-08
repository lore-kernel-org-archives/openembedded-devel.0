Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLwKz-0001pM-A8
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 12:47:20 +0200
Received: by fxm9 with SMTP id 9so2899357fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nt0OTGpDWvVu4Tifr9yWaI6w99tEaUDJyaXAQIM8Ggo=;
	b=Hq4J+8TJjAxZIq9KYAoaLeUKZ/uDnzFqPY791GAIApY6NLmlJJEKUQFHwf3hzyirxx
	yWS2VwzsbMjBfi31iWGntCFPeXqHDjM2sFRcn5nTk/ckS7rfMff8IL4kFQmLuS94t9y2
	R0iTwb1bzAuJpwY9QIVC0l+g/FQFBmKnxjYSU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bp0b9Hu4KdAw+W7VyWN2QuXlG37+nqQP/5Ult1WhLDNtsY1F2XUfOHKekARXgN4gtp
	qltUnRqOPglnwyU/bZxmYsuBff1kITa2ezVifruBm9XrrlZQTlgmglXjh+nQ28NzWIcL
	QF4bJpzJk75avpRsaVnclXM/9NhY2QWdQF4Xw=
Received: by 10.223.21.17 with SMTP id h17mr16318819fab.45.1275993770289;
	Tue, 08 Jun 2010 03:42:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm24845708fah.21.2010.06.08.03.42.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Jun 2010 03:42:49 -0700 (PDT)
Date: Tue, 8 Jun 2010 12:42:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608104243.GG1403@jama>
References: <E1OLvSl-0003gY-9Y@melo.openembedded.org>
	<20100608095356.GF1403@jama>
	<20100608103257.GA4805@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20100608103257.GA4805@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Henning Heinold : zziplib: convert to BBCLASSEXTEND and use new patch system
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
X-List-Received-Date: Tue, 08 Jun 2010 10:47:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2010 at 12:32:57PM +0200, Henning Heinold wrote:
> On Tue, Jun 08, 2010 at 11:53:56AM +0200, Martin Jansa wrote:
> > On Tue, Jun 08, 2010 at 09:51:15AM +0000, git version control wrote:
> > > Module: openembedded.git
> > > Branch: org.openembedded.dev
> > > Commit: 8031ee4953f3510d53022ce0e53bc903d3089f30
> > > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=8031ee4953f3510d53022ce0e53bc903d3089f30
> > > 
> > > Author: Henning Heinold <heinold@inf.fu-berlin.de>
> > > Date:   Tue Jun  8 01:34:58 2010 +0200
> > > 
> > > zziplib: convert to BBCLASSEXTEND and use new patch system
> > > 
> > > ---
> > > 
> > > diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zziplib_0.13.49.bb
> > > index 3aecb74..256b13d 100644
> > > --- a/recipes/zziplib/zziplib_0.13.49.bb
> > > +++ b/recipes/zziplib/zziplib_0.13.49.bb
> > > @@ -3,8 +3,9 @@ require zziplib.inc
> > >  PR = "r2"
> > >  
> > >  SRC_URI += "\
> > > -  file://zip_c.patch \
> > > -  file://zziplib-autoconf.patch \
> > > +  file://zip_c.patch;apply=yes \
> > > +  file://zziplib-autoconf.patch;apply=yes \
> > > +  file://automake.patch;apply=yes \
> > 
> > Isn't apply=yes default for .patch, .diff extensions? Why did you need
> > to add it?
> > 
> > Thanks
> > 
> > Regards,
> > -- 
> > Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com
> 
> Hi,
> 
> didn't think about it, but it don't hurts.

Hi,

yeah it doesn't hurt, but it was so nice and clean without.. :)

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=6fe7cef27069415f2eba36bc640cf59013d4979b

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


