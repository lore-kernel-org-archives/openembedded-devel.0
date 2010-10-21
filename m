Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8kCi-0005Ou-7S
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 03:44:28 +0200
Received: by gxk19 with SMTP id 19so120615gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=LYiMCKKMi7pZSWnV8p4mmozOZKezPBYZYLKH6YLTHAw=;
	b=EPm1hTBWsTTTzpC1gNY/L8/Zr2BvLBRJJxdCTy44hFbZeubTW9iO9JBGqGKoOf/Plm
	DuWRl/OkULoD7bnt3GZBQ58W6kR50aQmg0dZGpwTaDD6Bu3xW/s3iPpjv9//qXX+l7Ic
	L30Mw1Sdxq/Zy1NCWU7YW1Z9Z3jolkzsg1dBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Xv2ihcKOPhcNrNOI+vruj+nFuP8Re/LQIVp3NVOWEi7LCNIBRA6p2zGOIIe9fb5nrb
	QU5xXOWz/ygsxb8cJUJI64c9dLtQlkdyt8pjVIZ02udM/BaVe3AzfJAJjDL7vTB6ytmG
	dVSaF42TDXSpgzOvicUWGqidKr1lksyiKLgtE=
Received: by 10.90.113.13 with SMTP id l13mr904053agc.54.1287625421649; Wed,
	20 Oct 2010 18:43:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 20 Oct 2010 18:43:21 -0700 (PDT)
In-Reply-To: <4CBF89CE.8040705@gmail.com>
References: <4CBF89CE.8040705@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2010 18:43:21 -0700
Message-ID: <AANLkTin8+uFJ+ZGzxv0eCM1CF5eUL1z3h6nad2ki+jFP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] site/mips{,64}-common: Add postgresql bits.
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
X-List-Received-Date: Thu, 21 Oct 2010 01:44:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2010 at 5:31 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

is it possible to move the  offending parts to say mips64-linux and
mips64-linux-uclibc and friends instead of creating a new file with
lot of common
contents.

> ---
> =C2=A0site/mips-common =C2=A0 | =C2=A0 =C2=A06 ++++++
> =C2=A0site/mips64-common | =C2=A0 =C2=A06 ++++++
> =C2=A02 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/site/mips-common b/site/mips-common
> index 4b18c84..49e6dee 100644
> --- a/site/mips-common
> +++ b/site/mips-common
> @@ -29,3 +29,9 @@ ac_cv_alignof_CORBA_long_double=3D8
> =C2=A0ac_cv_alignof_CORBA_pointer=3D4
> =C2=A0ac_cv_alignof_CORBA_struct=3D1
>
> +# postgresql
> +pgac_cv_alignof_short=3D2
> +pgac_cv_alignof_int=3D4
> +pgac_cv_alignof_long=3D4
> +pgac_cv_alignof_long_long_int=3D8
> +pgac_cv_alignof_double=3D8
> diff --git a/site/mips64-common b/site/mips64-common
> index 5001ecd..90c2efe 100644
> --- a/site/mips64-common
> +++ b/site/mips64-common
> @@ -29,3 +29,9 @@ ac_cv_alignof_CORBA_long_double=3D8
> =C2=A0ac_cv_alignof_CORBA_pointer=3D4
> =C2=A0ac_cv_alignof_CORBA_struct=3D1
>
> +# postgresql
> +pgac_cv_alignof_short=3D2
> +pgac_cv_alignof_int=3D4
> +pgac_cv_alignof_long=3D8
> +pgac_cv_alignof_long_long_int=3D8
> +pgac_cv_alignof_double=3D8
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


