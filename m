Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LytjP-0005GW-G3
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 22:16:43 +0200
Received: by rv-out-0708.google.com with SMTP id f25so532760rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Wnheso1VTkrqvLV2LrmOk/FhzZoutEIIcyG27O/0LME=;
	b=ZKj98s8Wc5r2dblNdQ+0XoqrEtdqOYGCrUbrgI14z4WncWQ0/pD9pW2Fu8g2+Svxd+
	PjFJAvtFWu3fx1gD5fB+NNdRUriL53GQNUTce0wd1SY6IQjTXDlWbclWk36eaDq+8T9f
	+/ITynlEkZO1AZ919q9+eMkseNSrpCj+i8JLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KHkiDvcD8edWzmi3lut980MmET6UpeBwFc+0i96D1g7vKh2E2fF7ihHNooHuWlNpWa
	QFFOIRVl0cI/+aNd/ryYOEo1z6Q016aqaUYetMD18dflgMsFi4+iuhZqFIKD/zz1aY9r
	kwVY3BU2CO2+RDnATk9GompmdhqsK7il7jJ/s=
Received: by 10.143.11.11 with SMTP id o11mr1623035wfi.193.1240949492085;
	Tue, 28 Apr 2009 13:11:32 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id 30sm392604wff.29.2009.04.28.13.11.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Apr 2009 13:11:31 -0700 (PDT)
Date: Tue, 28 Apr 2009 13:11:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090428201128.GB26082@gmail.com>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH][STABLE] binutils-canadian-sdk: Use add SYSROOT, use SDK_REALPATH_MINGW, bump PR
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
X-List-Received-Date: Tue, 28 Apr 2009 20:16:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/04/09 09:11), Tom Rini wrote:
> From: Tom Rini <trini@embeddedalley.com>
> 
> 
> Signed-off-by: Tom Rini <trini@embeddedalley.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/binutils/binutils-canadian-sdk_2.18.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/binutils/binutils-canadian-sdk_2.18.bb b/recipes/binutils/binutils-canadian-sdk_2.18.bb
> index cf27cd0..e44e7b7 100644
> --- a/recipes/binutils/binutils-canadian-sdk_2.18.bb
> +++ b/recipes/binutils/binutils-canadian-sdk_2.18.bb
> @@ -9,9 +9,12 @@ DEPENDS="\
>  "
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-${PV}"
> -EXTRA_OECONF = "--with-sysroot=${prefix}/${TARGET_SYS} \
> +# On MinGW hosts we want to prepend a drive letter, in ${SDK_REALPATH_MINGW}
> +# to the sysroot path.
> +SYSROOT = "${@['${SDK_REALPATH}/${TARGET_SYS}', '${SDK_REALPATH_MINGW}${SDK_REALPATH}/${TARGET_SYS}'][bb.data.getVar('SDK_OS', d, 1) in ['mingw32', 'mingw64']]}"
> +EXTRA_OECONF = "--with-sysroot=${SYSROOT} \
>  		--program-prefix=${TARGET_PREFIX}"
> -PR = "r3"
> +PR = "r4"
>  
>  FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
>  
> -- 
> 1.5.6.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


