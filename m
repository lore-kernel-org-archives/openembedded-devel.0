Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9YO3-0005Ao-9S
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 09:19:32 +0200
Received: by iwn5 with SMTP id 5so457181iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iRhIWyke2L0PC7O0aG5ruSz1XdWZDca9f6M+9Kk8slc=;
	b=eV0goT48OR4q4pQgm72qsJHKaUYpKhbn9M1JN+SsOcsFoGCxy+Doi9rhYraasbA0ok
	pHDw+/50xriy+6UXrlQIfo9TWhWqhAzfawEhAwqXr8hhROOUa4U7/EDivOc+j6XQMgte
	EeFUnmrYX8E8UWX1QhKlfX4i718/In8iW6tEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=am65cSbUEC5Yg4es32mpImk55joWR6/g+iq0BVLXLjdK2hFEOEm/VfjrmCsKVaGjzc
	7ZTD0qQjqIMfwge8z+jY03u7EYmucyFqNl/+0Y28Pp0iYSSa6Y2EPqLakX9SgSQNuErL
	WOiMsScsbFQgAIHJlmAbeB9XYP2gCa8xMuIcQ=
MIME-Version: 1.0
Received: by 10.231.17.11 with SMTP id q11mr298733iba.102.1287818331870; Sat,
	23 Oct 2010 00:18:51 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 23 Oct 2010 00:18:51 -0700 (PDT)
In-Reply-To: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
References: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 23 Oct 2010 09:18:51 +0200
Message-ID: <AANLkTiko+XSPabHbGwR8QjVd5oCTqAFA4fM2qk13ranr@mail.gmail.com>
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
Subject: Re: [PATCH] bitbake.conf: Add one recipe identifying OVERRIDE based on recipe type
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
X-List-Received-Date: Sat, 23 Oct 2010 07:19:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/22 Khem Raj <raj.khem@gmail.com>:
> It adds an override based on type of recipe
> e.g. recipes ending with usual suffixes like -native -cross, -sdk
> add the same to overrides with out leading '-'
> It also add the same override for BBCLASSEXTEND
> For normal recipes we add 'target' to overrides
>
> This will give up better control over defining and combining
> recipes into using BBCLASSEXTEND and still have finer control
> if needed. We wont require to have virtclass-xxx overrides
> anymore
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0classes/utils.bbclass | =A0 =A03 +++
> =A0conf/bitbake.conf =A0 =A0 | =A0 =A02 ++
> =A0lib/oe/utils.py =A0 =A0 =A0 | =A0 =A08 ++++++++
> =A03 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
> index 10d49ce..7c96509 100644
> --- a/classes/utils.bbclass
> +++ b/classes/utils.bbclass
> @@ -36,6 +36,9 @@ def base_both_contain(variable1, variable2, checkvalue,=
 d):
> =A0def base_prune_suffix(var, suffixes, d):
> =A0 =A0 return oe.utils.prune_suffix(var, suffixes, d)
>
> +def base_get_suffix(var, suffixes, d):
> + =A0 =A0return oe.utils.get_suffix(var, suffixes, d)
> +
> =A0def oe_filter(f, str, d):
> =A0 =A0 return oe.utils.str_filter(f, str, d)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 539ab3d..2f3dd6b 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -195,6 +195,8 @@ MACHINE_KERNEL_PR =3D ""
> =A0# otherwise it is the same as PN and P
> =A0SPECIAL_PKGSUFFIX =3D "-native -cross -initial -intermediate -nativesd=
k -crosssdk -cross-canadian -sdk"
> =A0BPN =3D "${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(),=
 d)}"
> +# Add a _target override so we can do target specific overrides when usi=
ng BBCLASSEXTEND
> +OVERRIDES_prepend =3D "${@base_get_suffix('${PN}', '${SPECIAL_PKGSUFFIX}=
'.split(), d)}:"
> =A0BP =3D "${BPN}-${PV}"
>
> =A0# Package info.
> diff --git a/lib/oe/utils.py b/lib/oe/utils.py
> index 2169ed2..4822864 100644
> --- a/lib/oe/utils.py
> +++ b/lib/oe/utils.py
> @@ -67,6 +67,14 @@ def prune_suffix(var, suffixes, d):
> =A0 =A0 =A0 =A0 =A0 =A0 return var.replace(suffix, "")
> =A0 =A0 return var
>
> +def get_suffix(var, suffixes, d):
> + =A0 =A0# See if var ends with any of the suffixes listed and
> + =A0 =A0# if found return it otherwise return "target'
> + =A0 =A0for suffix in suffixes:
> + =A0 =A0 =A0 =A0if var.endswith(suffix):
> + =A0 =A0 =A0 =A0 =A0 return suffix[1:]
> + =A0 =A0return "target"
> +
> =A0def str_filter(f, str, d):
> =A0 =A0 from re import match
> =A0 =A0 return " ".join(filter(lambda x: match(f, x, 0), str.split()))
> --
> 1.7.1

Cool. I felt we need -target for quite a while, but could not add it myself=
.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Next question/proposal:
A big patch to replace things like virtclass-natve to -native ?
And then a patch to remove that functionality ?

Seems liek the way forward.

Frans


