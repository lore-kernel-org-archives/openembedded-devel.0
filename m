Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1A47A620C2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jun 2013 13:52:11 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id ea20so2194741lab.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jun 2013 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4n2DCscPeENFvmpaZGQYvz8+/eUdqHH/Jg62FQ45jkM=;
	b=E4037poxoe0Up1PffIFPeaOMJgNV0W65kYteg05OsPiKYhTdUG/vLcZ1tD8z90J894
	4Fxeej0DeuOw/1Y7z/Q9cxfL522WMHGXfCTwT4liG5/a2/j15WR3vmVrwta0N3JseMOF
	aPjvg2AVBcDpGE9A/jvo1pE6vjQaJip4yuAEELpI4YCM2JSULRMHk7eK6b5YPYkKjzis
	yxiU42+GDAZETSjgBS7nsk6A78+sWGUHlKdzwaBi3VuCsiqzy4kp4GOsdByxiCUiKCXa
	57RdKkBsVqAwpWGwOMO3s1MiOhHdnuZYF5XjvflWtohKhP6FMLRuEVl2241PEkNAZaAo
	lQMg==
MIME-Version: 1.0
X-Received: by 10.112.170.201 with SMTP id ao9mr7766989lbc.40.1370094731735;
	Sat, 01 Jun 2013 06:52:11 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Sat, 1 Jun 2013 06:52:11 -0700 (PDT)
In-Reply-To: <1370037449-6982-3-git-send-email-andrea.adami@gmail.com>
References: <1370037449-6982-1-git-send-email-andrea.adami@gmail.com>
	<1370037449-6982-3-git-send-email-andrea.adami@gmail.com>
Date: Sat, 1 Jun 2013 09:52:11 -0400
Message-ID: <CADkTA4MrS4soopj-P1Y8HAxmreEBkYgH6e_k5WqfX_Z1mRrkjQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH 3/3] linux-yocto_3.8: unlock linux-yocto kernels 3.8 for Zaurus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jun 2013 13:52:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 31, 2013 at 5:57 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> * after removal of kernel 3.2 we are obliged to upgrade
> * note: testing needed
> * known issue: large size

Work with me on this if you are still seeing odd behaviour. I'm out of
the office
for some travel this upcoming week, but am available to debug in the cycles
I can steal.

Cheers,

Bruce

>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.8.bbappend | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> index b81a67d..1637c0b 100644
> --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> @@ -2,12 +2,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/fil
>
>  COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
>
> -DEFAULT_PREFERENCE_akita = "-1"
> -DEFAULT_PREFERENCE_c7x0 = "-1"
> -DEFAULT_PREFERENCE_collie = "-1"
> -DEFAULT_PREFERENCE_poodle = "-1"
> -DEFAULT_PREFERENCE_spitz = "-1"
> -DEFAULT_PREFERENCE_tosa = "-1"
> +DEFAULT_PREFERENCE_akita = "1"
> +DEFAULT_PREFERENCE_c7x0 = "1"
> +DEFAULT_PREFERENCE_collie = "1"
> +DEFAULT_PREFERENCE_poodle = "1"
> +DEFAULT_PREFERENCE_spitz = "1"
> +DEFAULT_PREFERENCE_tosa = "1"
>
>  KMACHINE_akita = "akita"
>  KMACHINE_c7x0 = "c7x0"
> --
> 1.8.1.5
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

