Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Prlet-0003uX-Ko
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 07:23:39 +0100
Received: by fxm8 with SMTP id 8so2225966fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 22:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=s0Q2oTsVgcRzRB76bEkhWfRg8SVoboF1WEIUkYu9V8E=;
	b=SWyIGLdCb43agiV8Bwi5oN2lA1tSIhHAoI7h9MuE7g5T2aCn5NoX7OK0VikdLRLEhb
	koE460zs74iXgxDsfBIVwnQS1/iTIfD7JwjeTVJu1PL99uarppITCuVUygHQoo1RFuwn
	m5au55TgMgAksxkz8F4GNnz1Avx0WKmz4IYEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=teYpall9EiwAqMstZ1bLe2GOiRVYMI0rZbLlTLxkwEOIa4hSP+tQznkCQ/nrsj6cFt
	1Rs+EJGkw7BT6vsSuEY3eFsD5Shd/2dxFtvQJeFN5Uhbt0UUeu3CQ6KoyfsXKvJYJu1q
	Nas0UUoUE8gZR0ghuxrWfBOht8l2hkqafzF0g=
Received: by 10.223.71.199 with SMTP id i7mr3058063faj.57.1298355738444; Mon,
	21 Feb 2011 22:22:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 21 Feb 2011 22:21:12 -0800 (PST)
In-Reply-To: <1298337246-11794-2-git-send-email-tom_rini@mentor.com>
References: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>
	<1298337246-11794-2-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2011 22:21:12 -0800
Message-ID: <AANLkTin-fKddL80Sn4m08AwayH4t0+EGmFMof72Rwueq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Simplify TARGET_CPPFLAGS/LDFLAGS
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
X-List-Received-Date: Tue, 22 Feb 2011 06:23:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2011 at 5:14 PM, Tom Rini <tom_rini@mentor.com> wrote:
> This is based on poky's ba2e1f4d933c37b372d6749d64614f2510ee9d7b, which
> simplifies TARGET_CPPFLAGS (and thus CFLAGS) and TARGET_LDFLAGS
> based on gcc any company having --sysroot
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by:Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0conf/bitbake.conf | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f005658..ec20332 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -502,7 +502,7 @@ PATCHRESOLVE =3D 'noop'
>
> =C2=A0export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> =C2=A0export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> -export TARGET_CPPFLAGS =3D "-isystem${STAGING_DIR_TARGET}${includedir}"
> +export TARGET_CPPFLAGS =3D ""
> =C2=A0export SDK_CPPFLAGS =3D "-isystem${STAGING_DIR_SDK}${includedir} -i=
system${STAGING_DIR_HOST}${includedir}"
>
> =C2=A0export BUILD_CFLAGS =3D "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
> @@ -520,7 +520,7 @@ export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
>
> =C2=A0export LDFLAGS =3D "${TARGET_LDFLAGS}"
> -export TARGET_LDFLAGS =3D '${@["-L${STAGING_DIR_TARGET}${libdir} -Wl,-rp=
ath-link,${STAGING_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK_HASH_STYLE}",=
 "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"][bb.data.getVar('LIBTOOL_HAS_SYSROOT',=
 d, 1) =3D=3D "yes"]}'
> +export TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>
> =C2=A0export SDK_LDFLAGS =3D "-L${STAGING_DIR_SDK}${libdir} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


