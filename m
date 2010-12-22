Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVNIP-0002mp-Ti
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 12:55:54 +0100
Received: by iwn8 with SMTP id 8so5326146iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 03:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rwiXr6p6l8vrO6zuCVzdqgs395vIRefzVAZwOcVBGlQ=;
	b=sySkR/wNu6EhqfF5xPmrX9iIbGaoDrbctbh7/wIJ4/pil6Km/D2h+qnTiUFZYYYje6
	mFD4n+CMcuRu5qevJ1lRF6GyBoLJkogVArGcra5DlKQNLL2aK/gFYMjbh4zTTCbg39rO
	HmMdeMnMzL53wfEth2PeMw5bMTWatNo4/HmB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GI1HoRPTs0Ek6NLT6cF+BDO/Ki7AC1R4EEp/m0+KDjZl6ZaAmGlFdVOjRcArLmKCqQ
	4Bp5CLesPtkZNJSbGu5X/wkz1BUatraiAMpxKJdTZ8QwAIDwQG2Nn4nzT75aq91B/Wei
	cNSosSKZWQDKX+Rnqow0CZ5fntKybVQ9Zt0bI=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr6748969ibv.32.1293018946316; Wed,
	22 Dec 2010 03:55:46 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 03:55:46 -0800 (PST)
In-Reply-To: <1293016481-703-1-git-send-email-koen@openembedded.org>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
Date: Wed, 22 Dec 2010 12:55:46 +0100
Message-ID: <AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 11:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/22 Koen Kooi <koen.kooi@gmail.com>:
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
> =A0conf/sanity.conf | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/sanity.conf b/conf/sanity.conf
> index 0f53cb2..1c83c14 100644
> --- a/conf/sanity.conf
> +++ b/conf/sanity.conf
> @@ -3,7 +3,7 @@
> =A0# See sanity.bbclass
> =A0#
> =A0# Expert users can confirm their sanity with "touch conf/sanity.conf"
> -BB_MIN_VERSION =3D "1.8.18"
> +BB_MIN_VERSION =3D "1.10.0"
>
> =A0SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
> =A0SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
> --
> 1.7.0
>

As 1.10.1 is already out for quite a while and (if I recall correctly)
1.10.0 had some issues that are resolved in 1.10.1 wouldn't it be
better to set 1.10.1 as minimal version?
Otherwise no objections.

Frans.


