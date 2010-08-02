Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ofz8y-0006F3-CH
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 19:49:47 +0200
Received: by pwi10 with SMTP id 10so1481648pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YOVdKiQp2n8zkIskoJQW9hTyLkj7WVfsB+3g73O/CtI=;
	b=umGV73IepGNkpjI6R9RT7J9VG9TVKbeBUf2IBEfzlSo8tSuU7gEXs+PtZ1N9gJxXqh
	bhHyXNXLuegnhnSXbWV3lnDlvEdJo1YTinGiro2Wn+xIw5he50ZivtwRrD5ImrTyCGmt
	lpvkq+9lh/AwvnMMCRzr0QQbtl/UJFm/3mY9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mfwV5FG7uVZKs4Fdqzh17YkZSnFcB8vQQ66TK3ujDBp+JD7q8fCU2WSNeNItWb/SyJ
	YafeU200qYGU6KV0KmB4o59uXVaxgynJk1grcNFx5wU+KCMIzaT1zHVx3MmgIhO9ZgAj
	yC8cBjEVdmDedsQYFZp63sbLP6DfDF11MsXZw=
Received: by 10.142.144.16 with SMTP id r16mr5702776wfd.135.1280771359188;
	Mon, 02 Aug 2010 10:49:19 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q27sm7981513wfc.18.2010.08.02.10.49.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Aug 2010 10:49:18 -0700 (PDT)
Date: Mon, 2 Aug 2010 10:49:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100802174910.GA1503@gmail.com>
References: <1280309434.7083.8.camel@utx.lan> <4C503315.8090009@gmail.com>
	<20100728140613.GB19135@mx.loc> <20100728143208.GC19135@mx.loc>
	<20100802171317.GF29814@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100802171317.GF29814@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC]: automatically depend xz compressed URIs on xz-native [was: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)]
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
X-List-Received-Date: Mon, 02 Aug 2010 17:49:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/08/10 19:13), Bernhard Reutner-Fischer wrote:
> On Wed, Jul 28, 2010 at 04:32:08PM +0200, Bernhard Reutner-Fischer wrote:
> >On Wed, Jul 28, 2010 at 04:06:13PM +0200, Bernhard Reutner-Fischer wrote:
> >>On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
> >>>Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
> 
> comments on the attached RFC patch?
> TIA,

-snip-
> @@ -420,12 +424,16 @@ python () {
>  
>      # unzip-native should already be staged before unpacking ZIP recipes
>      need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
> -    src_uri = bb.data.getVar('SRC_URI', d, 1)
>  
> -    if ".zip" in src_uri or need_unzip == "1":
> +    if ".zip" in srcuri or need_unzip == "1":
>          depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>          depends = depends + " unzip-native:do_populate_sysroot"
>          bb.data.setVarFlag('do_unpack', 'depends', depends, d)
> +    for ext in ['xz']: #['gzip', 'bzip2', 'xz']:
> +        if '.' + ext in srcuri:
> +            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
> +            depends += ' ' + ext + '-native:do_populate_sysroot'
> +            bb.data.setVarFlag('do_unpack', 'depends', depends, d)

what does above hunk do.

>  
>      # 'multimachine' handling
>      mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
> diff --git a/classes/native.bbclass b/classes/native.bbclass
> index 3437836..9539d30 100644
> --- a/classes/native.bbclass
> +++ b/classes/native.bbclass
> @@ -88,8 +88,7 @@ PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
>  PKG_CONFIG_SYSROOT_DIR = ""
>  
>  ORIG_DEPENDS := "${DEPENDS}"
> -
> -DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
> +DEPENDS_virtclass-native ?= "${@base_conditional('INHIBIT_DEFAULT_DEPS_virtclass-native', '1', '', '${ORIG_DEPENDS}', d)}"
>  
>  python __anonymous () {
>      # If we've a legacy native do_stage, we need to neuter do_install
> @@ -111,7 +110,6 @@ python __anonymous () {
>              if dep.endswith("-cross"):
>                  newdeps.append(dep.replace("-cross", "-native"))
>              elif not dep.endswith("-native"):
> -     
>                  newdeps.append(dep + "-native")
>              else:
>                  newdeps.append(dep)
> @@ -121,9 +119,9 @@ python __anonymous () {
>              if prov.find(pn) != -1:
>                  continue
>              if not prov.endswith("-native"):
> -    
>                  provides = provides.replace(prov, prov + "-native")
>          bb.data.setVar("PROVIDES", provides, d)
>          bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", d, False) + ":virtclass-native", d)
> +        bb.data.setVar("INHIBIT_AUTORECONF", bb.data.getVar("INHIBIT_AUTORECONF_virtclass-native", d, True), d)
>  }
>  
> diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.6.3.bb
> index 981c062..5c76bab 100644
> --- a/recipes/grep/grep_2.6.3.bb
> +++ b/recipes/grep/grep_2.6.3.bb
> @@ -3,8 +3,6 @@ SECTION = "console/utils"
>  DESCRIPTION = "grep GNU utility"
>  PR = "r2"
>  
> -do_unpack[depends] += "xz-native:do_populate_sysroot"
> -
>  SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
>             file://uclibc-fix.patch"
>  
> diff --git a/recipes/xz/xz_4.999.9beta.bb b/recipes/xz/xz_4.999.9beta.bb
> index 8733023..fe49412 100644
> --- a/recipes/xz/xz_4.999.9beta.bb
> +++ b/recipes/xz/xz_4.999.9beta.bb
> @@ -1,5 +1,8 @@
> +INHIBIT_AUTOTOOLS_DEPS_virtclass-native = "1"
> +INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
> +INHIBIT_AUTORECONF_virtclass-native = "1"
>  require xz.inc
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
>  SRC_URI[xz.md5sum] = "cc4044fcc073b8bcf3164d1d0df82161"
>  SRC_URI[xz.sha256sum] = "330312c4397608d8b7be362cc7edbfeafa6101614bc2164d816ea767656aa15c"


in general approach looks ok to me. It would be nice that while you are at
it other packages which are needed early like git etc can use this approach
as well.

Thanks
-Khem




> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



