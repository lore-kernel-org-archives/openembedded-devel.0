Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0Jmu-0008GM-SS
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 22:31:48 +0100
Received: by lahc1 with SMTP id c1so626174lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.122.74 as permitted sender) client-ip=10.152.122.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.122.74 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.122.74])
	by 10.152.122.74 with SMTP id lq10mr26950052lab.7.1329945808373
	(num_hops = 1); Wed, 22 Feb 2012 13:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=OklgSRfIn1ZomyP0eBw55Dx+0VdeVeksNS+Tm57bHjI=;
	b=kUsdhDEr5e/3z8xAaJYKjsJf/vFHcwXtqhmydxsz6fRgfDCmyFfCmtMlsoOr0Sj7uK
	QTN8s0heUnLaWREbjBMLZUeVpnU1AKraYZK/H+aS3xEtAYNSXgvlJawqEM5PmOZGMpQ4
	yEhLensLHuafKD2UJ5ouGxH11mwWRo+w5bq8g=
Received: by 10.152.122.74 with SMTP id lq10mr22537596lab.7.1329945808270;
	Wed, 22 Feb 2012 13:23:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Wed, 22 Feb 2012 13:22:58 -0800 (PST)
In-Reply-To: <1329940246-28769-1-git-send-email-msm@freescale.com>
References: <1329940246-28769-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2012 13:22:58 -0800
Message-ID: <CAMKF1soS46XnYge0YoU5Zt+4tUX5SJKP=BhdHhn0CR+Hi9avjQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
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
X-List-Received-Date: Wed, 22 Feb 2012 21:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 11:50 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
> This is useful when we want to include meta-oe as is, and also
> want to modify the toolchain such that these patches don't apply
> cleanly

I think the right thing to do is to spin this out into a layer of its
own. which we discussed on another thread.
if your intention is to just get non/oe-core overridden recipes from
meta-oe. This patch not really incorrect
but can be then avoided.

>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =C2=A0.../gcc/gcc-4_6-branch-linaro-backports.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports=
.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> index 882876e..b0fd3c7 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> @@ -1,4 +1,4 @@
> -GCC-4_6-BRANCH-LINARO-BACKPORTS =3D " =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> +GCC-4_6-BRANCH-LINARO-BACKPORTS ?=3D " =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0file://linaro/gcc-4.6-linaro-r106720.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106733.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106737.patch \
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


