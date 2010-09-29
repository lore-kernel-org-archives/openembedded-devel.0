Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P129m-0006xt-TP
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 21:17:35 +0200
Received: by iwn2 with SMTP id 2so1419439iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xqawgv9nPM3wpojmRmo9qEh+IUnFmsdOHiTdDQxqBqs=;
	b=wg3gO/5hEBevEakP0TNiAw32rQCJasolTxJWZ7hourNclT0vaIDb+RNJfurwcfvKbx
	8NmCJyz2S/tM8DcA/Hs7yEy0ZLBquAcM6/2IyrUbIXc0RkflDBUZW92C8deycxXGLloQ
	oilcpUkzgeKjGRJpTZzPxamtGLHxpse2tqtpw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qJcVLeNOdRMmRd6gbBFAsOXMuQ2fuU+96MQoinJ90yQa4eU3NliuoRWY+mGIYT8qmn
	MHL8FzRFD29ugmh5gilBOEyI0CzPJQdbbnUeCtdFuluDk8PiQMVHgI8JOo4RRAurKggJ
	3qFhbaSSSLwPr/tTDc8qTSBwUBLv64dSbKVhs=
MIME-Version: 1.0
Received: by 10.231.32.73 with SMTP id b9mr2255675ibd.133.1285787839517; Wed,
	29 Sep 2010 12:17:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 12:17:19 -0700 (PDT)
In-Reply-To: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
Date: Wed, 29 Sep 2010 21:17:19 +0200
Message-ID: <AANLkTik-U9pMUROFJXa_pAShpuyrVe5_tWnJ9Gtn7178@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 19:17:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Chase Maupin <chasemaupin03@gmail.com>:
> * Updated the SRCREV to the latest version of this project
> =A0which includes support for multiple platforms.
> * Add COMPATIBLE_MACHINE setting for recipe.
>
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
> =A0recipes/ti/am-benchmarks_svn.bb | =A0 13 ++++++++++---
> =A01 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_s=
vn.bb
> index 51ac6af..6ab29f5 100644
> --- a/recipes/ti/am-benchmarks_svn.bb
> +++ b/recipes/ti/am-benchmarks_svn.bb
> @@ -4,15 +4,22 @@ LICENSE =3D "BSD"
> =A0SECTION =3D "system"
> =A0PRIORITY =3D "optional"
>
> -SRCREV =3D "33"
> -PV =3D "1.0"
> +SRCREV =3D "56"
> +PV =3D "1.1"
> =A0PR =3D "r1+svnr${SRCPV}"
>
> +COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x)"
> +
> +ARCHITECTURE_dm365 =3D "arm9"
> +ARCHITECTURE_omapl138 =3D "arm9"
> +ARCHITECTURE_omap3 =3D "cortex-a8"
> +ARCHITECTURE_ti816x =3D "cortex-a8"
> +
> =A0INSANE_SKIP_${PN} =3D "True"
>
> =A0SRC_URI =3D "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;pro=
to=3Dhttps;user=3Danonymous;pswd=3D''"
>
> -S =3D "${WORKDIR}/trunk"
> +S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
>
> =A0do_compile() {
> =A0 =A0 =A0 =A0# don't build debug version
> --

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


