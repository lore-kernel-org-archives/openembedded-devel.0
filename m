Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3E346C653
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 22:42:13 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id z2-v6so1454311ybj.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=826Rc791rTQmAbq9y0FIqIXvlLMSQuVT1XyvRGuWlGU=;
	b=DzHTHd4emZJMgQ1nk+W+ULbfz4PxdwkUkiCf7vQOYY9+HKDbl8mXdIiK32h2lp+3nq
	m8Bp7I/3+A1806vVvmPL2N/WLwxjXsaBZZkR0k/wX6nhKblww31wWqthrZgD+Yo1kEAP
	j9ZmvXT+bzfrou74mBXXNWSYAcOLOj0XwrPzpq2g9IE6lKiSBzRlep0F+1ggLGHzLPub
	LzXHDiS64GckbP2n6IbTpBQ00i+o9LKDzmPC9LQOHd0uYsbbKQDXkzehtNt4+KnUUXnY
	/9FdnMvHkFQvRJDDBm/X9wWrkg1X4yNc1U9SLypjb2N1vLJ3nC05Gc6+f9UCH63S8/wR
	JWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=826Rc791rTQmAbq9y0FIqIXvlLMSQuVT1XyvRGuWlGU=;
	b=KdVpXG3c7UNKyudArD4o7llbWOZMPKhvZX6YWLxpFtb/hGrr13hL2+/PXwLKXRX9Ug
	kcagVmwetecaUctTadLMaebYxB+reDFDamPfCFubl6IYGKBRm9axaxOs2TLEOf03CqqB
	o3mNY1waLpaNBVx7sZ1QjNFDiE5pnZ3rOR37pIMaCTh28nKlogKXi2Grm0V/fqBp8Lpg
	GDN8OdMfgRZG7pzPtjK9ZA7tPMwbjGY4Lt0T6/3luBhYx6RA4JTFbYxsC/7hZChhGCz7
	yuTRI9xt9+5TGZN7i9E3LhIPzIohILDVvNfAMAAjOqGuybr8IC7JyLqU2gkgrMHDiDdB
	bUDA==
X-Gm-Message-State: AA+aEWYYG9CMlNZhBZ2V4m8G3LMz5hbDQ+zxq4151Y43w2uJl5sw7+7V
	NWUjcbtbSxyCFAPH+0qibastA7Vqqnc3nkIS8y+AVmgw
X-Google-Smtp-Source: AFSGD/V0veoYjp/2JY3CuO0QvuQhjxIAoK4d6dWLUbhRc1gKocN6jPdH2woc31sF1DlWjLInhWHQCpUFQocs3Arievk=
X-Received: by 2002:a25:6589:: with SMTP id
	z131-v6mr3148184ybb.389.1543531333985; 
	Thu, 29 Nov 2018 14:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20181129015333.1274-1-schnitzeltony@gmail.com>
In-Reply-To: <20181129015333.1274-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 29 Nov 2018 23:41:59 +0100
Message-ID: <CALbNGRROSZ3XTTLjJY7dQH7DAVio_9St=9cPUY=a=GHFFkqn3Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] libmtp: fix paths for packages
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
X-List-Received-Date: Thu, 29 Nov 2018 22:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 2:53 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Upstream has moved udev-rules/mtp-probe. That was not detected on previou=
s
> update commit so this is a follow-up.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb b/meta-=
oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
> index a648c890e..c7e2bafdd 100644
> --- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
> +++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
> @@ -38,10 +38,10 @@ PACKAGES =3D+ "${BPN}-common ${BPN}-runtime"
>  RDEPENDS_${BPN} +=3D "libmtp-common"
>  RRECOMMENDS_${BPN} +=3D "libmtp-runtime ${PN}-bin"
>
> -FILES_${BPN}-common =3D "${nonarch_base_libdir}/udev/rules.d/*"
> +FILES_${BPN}-common =3D "${nonarch_libdir}/udev/rules.d/*"
>  SUMMARY_${BPN}-common =3D "The udev rules file for MTP devices"
>
> -FILES_${BPN}-runtime =3D "${nonarch_base_libdir}/udev/mtp-probe"
> +FILES_${BPN}-runtime =3D "${nonarch_libdir}/udev/mtp-probe"
>  RDEPENDS_${BPN}-runtime =3D "libmtp-common"
>  SUMMARY_${BPN}-runtime =3D "mtp-probe, used for the MTP udev rules"
>  DESCRIPTION_${BPN}-runtime =3D "This package provides mtp-probe, a progr=
am to probe newly connected device interfaces from userspace to determine i=
f they are MTP devices, used for udev rules."
> --
> 2.14.5
>
Seems we do not follow freedesktop docs on where udev rules are
expected. Just changed another recipe: Moved udev-rules from
/lib/udev/rules.d to /usr/lib/udev/rules.d. - now the rules are
ignored :(

So this patch is wrong and we have to use the configure option to
install rules to /lib/udev/rules.d (there they were before). I suggest
to ignore the libmtp update patch I sent which is already in
master-next. I send one patch with update and corrected path.

Andreas

