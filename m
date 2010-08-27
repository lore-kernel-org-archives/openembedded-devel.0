Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ooq8t-0001pN-KG
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 06:02:17 +0200
Received: by wwb31 with SMTP id 31so2447362wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 21:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=sIwsUmUNF7mGdRrxiVf97XFGCYzDTDDsIcScEAoO45s=;
	b=xBJLAKq64Wj3030EuftxPGflQa0WP9oVAqu2i7cObvr4/APcGA0g4kixd9CdwQkIAA
	dsSbRkDHzuo8+PVUuFZF+XHleYx1ZYdRPVgkP7vzkASa6mdObcng3W1Cy0eNM2sVzb2d
	XSGdagM/vqDf98bRVqFHUVdOPrLZAvHwh12vM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gaYHc6WSRS3twy1XdT0KdwarTgRPMnHSHXXnkTMFRjFwMxrWUd5xC0aOs/suMByLii
	jux006VXukrAbGWXa/s39WweKMOZNug1bns2jZEQKXmqYlZAuW8ijkrSFuGqvA2lQLcv
	saUCy0oBX0AY7AN8dG/gSNL4qni64DT1UNucw=
Received: by 10.216.93.16 with SMTP id k16mr312922wef.78.1282881707262; Thu,
	26 Aug 2010 21:01:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Thu, 26 Aug 2010 21:01:27 -0700 (PDT)
In-Reply-To: <20100622144449.GA32544@gmail.com>
References: <4C1FDA55.6050705@mentor.com> <20100622144449.GA32544@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Aug 2010 21:01:27 -0700
X-Google-Sender-Auth: QAvqS8LYOaPGyXIX-g93mJL5fp8
Message-ID: <AANLkTikv_BVWL-FUjgmV1WjWpQkwaKJDdLw=a0ViOD3=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] Don't pipe ar/tar/gzip in stage-manager-ipkg
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
X-List-Received-Date: Fri, 27 Aug 2010 04:02:17 -0000
Content-Type: text/plain; charset=UTF-8

How about:
trap "" PIPE

As an alternative to handle this?  Sorry for the delayed comment, this has
been sitting in my inbox waiting for me to look at it :)

On Tue, Jun 22, 2010 at 7:44 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On (21/06/10 14:32), Tom Rini wrote:
> > As we've gone over before, gunzip/tar can have a broken pipe, and
> > this is allowed.  In python code, we have things setup to ignore the
> > problem.  stage-manager-ipkg is written in shell however and we can
> > hit the problem there too.  There's two ways around this, one of
> > which is to stop checking for problems with the extraction (and hide
> > stderr) or we extract the archive, gunzip and then tar.  I've done
> > the latter for this RFC.  Does anyone have a strong preference for
> > the other way?
> >
>
> sounds good to me.
>
>
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> >
> > diff --git a/recipes/stage-manager/files/stage-manager-ipkg
> > b/recipes/stage-manager/files/stage-manager-ipkg
> > index 2559fdb..e5ad6f6 100755
> > --- a/recipes/stage-manager/files/stage-manager-ipkg
> > +++ b/recipes/stage-manager/files/stage-manager-ipkg
> > @@ -732,11 +732,11 @@ ipkg_install_file_dest() {
> >
> >       local pkg=`ipkg_file_part $filename | sed
> 's/\([a-z0-9.+-]\+\)_.*/\1/'`
> >       local ext=`echo $filename | sed 's/.*\.//'`
> > -     local pkg_extract_stdout
> > +     local pkg_extract
> >       #if [ "$ext" = "ipk" ]; then
> >       #       pkg_extract_stdout="tar -xzOf"
> >       #elif [ "$ext" = "deb" ]; then
> > -             pkg_extract_stdout="ar p"
> > +             pkg_extract="ar x"
> >       #else
> >       #       echo "ipkg_install_file: ERROR: File $filename has unknown
> > extension $ext (not .ipk or .deb)"
> >       #       return 1
> > @@ -768,7 +768,7 @@ ipkg_install_file_dest() {
> >       mkdir -p $IPKG_TMP/$pkg/data
> >       mkdir -p $info_dir
> >
> > -     if ! $pkg_extract_stdout $filename control.tar.gz | (cd
> > $IPKG_TMP/$pkg/control; tar -xzf - ) ; then
> > +     if ! (cd $IPKG_TMP/$pkg/control ; $pkg_extract $filename
> > control.tar.gz ; gunzip control.tar.gz ; tar xf control.tar ) ; then
> >               echo "ipkg_install_file: ERROR unpacking control.tar.gz
> from $filename"
> >               return 1
> >       fi
> > @@ -798,10 +798,11 @@ Status: install ok pending" |
> > ipkg_status_update_sd $sd $pkg
> >       set -o noglob
> >       rm -r $IPKG_TMP/$pkg/control
> >
> > -     if ! $pkg_extract_stdout $filename ./data.tar.gz | (cd
> > $IPKG_TMP/$pkg/data; tar -xzf - ) ; then
> > +     if ! (cd $IPKG_TMP/$pkg/data ; $pkg_extract $filename
> > ./data.tar.gz ; gunzip data.tar.gz ; tar xf data.tar ) ; then
> >               echo "ipkg_install_file: ERROR unpacking data.tar.gz from
> $filename"
> >               return 1
> >       fi
> > +     rm $IPKG_TMP/$pkg/data/data.tar
> >       echo "Done."
> >
> >       echo -n "Configuring $pkg..."
> > @@ -869,7 +870,10 @@ diff -u $dest/$conffile
> $IPKG_TMP/$pkg/data/$conffile"
> >       (cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; cd $dest; tar xf
> -))
> >       rm -rf $IPKG_TMP/$pkg/data
> >       rmdir $IPKG_TMP/$pkg
> > -     $pkg_extract_stdout $filename ./data.tar.gz | tar tzf - | sed -e
> > 's/^\.//' > $info_dir/$pkg.list
> > +     $pkg_extract $filename ./data.tar.gz
> > +     gunzip data.tar
> > +     tar tf data.tar | sed -e 's/^\.//' > $info_dir/$pkg.list
> > +     rm data.tar
> >
> >       if [ -x "$info_dir/$pkg.postinst" ]; then
> >               $info_dir/$pkg.postinst configure
> > diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> > b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> > index 733cc83..9eeac4b 100644
> > --- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> > +++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION = "Helper script for packaged-staging.bbclass"
> > -PR = "r12"
> > +PR = "r13"
> >
> >  SRC_URI = "file://stage-manager \
> >             file://stage-manager-ipkg \
> >
> > --
> > Tom Rini
> > Mentor Graphics Corporation
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
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

