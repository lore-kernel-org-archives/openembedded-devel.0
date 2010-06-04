Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKcvo-0008Dx-BW
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 21:51:53 +0200
Received: by gwb20 with SMTP id 20so150438gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=oY/WoKS5jc3khBv39Equ6K9fvUTuS92u3jfBmwvSfRc=;
	b=MVkspcYWmxBp0oJLOuew8/kLxxylA8ws86UXXYNc+BLy0A0sfvuSz95ndC0TbbFm+S
	+7IK/TK+RTNNE9ra/WqmmXNPJNAXvAQBgLTQcPyPuFtmzUn3ufgEsjvX/3+PWScAKuMm
	UrwoSUz69k9YMFxX8QspNYLb3ft4jAdwI86w4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=XlR9yPIg90kdKpruR0ZU0KWwViKT7VfFAX/J7+M3CGAnZ8I85rzTkayfbwuomJM71s
	EKtcC0XZ2gNDqHUPZpdf98HcAs3qWDIIB6hE+/R+DhWhhYiDdoBJjaV5T+Womb0ul6B/
	QKv9X+CTKpHUvbAjNE6QM+oxeTCWi9EzyxmTI=
Received: by 10.229.193.16 with SMTP id ds16mr2874053qcb.148.1275680850436; 
	Fri, 04 Jun 2010 12:47:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Fri, 4 Jun 2010 12:47:10 -0700 (PDT)
In-Reply-To: <AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>
References: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com> 
	<AANLkTilBs6W1OMqbnKf9AujWBBGTWGyHo3Q3C9mr7URg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 4 Jun 2010 12:47:10 -0700
X-Google-Sender-Auth: QfEh5NicPNghno_zKrtywLekwhs
Message-ID: <AANLkTin8ybTRctnuKkR9h6lFHZFQDJTLlI7wB2vrc6AA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Fri, 04 Jun 2010 19:51:53 -0000
Content-Type: text/plain; charset=UTF-8

Please change ${srcuri} to $srcuri, so its very clear that its expanded in
shell, rather than letting bitbake try to expand it and fail since its unset
:)

After that, Acked-by: Chris Larson <chris_larson@mentor.com>

On Fri, Jun 4, 2010 at 12:37 PM, Cliff Brake <cbrake@bec-systems.com> wrote:

> Below is the context for proposed patch.  Perhaps this will help
> people review it.  I would like to get this pushed, so acks
> appreciated.
>
> 4ad83f91 (Richard Purdie     2008-03-17 20:38:12 +0000 364)     echo
> "Package: ${PSTAGE_PKGPN}"         >
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 38f04328 (Richard Purdie     2008-03-14 11:38:00 +0000 365)     echo
> "Version: ${PSTAGE_PKGVERSION}"    >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 366)     echo
> "Description: ${DESCRIPTION}"      >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 367)     echo
> "Section: ${SECTION}"              >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 368)     echo
> "Priority: Optional"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 695ca198 (Richard Purdie     2008-02-19 12:08:38 +0000 369)     echo
> "Maintainer: ${MAINTAINER}"        >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 38f04328 (Richard Purdie     2008-03-14 11:38:00 +0000 370)     echo
> "Architecture: ${PSTAGE_PKGARCH}"  >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 371)
> 239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 372)     #
> Protect against empty SRC_URI
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 373)
> srcuri="${SRC_URI}"
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 374)     if [
> "$srcuri" == "" ]; then
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 375)
>  srcuri="OpenEmbedded"
> 239d4346 (Koen Kooi          2008-04-11 07:39:51 +0000 376)     fi
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 377)     echo
> "Source: ${SRC_URI}"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 378)
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 379)     # Deal
> with libtool not supporting sysroots
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 380)     # Need
> to remove hardcoded paths and fix these when we install the
> 3440328a (Joshua Lock        2010-03-31 11:22:02 +0100 381)     #
> staging packages.
>
> This is the change where the code got changed:
>
>        # Protect against empty SRC_URI
> -       if [ "${SRC_URI}" != "" ] ; then
> -               echo "Source: ${SRC_URI}"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> -       else
> -               echo "Source: OpenEmbedded"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> +       srcuri="${SRC_URI}"
> +       if [ "$srcuri" == "" ]; then
> +               srcuri="OpenEmbedded"
>        fi
> +       echo "Source: ${SRC_URI}"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
>
> It appears that the above patch is what broke it.  The proposed fix is
> in the previous email below.
>
> Thanks,
> Cliff
>
>
> On Wed, Jun 2, 2010 at 2:46 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> > From: Cliff Brake <cbrake@bec-systems.com>
> >
> > Currently with srctree, we get errors like the following:
> > | + srcuri=
> > | + '[' '' == '' ']'
> > | + srcuri=OpenEmbedded
> > | + echo 'Source: '
> > | ++ find
> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg
> '(' -name '*.la' -o -name '*-config' ')' -type f
> > | + stage-manager-ipkg-build -o 0 -g 0
> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg
> /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/pstage/angstromglibc
> > | *** Error: CONTROL/control is missing field Source
> > | The Source field contain the URL's or filenames of the source code and
> any patches
> > | used to build this package.  Either gnu-style tarballs or Debian source
> packages
> > | are acceptable.  Relative filenames may be used if they are distributed
> in the same
> > | directory as the .ipk file.
> > |
> > | ipkg-build: Please fix the above errors and try again.
> > | ERROR: Function staging_packager failed
> > NOTE: package autotools-demo-1.0-28-g3a96627-r0: task do_package_stage:
> Failed
> > ERROR: TaskFailed event exception, aborting
> >
> > This patch fixes that issue.
> >
> > Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> > ---
> >  classes/packaged-staging.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/classes/packaged-staging.bbclass
> b/classes/packaged-staging.bbclass
> > index 83f3578..6413afb 100644
> > --- a/classes/packaged-staging.bbclass
> > +++ b/classes/packaged-staging.bbclass
> > @@ -374,7 +374,7 @@ staging_packager () {
> >        if [ "$srcuri" == "" ]; then
> >                srcuri="OpenEmbedded"
> >        fi
> > -       echo "Source: ${SRC_URI}"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> > +       echo "Source: ${srcuri}"               >>
> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
> >
> >        # Deal with libtool not supporting sysroots
> >        # Need to remove hardcoded paths and fix these when we install the
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

