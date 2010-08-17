Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OlT9I-0001Dc-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 22:52:59 +0200
Received: by ewy7 with SMTP id 7so3457917ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=6ibGI8KqGWWu3WHPUnRHHQBmyPBJKChrcubD174WX5E=;
	b=OVR3SCFnrcCiIMedgK/FxdFhkAFtMF+Drux0xw9aoff0qojvXWVeQweWzsvptGckLg
	Cr4HXHm2R5bTMqiiBFS0VewL5zlWULeSY9thw6xRTVg+uUfVYkMyRWDshiGr8ENCWCyc
	yS+pvSeM2rRl2ji1QrpVT54nB1zrM2E6FJdmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=caMHzLxdmO+YaUAbJEIO95e6hcBHVwyn6dddKjaKPfDy0px/lPvZfG4ejm9mFZChzv
	JyKwLZKesvzlgoJrcfLFAKrcdHaupb5xNBDT0ZQH9e3Vm0Cu928S4abX6UXqRCyElmqO
	dTEw+upgdrKzEet+UY+3pzjDVVzazDJ9KeULA=
Received: by 10.216.70.200 with SMTP id p50mr6211990wed.54.1282078343283; Tue,
	17 Aug 2010 13:52:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 17 Aug 2010 13:52:02 -0700 (PDT)
In-Reply-To: <AANLkTinvpJphbWaNu_8s=oyxC_1PN=uSXRoNfuEVr=No@mail.gmail.com>
References: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
	<AANLkTinvpJphbWaNu_8s=oyxC_1PN=uSXRoNfuEVr=No@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 17 Aug 2010 13:52:02 -0700
X-Google-Sender-Auth: ePoATAKaSABRH1suECzD-WPJyLI
Message-ID: <AANLkTikFP8vUiQ4PbJ6Acv=7TeY6fyP4LAq7C9GQkX0m@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] quilt: disable packaged staging on native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 20:53:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 17, 2010 at 1:03 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
> >
> > Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> > ---
> >  recipes/quilt/quilt-native.inc |    3 +++
> >  recipes/quilt/quilt_0.48.bb    |    2 +-
> >  2 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/quilt/quilt-native.inc
> b/recipes/quilt/quilt-native.inc
> > index 10d8183..f422b63 100644
> > --- a/recipes/quilt/quilt-native.inc
> > +++ b/recipes/quilt/quilt-native.inc
> > @@ -6,6 +6,9 @@ RDEPENDS_${PN} = "diffstat-native patch-native
> bzip2-native util-linux-native"
> >  FILESPATHPKG =. quilt-${PV}
> >  INHIBIT_AUTOTOOLS_DEPS = "1"
> >
> > +# Several packages fail to patch when using quilt from packaged staging
> > +PSTAGING_DISABLED_virtclass-native = "1"
> > +
> >  inherit autotools native
> >
> >  PATCHTOOL = "patch"
> > diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
> > index 0a066df..99dc2a2 100644
> > --- a/recipes/quilt/quilt_0.48.bb
> > +++ b/recipes/quilt/quilt_0.48.bb
> > @@ -1,6 +1,6 @@
> >  require quilt-package.inc
> >
> > -PR="r1"
> > +PR="r2"
> >
> >  SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
> >  SRC_URI[sha256sum] =
> "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
> > --
> > 1.5.6.4
>
> I have some concerns with this patch.
> I have a quilt native in my pstage dir from aug 7. (pstage is outside
> TMPDIR)
> Just did a bitbake beagleboard-demo-image after removing TMPDIR, with
> quilt-native and quite some other packages in my pstage dir.
> I am at "Running task 7313 of 11636", lots of packages have been
> compiled and no patch has failed.
>
> My proposal is to put this patch on hold until proven to be an issue
> by someone else.


Did you build with TMPDIR in a *different* location using prebuilts?  If not
you didn't prove anything at all about the relocatability of quilt.  If a
package isn't relocatable, it shouldn't be enabled for pstaging, as the
package can't be used reliably.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

