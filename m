Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9494771F1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:31:30 +0000 (UTC)
Received: by pablf10 with SMTP id lf10so5950699pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 07:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=cJ5WbMjHcnGYWNP8wjHtivmg3lxu7AwLryVFsv5IV+k=;
	b=fXxo9WnHyzpbuLPjOSttcc74zZjrJhQSV7yA00j1tD2tksDugUkO5VxASLQ5fAjXdG
	5Ovu4N2nZxPx5JPc/7k9J4+dzsK5/cRuTuONhzHDsjUw4etOtHb7f0fTRKb5iBngwCWo
	Gw19HFpIsIR/KrKB+Pjh65Qn/AfdedwbpvheCN8LWp1QaBvid4uchqEt0zcMA/AFquIE
	RIPSrKmnLyMTgTLoza21TXbBykPaqtE+F1vRBAmweUEqbWYkTkM9sX2m4QxOJUNwiq3J
	VBIkSDl+Xbqah9vr1xEBWLULCA12AqH/trwyPMSFdhbaIsFpFoecAoVU8a54ATgvmSsJ
	WBhg==
MIME-Version: 1.0
X-Received: by 10.66.221.227 with SMTP id qh3mr6348472pac.1.1424878291834;
	Wed, 25 Feb 2015 07:31:31 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Wed, 25 Feb 2015 07:31:31 -0800 (PST)
In-Reply-To: <1424709653-10906-1-git-send-email-ashcharles@gmail.com>
References: <1424709653-10906-1-git-send-email-ashcharles@gmail.com>
Date: Wed, 25 Feb 2015 16:31:31 +0100
Message-ID: <CALbNGRRQvTy5xMVHsudrP9OO+KJZfJhg1FA+f9D6JysoSrFeOg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-session: Remove unneeded pkg_postinst
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
X-List-Received-Date: Wed, 25 Feb 2015 15:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2015 at 5:40 PM, Ash Charles <ashcharles@gmail.com> wrote:
> The pkg_postinst inherited from previous versions of this recipe no
> longer seems necessary; no error message seen at runtime in a quick
> test.  As it made the generated packages unnecessarily
> machine-specific, remove this post-install step. Based on the ensuring
> discussion, this supersedes the original patch [1].
>
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2015-Febru=
ary/100454.html
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> index 74289fb..aa82a7c 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> @@ -17,11 +17,6 @@ ALTERNATIVE_${PN} =3D "x-session-manager"
>  ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
>  ALTERNATIVE_PRIORITY_${PN} =3D "100"
>
> -# protect from frightening message that xfce might not work correctly
> -pkg_postinst_${PN} () {
> -    echo 127.0.0.1    ${MACHINE} >> /etc/hosts
> -}
> -
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES','systemd','syste=
md','consolekit',d)}"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd, --disable-systemd, polkit,=
 systemd"
>  PACKAGECONFIG[consolekit] =3D ",,,consolekit"
> --
> 2.1.0
>
Tested-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

