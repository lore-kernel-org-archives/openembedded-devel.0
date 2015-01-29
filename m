Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 80B8D60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 07:44:47 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id kq14so35912462pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 23:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6+z7m080LZQUz92mRjx+5QmtbOiTtc4/8kvssXLYUC0=;
	b=n4ZLrckjQsGW9IALkNO/MIsUsnjyScB6/dEZujy4oTxqei1UilhnAZlwGdIGbw6xL3
	QiOppnStk4PO0Ms0DPU2/0Y0c1DufAJq551MaEj9en993iKz67gevWYnWDDO/Ns9tPlh
	3mJvj1939R7RBzD3uf+lATvlPaiBYaWUeGfIYLU+UCc6nhsMRMiLn5vSkZMVXdSb9zYD
	dMNHb+/Q5UQ7EVfIOn6UfVWtoK8n5X07Fho4vPLw2m539vmtPAl0K71ZgDF0SdWu7sF4
	CuaVNL/bebourSzBIj6R+DkNkm7Jf2SLDJDh31Z6TVkEXU0VmfYTAB5iNYuTxsM9CyKM
	Iy7A==
MIME-Version: 1.0
X-Received: by 10.66.172.36 with SMTP id az4mr12095673pac.77.1422517488416;
	Wed, 28 Jan 2015 23:44:48 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Wed, 28 Jan 2015 23:44:48 -0800 (PST)
In-Reply-To: <1422495493-7230-1-git-send-email-ashcharles@gmail.com>
References: <1422495493-7230-1-git-send-email-ashcharles@gmail.com>
Date: Thu, 29 Jan 2015 08:44:48 +0100
Message-ID: <CALbNGRSS1G0dxGD02_mYNguGqdGb4Wi6SW3P+Pt=4y5DO0cp=A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] polkit-group-rule: Add polkitd user and group
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
X-List-Received-Date: Thu, 29 Jan 2015 07:44:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2015 at 2:38 AM, Ash Charles <ashcharles@gmail.com> wrote:
> Recipes including polkit-group-rule.inc correctly install a directory
> with the user and group set as 'polkitd'.  To avoid warnings like
> these when assemblying the rootfs,
>
>   WARNING: log_check: warning: user polkitd does not exist - using root
>   ...
>   WARNING: log_check: warning: group polkitd does not exist - using root
>
> create this user and group.
>
> Note: although the polkit recipe itself, on which this depends, is
>       creating this same user and group, it seems that the useradd class
>       needs this to be specified independently.
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta=
-oe/recipes-extended/polkit/polkit-group-rule.inc
> index 8d1a89a..3435e93 100644
> --- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> +++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> @@ -7,3 +7,4 @@ do_install_prepend() {
>      install -m 700 -d ${D}${sysconfdir}/polkit-1/rules.d
>      chown polkitd:polkitd ${D}${sysconfdir}/polkit-1/rules.d
>  }
> +USERADD_PARAM_${PN}_prepend =3D "--system --no-create-home --user-group =
--home-dir ${sysconfdir}/polkit-1 polkitd;"
> --
> 2.1.0
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

