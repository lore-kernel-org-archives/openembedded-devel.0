Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MnWeA-00040F-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 13:56:37 +0200
Received: by bwz6 with SMTP id 6so2659075bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2009 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=L5bjvP3ty+Gz4jenrFT+1MjkkLVF4LZVOd3kTbSwbVQ=;
	b=miT8U2mFqy5hOy4jhCbvHq340+PNmM4H0S5G7gIPQmsWWoodRpfToB+uYIY/cpNh1a
	YoxE4OHoOZbwKIm4ICF9bAOeu+7gL5H0SznXUF/zMJWdWweKoYZEL87fFLxPG1+bGYMc
	Oxv0LnZoD8taNIjR3l/Q3eiJddUmXm7gSOaxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rPYNtGQ5Sph7pgUZ5j+rsyHf1B3qx96I2bMoz+knr55Vhy6SIm1Dt53NqKtP/P+Fns
	tUakBNF/bMNxl5CwF8F21fgDcPIEpJwBRPqnrbz90looZ2QPFrU8iQfKQID5lMflgVHq
	gP1et0fPZtArlT59wI+WPIsMxpLsVHmGNrSfA=
Received: by 10.86.187.7 with SMTP id k7mr6108025fgf.30.1253015762765;
	Tue, 15 Sep 2009 04:56:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e11sm1829930fga.26.2009.09.15.04.56.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Sep 2009 04:56:01 -0700 (PDT)
Date: Tue, 15 Sep 2009 13:56:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090915115601.GA26039@jama>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<1253002300.4490.1103.camel@lenovo.internal.reciva.com>
	<20090915091626.GH4970@jama>
	<1253010711.12689.160.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1253010711.12689.160.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.210
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
X-List-Received-Date: Tue, 15 Sep 2009 11:56:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2009 at 11:31:51AM +0100, Phil Blundell wrote:
> On Tue, 2009-09-15 at 11:16 +0200, Martin Jansa wrote:
> > I wrote a bit more about my problem here:
> > http://article.gmane.org/gmane.comp.handhelds.openembedded/25986
> > 
> > Simply:
> > If I want to prefer bbfile with
> > PV=1.0+gitr${SRCPV}
> > then PV will change with every commit
> > so what PV should be in PREFERRED_VERSION_pkg?
> > 
> > With this patch I can put there "1.0+git%" which will match just this
> > one bbfile.
> 
> I would have thought you would be better off setting a positive
> DEFAULT_PREFERENCE for your own DISTRO inside the bb file in question.
> That doesn't require any bitbake changes and doesn't introduce any
> semantically-murky extensions.
> 
> Your scheme of setting "1.0+git%" may work fine if there is just a
> single git-based bb file in the repository but it would obviously break
> down if a second one were ever to appear.  That seems like an unhealthy
> state of affairs.
> 
> p.

Ok, but then you can say, that the same problem is when there is two or
more packages with PV = "1.0".

You can have as many git-based bb files as long as they have different
PV prefix like 1.0+git% and then 1.1+git% or 2.0+git.

Why would you have more bbffiles with the same PN and all git-based with
PV = "1.0+gitr${SRCPV}" ?

Setting PREFERRED_VERSION_pkg at least close enough to match
"1.0+gitr${SRCPV}" seems better for me than not setting preferred at
all and rely on DEFAULT_PREFERENCE.

BTW: in shr there is one distribution "shr" with -testing and -unstable
variants, main difference is which files with srcrevs and preferred
versions are included during build, how to set DEFAULT_PREFERENCE in
bbfile for this case (-testing wants some relased version, -unstable
using AUTOREV on _git version)?

Regards

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


