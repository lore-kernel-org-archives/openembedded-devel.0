Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john3909@gmail.com>) id 1NXHx9-00025m-Az
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 18:33:22 +0100
Received: by fxm8 with SMTP id 8so1965065fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:reply-to:from:to:references
	:in-reply-to:subject:date:organization:message-id:mime-version
	:content-type:content-transfer-encoding:x-mailer:thread-index
	:content-language;
	bh=WM+rqdzhW8qYZGbVRLI33StEsm3LPhGgfMiHayUO5+k=;
	b=KRE6ZoO60cpSN5O4h9MG6cSdEJuoWT8T1OwPxOgbatEyxzyHD6F/deJMaR3H1mu1/r
	Lzj2kkaflQfzsnrwy654mEfiO98KCgNMjWfqEQmtAYM7aWpu6W/HwdUq6Piz0uml5mCN
	BcugJvb4HdLWu8vMbFxJd3Ot8BSNer05kqi1Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=reply-to:from:to:references:in-reply-to:subject:date:organization
	:message-id:mime-version:content-type:content-transfer-encoding
	:x-mailer:thread-index:content-language;
	b=UbX2RHqHOH2fh4CLDbh7HBUUII9tBIX74HkXCXmb8rFVdwHq+eRqQ3h1Ch8LVa3L7y
	GjauWO6oOKuF2+WNbOVDdxJScJ2dKVrh9NAZ0LNjYkdfq8fKkRoI0uErGrkkgyiNJj94
	U+ARRAW7FSIuIJOcwy9fMu9QMOkIWpRAXwq6k=
Received: by 10.223.76.77 with SMTP id b13mr4786030fak.74.1263922263592;
	Tue, 19 Jan 2010 09:31:03 -0800 (PST)
Received: from inspiron9400 (99-26-125-126.lightspeed.sndgca.sbcglobal.net
	[99.26.125.126])
	by mx.google.com with ESMTPS id 1sm5073906fks.29.2010.01.19.09.31.00
	(version=SSLv3 cipher=RC4-MD5); Tue, 19 Jan 2010 09:31:01 -0800 (PST)
From: "John \(GMail\)" <john3909@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.00.1001190305430.13206@localhost>
In-Reply-To: <alpine.LFD.2.00.1001190305430.13206@localhost>
Date: Tue, 19 Jan 2010 09:30:43 -0800
Organization: U.S. Power, Inc
Message-ID: <01eb01ca992d$22aa61d0$67ff2570$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqY4BZv4OanisyUSb2mLcZfhqUOOAAS0NqA
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: john3909@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: tinderbox, bug reports and a freshly-broken mplayer
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
X-List-Received-Date: Tue, 19 Jan 2010 17:33:22 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Robert P. J. Day
> Sent: Tuesday, January 19, 2010 12:17 AM
> To: OpenEmbedded Development mailing list
> Subject: [oe] tinderbox, bug reports and a freshly-broken mplayer
> 
> 
>   in order to keep the peace, i'm more than willing to file actual OE
> bug reports for breakage i discover when building.  specifically, i'm
> almost always trying to build beagleboard-demo-image on my up-to-date
> fedora system, which seems to be a relatively unpopular working system
> for most people here (except for philip b.), so i'm getting used to
> running into breakage that no one else is seeing -- it's just a fact
> of life.
Hi Robert,

I run the same beagleboard-demo-image build on Ubuntu 9.10 almost daily.
Occasionally I also see a package build error and I mostly resolve this by
doing a bitbake -c clean for that package and then a bitbake -c build for
the same package. In most instances, this results in a clean build and then
beagleboard-demo-image builds without error. If this does not work, then I
rename my tmp folder and then rebuild everything. On my machine, it only
takes about an hour to complete. If I get the same build error, then and
only then do I start looking for a fix (review log file, review chat
discussions, etc). Over the last six weeks, the only build that would not
complete was on Dec 13 because mesa-dri was broken.

I hope this helps.
Regards,
John
> 
>   ignoring gnome-games for now, after a recent "git pull" on the OE
> dev branch, the "mplayer" package now no longer builds.  from the git
> log, i can see:
> 
> =====
> 
> commit 33c882b663a1dd229d0ebcb187648838d0164795
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Sun Jan 17 14:52:44 2010 +0100
> 
>     mplayer: bump SRCREV for some more ARM fixes
> 
> diff --git a/recipes/mplayer/mplayer_svn.bb
> b/recipes/mplayer/mplayer_svn.bb
> index 58a4bc7..d3fc2f7 100644
> --- a/recipes/mplayer/mplayer_svn.bb
> +++ b/recipes/mplayer/mplayer_svn.bb
> @@ -15,7 +15,7 @@ SRC_URI =
> "svn://svn.mplayerhq.hu/mplayer;module=trunk \
>            file://fix-addrinfo.patch;patch=1;maxrev=30302 \
>  "
> 
> -SRCREV = "30247"
> +SRCREV = "30345"
>  SRC_URI_append_armv7a = " \
>                 file://omapfb.patch;patch=1 \
>            file://vo_omapfb.c \
> 
> =====
> 
>   if i "git reset" to the commit just before that, it builds fine;
> ergo, that seems to be the commit that broke it.  a wild guess is that
> the "maxrev" parameters are the cause, given that at least one now
> falls below the requested svn revision, causing an essential patch to
> no longer be applied, but that's just a guess until i look more
> closely.
> 
>   the tail end of the log file:
> 
> fmt-conversion.c
> fmt-conversion.c:28: error: 'PIX_FMT_RGB32' undeclared here (not in a
function)
> fmt-conversion.c:30: error: 'PIX_FMT_RGB565' undeclared here (not in a
function)
> fmt-conversion.c:31: error: 'PIX_FMT_RGB555' undeclared here (not in a
function)
> fmt-conversion.c:40: error: 'PIX_FMT_BGR32' undeclared here (not in a
function)
> fmt-conversion.c:42: error: 'PIX_FMT_BGR565' undeclared here (not in a
function)
> fmt-conversion.c:43: error: 'PIX_FMT_BGR555' undeclared here (not in a
function)
> make: *** [fmt-conversion.o] Error 1
> FATAL: oe_runmake failed
> 
> 
>   so ... i can file this over at http://bugs.openembedded.net/ if
> that's the way to go.  but others were talking about this tinderbox
> thing, which i've never used.  a quick glance suggests it's a more
> formal, automated way of doing regular builds.  would that be
> appropriate for me, if it's understood i'm always building on the same
> distro?  feel free to point me at a quick intro, or i'll just file a
> regular bug if that's the way to go.
> 
> rday
> --
> 
> =============================================================
> ===========
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> =============================================================
> ===========
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



