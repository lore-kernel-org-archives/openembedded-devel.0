Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcKpS-0000AB-Os
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:42:46 +0100
Received: by pxi17 with SMTP id 17so3670570pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=ptG3euZgJ+j06FociaUVWePNv4xpdC0SkNhw222o0eE=;
	b=txjbqbJFeMZ1H/vTPSJjZmGq2IFqDRtgSlAvWL1xRXFJR+odjQr+J+n0bQribGARSn
	PSXiVBYMPaYvAm0ozkux3JQ58DpetWBhTdJ40sk48shn3CmWAI2ezOC55AKMOS7mzNWz
	Pwh701SvcSo8DhTQis2NslAHhYESoZ4Wq7pc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=NKtZ1Xzw7dyAWx3UAn7vjH3m7kpP2yJyJdv7yeaneGnXSyBviDx62r2ovNL9h1ISey
	Bt+V+qc6Krk7lB4LWoItzHQsPhpehzbHNH0KLYTSSsGmNYa3wuN0W24phR65bL+oeegx
	sW5J7kFEDQ33RIQMmre6rvn1i6uBrhZro0UuM=
Received: by 10.142.192.5 with SMTP id p5mr4626438wff.122.1294677735944;
	Mon, 10 Jan 2011 08:42:15 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm7898801wfa.11.2011.01.10.08.42.14
	(version=SSLv3 cipher=RC4-MD5); Mon, 10 Jan 2011 08:42:14 -0800 (PST)
Message-ID: <4D2B36E3.4080404@gmail.com>
Date: Mon, 10 Jan 2011 08:42:11 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294632837-21666-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1294632837-21666-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] packaged-staging.bbclass: bug fix in ipk file name generation for searching ipk file.
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
X-List-Received-Date: Mon, 10 Jan 2011 16:42:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/2011 8:13 PM, Ahsan, Noor wrote:
> * First check the availability of PKGV_pkg variable, if it is not available then get value from PKGV variable for creating ipk file name for searching ipk file.
>
> Signed-off-by: Ahsan, Noor<noor_ahsan@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   classes/packaged-staging.bbclass |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
> index d0aaea1..1200abc 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -454,10 +454,13 @@ python do_package_stage () {
>               pr = bb.data.getVar('PR_%s' % pkg, d, 1)
>               if not pr:
>                   pr = bb.data.getVar('PR', d, 1)
> +            pkgv = bb.data.getVar('PKGV_%s' % pkg, d, 1)
> +            if not pkgv:
> +                pkgv = bb.data.getVar('PKGV', d, 1)
>               if not oe.packagedata.packaged(pkg, d):
>                   continue
>               if bb.data.inherits_class('package_ipk', d):
> -                srcname = bb.data.expand(pkgname + "_${PKGV}-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)
> +                srcname = bb.data.expand(pkgname + "_" + pkgv + "-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)
>                   srcfile = bb.data.expand("${DEPLOY_DIR_IPK}/" + arch + "/" + srcname, d)
>                   if os.path.exists(srcfile):
>                       destpath = ipkpath + "/" + arch + "/"



