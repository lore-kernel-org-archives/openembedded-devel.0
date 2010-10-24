Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PA5JX-0000Pe-Na
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 20:29:04 +0200
Received: by iwn5 with SMTP id 5so2079936iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=XDZWvspZIn11h63H8s9kEVPQBVtjisJ6kh1q01HQb7w=;
	b=npSSqTuRyrDhMNF3breWvm2/c9V3XZuB5yGjCyIO5caHdGROTkFE6M5EG9hgxInyA9
	8zg5QGn3X6KLnN33Dvdmd/9ZH0vRp28cM7pzKw4R8TpGOAd+A+WxMAZr1cvUFABk1svr
	uImZptifW4MufQ+MZpA6odbSFbGFBAVOBEC6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=wU1jLKY1qSWbYP/JW2R4U3mehqUivqgpiUaAVyb2x28LzsBvzDILkYZJmElolNFPRJ
	GMTXnk4OhZpoXYrgP2sVDhAwYT2UK/ARcRQg3YPPrPfFYX3rfYqShH2bc0GmuIi75xqP
	YAawp3hMhrf2svWtE/K1Qn9zsLEn84OlWH1ww=
Received: by 10.42.176.194 with SMTP id bf2mr3676325icb.435.1287944901912;
	Sun, 24 Oct 2010 11:28:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 11:28:01 -0700 (PDT)
In-Reply-To: <1287927378-11971-1-git-send-email-eric@eukrea.com>
References: <1287927378-11971-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 11:28:01 -0700
Message-ID: <AANLkTinU5a-o28y1CsAG2Yw_EpU3_SP-Pfe1ixcL7msC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: [PATCH] shadow: Switch to getting libtool from PATH
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
X-List-Received-Date: Sun, 24 Oct 2010 18:29:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/10/24 Eric B=C3=A9nard <eric@eukrea.com>:
> * with PAM enabled, shadow's libtool sets lt_sysroot to the machine's
> sysroot and not the arch's sysroot, thus it can't find libpam.
> * by using libtool from PATH, this patch fix the problem.
> * tested using angstrom-2010.x for an arvm5te target
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

I have fixed it in autotools class. Basically it should have takes
care of setting
the sysroot correctly for arch and machine recipes equally. Should be fixed=
 now
please pull and retest.

> ---
> =C2=A0recipes/shadow/shadow.inc | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index f1476b7..b8f1d2b 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -52,6 +52,9 @@ EXTRA_OECONF_libc-uclibc +=3D "\
> =C2=A0 =C2=A0 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam',=
 '--without-libpam', d)} \
> =C2=A0"
>
> +LIBTOOL =3D "${HOST_SYS}-libtool"
> +EXTRA_OEMAKE =3D "'LIBTOOL=3D${LIBTOOL}'"
> +
> =C2=A0CFLAGS +=3D "-I../include"
>
> =C2=A0PACKAGES =3D+ "${PN}-group"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


