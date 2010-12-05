Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthewbot@gmail.com>) id 1PPKyH-0005dm-VY
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 21:14:10 +0100
Received: by gxk21 with SMTP id 21so5946922gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Dec 2010 12:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=cdZzLKxTeDXpn/PBZsfRwwP0abKLvuF+SX4+sK4Y8B0=;
	b=smcsB/10GKr1Ed3B5jn7aDv0rWyg98EZaFA5/wljHOGFby7rckFNQHn+0QI61ICkXN
	lUyuYlWweSnsxsdfIx5s4iRLIkkC3UxfXDh7/qZuY4DB43wjt5YUaPWlux3tiCmWIy1x
	AfIEwkALZbk7o/AD4c9kV4DSQV4zCJNZIsUXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=xcCim0+ZmvGrKcs0iB6dKsG24W9ZMW+7bwb1yeCjpwHaWaATf/uwwLxLSLkc6dnu/B
	r6RHRLbM3dBCQQ5mPQM0aU67NwuVgr7nVOexrbjx4QrauLfpdTH5t0eDLuIAnYbzE18Q
	wDMkkIU4agt3CFa5RV/QgtP6bpyqTrf8I1dG0=
Received: by 10.151.41.6 with SMTP id t6mr7865335ybj.125.1291579962805;
	Sun, 05 Dec 2010 12:12:42 -0800 (PST)
Received: from [10.24.160.187] (n128-227-48-245.xlate.ufl.edu [128.227.48.245])
	by mx.google.com with ESMTPS id q8sm1084891ybk.12.2010.12.05.12.12.40
	(version=SSLv3 cipher=RC4-MD5); Sun, 05 Dec 2010 12:12:41 -0800 (PST)
From: Matthew Thompson <matthewbot@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CFBBA1C.4080103@eukrea.com>
References: <1291564968-3502-1-git-send-email-matthewbot@gmail.com>
	<4CFBBA1C.4080103@eukrea.com>
Date: Sun, 05 Dec 2010 15:12:40 -0500
Message-ID: <1291579960.7355.8.camel@matthew-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: matthewbot@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] wxwidgets: added libxinerama to DEPENDS
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
X-List-Received-Date: Sun, 05 Dec 2010 20:14:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2010-12-05 at 17:13 +0100, Eric Bénard wrote:
> Hi,
> 
> On 05/12/2010 17:02, Matt Thompson wrote:
> > Signed-off-by: Matt Thompson<matthewbot@gmail.com>
> > ---
> >   recipes/wxwidgets/wxwidgets.inc |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/wxwidgets/wxwidgets.inc b/recipes/wxwidgets/wxwidgets.inc
> > index 2fb2bef..4c4f77f 100644
> > --- a/recipes/wxwidgets/wxwidgets.inc
> > +++ b/recipes/wxwidgets/wxwidgets.inc
> > @@ -2,7 +2,7 @@ DESCRIPTION = "wxWidgets is a cross platform application framework utilizing nat
> >   HOMEPAGE = "http://www.wxwidgets.org"
> >   SECTION = "x11/libs"
> >   LICENSE = "wxWindows"
> > -DEPENDS = "gtk+ jpeg tiff libpng zlib expat"
> > +DEPENDS = "gtk+ jpeg tiff libpng zlib expat libxinerama"
> >
> maybe this is obvious for wxwidgets'users but can you please add a comment 
> detailing why this is needed ?
> 
> Thanks,
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I'm not entirely sure myself, but under the recipes fails to build
wxwidgets without libxinerama on my box at least.

I'm using the overo-oe branch of openembedded, but it appears as though
they haven't made any changes to this recipe, so I sent the patch here.
I'm also using their configuration files if that matters.

This is my first time sending a patch via a mailing list, so should I
amend my commit with an additional line in the commit message to the
effect of "wxwidgets depends on libxinerama, which was missing from the
recipe" and then perform git send-email again as detailed in the wiki?
Is there some additional step to mark it as a revision to this patch?




