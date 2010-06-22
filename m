Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OR4m3-0003H7-D4
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:48:31 +0200
Received: by pvg3 with SMTP id 3so52054pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=48eI4ASviG0IgMnkM3ry2fuJonrfgNkJac2CZ+4LHnk=;
	b=WKr9PsimoDDNubtFUbZrLNP43pYDovFEa8EylUl9NspVmk/psdFprkqRK+u0/k+IUp
	3azfzd7OuB6wG83LIQKl+mw09vvp+PQ5L2bAuVMvr2bcUXS9iwm173VCIYaCSzZCASec
	75UnGyDhpd2FdzbyhGlAqDfGk0CoGTpbOOJgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Mh6P5NmSst5/eiLRlO0sFMSJneuupetzmuOnnbufzHTgs/PGw32aecrtRRRnNcl7bc
	zWcfK5/MFz+uRdupRLbWhRxsas4VCx/Z8h8ysAkP0O4vgFChz7fMyuN0kMxrqT0dHnT6
	43iDEZst5sqRrf/vgkJJ4LJtWSf0Z+u66XMgs=
Received: by 10.143.24.11 with SMTP id b11mr5180535wfj.215.1277217830333;
	Tue, 22 Jun 2010 07:43:50 -0700 (PDT)
Received: from gmail.com ([99.57.141.118])
	by mx.google.com with ESMTPS id f20sm3878327rvb.3.2010.06.22.07.43.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 07:43:49 -0700 (PDT)
Date: Tue, 22 Jun 2010 07:44:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100622144449.GA32544@gmail.com>
References: <4C1FDA55.6050705@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C1FDA55.6050705@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 22 Jun 2010 14:48:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/06/10 14:32), Tom Rini wrote:
> As we've gone over before, gunzip/tar can have a broken pipe, and
> this is allowed.  In python code, we have things setup to ignore the
> problem.  stage-manager-ipkg is written in shell however and we can
> hit the problem there too.  There's two ways around this, one of
> which is to stop checking for problems with the extraction (and hide
> stderr) or we extract the archive, gunzip and then tar.  I've done
> the latter for this RFC.  Does anyone have a strong preference for
> the other way?
> 

sounds good to me.


> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> diff --git a/recipes/stage-manager/files/stage-manager-ipkg
> b/recipes/stage-manager/files/stage-manager-ipkg
> index 2559fdb..e5ad6f6 100755
> --- a/recipes/stage-manager/files/stage-manager-ipkg
> +++ b/recipes/stage-manager/files/stage-manager-ipkg
> @@ -732,11 +732,11 @@ ipkg_install_file_dest() {
> 
>  	local pkg=`ipkg_file_part $filename | sed 's/\([a-z0-9.+-]\+\)_.*/\1/'`
>  	local ext=`echo $filename | sed 's/.*\.//'`
> -	local pkg_extract_stdout
> +	local pkg_extract
>  	#if [ "$ext" = "ipk" ]; then
>  	#	pkg_extract_stdout="tar -xzOf"
>  	#elif [ "$ext" = "deb" ]; then
> -		pkg_extract_stdout="ar p"
> +		pkg_extract="ar x"
>  	#else
>  	#	echo "ipkg_install_file: ERROR: File $filename has unknown
> extension $ext (not .ipk or .deb)"
>  	#	return 1
> @@ -768,7 +768,7 @@ ipkg_install_file_dest() {
>  	mkdir -p $IPKG_TMP/$pkg/data
>  	mkdir -p $info_dir
> 
> -	if ! $pkg_extract_stdout $filename control.tar.gz | (cd
> $IPKG_TMP/$pkg/control; tar -xzf - ) ; then
> +	if ! (cd $IPKG_TMP/$pkg/control ; $pkg_extract $filename
> control.tar.gz ; gunzip control.tar.gz ; tar xf control.tar ) ; then
>  		echo "ipkg_install_file: ERROR unpacking control.tar.gz from $filename"
>  		return 1
>  	fi
> @@ -798,10 +798,11 @@ Status: install ok pending" |
> ipkg_status_update_sd $sd $pkg
>  	set -o noglob
>  	rm -r $IPKG_TMP/$pkg/control
> 
> -	if ! $pkg_extract_stdout $filename ./data.tar.gz | (cd
> $IPKG_TMP/$pkg/data; tar -xzf - ) ; then
> +	if ! (cd $IPKG_TMP/$pkg/data ; $pkg_extract $filename
> ./data.tar.gz ; gunzip data.tar.gz ; tar xf data.tar ) ; then
>  		echo "ipkg_install_file: ERROR unpacking data.tar.gz from $filename"
>  		return 1
>  	fi
> +	rm $IPKG_TMP/$pkg/data/data.tar
>  	echo "Done."
> 
>  	echo -n "Configuring $pkg..."
> @@ -869,7 +870,10 @@ diff -u $dest/$conffile $IPKG_TMP/$pkg/data/$conffile"
>  	(cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; cd $dest; tar xf -))	
>  	rm -rf $IPKG_TMP/$pkg/data
>  	rmdir $IPKG_TMP/$pkg
> -	$pkg_extract_stdout $filename ./data.tar.gz | tar tzf - | sed -e
> 's/^\.//' > $info_dir/$pkg.list
> +	$pkg_extract $filename ./data.tar.gz
> +	gunzip data.tar
> +	tar tf data.tar | sed -e 's/^\.//' > $info_dir/$pkg.list
> +	rm data.tar
> 
>  	if [ -x "$info_dir/$pkg.postinst" ]; then
>  		$info_dir/$pkg.postinst configure
> diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> index 733cc83..9eeac4b 100644
> --- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> +++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Helper script for packaged-staging.bbclass"
> -PR = "r12"
> +PR = "r13"
> 
>  SRC_URI = "file://stage-manager \
>             file://stage-manager-ipkg \
> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


