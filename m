Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PUzUC-0008UJ-6r
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:30:28 +0100
Received: by fxm11 with SMTP id 11so3631790fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/a/fziqjutb774WYhvRiVCKpfSWOtkjyzLsoVq8kNWo=;
	b=UmeZWr361v2xMpNGvUsD/caTC+5juxwO7cMxDwMzM1W+1Yl1DlZtRwdd7UR1CZgJM1
	R6OQPOYbgD0ef0ZNshOzQ3rMN4kaVZa7Br3w2OhoLJsJI38DfwS+G8y6kb5x+zbZ5HOU
	p1sXMxFDruylqfD9ON81Nwgj94npVsAELaRG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CQAWDQlgBqzJ1/6kdxajUvOVh4eM/ZZ+SpbzkTNkmT+og46Ae7Bpy1LT9Jw4hWgDhH
	lpZeLjKEC7nSXQ1+41wP6rCM5yEt9oJG9uqALGDF11Nt4Kd83p5IMuV5aLjZfDO/NGce
	kZ5iEXvy2lKlBvgpJYYrRHqHb0lSrNSwmnODE=
Received: by 10.223.97.7 with SMTP id j7mr6026735fan.41.1292927421789;
	Tue, 21 Dec 2010 02:30:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm1252210faa.29.2010.12.21.02.30.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 02:30:21 -0800 (PST)
Date: Tue, 21 Dec 2010 11:30:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221103004.GH3282@jama>
References: <1292925966-65237-1-git-send-email-koen@openembedded.org>
	<iepusv$t59$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <iepusv$t59$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Tue, 21 Dec 2010 10:30:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 21, 2010 at 11:18:07AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> There is no 2/2, this is the only patch in the series, I had a git
> format-patch slip up on my end.

Ah :), looks usefull to me

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> On 21-12-10 11:06, Koen Kooi wrote:
> > The ipkg metadata will look like this now:
> > 
> > koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
> >  new debian package, version 2.0.
> >  size 24112 bytes: control archive= 540 bytes.
> >      629 bytes,    13 lines      control
> >  Package: matrix-gui
> >  Version: 1.3-r19.0.6
> >  Description: Matrix GUI for Qt X11
> >  Section: multimedia
> >  Priority: optional
> >  Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
> >  License: BSD
> >  Architecture: am3517-evm
> >  OE: matrix-gui
> >  Homepage: https://gforge.ti.com/gf/project/matrix_gui/
> >  Build: org.openembedded.dev/f35ab2d
> >  Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, libgcc1
> >  Source: svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd=''
> > koen@dominion:/OE/angstrom-dev/deploy/glibc$
> > 
> > Signed-off-by: Koen Kooi <koen@openembedded.org>
> > ---
> >  classes/package_ipk.bbclass |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
> > index 5d388da..97e5cd8 100644
> > --- a/classes/package_ipk.bbclass
> > +++ b/classes/package_ipk.bbclass
> > @@ -224,6 +224,7 @@ python do_package_ipk () {
> >  		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
> >  		fields.append(["OE: %s\n", ['PN']])
> >  		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> > +		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', 'METADATA_REVISION']])
> >  
> >  		def pullData(l, d):
> >  			l2 = []
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFNEH7fMkyGM64RGpERAtfoAJ4wwHII7rXn7YG4gCKFSQd1B9SmEACeIg/Y
> rhw39nBhCibyooRTxx+zAZM=
> =SkML
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


