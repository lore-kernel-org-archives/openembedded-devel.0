Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MnU9h-0001fi-AB
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 11:17:00 +0200
Received: by fg-out-1718.google.com with SMTP id e21so697550fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2009 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DmtReJplwXJ3DRZz3F76yxbDTtZzc/TnvwqkTyeZJEw=;
	b=vt4x5FtCxPf9m/mKPZqkTCVRKOHqfP4vlWH7oB2Q6GO4xexuY8Mqwe2MXFlV+ZdzKd
	GzBJbjVS1jrO6kUiDFXAN8PU9Txa4bnoqvf+C4KDIsJJ5fxoOYL5g82tXP+OnF/s1XZj
	DVVE0IrCF8hg3yiv/Wg0P0TBkApkq1YAbd2Mk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cYeu2hF7XrJL/C2JaTJ/pnMZGnwNW586/bIY7ZAzRO5nQgLFhWBJcDecUlZQLXzAgM
	tO0D7uQE5Bafa5ICNEpaqzmfvgucYfvK8Eg5NRkzP3lc8+Pf5Sqz4X20fpas54J2JLky
	hvTApmBqYg40X6caAwBEGqOQ6jdVfVd6zaXkc=
Received: by 10.86.158.5 with SMTP id g5mr5840559fge.32.1253006187849;
	Tue, 15 Sep 2009 02:16:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 3sm54720fge.22.2009.09.15.02.16.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Sep 2009 02:16:27 -0700 (PDT)
Date: Tue, 15 Sep 2009 11:16:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090915091626.GH4970@jama>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<1253002300.4490.1103.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1253002300.4490.1103.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Tue, 15 Sep 2009 09:17:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2009 at 09:11:40AM +0100, Phil Blundell wrote:
> On Mon, 2009-09-14 at 00:43 +0200, Martin Jansa wrote:
> > +def isPreferredVersion(pe, pv, pr, preferred_e, preferred_v, preferred_r):
> > +    """
> > +    Check if the version pe,pv,pr is the preferred one.
> > +    If there is preferred version defined and ends with '%', then pv has to start with that version after removing the '%' in the end,
> > +    """
> >  
> > +    if (pv == preferred_v or (preferred_v != None and preferred_v.endswith('%') and pv.startswith(preferred_v[:len(preferred_v)-1]))):
> > +        if (pr == preferred_r or preferred_r == None):
> > +            if (pe == preferred_e or preferred_e == None):
> > +                return true
> > +    return false
> > +    
> 
> I'm not totally comfortable that this patch is semantically well-formed.
> If you start allowing wildcards then the idea of "the preferred version"
> becomes somewhat ill-defined since, obviously, the wildcard might match
> any number of files.  I'm not quite sure what the problem is that you
> are trying to solve, but my initial reaction is that (whatever the
> problem is) it would probably be better solved another way.
> 
> p.

I wrote a bit more about my problem here:
http://article.gmane.org/gmane.comp.handhelds.openembedded/25986

Simply:
If I want to prefer bbfile with
PV=1.0+gitr${SRCPV}
then PV will change with every commit
so what PV should be in PREFERRED_VERSION_pkg?

With this patch I can put there "1.0+git%" which will match just this
one bbfile.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


