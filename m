Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9u2D-0001tN-Mz
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 08:26:27 +0200
Received: by fxm3 with SMTP id 3so2000612fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JZWgcAtmgFushgWKZORqHdEuy4vtUmUR5opyt2Bu1sI=;
	b=brBL/pL7N0IzSYTaDHNGu57HX792Dh1+uHN9EnDOpxpeX5fJmSvbSWmjEvJyJBYibw
	vS2X86/N5dFdP4RWkVOkZjpxi+WdXCbgGQiu3egQ/dnSy7kWgrQSCd9/XJ+jmtb67KVA
	3kaCidMclynXLG2okYbeM9EANUZu3wNeSjkFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ShnpMt55nxQh78xRTFj7QbA7fTuG+a+1NS5yfXujNsG+n8GvQyyBjO8if9THuko0M3
	rcKPCbCuFpNYOo9XCeRhOdcwoYcPbij5n7h/UvuC1MCf3E83dhvMUMVPIH0im8kQhobe
	2ViotyIMkTIkmM0bAOE/DLURKZBOgz9DsJkus=
Received: by 10.103.52.20 with SMTP id e20mr6241172muk.65.1287901544335;
	Sat, 23 Oct 2010 23:25:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o6sm2242902fal.39.2010.10.23.23.25.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Oct 2010 23:25:43 -0700 (PDT)
Date: Sun, 24 Oct 2010 08:25:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101024062549.GD3494@jama>
References: <y>
 <4cc228ec.1d8b970a.4cbb.0973@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cc228ec.1d8b970a.4cbb.0973@mx.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] Lightmediascanner: Add recipe for 0.4.0 release
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
X-List-Received-Date: Sun, 24 Oct 2010 06:26:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 10:14:04PM -0200, fidencio@profusion.mobi wrote:
> From: Eduardo Lima (Etrunko) <eblima@gmail.com>
> 
> Also update 0.2.0 recipe to use lightmediascanner.inc
> 
> Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
> ---
>  recipes/lightmediascanner/lightmediascanner.inc    |   21 ++++++++++++++++++++
>  .../lightmediascanner/lightmediascanner_0.2.0.0.bb |   11 +---------
>  .../lightmediascanner/lightmediascanner_0.4.0.0.bb |    6 +++++
>  3 files changed, 28 insertions(+), 10 deletions(-)
>  create mode 100644 recipes/lightmediascanner/lightmediascanner.inc
>  create mode 100644 recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
> 
> diff --git a/recipes/lightmediascanner/lightmediascanner.inc b/recipes/lightmediascanner/lightmediascanner.inc
> new file mode 100644
> index 0000000..9ba7a01
> --- /dev/null
> +++ b/recipes/lightmediascanner/lightmediascanner.inc
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
> +SECTION = "libs/multimedia"
> +AUTHOR = "INdT / ProFUSION"
> +LICENSE = "LGPL"
> +DEPENDS += "sqlite3 libogg libvorbis flac"
> +# DEPENDS += "mpeg4ip"
> +
> +PE = "1"
> +RDEPENDS_${PN} += "glibc-gconv-utf-16 \
> +             glibc-gconv \
> +             "
> +RPROVIDES_${PN} += "liblightmediascanner"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
> +
> +do_stage() {
> +	autotools_stage_all
> +}

please don't use old staging for new stuff

> +
> diff --git a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
> index cbb8f4b..f9ffbaf 100644
> --- a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
> +++ b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
> @@ -1,15 +1,6 @@
> -DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
> -SECTION = "libs/multimedia"
> -AUTHOR = "Profusion"
> -LICENSE = "LGPL"
> -DEPENDS = "sqlite3"
> -PE = "1"
> +require lightmediascanner.inc
>  
>  SRC_URI = "https://garage.maemo.org/frs/download.php/4626/lightmediascanner-0.2.0.0.tar.bz2"
>  
> -inherit autotools pkgconfig
> -
> -FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
> -
>  SRC_URI[md5sum] = "ee1494b6dff3a50be64a3266819056d5"
>  SRC_URI[sha256sum] = "98f980e8971fa4d04a589215c3b90d2eaf317ed70fd0d4988089e0fe5808c853"
> diff --git a/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb b/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
> new file mode 100644
> index 0000000..24b67cb
> --- /dev/null
> +++ b/recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
> @@ -0,0 +1,6 @@
> +require lightmediascanner.inc
> +
> +SRC_URI = "https://garage.maemo.org/frs/download.php/8497/lightmediascanner-0.4.0.0.tar.bz2"
> +
> +SRC_URI[md5sum] = "a302107cb17fc0c8fb7c8fe42b4a92f1"
> +SRC_URI[sha256sum] = "718965779f43796fa76ffdf36b90a138725bc69c20013d75e8dc7291a939dcb2"
> -- 
> 1.7.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


