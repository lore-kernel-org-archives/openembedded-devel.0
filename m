Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B9D8A7CD73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:17:42 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q6so6985441wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 04:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iW2uSRmrssUomTdt2TwYcJIDYIv9lZY5q/cITvnNDPU=;
	b=S1ydu+PM7nKOvPj8bCBcvNrLejSl5Rr2ps2Zg4k1EOaq4oFOzLHaGNJFAtsvbNInlO
	4fNx2qVmeVjfnnGS0+VcemB+L3+40OMiA7pRJejapFA8kI4s+AKaY2hJhWggSxzDjD8R
	OgFw391Ul6crs+Jc0Zm8ILVG/x9EOibpjqvlQsAjEKSWavIzXAyOqdX05OM4k9CChEMG
	f08D8w7dHGCZ27iCqQ6uXxKVJ/8E4FuZPc3GG2leDjAndYtSSTUuQwAQLmYVsCiSD4U8
	gwKOLEuIvbXJHUsBOq5bWY9vXWNTzsHumolJ470ObxmUkLiMczFF+M58wvQtgGjz39gE
	Ks0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iW2uSRmrssUomTdt2TwYcJIDYIv9lZY5q/cITvnNDPU=;
	b=uB0/FTzsfuoAIzTotfElFuIqx8G39YRULH/DKrGESOdd41qdGJTaNYcEjr0GuuHHL4
	JEEAHT2yupnEwOv2WwUBhxJVk4IPtzWWhd0usPzIQSXO+qC8IalMxEvU4CMIvoTzkKFi
	h3OMaM026QJCwldk9S1BaotBYrFh0xjzf6Mw07nA5qgE+NXfa+VZsPsD9H3nistd/j8J
	wTpKu5ruTJrx/bO0RhPzphc2EBygZVQmYOUej1vJGZQgeflY3LavMrEObuEBi0DyaTK9
	2iagtxcAkAUUCmFuFHm5jinaPA+eSs8+BUexB5rteeJFeBsQpxK+TWwbt6XLAglxnf3H
	ieHA==
X-Gm-Message-State: APjAAAWeZz7n2YsiQN6loUwTI6YcAUCIBBwzoTqZrjjx3GhCzM6MZ0Yv
	ENb9lwLuItWEc9I7X+ryerPsCHMkWOr+EJt96ts=
X-Google-Smtp-Source: APXvYqwTNSzx+XcC2DIBZ4X0F2OVdK3+3ZSM+gngENQW497PxLKKUVSPJpYwyXOowD3fVUq4q24pZr1zWiG7u0MeqhE=
X-Received: by 2002:adf:a746:: with SMTP id e6mr10892821wrd.329.1579695463112; 
	Wed, 22 Jan 2020 04:17:43 -0800 (PST)
MIME-Version: 1.0
References: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
In-Reply-To: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 22 Jan 2020 13:17:32 +0100
Message-ID: <CAB2nKc_JoM6ASEBQAe1gs74W29VAMLExr4rJJut8knKLFkAMUg@mail.gmail.com>
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cppzmq: bump to version 4.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2020 12:17:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

v4.6.0 breaks some namespaces from v4.4.1, maybe we can keep both
versions until people migrates?

Best regards,
Vincent


Le ven. 17 janv. 2020 =C3=A0 23:44, Pierre-Jean Texier via
Openembedded-devel <openembedded-devel@lists.openembedded.org> a =C3=A9crit
:
>
> This includes the following changes:
>
> 8d5c9a8 Merge pull request #374 from gummif/patch-2
> ff994d9 Improved comment on workaround
> 615380b Problem: Invalid 32bit issues when using Conan
> bd27f24 Merge pull request #373 from gummif/gfa/tostring
> 4f9c2ea Problem: message_t to string is hard
> de07119 Merge pull request #370 from gummif/gfa/multipartn
> 30fdfe0 Simplify code by trusting the compiler
> 0f8601c Merge pull request #371 from gummif/gfa/move-ctors
> d3abe06 Problem: Move assigned objects still alive
> 93e3090 Problem: Missing recv multipart to fixed buffers
> 5ee8261 Merge pull request #366 from gummif/gfa/detail-in-api
> 0ef29c1 Problem: Detail namespace used in API
> 28aecd9 Merge pull request #367 from gummif/gfa/no-tests
> 76e5fb0 Problem: No multipart tests are begin run
> a34d2a3 Merge pull request #358 from gummif/gfa/send-recv-multipart
> d4d3ce3 Suppport for raw arrays in send_multipart
> 5cc7793 Improve algorithms and documentation
> 829997d Update version number to 4.6.0 to prepare for next development it=
eration
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/=
recipes-connectivity/zeromq/cppzmq_git.bb
> index 3697129..0b66970 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66=
e94"
>  DEPENDS =3D "zeromq"
>
> -SRCREV =3D "e67fa0e16d7964876228952f60693f5c03ea0cc1"
> -PV =3D "4.5.0"
> +SRCREV =3D "8d5c9a88988dcbebb72939ca0939d432230ffde1"
> +PV =3D "4.6.0"
>
>  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

