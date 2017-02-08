Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5520571CB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:43:10 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o16so9729896wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=9BPWM9jxUNVPh5WOQDjG/duPWJLQGbBNyzmksuM5WN8=;
	b=kGzxw+pH2S3edF30wtElatN64Z58ZTY1zLHPS/0uybPh1p+gd6XIO17ime349sUOcW
	zgqybgAX17MJF9D5A4NVtIPq2ImkvseoZvDWo4Hin3HxKB7iDTzU9gLvooRWWr6M/3ra
	vc7VwSJ95WjKCUPOKkHdJMva8oX1k+uP0dx1upMaVoBYKMP6k3V51UZ6WJK2aELSClAS
	7XUOZrytCz0XZHfsUmTlDygdwQB54YRy1lWgVqGi335aiVkhrLUHcC+UpKLaLLtOpy7z
	uoFgTuud7gtFKIQH91I87HlWmGldgfKoDGG1HD4DSp2Fube//xhYmvmXwgqRm85oDWFK
	UCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=9BPWM9jxUNVPh5WOQDjG/duPWJLQGbBNyzmksuM5WN8=;
	b=MKi/3cbP4qxXS7A7eKq7ixMl16PJuZneE03xEMIQfeQFqM6CYH8ajHKS/50zsY3X4+
	JkgSs6dgYKZVWOX2bB2sfVAP6e8juqtLsMBhU1N/bmnQrvtHgBbZw286899PkOZJuuY5
	5rcs16y8q2+xi16P/RaRd27FA2J2ovFU6zK+iE+k9TgDDdBqQmucoAFZfiBdUKY3Rvpn
	gV5nPRnlghwM5vBKp4VduWmIvXDg/QqTMWiorGVjY78dungVctKHPKNR0/tsk67sAMe8
	2WVw8EQ9DBsntnt4/0Dh4xaY6zK9jYwXMaOhq1O+U4k+dEqmD9pZDK/AUJ9edve1TkrN
	OcwQ==
X-Gm-Message-State: AIkVDXJMFO4Hir+oQ7OEYoAssYtW7bJtxvKjJ2teV1ivbFQn6jGWso98FnQxW/H39GBGO/C9JpucN+5N6QQDMg==
X-Received: by 10.223.154.109 with SMTP id z100mr20215601wrb.145.1486582990338;
	Wed, 08 Feb 2017 11:43:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 8 Feb 2017 11:43:09 -0800 (PST)
In-Reply-To: <AM5PR0402MB281713F0BB2D14E79F61E00DE2420@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <1485557640-10259-1-git-send-email-tom.hochstein@nxp.com>
	<20170207120034.GC3276@jama>
	<AM5PR0402MB281713F0BB2D14E79F61E00DE2420@AM5PR0402MB2817.eurprd04.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Feb 2017 20:43:09 +0100
Message-ID: <CA+chaQc9+Pxi5LDw1cBf2CFmYwTrNwkumuyobMO2A_TMdgW0FQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2017 19:43:12 -0000
Content-Type: text/plain; charset=UTF-8

RSS:
http://git.openembedded.org/openembedded-core/commit/?id=809746f56df4b91af014bf6a3f28997d6698ac78
http://lists.openembedded.org/pipermail/openembedded-architecture/2017-January/000384.html
and following threads

For morty and older releases you need to disable autodetection in qt3d
sources when the assimp PACKAGECONFIG is not enabled (see PACKAGECONFIG in
other recipes for some examples how to do it - but for qt5 it's often
tricky as it rarely has enable/disable options usable in configure and has
to be patched).

Otherwise assimp can still be detected when it's built as a dependency of
some other recipe and might be removed from sysroot while qt3d build is
already running and causing the issues you were trying to fix.

On Wed, Feb 8, 2017 at 6:42 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:

>
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On
> > Behalf Of Martin Jansa
> > Sent: Tuesday, February 07, 2017 6:01 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-qt5][PATCH v2] qt3d: Add assimp dependency
> >
> > On Fri, Jan 27, 2017 at 04:54:00PM -0600, Tom Hochstein wrote:
> > > Fix build error:
> > >
> > > fatal error: assimp/Importer.hpp: No such file or directory
> >
> > I'm was able to build qt3d without this dependency, is there something
> > in your config which enabled it? Or is it autodetected from sysroot
> > which wont be an issue anymore with master and RSS, but your change
> > doesn't fix the autodetection for older branches.
>
> We do enable assimp from another recipe.
>
> I am unable to reproduce the original problem either.
>
> Without the explicit dependency, it would seem that the build would at
> best be non-deterministic, enabling or disabling assimp support based
> solely on the timing of the Yocto tasks. I'm not aware of the technologies
> you allude to. Do they provide some determinism for this case?
>
> >
> > > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> > > ---
> > >  recipes-qt/qt5/qt3d_git.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> > > index 2276c36..7c31213 100644
> > > --- a/recipes-qt/qt5/qt3d_git.bb
> > > +++ b/recipes-qt/qt5/qt3d_git.bb
> > > @@ -19,6 +19,7 @@ PACKAGECONFIG ??= ""
> > >  PACKAGECONFIG_class-native ??= "tools-only"
> > >  PACKAGECONFIG_class-nativesdk ??= "tools-only"
> > >  PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
> > > +PACKAGECONFIG[assimp] = ",,assimp"
> > >
> > >  EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
> > >
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > >
> > https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.
> openembedded.org%2Fmailman%2Flistinfo%2Fopenembedde
> > d-
> > devel&data=01%7C01%7Ctom.hochstein%40nxp.com%
> 7Cfa462298ac744a52797808d44f50f020%7C686ea1d3bc2b4c6fa92cd99c5c301635
> > %7C0&sdata=mLf9Lt9hQ5Rn8Ygbq7PczLY4Ix%2BscnMCbhC%2BDyUwLLM%3D&reserved=0
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

